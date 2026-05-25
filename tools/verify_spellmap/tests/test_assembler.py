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
