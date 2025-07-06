"""
Tests for SpellIconValidator using pytest with Lua fixtures.
"""

import pytest
from spellmap_verifier.validators import SpellIconValidator


class TestSpellIconValidator:
    """Test suite for SpellIconValidator."""

    def test_invalid_spell_icons_fixture(self, invalid_spell_icons_spellmap):
        """Test spell icon validation using the invalid_spell_icons fixture."""
        validator = SpellIconValidator()
        validator.validate(invalid_spell_icons_spellmap)

        errors = validator.get_errors()

        # Expected errors:
        # - 12323: Missing spellIcon
        # - 18499: Empty spellIcon
        # - 20230: spellIcon not a string (number)
        # - 25275: Contains capital letters "Ability_Warrior_Charge"
        # - 1719: Contains hyphen "ability-criticalstrike"
        # - 12042: Contains space "spell nature lightning"
        # - 11958: Contains special character "spell_frost_frost!"
        # - 5277: Contains hash symbol "spell_shadow_shadowward#1"
        # Valid icons (no errors):
        # - 1953: "spell_arcane_blink"
        # - 1856: "spell_magic_lesserinvisibilty"
        # - 5384: "ability_rogue_feigndeath"
        # - 19574: "ability_druid_ferociousbite_01"
        # - 3045: "inv_1h_haremmatron_d_01"
        # - 99999: Reference entry (skipped)
        assert len(errors) == 8

        # Check for missing spellIcon
        assert any("12323" in error and "Missing" in error for error in errors)

        # Check for empty spellIcon
        assert any("18499" in error and "empty" in error for error in errors)

        # Check for non-string type
        assert any("20230" in error and "must be a string" in error for error in errors)

        # Check for invalid characters
        assert any("25275" in error and "Ability_Warrior_Charge" in error and "'A'" in error for error in errors)
        assert any("1719" in error and "ability-criticalstrike" in error and "'-'" in error for error in errors)
        assert any("12042" in error and "spell nature lightning" in error and "' '" in error for error in errors)
        assert any("11958" in error and "spell_frost_frost!" in error and "'!'" in error for error in errors)
        assert any("5277" in error and "spell_shadow_shadowward#1" in error and "'#'" in error for error in errors)

        # Valid spell icons should not have errors
        assert not any("1953" in error for error in errors)  # spell_arcane_blink
        assert not any("1856" in error for error in errors)  # spell_magic_lesserinvisibilty
        assert not any("5384" in error for error in errors)  # ability_rogue_feigndeath
        assert not any("19574" in error for error in errors) # ability_druid_ferociousbite_01
        assert not any("3045" in error for error in errors)  # inv_1h_haremmatron_d_01

        # Reference entry should be skipped
        assert not any("99999" in error for error in errors)

    def test_valid_spellmap_spell_icons(self, valid_spellmap):
        """Test that valid spellmap produces no spell icon errors."""
        validator = SpellIconValidator()
        validator.validate(valid_spellmap)

        errors = validator.get_errors()
        assert len(errors) == 0

    def test_valid_spell_icons(self, valid_spell_variations):
        """Test various valid spell icon patterns using fixture."""
        validator = SpellIconValidator()
        validator.validate(valid_spell_variations)

        errors = validator.get_errors()
        assert len(errors) == 0

    def test_reference_entry_skipped(self, reference_entry):
        """Test that reference entries are properly skipped."""
        test_entries = {
            "test": {
                1: reference_entry
            }
        }

        validator = SpellIconValidator()
        validator.validate(test_entries)

        errors = validator.get_errors()
        assert len(errors) == 0
