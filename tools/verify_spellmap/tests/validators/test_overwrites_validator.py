"""
Tests for OverwritesValidator
"""

import pytest
from verify_spellmap.validators.overwrites_validator import OverwritesValidator


@pytest.fixture
def validator():
    """Create an OverwritesValidator instance."""
    return OverwritesValidator()


def _base_spell(name="Explosive Trap"):
    """Return a minimal valid SPELL_TYPE_BASE entry."""
    return {
        "name": name,
        "type": "SPELL_TYPE_BASE",
        "soundFileName": "explosive_trap",
        "spellIcon": "spell_fire_selfdestruct",
        "hasFade": False,
        "active": True,
        "trackedEvents": ["SPELL_CAST_SUCCESS"],
        "allRanks": [14317]
    }


def _sod_spell(overwrites=14317):
    """Return a minimal valid SPELL_TYPE_SOD entry with an overwrites property."""
    spell = {
        "name": "Explosive Trap",
        "type": "SPELL_TYPE_SOD",
        "soundFileName": "explosive_trap",
        "spellIcon": "spell_fire_selfdestruct",
        "hasFade": False,
        "active": True,
        "trackedEvents": ["SPELL_CAST_SUCCESS"],
        "allRanks": [409535]
    }

    if overwrites is not None:
        spell["overwrites"] = overwrites

    return spell


def test_valid_overwrites(validator):
    """A SoD entry overwriting a base entry in the same category is valid."""
    test_data = {
        "hunter": {
            14317: _base_spell(),
            409535: _sod_spell(overwrites=14317)
        }
    }

    validator.validate(test_data)

    assert not validator.has_errors()


def test_missing_overwrites_is_valid(validator):
    """The overwrites property is optional."""
    test_data = {
        "hunter": {
            14317: _base_spell(),
            409535: _sod_spell(overwrites=None)
        }
    }

    validator.validate(test_data)

    assert not validator.has_errors()


def test_reference_entries_are_skipped(validator):
    """Reference entries (only refId) are skipped."""
    test_data = {
        "hunter": {
            14317: _base_spell(),
            409532: {"refId": 409535},
            409535: _sod_spell(overwrites=14317)
        }
    }

    validator.validate(test_data)

    assert not validator.has_errors()


def test_overwrites_string_instead_of_integer(validator):
    """overwrites must be an integer."""
    test_data = {
        "hunter": {
            14317: _base_spell(),
            409535: _sod_spell(overwrites="14317")
        }
    }

    validator.validate(test_data)

    assert validator.has_errors()
    assert "'overwrites' must be an integer, got str" in validator.get_errors()[0]


def test_overwrites_boolean_is_rejected(validator):
    """A boolean is not accepted as an integer overwrites value."""
    test_data = {
        "hunter": {
            14317: _base_spell(),
            409535: _sod_spell(overwrites=True)
        }
    }

    validator.validate(test_data)

    assert validator.has_errors()
    assert "'overwrites' must be an integer, got bool" in validator.get_errors()[0]


def test_overwrites_on_base_entry_is_rejected(validator):
    """overwrites is only allowed on SPELL_TYPE_SOD entries."""
    base_with_overwrites = _base_spell()
    base_with_overwrites["overwrites"] = 13809

    test_data = {
        "hunter": {
            13809: _base_spell(name="Frost Trap"),
            14317: base_with_overwrites
        }
    }

    validator.validate(test_data)

    assert validator.has_errors()
    assert "'overwrites' is only allowed on SPELL_TYPE_SOD entries" in validator.get_errors()[0]


def test_overwrites_references_missing_spell(validator):
    """overwrites must reference a spell that exists in the same category."""
    test_data = {
        "hunter": {
            409535: _sod_spell(overwrites=99999)
        }
    }

    validator.validate(test_data)

    assert validator.has_errors()
    assert "references spell ID 99999 which does not exist" in validator.get_errors()[0]


def test_overwrites_references_reference_entry(validator):
    """overwrites must not reference a refId reference entry."""
    test_data = {
        "hunter": {
            14316: {"refId": 14317},
            14317: _base_spell(),
            409535: _sod_spell(overwrites=14316)
        }
    }

    validator.validate(test_data)

    assert validator.has_errors()
    assert "is a refId reference entry" in validator.get_errors()[0]


def test_overwrites_references_non_base_spell(validator):
    """overwrites must reference a SPELL_TYPE_BASE spell."""
    other_sod = _sod_spell(overwrites=None)

    test_data = {
        "hunter": {
            409534: other_sod,
            409535: _sod_spell(overwrites=409534)
        }
    }

    validator.validate(test_data)

    assert validator.has_errors()
    assert "must reference a SPELL_TYPE_BASE spell" in validator.get_errors()[0]


def test_different_category_is_not_found(validator):
    """overwrites only resolves within the same category."""
    test_data = {
        "warrior": {
            14317: _base_spell()
        },
        "hunter": {
            409535: _sod_spell(overwrites=14317)
        }
    }

    validator.validate(test_data)

    assert validator.has_errors()
    assert "does not exist in category 'hunter'" in validator.get_errors()[0]
