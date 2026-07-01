#!/usr/bin/env python3
"""
SpellMap Export Tool for PVPWarn.

Replays the AddOn's runtime base + overlay assembly offline so the full SpellMap /
SpellAvoidMap for every branch (classic, sod, tbc) can be inspected without launching WoW.

The Lua source lives in a base + overlay layout (mirrors code/SpellMap.lua's buildAssembledMap):

    code/spellmap/
      Base.lua                      -- Classic Era content
      overlay/Sod.lua               -- SoD add/remove/replace ops
      overlay/Tbc.lua               -- TBC add/remove/replace ops

Same shape for code/spellavoidmap/. For each map the exporter:

1. Reads Base.lua + both overlays.
2. For each branch (classic, sod, tbc) assembles that branch's view of the map.
3. Writes a JSON dump of the assembled map and a human-readable summary.md per branch.
4. Writes a single top-level diff.md comparing the branches against each other.
5. Prints a compact plaintext report to stdout (rendered into the workflow step summary).

This is a *reporting* tool: it exits non-zero only on hard failures (Lua load errors, overlay
structural validation errors). A changed data set is never a failure.

It reuses the Lua loader and the Python port of the assembler from the sibling tool
tools/verify_spellmap/, so the two tools can never drift. The verify tool must stay co-located.
"""

import sys
import json
import argparse
from pathlib import Path
from typing import Dict, List, Tuple, Any

# Reuse the battle-tested loader + assembler from the sibling verify_spellmap tool so the two
# tools share one implementation of the assembly rules. Mirrors how verify_spellmap.py imports
# its own package (see tools/verify_spellmap/verify_spellmap.py).
sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "verify_spellmap"))

from verify_spellmap import LuaParser, SpellMapFileReader  # noqa: E402
from verify_spellmap.assembler import apply as assemble_apply, validate as assemble_validate  # noqa: E402


BRANCHES = ("classic", "sod", "tbc")

# Spell type constants as they appear in the assembled data (string literals, see code/Constants.lua).
TYPE_BASE = "SPELL_TYPE_BASE"
TYPE_SOD = "SPELL_TYPE_SOD"
TYPE_TBC = "SPELL_TYPE_TBC"
KNOWN_TYPES = (TYPE_BASE, TYPE_SOD, TYPE_TBC)


# --- Derived enrichment ----------------------------------------------------------------------
# Computed offline from data already in the map (no network). Wowhead URLs follow the public URL
# scheme; sound paths mirror code/Sound.lua's path building exactly. This keeps the export
# self-contained for review (clickable spell pages, icon images, the concrete .mp3 files played).

# wowhead has no distinct /sod/ path - Season of Discovery spells live under the classic domain.
WOWHEAD_SPELL_BASE = {
    "classic": "https://www.wowhead.com/classic/spell=",
    "sod": "https://www.wowhead.com/classic/spell=",
    "tbc": "https://www.wowhead.com/tbc/spell=",
}
WOWHEAD_ITEM_BASE = {
    "classic": "https://www.wowhead.com/classic/item=",
    "sod": "https://www.wowhead.com/classic/item=",
    "tbc": "https://www.wowhead.com/tbc/item=",
}
ZAMIMG_ICON_BASE = "https://wow.zamimg.com/images/wow/icons/large/"

# Sound path pieces - mirror code/Sound.lua:36-43 exactly. SOUND_ROOT is the addon-relative root
# the JSON display paths are anchored to; the on-disk existence check resolves the per-entry
# sub-path against --assets-dir (which defaults to <addon_root>/SOUND_ROOT).
SOUND_ROOT = "assets/sounds/en"
SOUND_EXT = ".mp3"
SOUND_DOWN_SUFFIX = "_down"
SOUND_CAST_SUFFIX = "_cast"
SELF_AVOID_DIR = "self_avoid"
ENEMY_AVOID_DIR = "enemy_avoid"
SELF_AVOID_PREFIX = "you_avoided_"
ENEMY_AVOID_PREFIX = "enemy_avoided_"

# trackedEvents -> role key. The AddOn plays one sound per matched combat-log event
# (code/Sound.lua me.PlaySound + code/Constants.lua SPELL_TYPES), so trackedEvents is the
# authoritative driver for which files a SpellMap entry can play. normal/applied/refresh share
# the base file; removed -> _down, start -> _cast.
EVENT_TO_SOUND_ROLE = {
    "SPELL_CAST_SUCCESS": "normal",
    "SPELL_AURA_APPLIED": "applied",
    "SPELL_AURA_REFRESH": "refresh",
    "SPELL_AURA_REMOVED": "removed",
    "SPELL_CAST_START": "start",
}


def is_ref_alias(entry: Dict[str, Any]) -> bool:
    """A ref-alias row only points at a primary entry: ``{ refId = <spellId> }``."""
    return isinstance(entry, dict) and "refId" in entry and len(entry) == 1


def build_wowhead_url(branch: str, spell_id: int) -> str:
    """Wowhead spell-page URL for ``branch`` (sod shares the classic domain)."""
    return f"{WOWHEAD_SPELL_BASE[branch]}{spell_id}"


def build_item_wowhead_url(branch: str, item_id: int) -> str:
    """Wowhead item-page URL for item-backed entries (those carrying an ``itemId``)."""
    return f"{WOWHEAD_ITEM_BASE[branch]}{item_id}"


def build_icon_url(spell_icon: str) -> str:
    """Wowhead (zamimg CDN) large icon image URL built from the ``spellIcon`` texture name."""
    return f"{ZAMIMG_ICON_BASE}{spell_icon.lower()}.jpg"


def derive_sound_files(category: str, entry: Dict[str, Any], is_avoid_map: bool) -> Dict[str, str]:
    """Return ``{role: path-relative-to-SOUND_ROOT}`` for every sound this entry can play.

    Mirrors code/Sound.lua's ``PlaySound`` path building. SpellMap entries are driven by
    ``trackedEvents``; SpellAvoidMap entries by the ``self_avoid`` / ``enemy_avoid`` flags. Returns
    ``{}`` when the entry has no ``soundFileName`` (nothing to play). Pure: no I/O.
    """
    sound_file = entry.get("soundFileName")
    if not sound_file:
        return {}

    roles: Dict[str, str] = {}

    if is_avoid_map:
        if entry.get("self_avoid"):
            roles["self_avoid"] = (
                f"{category}/{SELF_AVOID_DIR}/{SELF_AVOID_PREFIX}{sound_file}{SOUND_EXT}"
            )
        if entry.get("enemy_avoid"):
            roles["enemy_avoid"] = (
                f"{category}/{ENEMY_AVOID_DIR}/{ENEMY_AVOID_PREFIX}{sound_file}{SOUND_EXT}"
            )
        return roles

    for event in entry.get("trackedEvents") or []:
        role = EVENT_TO_SOUND_ROLE.get(event)
        if role is None:
            continue
        if role == "removed":
            roles[role] = f"{category}/{sound_file}{SOUND_DOWN_SUFFIX}{SOUND_EXT}"
        elif role == "start":
            roles[role] = f"{category}/{sound_file}{SOUND_CAST_SUFFIX}{SOUND_EXT}"
        else:  # normal / applied / refresh all play the base file
            roles[role] = f"{category}/{sound_file}{SOUND_EXT}"
    return roles


def enrich(assembled: Dict[str, Dict[int, Dict]], branch: str, is_avoid_map: bool,
           assets_dir: Path) -> Tuple[Dict[str, Dict[int, Dict]], List[str]]:
    """Add derived fields to every real entry and collect missing-but-expected sound files.

    Adds (inline) ``wowheadUrl``, ``iconUrl``, ``itemWowheadUrl`` (item-backed only) and a
    ``soundFiles`` map of ``{role: {path, exists}}``. Ref-aliases are passed through untouched.
    Mutates the entries in place (the assembled map is exporter-local, not shared) and also returns
    it. Returns ``(assembled, missing_sounds)``.
    """
    missing_sounds: List[str] = []

    for category in assembled:
        for spell_id, entry in assembled[category].items():
            if is_ref_alias(entry):
                continue

            entry["wowheadUrl"] = build_wowhead_url(branch, spell_id)

            item_id = entry.get("itemId")
            if item_id is not None:
                entry["itemWowheadUrl"] = build_item_wowhead_url(branch, item_id)

            spell_icon = entry.get("spellIcon")
            if spell_icon:
                entry["iconUrl"] = build_icon_url(spell_icon)

            sound_files: Dict[str, Dict[str, Any]] = {}
            for role, subpath in derive_sound_files(category, entry, is_avoid_map).items():
                exists = (assets_dir / subpath).is_file()
                display_path = f"{SOUND_ROOT}/{subpath}"
                sound_files[role] = {"path": display_path, "exists": exists}
                if not exists:
                    missing_sounds.append(
                        f"{category}[{spell_id}] {entry.get('soundFileName')}: "
                        f"{role} → {display_path}"
                    )
            entry["soundFiles"] = sound_files

    return assembled, missing_sounds


def summarize(assembled: Dict[str, Dict[int, Dict]], is_avoid_map: bool) -> Dict[str, Any]:
    """Compute counts and anomalies for one assembled map.

    Returns a plain dict consumed by both the Markdown writer and the stdout report. Pure: no
    I/O, no mutation of the input.
    """
    per_category: Dict[str, Dict[str, int]] = {}
    per_entry_type: Dict[str, int] = {t: 0 for t in KNOWN_TYPES}
    per_rank_type: Dict[str, int] = {t: 0 for t in KNOWN_TYPES}
    total_real = 0
    total_alias = 0
    total_ranks = 0
    anomalies: List[str] = []

    for category in sorted(assembled.keys()):
        spells = assembled[category]
        cat_real = 0
        cat_alias = 0
        for spell_id in sorted(spells.keys()):
            entry = spells[spell_id]

            if is_ref_alias(entry):
                cat_alias += 1
                total_alias += 1
                ref_target = entry["refId"]
                if ref_target not in spells:
                    anomalies.append(
                        f"{category}[{spell_id}]: refId {ref_target} has no target in category"
                    )
                continue

            cat_real += 1
            total_real += 1

            entry_type = entry.get("type")
            if entry_type in per_entry_type:
                per_entry_type[entry_type] += 1
            elif entry_type is not None:
                per_entry_type[entry_type] = per_entry_type.get(entry_type, 0) + 1

            if "name" not in entry or not entry.get("name"):
                anomalies.append(f"{category}[{spell_id}]: missing 'name'")
            if "spellIcon" not in entry or not entry.get("spellIcon"):
                anomalies.append(f"{category}[{spell_id}]: missing 'spellIcon'")

            all_ranks = entry.get("allRanks")
            if not all_ranks:
                anomalies.append(f"{category}[{spell_id}]: empty or missing 'allRanks'")
            else:
                for rank in all_ranks:
                    if not isinstance(rank, dict) or "spellId" not in rank:
                        anomalies.append(
                            f"{category}[{spell_id}]: malformed rank entry {rank!r}"
                        )
                        continue
                    total_ranks += 1
                    rank_type = rank.get("type")
                    if rank_type in per_rank_type:
                        per_rank_type[rank_type] += 1
                    elif rank_type is not None:
                        per_rank_type[rank_type] = per_rank_type.get(rank_type, 0) + 1

        per_category[category] = {"real": cat_real, "alias": cat_alias}

    return {
        "is_avoid_map": is_avoid_map,
        "total_real": total_real,
        "total_alias": total_alias,
        "total_ranks": total_ranks,
        "per_category": per_category,
        "per_entry_type": per_entry_type,
        "per_rank_type": per_rank_type,
        "anomalies": anomalies,
    }


def render_summary_md(map_label: str, branch: str, summary: Dict[str, Any]) -> str:
    """Render one branch's summary as Markdown."""
    lines: List[str] = []
    lines.append(f"# {map_label} - `{branch}` branch")
    lines.append("")
    lines.append(f"- **Real entries:** {summary['total_real']}")
    lines.append(f"- **Ref aliases:** {summary['total_alias']}")
    lines.append(f"- **Total ranks:** {summary['total_ranks']}")
    lines.append("")

    lines.append("## Entries per class")
    lines.append("")
    lines.append("| Class | Real | Aliases |")
    lines.append("| --- | ---: | ---: |")
    for category in sorted(summary["per_category"].keys()):
        counts = summary["per_category"][category]
        lines.append(f"| {category} | {counts['real']} | {counts['alias']} |")
    lines.append("")

    lines.append("## Entries per spell type")
    lines.append("")
    lines.append("| Type | Count |")
    lines.append("| --- | ---: |")
    for spell_type in sorted(summary["per_entry_type"].keys()):
        lines.append(f"| {spell_type} | {summary['per_entry_type'][spell_type]} |")
    lines.append("")

    lines.append("## Ranks per spell type")
    lines.append("")
    lines.append("| Type | Count |")
    lines.append("| --- | ---: |")
    for spell_type in sorted(summary["per_rank_type"].keys()):
        lines.append(f"| {spell_type} | {summary['per_rank_type'][spell_type]} |")
    lines.append("")

    anomalies = summary["anomalies"]
    lines.append(f"## Anomalies ({len(anomalies)})")
    lines.append("")
    if anomalies:
        for anomaly in anomalies:
            lines.append(f"- {anomaly}")
    else:
        lines.append("_None._")
    lines.append("")

    missing = summary.get("missing_sounds", [])
    lines.append(f"## Missing sound files ({len(missing)})")
    lines.append("")
    if missing:
        for entry in missing:
            lines.append(f"- {entry}")
    else:
        lines.append("_None._")
    lines.append("")

    return "\n".join(lines)


def _branch_keys(assembled: Dict[str, Dict[int, Dict]]) -> Dict[Tuple[str, int], Dict]:
    """Flatten an assembled map to ``{(category, spellId): entry}`` for cross-branch comparison."""
    flat: Dict[Tuple[str, int], Dict] = {}
    for category, spells in assembled.items():
        for spell_id, entry in spells.items():
            flat[(category, spell_id)] = entry
    return flat


def _rank_id_set(entry: Dict[str, Any]) -> Tuple[int, ...]:
    if is_ref_alias(entry):
        return ()
    ranks = entry.get("allRanks") or []
    ids = sorted(
        int(r["spellId"]) for r in ranks
        if isinstance(r, dict) and "spellId" in r
    )
    return tuple(ids)


def build_diff(map_label: str, assembled_by_branch: Dict[str, Dict[int, Dict]]) -> Dict[str, Any]:
    """Compute branch-exclusive entries and entries that drift across branches.

    Pure: returns a dict, no I/O.
    """
    flat_by_branch = {b: _branch_keys(assembled_by_branch[b]) for b in BRANCHES}

    all_keys = set()
    for flat in flat_by_branch.values():
        all_keys.update(flat.keys())

    exclusive: Dict[str, List[Tuple[str, int, str]]] = {b: [] for b in BRANCHES}
    drift: List[Dict[str, Any]] = []

    for key in sorted(all_keys):
        category, spell_id = key
        present = [b for b in BRANCHES if key in flat_by_branch[b]]

        if len(present) == 1:
            branch = present[0]
            entry = flat_by_branch[branch][key]
            name = "(ref alias)" if is_ref_alias(entry) else entry.get("name", "?")
            exclusive[branch].append((category, spell_id, name))
            continue

        # Present in more than one branch: report type / rank-set drift.
        types = {b: flat_by_branch[b][key].get("type") for b in present}
        rank_sets = {b: _rank_id_set(flat_by_branch[b][key]) for b in present}
        type_differs = len(set(types.values())) > 1
        ranks_differ = len(set(rank_sets.values())) > 1
        if type_differs or ranks_differ:
            drift.append({
                "category": category,
                "spellId": spell_id,
                "present": present,
                "types": types,
                "rank_counts": {b: len(rank_sets[b]) for b in present},
                "type_differs": type_differs,
                "ranks_differ": ranks_differ,
            })

    return {"map_label": map_label, "exclusive": exclusive, "drift": drift}


def render_diff_md(diffs: List[Dict[str, Any]]) -> str:
    """Render the cross-branch diff for every map as a single Markdown document."""
    lines: List[str] = []
    lines.append("# Cross-branch SpellMap diff")
    lines.append("")
    lines.append(
        "Compares the assembled `classic`, `sod` and `tbc` views against each other. "
        "`classic` is the base; `sod` / `tbc` overlay on top of it."
    )
    lines.append("")

    for diff in diffs:
        lines.append(f"## {diff['map_label']}")
        lines.append("")

        lines.append("### Branch-exclusive entries")
        lines.append("")
        any_exclusive = False
        for branch in BRANCHES:
            entries = diff["exclusive"][branch]
            if not entries:
                continue
            any_exclusive = True
            lines.append(f"**{branch}-only ({len(entries)}):**")
            lines.append("")
            lines.append("| Class | SpellId | Name |")
            lines.append("| --- | ---: | --- |")
            for category, spell_id, name in entries:
                lines.append(f"| {category} | {spell_id} | {name} |")
            lines.append("")
        if not any_exclusive:
            lines.append("_No branch-exclusive entries._")
            lines.append("")

        lines.append("### Entries that differ across branches")
        lines.append("")
        drift = diff["drift"]
        if drift:
            lines.append("| Class | SpellId | Present in | Type differs | Ranks differ |")
            lines.append("| --- | ---: | --- | :---: | :---: |")
            for row in drift:
                present = ", ".join(row["present"])
                lines.append(
                    f"| {row['category']} | {row['spellId']} | {present} | "
                    f"{'yes' if row['type_differs'] else 'no'} | "
                    f"{'yes' if row['ranks_differ'] else 'no'} |"
                )
            lines.append("")
        else:
            lines.append("_No entries drift in type or rank set across branches._")
            lines.append("")

    return "\n".join(lines)


def render_stdout_report(map_summaries: Dict[str, Dict[str, Dict[str, Any]]]) -> str:
    """Compact plaintext report for stdout (teed into $GITHUB_STEP_SUMMARY)."""
    lines: List[str] = []
    for map_label in sorted(map_summaries.keys()):
        lines.append(f"=== {map_label} ===")
        for branch in BRANCHES:
            summary = map_summaries[map_label][branch]
            type_bits = ", ".join(
                f"{t}={summary['per_entry_type'].get(t, 0)}" for t in KNOWN_TYPES
            )
            lines.append(
                f"  {branch:<8} entries={summary['total_real']:<4} "
                f"aliases={summary['total_alias']:<4} ranks={summary['total_ranks']:<5} "
                f"anomalies={len(summary['anomalies'])} "
                f"missing_sounds={len(summary.get('missing_sounds', []))}  ({type_bits})"
            )
        lines.append("")
    return "\n".join(lines)


def _write(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")


def _dump_json(path: Path, data: Dict[str, Dict[int, Dict]]) -> None:
    # sort_keys + indent => stable, diffable output between runs.
    _write(path, json.dumps(data, indent=2, sort_keys=True, ensure_ascii=False) + "\n")


def assemble_branches(base, overlays_by_branch) -> Dict[str, Dict[int, Dict]]:
    """Assemble every branch's view of a map from a shared base + per-branch overlays."""
    return {branch: assemble_apply(base, overlays_by_branch[branch]) for branch in BRANCHES}


class MapExporter:
    """Loads, assembles and exports a single map (SpellMap or SpellAvoidMap) for all branches."""

    def __init__(self, map_label: str, json_name: str, base_path: Path,
                 sod_path: Path, tbc_path: Path, assets_dir: Path, is_avoid_map: bool):
        self.map_label = map_label
        self.json_name = json_name
        self.base_path = base_path
        self.sod_path = sod_path
        self.tbc_path = tbc_path
        self.assets_dir = assets_dir
        self.is_avoid_map = is_avoid_map

    def run(self, output_dir: Path) -> Tuple[Dict[str, Dict[str, Any]],
                                             Dict[str, Dict[int, Dict]], List[str]]:
        """Returns (summaries_by_branch, assembled_by_branch, hard_errors)."""
        print(f"\nExporting {self.map_label} from {self.base_path.parent}")

        parser = LuaParser()
        parser.setup_environment()

        if self.is_avoid_map:
            base = parser.parse_spell_avoid_map(SpellMapFileReader(str(self.base_path)).read())
        else:
            base = parser.parse_spellmap(SpellMapFileReader(str(self.base_path)).read())

        sod_overlay = parser.parse_overlay(SpellMapFileReader(str(self.sod_path)).read())
        tbc_overlay = parser.parse_overlay(SpellMapFileReader(str(self.tbc_path)).read())

        # Structural overlay validation - a hard failure (overlay describes an impossible op).
        hard_errors: List[str] = []
        for branch_name, overlay in (("sod", sod_overlay), ("tbc", tbc_overlay)):
            for err in assemble_validate(base, [overlay]):
                hard_errors.append(f"{self.map_label} [{branch_name}]: {err}")

        overlays_by_branch = {"classic": [], "sod": [sod_overlay], "tbc": [tbc_overlay]}
        assembled_by_branch = assemble_branches(base, overlays_by_branch)

        summaries_by_branch: Dict[str, Dict[str, Any]] = {}
        for branch in BRANCHES:
            assembled = assembled_by_branch[branch]
            # Enrich before summarizing/dumping so the JSON carries the derived fields and the
            # summary can report missing-but-expected sound files.
            assembled, missing_sounds = enrich(assembled, branch, self.is_avoid_map, self.assets_dir)
            summary = summarize(assembled, self.is_avoid_map)
            summary["missing_sounds"] = missing_sounds
            summaries_by_branch[branch] = summary

            branch_dir = output_dir / branch
            _dump_json(branch_dir / self.json_name, assembled)
            _write(branch_dir / f"{self.json_name.rsplit('.', 1)[0]}.summary.md",
                   render_summary_md(self.map_label, branch, summary))

        return summaries_by_branch, assembled_by_branch, hard_errors


def parse_arguments():
    parser = argparse.ArgumentParser(
        description="Export the assembled PVPWarn SpellMap / SpellAvoidMap per branch for "
                    "offline inspection.",
    )

    script_dir = Path(__file__).resolve().parent
    addon_root = script_dir.parent.parent
    default_spellmap_dir = addon_root / "code" / "spellmap"
    default_spellavoidmap_dir = addon_root / "code" / "spellavoidmap"
    default_assets_dir = addon_root / "assets" / "sounds" / "en"
    # Write into the repo-root target/ build dir (already covered by the root .gitignore), so the
    # tool needs no .gitignore of its own. Namespaced so it doesn't mingle with Maven artifacts.
    default_output_dir = addon_root / "target" / "spellmap-export"

    parser.add_argument(
        "--spellmap-dir",
        default=str(default_spellmap_dir),
        help=f"Path to code/spellmap/ (default: {default_spellmap_dir})",
    )
    parser.add_argument(
        "--spellavoidmap-dir",
        default=str(default_spellavoidmap_dir),
        help=f"Path to code/spellavoidmap/ (default: {default_spellavoidmap_dir})",
    )
    parser.add_argument(
        "--assets-dir",
        default=str(default_assets_dir),
        help=f"Path to assets/sounds/en/ used for the sound-file existence check "
             f"(default: {default_assets_dir})",
    )
    parser.add_argument(
        "--output-dir",
        default=str(default_output_dir),
        help=f"Directory to write the export into (default: {default_output_dir})",
    )

    return parser.parse_args()


def _resolve_map_paths(directory: Path, label: str) -> Tuple[Path, Path, Path]:
    base = directory / "Base.lua"
    sod = directory / "overlay" / "Sod.lua"
    tbc = directory / "overlay" / "Tbc.lua"
    for path in (base, sod, tbc):
        if not path.exists():
            print(f"Error: missing {label} file: {path}")
            sys.exit(1)
    return base, sod, tbc


def main():
    args = parse_arguments()

    spellmap_dir = Path(args.spellmap_dir)
    spellavoidmap_dir = Path(args.spellavoidmap_dir)
    assets_dir = Path(args.assets_dir)
    output_dir = Path(args.output_dir)

    spellmap_paths = _resolve_map_paths(spellmap_dir, "SpellMap")
    spellavoidmap_paths = _resolve_map_paths(spellavoidmap_dir, "SpellAvoidMap")

    exporters = [
        MapExporter("SpellMap", "spellmap.json", *spellmap_paths,
                    assets_dir=assets_dir, is_avoid_map=False),
        MapExporter("SpellAvoidMap", "avoidmap.json", *spellavoidmap_paths,
                    assets_dir=assets_dir, is_avoid_map=True),
    ]

    map_summaries: Dict[str, Dict[str, Dict[str, Any]]] = {}
    diffs: List[Dict[str, Any]] = []
    all_hard_errors: List[str] = []

    try:
        for exporter in exporters:
            summaries, assembled_by_branch, hard_errors = exporter.run(output_dir)
            map_summaries[exporter.map_label] = summaries
            all_hard_errors.extend(hard_errors)
            diffs.append(build_diff(exporter.map_label, assembled_by_branch))
    except Exception as exc:  # Lua load / parse error => hard failure.
        print(f"Fatal error during export: {exc}")
        sys.exit(1)

    _write(output_dir / "diff.md", render_diff_md(diffs))

    print()
    print(render_stdout_report(map_summaries))
    print(f"Export written to: {output_dir}")

    if all_hard_errors:
        print("\nOverlay validation errors (build will fail):")
        for err in all_hard_errors:
            print(f"  - {err}")
        sys.exit(1)

    sys.exit(0)


if __name__ == "__main__":
    main()
