"""
Tests for the shared directory-level union loader (spellmap_core/map_loader.py).
"""

import pytest

from spellmap_core.map_loader import load_union_map, union_apply


@pytest.fixture
def base():
    return {
        "warrior": {
            12323: {"name": "Piercing Howl", "type": "SPELL_TYPE_BASE"},
            18499: {"name": "Berserker Rage", "type": "SPELL_TYPE_BASE"},
        },
        "mage": {
            12042: {"name": "Arcane Power", "type": "SPELL_TYPE_BASE"},
        },
    }


class TestUnionApply:
    def test_no_overlays_returns_copy_of_base(self, base):
        result = union_apply(base, [])
        assert result == base
        assert result is not base

    def test_remove_is_skipped(self, base):
        overlay = {"warrior": {"remove": [12323]}}
        result = union_apply(base, [overlay])
        assert 12323 in result["warrior"]

    def test_add_and_replace_are_applied(self, base):
        overlay = {
            "warrior": {"add": {402911: {"name": "Raging Blow", "type": "SPELL_TYPE_SOD"}}},
            "mage": {"replace": {12042: {"name": "Arcane Power", "type": "SPELL_TYPE_SOD"}}},
        }
        result = union_apply(base, [overlay])
        assert result["warrior"][402911]["name"] == "Raging Blow"
        assert result["mage"][12042]["type"] == "SPELL_TYPE_SOD"

    def test_append_ranks_is_applied(self):
        base = {
            "shaman": {
                10463: {
                    "name": "Healing Stream Totem",
                    "type": "SPELL_TYPE_BASE",
                    "allRanks": [{"spellId": 5394, "type": "SPELL_TYPE_BASE"}],
                },
            },
        }
        overlay = {
            "shaman": {
                "appendRanks": {10463: [{"spellId": 25566, "type": "SPELL_TYPE_TBC"}]},
            },
        }
        result = union_apply(base, [overlay])
        rank_ids = [r["spellId"] for r in result["shaman"][10463]["allRanks"]]
        assert rank_ids == [5394, 25566]

    def test_removed_then_added_entry_keeps_latest_data(self, base):
        # A branch remodel (remove X, add X') must surface the branch's version in the union.
        overlay = {
            "warrior": {
                "remove": [12323],
                "add": {12323: {"name": "Piercing Howl", "type": "SPELL_TYPE_SOD"}},
            },
        }
        result = union_apply(base, [overlay])
        assert result["warrior"][12323]["type"] == "SPELL_TYPE_SOD"

    def test_base_and_overlays_are_not_mutated(self, base):
        overlay = {"warrior": {"remove": [12323], "add": {1: {"name": "New"}}}}
        union_apply(base, [overlay])
        assert 1 not in base["warrior"]
        assert overlay["warrior"]["remove"] == [12323]


class TestLoadUnionMap:
    @pytest.fixture
    def map_dir(self, tmp_path):
        """A minimal base + overlay directory in the production layout."""
        (tmp_path / "overlay").mkdir()
        (tmp_path / "Base.lua").write_text(
            """
            local mod = rgpvpw
            local me = {}
            mod.spellMapBase = me

            local spellMap = {
              ["warrior"] = {
                [6673] = {
                  name = "Battle Shout",
                  type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
                  soundFileName = "battle_shout",
                  trackedEvents = {
                    "SPELL_CAST_SUCCESS"
                  }
                },
                [100] = {
                  name = "Charge",
                  type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
                  soundFileName = "charge"
                }
              }
            }
            """,
            encoding="utf-8",
        )
        (tmp_path / "overlay" / "Sod.lua").write_text(
            """
            local mod = rgpvpw
            local me = {}
            mod.spellMapOverlaySod = me

            function me.GetOverlay()
              return {
                ["warrior"] = {
                  remove = { 100 },
                  add = {
                    [402911] = {
                      name = "Raging Blow",
                      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
                      soundFileName = "raging_blow"
                    }
                  }
                }
              }
            end
            """,
            encoding="utf-8",
        )
        return tmp_path

    def test_union_of_base_and_overlay(self, map_dir):
        result = load_union_map(str(map_dir))

        warrior = result["warrior"]
        # Base entries survive, including the one the SoD overlay removes.
        assert warrior[6673]["name"] == "Battle Shout"
        assert warrior[100]["name"] == "Charge"
        # Overlay-added entry is present.
        assert warrior[402911]["type"] == "SPELL_TYPE_SOD"
        # Array tables surface as Python lists.
        assert warrior[6673]["trackedEvents"] == ["SPELL_CAST_SUCCESS"]

    def test_missing_directory_raises(self, tmp_path):
        with pytest.raises(FileNotFoundError):
            load_union_map(str(tmp_path / "does_not_exist"))

    def test_missing_base_file_raises(self, tmp_path):
        with pytest.raises(FileNotFoundError):
            load_union_map(str(tmp_path))
