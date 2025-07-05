"""
Tests for HasFadeValidator
"""

import pytest
from spellmap_verifier.validators.has_fade_validator import HasFadeValidator


@pytest.fixture
def validator():
    """Create a HasFadeValidator instance."""
    return HasFadeValidator()


def test_valid_has_fade_true(validator, fixture_loader):
    """Test validation passes for valid hasFade=true entries."""
    entries = fixture_loader.load_fixture("valid_spell_variations")

    validator.validate(entries)

    assert not validator.has_errors()
    assert len(validator.get_errors()) == 0


def test_valid_has_fade_false(validator):
    """Test validation passes for valid hasFade=false entries."""
    test_data = {
        "warrior": {
            100: {
                "name": "Test Spell",
                "type": "RGPVPW_CONSTANTS.SPELL_TYPE_BASE",
                "soundFileName": "test_spell",
                "spellIcon": "test_icon",
                "hasFade": False,  # Testing with False value
                "active": True,
                "trackedEvents": ["SPELL_CAST_SUCCESS"],
                "allRanks": [100]
            }
        }
    }

    validator.validate(test_data)

    assert not validator.has_errors()


def test_missing_has_fade(validator, fixture_loader):
    """Test validation fails when hasFade property is missing."""
    entries = fixture_loader.load_fixture("invalid_has_fade")

    validator.validate(entries)

    assert validator.has_errors()
    errors = validator.get_errors()

    # Check for missing hasFade error
    missing_error = next((e for e in errors if "100" in e and "Missing 'hasFade'" in e), None)
    assert missing_error is not None
    assert "warrior[100]: Missing 'hasFade' property" in missing_error


def test_has_fade_string_instead_of_boolean(validator, fixture_loader):
    """Test validation fails when hasFade is a string instead of boolean."""
    entries = fixture_loader.load_fixture("invalid_has_fade")

    validator.validate(entries)

    assert validator.has_errors()
    errors = validator.get_errors()

    # Check for string type error
    type_error = next((e for e in errors if "871" in e and "must be a boolean" in e), None)
    assert type_error is not None
    assert "warrior[871]: 'hasFade' must be a boolean (true or false), got str" in type_error


def test_has_fade_number_instead_of_boolean(validator, fixture_loader):
    """Test validation fails when hasFade is a number instead of boolean."""
    entries = fixture_loader.load_fixture("invalid_has_fade")

    validator.validate(entries)

    assert validator.has_errors()
    errors = validator.get_errors()

    # Check for number type error
    type_error = next((e for e in errors if "2565" in e and "must be a boolean" in e), None)
    assert type_error is not None
    assert "warrior[2565]: 'hasFade' must be a boolean (true or false), got int" in type_error


def test_has_fade_nil_instead_of_boolean(validator, fixture_loader):
    """Test validation fails when hasFade is nil instead of boolean."""
    entries = fixture_loader.load_fixture("invalid_has_fade")

    validator.validate(entries)

    assert validator.has_errors()
    errors = validator.get_errors()

    # Check for nil type error (nil becomes NoneType in Python)
    type_error = next((e for e in errors if "676" in e), None)
    assert type_error is not None
    # nil might be missing or NoneType depending on Lua parser behavior


def test_has_fade_table_instead_of_boolean(validator, fixture_loader):
    """Test validation fails when hasFade is a table instead of boolean."""
    entries = fixture_loader.load_fixture("invalid_has_fade")

    validator.validate(entries)

    assert validator.has_errors()
    errors = validator.get_errors()

    # Check for table type error
    type_error = next((e for e in errors if "5246" in e and "must be a boolean" in e), None)
    assert type_error is not None
    assert "list" in type_error or "dict" in type_error  # Empty Lua tables become lists in Python


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
