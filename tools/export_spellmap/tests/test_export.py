"""
Unit tests for the export-specific pure functions.

The Lua loader and the assembler are already covered by tools/spellmap_core/tests; here we only
exercise the new reporting logic (summarize + build_diff) against hand-built assembled maps.
"""

import sys
from pathlib import Path

# Make export_spellmap.py (one level up) importable regardless of pytest's import mode / cwd.
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))

import export_spellmap as ex  # noqa: E402


def _entry(name, type_, ranks, **extra):
    e = {
        "name": name,
        "type": type_,
        "allRanks": [{"spellId": rid, "type": type_} for rid in ranks],
    }
    e.update(extra)
    return e


class TestSummarize:
    def test_counts_real_aliases_and_ranks(self):
        assembled = {
            "warrior": {
                100: _entry("Charge", ex.TYPE_BASE, [100, 101]),
                101: {"refId": 100},
                200: _entry("Raging Blow", ex.TYPE_SOD, [200]),
            },
        }

        summary = ex.summarize(assembled)

        assert summary["total_real"] == 2
        assert summary["total_alias"] == 1
        assert summary["total_ranks"] == 3
        assert summary["per_category"]["warrior"] == {"real": 2, "alias": 1}
        assert summary["per_entry_type"][ex.TYPE_BASE] == 1
        assert summary["per_entry_type"][ex.TYPE_SOD] == 1
        assert summary["per_rank_type"][ex.TYPE_BASE] == 2
        assert summary["per_rank_type"][ex.TYPE_SOD] == 1
        assert summary["anomalies"] == []

    def test_flags_broken_ref_and_empty_ranks(self):
        assembled = {
            "mage": {
                1: {"refId": 999},                                  # target 999 not present
                3: {"name": "Fireball", "type": ex.TYPE_BASE,       # empty allRanks
                    "allRanks": []},
            },
        }

        anomalies = ex.summarize(assembled)["anomalies"]

        joined = "\n".join(anomalies)
        assert "mage[1]: refId 999 has no target" in joined
        assert "mage[3]: empty or missing 'allRanks'" in joined


class TestBuildDiff:
    def _maps(self):
        base = {"warrior": {100: _entry("Charge", ex.TYPE_BASE, [100])}}
        sod = {"warrior": {
            100: _entry("Charge", ex.TYPE_BASE, [100]),
            200: _entry("Raging Blow", ex.TYPE_SOD, [200]),   # sod-only
        }}
        tbc = {"warrior": {
            100: _entry("Charge", ex.TYPE_BASE, [100, 25272]),  # gained a TBC rank
            300: _entry("Devastate", ex.TYPE_TBC, [300]),       # tbc-only
        }}
        return {"classic": base, "sod": sod, "tbc": tbc}

    def test_branch_exclusive_entries(self):
        diff = ex.build_diff("SpellMap", self._maps())

        sod_only = {(c, sid) for c, sid, _ in diff["exclusive"]["sod"]}
        tbc_only = {(c, sid) for c, sid, _ in diff["exclusive"]["tbc"]}

        assert ("warrior", 200) in sod_only
        assert ("warrior", 300) in tbc_only
        assert diff["exclusive"]["classic"] == []

    def test_rank_drift_detected(self):
        diff = ex.build_diff("SpellMap", self._maps())

        drift = {row["spellId"]: row for row in diff["drift"]}
        assert 100 in drift                       # Charge gained a rank only in tbc
        assert drift[100]["ranks_differ"] is True
        assert drift[100]["type_differs"] is False
        assert set(drift[100]["present"]) == {"classic", "sod", "tbc"}


def test_render_functions_produce_markdown():
    maps = {"classic": {"warrior": {100: _entry("Charge", ex.TYPE_BASE, [100])}},
            "sod": {"warrior": {100: _entry("Charge", ex.TYPE_BASE, [100])}},
            "tbc": {"warrior": {100: _entry("Charge", ex.TYPE_BASE, [100])}}}
    summary = ex.summarize(maps["classic"])

    summary_md = ex.render_summary_md("SpellMap", "classic", summary)
    diff_md = ex.render_diff_md([ex.build_diff("SpellMap", maps)])

    assert "# SpellMap - `classic` branch" in summary_md
    assert "Entries per class" in summary_md
    assert "Missing sound files" in summary_md
    assert "# Cross-branch SpellMap diff" in diff_md


class TestUrlBuilders:
    def test_wowhead_spell_url_per_branch(self):
        assert ex.build_wowhead_url("classic", 18499) == "https://www.wowhead.com/classic/spell=18499"
        assert ex.build_wowhead_url("tbc", 18499) == "https://www.wowhead.com/tbc/spell=18499"
        # sod has no distinct wowhead path; it shares the classic domain.
        assert ex.build_wowhead_url("sod", 18499) == "https://www.wowhead.com/classic/spell=18499"

    def test_item_wowhead_url(self):
        assert ex.build_item_wowhead_url("classic", 10592) == "https://www.wowhead.com/classic/item=10592"
        assert ex.build_item_wowhead_url("tbc", 10592) == "https://www.wowhead.com/tbc/item=10592"


class TestDeriveSoundFiles:
    def test_spellmap_events_drive_roles(self):
        entry = _entry("Berserker Rage", ex.TYPE_BASE, [18499],
                       soundFileName="berserker_rage",
                       trackedEvents=["SPELL_AURA_APPLIED", "SPELL_AURA_REMOVED"])

        roles = ex.derive_sound_files("warrior", entry, is_avoid_map=False)

        assert roles == {
            "applied": "warrior/berserker_rage.mp3",
            "removed": "warrior/berserker_rage_down.mp3",
        }

    def test_spellmap_cast_and_normal(self):
        entry = _entry("Intercept", ex.TYPE_BASE, [20252],
                       soundFileName="intercept",
                       trackedEvents=["SPELL_CAST_START", "SPELL_CAST_SUCCESS"])

        roles = ex.derive_sound_files("warrior", entry, is_avoid_map=False)

        assert roles["start"] == "warrior/intercept_cast.mp3"
        assert roles["normal"] == "warrior/intercept.mp3"

    def test_avoid_map_flags_drive_roles(self):
        entry = _entry("Charge", ex.TYPE_BASE, [7922],
                       soundFileName="charge", self_avoid=True, enemy_avoid=True,
                       trackedEvents=["SPELL_AURA_APPLIED"])  # ignored for avoid map

        roles = ex.derive_sound_files("warrior", entry, is_avoid_map=True)

        assert roles == {
            "self_avoid": "warrior/self_avoid/you_avoided_charge.mp3",
            "enemy_avoid": "warrior/enemy_avoid/enemy_avoided_charge.mp3",
        }

    def test_no_sound_file_name_yields_empty(self):
        entry = _entry("Silent", ex.TYPE_BASE, [1],
                       trackedEvents=["SPELL_AURA_APPLIED"])  # no soundFileName

        assert ex.derive_sound_files("warrior", entry, is_avoid_map=False) == {}


class TestEnrich:
    def _build_assets(self, tmp_path, *rel_paths):
        for rel in rel_paths:
            f = tmp_path / rel
            f.parent.mkdir(parents=True, exist_ok=True)
            f.write_bytes(b"")
        return tmp_path

    def test_adds_urls_and_marks_existing_and_missing_sounds(self, tmp_path):
        # Only the base file exists on disk; the _down file is missing.
        assets = self._build_assets(tmp_path, "warrior/berserker_rage.mp3")
        assembled = {
            "warrior": {
                18499: _entry("Berserker Rage", ex.TYPE_BASE, [18499],
                              soundFileName="berserker_rage",
                              trackedEvents=["SPELL_AURA_APPLIED", "SPELL_AURA_REMOVED"]),
                101: {"refId": 18499},
            }
        }

        enriched, missing = ex.enrich(assembled, "classic", is_avoid_map=False, assets_dir=assets)

        entry = enriched["warrior"][18499]
        assert entry["wowheadUrl"] == "https://www.wowhead.com/classic/spell=18499"
        assert entry["soundFiles"]["applied"] == {
            "path": "assets/sounds/en/warrior/berserker_rage.mp3", "exists": True}
        assert entry["soundFiles"]["removed"] == {
            "path": "assets/sounds/en/warrior/berserker_rage_down.mp3", "exists": False}
        # Ref-alias untouched.
        assert enriched["warrior"][101] == {"refId": 18499}
        # Missing-but-expected file reported.
        assert any("berserker_rage_down.mp3" in m for m in missing)

    def test_item_backed_entry_gets_item_url(self, tmp_path):
        assembled = {
            "items": {
                12608: _entry("Catseye Elixir", ex.TYPE_BASE, [12608],
                              soundFileName="catseye_elixir",
                              itemId=10592, trackedEvents=["SPELL_AURA_APPLIED"]),
            }
        }

        enriched, _ = ex.enrich(assembled, "classic", is_avoid_map=False, assets_dir=tmp_path)

        assert enriched["items"][12608]["itemWowheadUrl"] == (
            "https://www.wowhead.com/classic/item=10592")
