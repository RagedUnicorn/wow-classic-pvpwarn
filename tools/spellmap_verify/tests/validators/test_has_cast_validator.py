"""
Tests for HasCastValidator
"""

import pytest
from spellmap_verifier.validators.has_cast_validator import HasCastValidator


@pytest.fixture
def validator():
    """Create a HasCastValidator instance."""
    return HasCastValidator()


def test_valid_has_cast_true(validator):
    """Test validation passes for valid hasCast=true entries."""
    test_data = {
        "mage": {
            12826: {
                "name": "Polymorph",
                "type": "RGPVPW_CONSTANTS.SPELL_TYPE_BASE",
                "soundFileName": "polymorph",
                "spellIcon": "spell_nature_polymorph",
                "hasFade": False,
                "hasCast": True,  # Testing with True value
                "active": True,
                "trackedEvents": ["SPELL_CAST_SUCCESS", "SPELL_CAST_START"],
                "allRanks": [118, 12824, 12825, 12826]
            }
        }
    }

    validator.validate(test_data)

    assert not validator.has_errors()
    assert len(validator.get_errors()) == 0


def test_valid_has_cast_false(validator):
    """Test validation passes for valid hasCast=false entries."""
    test_data = {
        "warrior": {
            100: {
                "name": "Test Spell",
                "type": "RGPVPW_CONSTANTS.SPELL_TYPE_BASE",
                "soundFileName": "test_spell",
                "spellIcon": "test_icon",
                "hasFade": False,
                "hasCast": False,  # Testing with False value
                "active": True,
                "trackedEvents": ["SPELL_CAST_SUCCESS"],
                "allRanks": [100]
            }
        }
    }

    validator.validate(test_data)

    assert not validator.has_errors()


def test_missing_has_cast_is_valid(validator):
    """Test validation passes when hasCast property is missing (it's optional)."""
    test_data = {
        "warrior": {
            100: {
                "name": "Test Spell",
                "type": "RGPVPW_CONSTANTS.SPELL_TYPE_BASE",
                "soundFileName": "test_spell",
                "spellIcon": "test_icon",
                "hasFade": False,
                # hasCast is intentionally missing - this should be valid
                "active": True,
                "trackedEvents": ["SPELL_CAST_SUCCESS"],
                "allRanks": [100]
            }
        }
    }

    validator.validate(test_data)

    assert not validator.has_errors()


def test_has_cast_string_instead_of_boolean(validator):
    """Test validation fails when hasCast is a string instead of boolean."""
    test_data = {
        "warrior": {
            871: {
                "name": "Test Spell",
                "type": "RGPVPW_CONSTANTS.SPELL_TYPE_BASE",
                "soundFileName": "test_spell",
                "spellIcon": "test_icon",
                "hasFade": False,
                "hasCast": "true",  # String instead of boolean
                "active": True,
                "trackedEvents": ["SPELL_CAST_SUCCESS"],
                "allRanks": [871]
            }
        }
    }

    validator.validate(test_data)

    assert validator.has_errors()
    errors = validator.get_errors()
    assert len(errors) == 1
    assert "warrior[871]: 'hasCast' must be a boolean (true or false), got str" in errors[0]


def test_has_cast_number_instead_of_boolean(validator):
    """Test validation fails when hasCast is a number instead of boolean."""
    test_data = {
        "mage": {
            2565: {
                "name": "Test Spell",
                "type": "RGPVPW_CONSTANTS.SPELL_TYPE_BASE",
                "soundFileName": "test_spell",
                "spellIcon": "test_icon",
                "hasFade": False,
                "hasCast": 1,  # Number instead of boolean
                "active": True,
                "trackedEvents": ["SPELL_CAST_SUCCESS"],
                "allRanks": [2565]
            }
        }
    }

    validator.validate(test_data)

    assert validator.has_errors()
    errors = validator.get_errors()
    assert len(errors) == 1
    assert "mage[2565]: 'hasCast' must be a boolean (true or false), got int" in errors[0]


def test_has_cast_none_instead_of_boolean(validator):
    """Test validation fails when hasCast is None instead of boolean."""
    test_data = {
        "priest": {
            676: {
                "name": "Test Spell",
                "type": "RGPVPW_CONSTANTS.SPELL_TYPE_BASE",
                "soundFileName": "test_spell",
                "spellIcon": "test_icon",
                "hasFade": False,
                "hasCast": None,  # None instead of boolean
                "active": True,
                "trackedEvents": ["SPELL_CAST_SUCCESS"],
                "allRanks": [676]
            }
        }
    }

    validator.validate(test_data)

    assert validator.has_errors()
    errors = validator.get_errors()
    assert len(errors) == 1
    assert "priest[676]: 'hasCast' must be a boolean (true or false), got NoneType" in errors[0]


def test_has_cast_list_instead_of_boolean(validator):
    """Test validation fails when hasCast is a list instead of boolean."""
    test_data = {
        "druid": {
            5246: {
                "name": "Test Spell",
                "type": "RGPVPW_CONSTANTS.SPELL_TYPE_BASE",
                "soundFileName": "test_spell",
                "spellIcon": "test_icon",
                "hasFade": False,
                "hasCast": [],  # List instead of boolean
                "active": True,
                "trackedEvents": ["SPELL_CAST_SUCCESS"],
                "allRanks": [5246]
            }
        }
    }

    validator.validate(test_data)

    assert validator.has_errors()
    errors = validator.get_errors()
    assert len(errors) == 1
    assert "druid[5246]: 'hasCast' must be a boolean (true or false), got list" in errors[0]


def test_has_cast_dict_instead_of_boolean(validator):
    """Test validation fails when hasCast is a dict instead of boolean."""
    test_data = {
        "rogue": {
            1234: {
                "name": "Test Spell",
                "type": "RGPVPW_CONSTANTS.SPELL_TYPE_BASE",
                "soundFileName": "test_spell",
                "spellIcon": "test_icon",
                "hasFade": False,
                "hasCast": {},  # Dict instead of boolean
                "active": True,
                "trackedEvents": ["SPELL_CAST_SUCCESS"],
                "allRanks": [1234]
            }
        }
    }

    validator.validate(test_data)

    assert validator.has_errors()
    errors = validator.get_errors()
    assert len(errors) == 1
    assert "rogue[1234]: 'hasCast' must be a boolean (true or false), got dict" in errors[0]


def test_reference_entries_are_skipped(validator):
    """Test that reference entries (with only refId) are skipped by the validator."""
    test_data = {
        "mage": {
            118: {"refId": 12826},  # Reference entry - should be skipped
            12826: {
                "name": "Polymorph",
                "type": "RGPVPW_CONSTANTS.SPELL_TYPE_BASE",
                "soundFileName": "polymorph",
                "spellIcon": "spell_nature_polymorph",
                "hasFade": False,
                "hasCast": True,
                "active": True,
                "trackedEvents": ["SPELL_CAST_SUCCESS", "SPELL_CAST_START"],
                "allRanks": [118, 12824, 12825, 12826]
            }
        }
    }

    validator.validate(test_data)

    # Should not have errors - reference entry should be skipped
    assert not validator.has_errors()


def test_multiple_entries_with_mixed_has_cast(validator):
    """Test validation with multiple entries having different hasCast states."""
    test_data = {
        "mage": {
            # Entry with hasCast=true
            12826: {
                "name": "Polymorph",
                "type": "RGPVPW_CONSTANTS.SPELL_TYPE_BASE",
                "soundFileName": "polymorph",
                "spellIcon": "spell_nature_polymorph",
                "hasFade": False,
                "hasCast": True,
                "active": True,
                "trackedEvents": ["SPELL_CAST_SUCCESS", "SPELL_CAST_START"],
                "allRanks": [12826]
            },
            # Entry without hasCast (valid - it's optional)
            133: {
                "name": "Fireball",
                "type": "RGPVPW_CONSTANTS.SPELL_TYPE_BASE",
                "soundFileName": "fireball",
                "spellIcon": "spell_fire_fireball",
                "hasFade": False,
                "active": True,
                "trackedEvents": ["SPELL_CAST_SUCCESS"],
                "allRanks": [133]
            },
            # Entry with invalid hasCast
            1463: {
                "name": "Mana Shield",
                "type": "RGPVPW_CONSTANTS.SPELL_TYPE_BASE",
                "soundFileName": "mana_shield",
                "spellIcon": "spell_shadow_detectlesserinvisibility",
                "hasFade": True,
                "hasCast": "yes",  # Invalid type
                "active": True,
                "trackedEvents": ["SPELL_AURA_APPLIED", "SPELL_AURA_REMOVED"],
                "allRanks": [1463]
            }
        }
    }

    validator.validate(test_data)

    assert validator.has_errors()
    errors = validator.get_errors()
    assert len(errors) == 1
    assert "mage[1463]: 'hasCast' must be a boolean (true or false), got str" in errors[0]

