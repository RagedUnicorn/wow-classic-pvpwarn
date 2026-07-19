"""
Python port of code/SpellMapAssembler.lua (shared by both spell catalogs).

Mirrors mod.spellMapAssembler.Apply, SynthesizeRankAliases and Validate exactly:
  - Apply deep-copies the base map and applies each overlay's remove, then add, then replace,
    then appendRanks.
  - SynthesizeRankAliases generates the `{ refId = <primarySpellId> }` rank-alias entries from
    the primaries' allRanks arrays; runs on an assembled map after Apply.
  - Validate checks structural invariants (remove of missing, add of existing, replace of missing,
    appendRanks of missing base / duplicate rank) against a working copy, accumulating errors
    instead of raising.

Keep this in sync with the Lua side. Both modules are short and the rules are the same; a drift
between them shows up immediately the next time the verifier runs in CI / locally.
"""

import copy
from typing import Any, Dict, List, Optional


def _rank_spell_id(rank: Any) -> Optional[int]:
    """Return the numeric spellId of a rank entry, or None if the entry is malformed.

    Used by apply() to skip malformed ranks silently and by validate() to report a clear
    error. Mirrors the type-guards on the Lua side (code/SpellMapAssembler.lua).
    """
    if not isinstance(rank, dict):
        return None
    spell_id = rank.get("spellId")
    if spell_id is None:
        return None
    try:
        return int(spell_id)
    except (TypeError, ValueError):
        return None


def apply(base: Dict[str, Dict[int, Dict]],
          overlays: Optional[List[Dict[str, Dict]]]) -> Dict[str, Dict[int, Dict]]:
    """Build the assembled map for a branch.

    Args:
        base: Base spell map keyed by category, then by spellId.
        overlays: Ordered list of overlay tables to apply. May be None or empty.

    Returns:
        A new dict - base is not mutated, overlays are not mutated.
    """
    result = copy.deepcopy(base)

    if not overlays:
        return result

    for overlay in overlays:
        _apply_one(result, overlay)

    return result


def _apply_one(working: Dict[str, Dict[int, Dict]], overlay: Dict[str, Dict]) -> None:
    """Apply a single overlay to ``working`` in place. Operations within a category run in the
    order remove, add, replace, appendRanks - matching SpellMapAssembler.lua's ApplyOne."""
    for category, ops in overlay.items():
        if category not in working:
            working[category] = {}

        for spell_id in ops.get("remove") or []:
            working[category].pop(int(spell_id), None)

        for spell_id, spell_data in (ops.get("add") or {}).items():
            working[category][int(spell_id)] = copy.deepcopy(spell_data)

        for spell_id, spell_data in (ops.get("replace") or {}).items():
            working[category][int(spell_id)] = copy.deepcopy(spell_data)

        for base_spell_id, ranks_to_append in (ops.get("appendRanks") or {}).items():
            base_spell_id = int(base_spell_id)
            entry = working[category].get(base_spell_id)
            if entry is None:
                continue  # Validate() reports the error; Apply skips silently like the Lua side.
            if "allRanks" not in entry or entry["allRanks"] is None:
                entry["allRanks"] = []
            existing = {int(r["spellId"]) for r in entry["allRanks"]
                        if isinstance(r, dict) and "spellId" in r}
            for rank in ranks_to_append:
                rank_spell_id = _rank_spell_id(rank)
                if rank_spell_id is None:
                    continue  # malformed; Validate() reports it.
                if rank_spell_id in existing:
                    continue  # duplicate; Validate() reports it.
                entry["allRanks"].append(copy.deepcopy(rank))
                existing.add(rank_spell_id)


def synthesize_rank_aliases(assembled: Dict[str, Dict[int, Dict]]) -> List[str]:
    """Synthesize ``{ refId = <primarySpellId> }`` rank-alias entries from each primary
    entry's allRanks array. Mirrors SynthesizeRankAliases in code/SpellMapAssembler.lua.

    Intended to run on an assembled map after apply(), so ranks appended by overlay
    appendRanks ops are covered. The primaries' allRanks arrays are the single source of
    truth for rank aliases - the data files carry no hand-written alias entries.

    Args:
        assembled: The assembled map keyed by category, then by spellId. Mutated in place.

    Returns:
        A list of conflict error strings (a rank spellId already taken by another primary
        or by an alias to a different primary). Empty list means clean synthesis.
    """
    errors: List[str] = []

    for category, spells in assembled.items():
        primaries = {
            spell_id: entry for spell_id, entry in spells.items()
            if isinstance(entry, dict) and "refId" not in entry and entry.get("allRanks")
        }

        for primary_spell_id, entry in primaries.items():
            for rank in entry["allRanks"]:
                rank_spell_id = _rank_spell_id(rank)
                if rank_spell_id is None or rank_spell_id == primary_spell_id:
                    continue
                existing = spells.get(rank_spell_id)
                if existing is None:
                    spells[rank_spell_id] = {"refId": primary_spell_id}
                elif not isinstance(existing, dict) or existing.get("refId") != primary_spell_id:
                    errors.append(
                        f"{category}: rank alias synthesis failed: spellId {rank_spell_id} "
                        f"of primary {primary_spell_id} already exists"
                    )

    return errors


def validate(base: Dict[str, Dict[int, Dict]],
             overlays: Optional[List[Dict[str, Dict]]]) -> List[str]:
    """Validate every overlay's ops against the running state. Same rules as Assemble.Validate.

    Returns:
        A list of error strings. Empty list means valid.
    """
    errors: List[str] = []

    if not overlays:
        return errors

    working = copy.deepcopy(base)

    for index, overlay in enumerate(overlays, start=1):
        for category, ops in overlay.items():
            if category not in working:
                working[category] = {}

            for spell_id in ops.get("remove") or []:
                spell_id = int(spell_id)
                if spell_id not in working[category]:
                    errors.append(
                        f"overlay #{index} {category}.remove: spellId {spell_id} not present"
                    )
                else:
                    working[category].pop(spell_id, None)

            for spell_id, spell_data in (ops.get("add") or {}).items():
                spell_id = int(spell_id)
                if spell_id in working[category]:
                    errors.append(
                        f"overlay #{index} {category}.add: spellId {spell_id} already exists"
                    )
                else:
                    working[category][spell_id] = spell_data

            for spell_id, spell_data in (ops.get("replace") or {}).items():
                spell_id = int(spell_id)
                if spell_id not in working[category]:
                    errors.append(
                        f"overlay #{index} {category}.replace: spellId {spell_id} not present"
                    )
                else:
                    working[category][spell_id] = spell_data

            for base_spell_id, ranks_to_append in (ops.get("appendRanks") or {}).items():
                base_spell_id = int(base_spell_id)
                entry = working[category].get(base_spell_id)
                if entry is None:
                    errors.append(
                        f"overlay #{index} {category}.appendRanks: "
                        f"spellId {base_spell_id} not present"
                    )
                    continue
                if "allRanks" not in entry or entry["allRanks"] is None:
                    entry["allRanks"] = []
                existing = {int(r["spellId"]) for r in entry["allRanks"]
                            if isinstance(r, dict) and "spellId" in r}
                for rank in ranks_to_append:
                    rank_spell_id = _rank_spell_id(rank)
                    if rank_spell_id is None:
                        errors.append(
                            f"overlay #{index} {category}.appendRanks: "
                            f"malformed rank entry under spellId {base_spell_id} "
                            f"(expected table with numeric spellId, got {rank!r})"
                        )
                        continue
                    if rank_spell_id in existing:
                        errors.append(
                            f"overlay #{index} {category}.appendRanks: "
                            f"spellId {rank_spell_id} already in allRanks of {base_spell_id}"
                        )
                    else:
                        entry["allRanks"].append(rank)
                        existing.add(rank_spell_id)

    return errors
