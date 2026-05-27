"""
Tests for the Python port of mod.spellMapAssembler (verify_spellmap/assembler.py).
"""

import copy
import pytest

from verify_spellmap.assembler import apply, validate


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


@pytest.fixture
def base_with_ranks():
    """Base map containing a multi-rank entry (Healing Stream Totem) plus its refId aliases."""
    return {
        "shaman": {
            10463: {
                "name": "Healing Stream Totem",
                "type": "SPELL_TYPE_BASE",
                "allRanks": [
                    {"spellId": 5394,  "type": "SPELL_TYPE_BASE"},
                    {"spellId": 6375,  "type": "SPELL_TYPE_BASE"},
                    {"spellId": 6377,  "type": "SPELL_TYPE_BASE"},
                    {"spellId": 10462, "type": "SPELL_TYPE_BASE"},
                    {"spellId": 10463, "type": "SPELL_TYPE_BASE"},
                ],
            },
            5394:  {"refId": 10463},
            6375:  {"refId": 10463},
            6377:  {"refId": 10463},
            10462: {"refId": 10463},
        },
    }


class TestApply:
    def test_empty_overlays_returns_copy_of_base(self, base):
        result = apply(base, [])
        assert result == base
        assert result is not base
        # Mutating the result does not affect base
        result["warrior"][12323]["name"] = "Mutated"
        assert base["warrior"][12323]["name"] == "Piercing Howl"

    def test_none_overlays_returns_copy_of_base(self, base):
        result = apply(base, None)
        assert result == base
        assert result is not base

    def test_remove_drops_entry(self, base):
        overlay = {"warrior": {"remove": [12323]}}
        result = apply(base, [overlay])
        assert 12323 not in result["warrior"]
        assert 18499 in result["warrior"]

    def test_add_introduces_new_entry(self, base):
        new_spell = {"name": "Raging Blow", "type": "SPELL_TYPE_SOD"}
        overlay = {"warrior": {"add": {402911: new_spell}}}
        result = apply(base, [overlay])
        assert result["warrior"][402911]["name"] == "Raging Blow"

    def test_replace_swaps_existing_entry(self, base):
        replacement = {"name": "Arcane Power", "type": "SPELL_TYPE_SOD"}
        overlay = {"mage": {"replace": {12042: replacement}}}
        result = apply(base, [overlay])
        assert result["mage"][12042]["type"] == "SPELL_TYPE_SOD"

    def test_remove_add_replace_run_in_order(self, base):
        # remove first → add second succeeds even if same id, replace last needs a present key
        overlay = {
            "warrior": {
                "remove": [18499],
                "add":     {18499: {"name": "Berserker Rage v2", "type": "SPELL_TYPE_SOD"}},
                "replace": {12323: {"name": "Piercing Howl v2", "type": "SPELL_TYPE_SOD"}},
            }
        }
        result = apply(base, [overlay])
        assert result["warrior"][18499]["name"] == "Berserker Rage v2"
        assert result["warrior"][12323]["name"] == "Piercing Howl v2"

    def test_base_not_mutated(self, base):
        snapshot = copy.deepcopy(base)
        overlay = {"warrior": {"remove": [12323], "add": {402911: {"name": "X"}}}}
        apply(base, [overlay])
        assert base == snapshot


class TestValidate:
    def test_no_overlays_returns_empty(self, base):
        assert validate(base, []) == []
        assert validate(base, None) == []

    def test_remove_missing_reports_error(self, base):
        errors = validate(base, [{"warrior": {"remove": [99999]}}])
        assert len(errors) == 1
        assert "warrior.remove" in errors[0]
        assert "99999" in errors[0]

    def test_add_existing_reports_error(self, base):
        errors = validate(base, [{"warrior": {"add": {12323: {"name": "Dup"}}}}])
        assert len(errors) == 1
        assert "warrior.add" in errors[0]
        assert "12323" in errors[0]

    def test_replace_missing_reports_error(self, base):
        errors = validate(base, [{"warrior": {"replace": {99999: {"name": "X"}}}}])
        assert len(errors) == 1
        assert "warrior.replace" in errors[0]

    def test_happy_path_no_errors(self, base):
        overlay = {
            "warrior": {
                "remove": [12323],
                "add": {402911: {"name": "Raging Blow", "type": "SPELL_TYPE_SOD"}},
                "replace": {18499: {"name": "Berserker Rage v2", "type": "SPELL_TYPE_SOD"}},
            }
        }
        assert validate(base, [overlay]) == []

    def test_overlay_index_in_error_message(self, base):
        overlays = [
            {},  # overlay #1 — valid (empty)
            {"warrior": {"remove": [99999]}},  # overlay #2 — bad
        ]
        errors = validate(base, overlays)
        assert any("overlay #2" in err for err in errors)


class TestAppendRanks:
    """The appendRanks op merges TBC ranks into a Base.lua entry's allRanks."""

    def test_appends_rank_to_existing_entry(self, base_with_ranks):
        overlay = {
            "shaman": {
                "appendRanks": {
                    10463: [{"spellId": 25567, "type": "SPELL_TYPE_TBC"}],
                },
            },
        }
        result = apply(base_with_ranks, [overlay])
        ranks = result["shaman"][10463]["allRanks"]
        assert len(ranks) == 6
        assert ranks[-1] == {"spellId": 25567, "type": "SPELL_TYPE_TBC"}

    def test_appends_multiple_ranks(self, base_with_ranks):
        overlay = {
            "shaman": {
                "appendRanks": {
                    10463: [
                        {"spellId": 25567, "type": "SPELL_TYPE_TBC"},
                        {"spellId": 99999, "type": "SPELL_TYPE_TBC"},
                    ],
                },
            },
        }
        result = apply(base_with_ranks, [overlay])
        ranks = result["shaman"][10463]["allRanks"]
        assert len(ranks) == 7
        assert [r["spellId"] for r in ranks[-2:]] == [25567, 99999]

    def test_apply_missing_base_does_not_create(self, base_with_ranks):
        overlay = {
            "shaman": {
                "appendRanks": {
                    99999: [{"spellId": 12345, "type": "SPELL_TYPE_TBC"}],
                },
            },
        }
        result = apply(base_with_ranks, [overlay])
        assert 99999 not in result["shaman"]

    def test_apply_does_not_mutate_base(self, base_with_ranks):
        snapshot = copy.deepcopy(base_with_ranks)
        overlay = {
            "shaman": {
                "appendRanks": {
                    10463: [{"spellId": 25567, "type": "SPELL_TYPE_TBC"}],
                },
            },
        }
        apply(base_with_ranks, [overlay])
        assert base_with_ranks == snapshot

    def test_apply_skips_duplicate_rank(self, base_with_ranks):
        # 10463 itself is already in the base entry's allRanks.
        overlay = {
            "shaman": {
                "appendRanks": {
                    10463: [{"spellId": 10463, "type": "SPELL_TYPE_BASE"}],
                },
            },
        }
        result = apply(base_with_ranks, [overlay])
        spell_ids = [r["spellId"] for r in result["shaman"][10463]["allRanks"]]
        # No duplicate appended.
        assert spell_ids.count(10463) == 1

    def test_validate_missing_base_reports_error(self, base_with_ranks):
        errors = validate(base_with_ranks, [{
            "shaman": {"appendRanks": {99999: [
                {"spellId": 12345, "type": "SPELL_TYPE_TBC"},
            ]}},
        }])
        assert len(errors) == 1
        assert "shaman.appendRanks" in errors[0]
        assert "99999" in errors[0]

    def test_validate_duplicate_rank_reports_error(self, base_with_ranks):
        errors = validate(base_with_ranks, [{
            "shaman": {"appendRanks": {10463: [
                {"spellId": 10463, "type": "SPELL_TYPE_BASE"},
            ]}},
        }])
        assert len(errors) == 1
        assert "shaman.appendRanks" in errors[0]
        assert "10463" in errors[0]
        assert "already in allRanks" in errors[0]

    def test_validate_happy_path_no_errors(self, base_with_ranks):
        # Combined: append the TBC rank AND add the matching refId alias.
        overlay = {
            "shaman": {
                "appendRanks": {
                    10463: [{"spellId": 25567, "type": "SPELL_TYPE_TBC"}],
                },
                "add": {
                    25567: {"refId": 10463},
                },
            },
        }
        assert validate(base_with_ranks, [overlay]) == []

    def test_apply_runs_after_add_so_new_entries_can_be_targeted(self, base_with_ranks):
        # Add a brand-new entry, then append a rank to it in the same overlay.
        overlay = {
            "shaman": {
                "add": {
                    50000: {
                        "name": "Synthetic",
                        "type": "SPELL_TYPE_TBC",
                        "allRanks": [{"spellId": 50000, "type": "SPELL_TYPE_TBC"}],
                    },
                },
                "appendRanks": {
                    50000: [{"spellId": 50001, "type": "SPELL_TYPE_TBC"}],
                },
            },
        }
        result = apply(base_with_ranks, [overlay])
        assert len(result["shaman"][50000]["allRanks"]) == 2


class TestAppendRanksMalformed:
    """Malformed rank entries must not crash apply(); validate() must report them clearly."""

    @pytest.mark.parametrize("bad_rank", [
        25567,            # bare int instead of a dict
        "25567",          # bare string
        None,             # nil-equivalent
        [25567],          # list instead of dict
        {"type": "SPELL_TYPE_TBC"},                     # dict missing spellId
        {"spellId": None, "type": "SPELL_TYPE_TBC"},    # spellId is None
        {"spellId": "abc", "type": "SPELL_TYPE_TBC"},   # spellId not coercible to int
    ])
    def test_apply_skips_malformed_without_raising(self, base_with_ranks, bad_rank):
        overlay = {
            "shaman": {"appendRanks": {10463: [bad_rank]}},
        }
        # Must not raise.
        result = apply(base_with_ranks, [overlay])
        # And must not have appended the malformed entry.
        assert len(result["shaman"][10463]["allRanks"]) == 5

    def test_apply_skips_malformed_keeps_good_ranks(self, base_with_ranks):
        overlay = {
            "shaman": {"appendRanks": {10463: [
                25567,                                            # malformed
                {"spellId": 25568, "type": "SPELL_TYPE_TBC"},     # good
                {"type": "SPELL_TYPE_TBC"},                       # malformed
                {"spellId": 25569, "type": "SPELL_TYPE_TBC"},     # good
            ]}},
        }
        result = apply(base_with_ranks, [overlay])
        spell_ids = [r["spellId"] for r in result["shaman"][10463]["allRanks"]]
        assert 25568 in spell_ids
        assert 25569 in spell_ids
        assert len(result["shaman"][10463]["allRanks"]) == 7

    @pytest.mark.parametrize("bad_rank", [
        25567,
        "25567",
        None,
        [25567],
        {"type": "SPELL_TYPE_TBC"},
        {"spellId": None, "type": "SPELL_TYPE_TBC"},
        {"spellId": "abc", "type": "SPELL_TYPE_TBC"},
    ])
    def test_validate_reports_malformed_rank(self, base_with_ranks, bad_rank):
        errors = validate(base_with_ranks, [{
            "shaman": {"appendRanks": {10463: [bad_rank]}},
        }])
        assert len(errors) == 1
        assert "shaman.appendRanks" in errors[0]
        assert "malformed rank entry" in errors[0]
        assert "10463" in errors[0]

    def test_validate_reports_every_malformed_rank_independently(self, base_with_ranks):
        errors = validate(base_with_ranks, [{
            "shaman": {"appendRanks": {10463: [
                25567,                                           # malformed #1
                {"spellId": 25568, "type": "SPELL_TYPE_TBC"},    # good
                {"type": "SPELL_TYPE_TBC"},                      # malformed #2
            ]}},
        }])
        assert sum("malformed rank entry" in e for e in errors) == 2

    def test_apply_resilient_to_malformed_existing_rank_in_base(self, base_with_ranks):
        # If somehow allRanks already contains a malformed entry, apply still works.
        base_with_ranks["shaman"][10463]["allRanks"].append(99999)  # bare int, malformed
        overlay = {
            "shaman": {"appendRanks": {10463: [
                {"spellId": 25567, "type": "SPELL_TYPE_TBC"},
            ]}},
        }
        result = apply(base_with_ranks, [overlay])
        assert any(isinstance(r, dict) and r.get("spellId") == 25567
                   for r in result["shaman"][10463]["allRanks"])
