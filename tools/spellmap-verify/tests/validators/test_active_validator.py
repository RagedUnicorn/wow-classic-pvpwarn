"""
Tests for ActiveValidator
"""

import pytest
from spellmap_verifier.validators.active_validator import ActiveValidator


@pytest.fixture
def validator():
    """Create an ActiveValidator instance."""
    return ActiveValidator()


def test_valid_active_true(validator, fixture_loader):
    """Test validation passes for valid active=true entries."""
    entries = fixture_loader.load_fixture("valid_spell_variations")

    validator.validate(entries)

    assert not validator.has_errors()
    assert len(validator.get_errors()) == 0


def test_valid_active_false(validator):
    """Test validation passes for valid active=false entries."""
    test_data = {
        "warrior": {
            100: {
                "name": "Test Spell",
                "type": "RGPVPW_CONSTANTS.SPELL_TYPE_BASE",
                "soundFileName": "test_spell",
                "spellIcon": "test_icon",
                "hasFade": False,
                "active": False,  # Testing with False value
                "trackedEvents": ["SPELL_CAST_SUCCESS"],
                "allRanks": [100]
            }
        }
    }

    validator.validate(test_data)

    assert not validator.has_errors()


def test_missing_active(validator, fixture_loader):
    """Test validation fails when active property is missing."""
    entries = fixture_loader.load_fixture("invalid_active")

    validator.validate(entries)

    assert validator.has_errors()
    errors = validator.get_errors()

    # Check for missing active error
    missing_error = next((e for e in errors if "100" in e and "Missing 'active'" in e), None)
    assert missing_error is not None
    assert "warrior[100]: Missing 'active' property" in missing_error


def test_active_string_instead_of_boolean(validator, fixture_loader):
    """Test validation fails when active is a string instead of boolean."""
    entries = fixture_loader.load_fixture("invalid_active")

    validator.validate(entries)

    assert validator.has_errors()
    errors = validator.get_errors()

    # Check for string type error
    type_error = next((e for e in errors if "871" in e and "must be a boolean" in e), None)
    assert type_error is not None
    assert "warrior[871]: 'active' must be a boolean (true or false), got str" in type_error


def test_active_number_instead_of_boolean(validator, fixture_loader):
    """Test validation fails when active is a number instead of boolean."""
    entries = fixture_loader.load_fixture("invalid_active")

    validator.validate(entries)

    assert validator.has_errors()
    errors = validator.get_errors()

    # Check for number type error
    type_error = next((e for e in errors if "2565" in e and "must be a boolean" in e), None)
    assert type_error is not None
    assert "warrior[2565]: 'active' must be a boolean (true or false), got int" in type_error


def test_active_nil_instead_of_boolean(validator, fixture_loader):
    """Test validation fails when active is nil instead of boolean."""
    entries = fixture_loader.load_fixture("invalid_active")

    validator.validate(entries)

    assert validator.has_errors()
    errors = validator.get_errors()

    # Check for nil type error (nil becomes NoneType in Python)
    type_error = next((e for e in errors if "676" in e), None)
    assert type_error is not None
    # nil might be missing or NoneType depending on Lua parser behavior


def test_active_table_instead_of_boolean(validator, fixture_loader):
    """Test validation fails when active is a table instead of boolean."""
    entries = fixture_loader.load_fixture("invalid_active")

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
