"""
Tests for AllRanksValidator
"""

import os
import pytest
from pathlib import Path
from spellmap_verifier.validators.all_ranks_validator import AllRanksValidator
from spellmap_verifier.lua_parser import LuaParser


@pytest.fixture
def validator():
    """Create an AllRanksValidator instance."""
    return AllRanksValidator()


def test_valid_all_ranks(validator, fixture_loader):
    """Test validation passes for valid allRanks entries."""
    entries = fixture_loader.load_fixture("valid_spell_variations")

    validator.validate(entries)

    if validator.has_errors():
        print("\nErrors found:")
        for error in validator.get_errors():
            print(f"  - {error}")

    assert not validator.has_errors()
    assert len(validator.get_errors()) == 0


def test_missing_all_ranks(validator, fixture_loader):
    """Test validation fails when allRanks is missing."""
    entries = fixture_loader.load_fixture("invalid_all_ranks")

    validator.validate(entries)

    if validator.has_errors():
        print("\nErrors found:")
        for error in validator.get_errors():
            print(f"  - {error}")
    else:
        print("\nNo errors found!")
        print(f"Entries: {entries}")

    assert validator.has_errors()
    errors = validator.get_errors()

    # Check for missing allRanks error
    missing_error = next((e for e in errors if "100" in e and "Missing 'allRanks'" in e), None)
    assert missing_error is not None
    assert "warrior[100]: Missing 'allRanks' property" in missing_error


def test_all_ranks_not_list(validator, fixture_loader):
    """Test validation fails when allRanks is not a list."""
    entries = fixture_loader.load_fixture("invalid_all_ranks")

    validator.validate(entries)

    assert validator.has_errors()
    errors = validator.get_errors()

    # Check for not a list error
    type_error = next((e for e in errors if "6178" in e and "must be a list" in e), None)
    assert type_error is not None
    assert "warrior[6178]: 'allRanks' must be a list" in type_error


def test_empty_all_ranks(validator, fixture_loader):
    """Test validation fails when allRanks is empty."""
    entries = fixture_loader.load_fixture("invalid_all_ranks")

    validator.validate(entries)

    assert validator.has_errors()
    errors = validator.get_errors()

    # Check for empty list error
    empty_error = next((e for e in errors if "11578" in e and "is empty" in e), None)
    assert empty_error is not None
    assert "warrior[11578]: 'allRanks' list is empty" in empty_error


def test_non_numeric_all_ranks(validator, fixture_loader):
    """Test validation fails when allRanks contains non-numeric values."""
    entries = fixture_loader.load_fixture("invalid_all_ranks")

    validator.validate(entries)

    assert validator.has_errors()
    errors = validator.get_errors()

    # Check for non-numeric values error
    non_numeric_error = next((e for e in errors if "2565" in e and "non-numeric" in e), None)
    assert non_numeric_error is not None
    assert "warrior[2565]: 'allRanks' contains non-numeric values" in non_numeric_error


def test_missing_own_spell_id(validator, fixture_loader):
    """Test validation fails when allRanks doesn't contain the spell's own ID."""
    entries = fixture_loader.load_fixture("invalid_all_ranks")

    validator.validate(entries)

    assert validator.has_errors()
    errors = validator.get_errors()

    # Check for missing own ID error
    own_id_error = next((e for e in errors if "871" in e and "must contain the spell's own ID" in e), None)
    assert own_id_error is not None
    assert "warrior[871]: 'allRanks' must contain the spell's own ID 871" in own_id_error


def test_missing_referencing_spells(validator, fixture_loader):
    """Test validation fails when allRanks is missing referencing spell IDs."""
    entries = fixture_loader.load_fixture("invalid_all_ranks")

    validator.validate(entries)

    assert validator.has_errors()
    errors = validator.get_errors()

    # Check for missing references error (Shield Bash should have all ranks)
    missing_refs_error = next((e for e in errors if "72" in e and "missing referencing spell IDs" in e), None)
    assert missing_refs_error is not None
    assert "1671" in missing_refs_error
    assert "1672" in missing_refs_error


def test_unexpected_spell_ids(validator, fixture_loader):
    """Test validation fails when allRanks contains unexpected spell IDs."""
    entries = fixture_loader.load_fixture("invalid_all_ranks")

    validator.validate(entries)

    assert validator.has_errors()
    errors = validator.get_errors()

    # Check for unexpected IDs error
    unexpected_error = next((e for e in errors if "676" in e and "unexpected spell IDs" in e), None)
    assert unexpected_error is not None
    assert "99999" in unexpected_error


def test_reference_entries_are_skipped(validator):
    """Test that reference entries (with only refId) are skipped by the validator."""
    test_data = {
        "warrior": {
            1671: {"refId": 72},  # Reference entry - should be skipped
            72: {
                "name": "Shield Bash",
                "type": "RGPVPW_CONSTANTS.SPELL_TYPE_BASE",
                "soundFileName": "shield_bash",
                "spellIcon": "ability_warrior_shieldbash",
                "hasFade": False,
                "active": True,
                "trackedEvents": ["SPELL_CAST_SUCCESS"],
                "allRanks": [72, 1671]
            }
        }
    }

    validator.validate(test_data)

    # Should not have errors - reference entry should be skipped
    assert not validator.has_errors()
