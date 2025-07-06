"""
Tests for SoundFileNameValidator using pytest with Lua fixtures.
"""

import pytest
from spellmap_verifier.validators import SoundFileNameValidator


class TestSoundFileNameValidator:
    """Test suite for SoundFileNameValidator."""

    def test_invalid_sound_file_names_fixture(self, invalid_sound_file_names_spellmap):
        """Test sound file name validation using the invalid_sound_file_names fixture."""
        validator = SoundFileNameValidator()
        validator.validate(invalid_sound_file_names_spellmap)

        errors = validator.get_errors()

        # Expected errors:
        # - 12323: Missing soundFileName
        # - 18499: Empty soundFileName
        # - 20230: soundFileName not a string (number)
        # - 25275: Contains capital letters "Intercept_Sound"
        # - 1719: Contains hyphen "recklessness-sound"
        # - 12042: Contains space "arcane power"
        # - 11958: Contains special character "ice_block!"
        # - 1856: Contains numbers "vanish123"
        # - 5277: Contains non-ASCII "évasion"
        # - 1953: Valid (no error)
        # - 99999: Reference entry (skipped)
        assert len(errors) == 9

        # Check for missing soundFileName
        assert any("12323" in error and "Missing" in error for error in errors)

        # Check for empty soundFileName
        assert any("18499" in error and "empty" in error for error in errors)

        # Check for non-string type
        assert any("20230" in error and "must be a string" in error for error in errors)

        # Check for invalid characters
        assert any("25275" in error and "Intercept_Sound" in error and "'I'" in error for error in errors)
        assert any("1719" in error and "recklessness-sound" in error and "'-'" in error for error in errors)
        assert any("12042" in error and "arcane power" in error and "' '" in error for error in errors)
        assert any("11958" in error and "ice_block!" in error and "'!'" in error for error in errors)
        assert any("1856" in error and "vanish123" in error and "'1'" in error for error in errors)
        assert any("5277" in error and "évasion" in error for error in errors)

        # Valid spell should not have errors
        assert not any("1953" in error for error in errors)

        # Reference entry should be skipped
        assert not any("99999" in error for error in errors)

    def test_valid_spellmap_sound_file_names(self, valid_spellmap):
        """Test that valid spellmap produces no sound file name errors."""
        validator = SoundFileNameValidator()
        validator.validate(valid_spellmap)

        errors = validator.get_errors()
        assert len(errors) == 0

    def test_valid_sound_file_names(self):
        """Test various valid sound file name patterns."""
        test_entries = {
            "test": {
                1: {
                    "name": "Test1",
                    "type": "SPELL_TYPE_BASE",
                    "soundFileName": "simple",
                    "trackedEvents": ["SPELL_CAST_SUCCESS"]
                },
                2: {
                    "name": "Test2",
                    "type": "SPELL_TYPE_BASE",
                    "soundFileName": "with_underscores",
                    "trackedEvents": ["SPELL_CAST_SUCCESS"]
                },
                3: {
                    "name": "Test3",
                    "type": "SPELL_TYPE_BASE",
                    "soundFileName": "multiple_underscores_allowed",
                    "trackedEvents": ["SPELL_CAST_SUCCESS"]
                },
                4: {
                    "name": "Test4",
                    "type": "SPELL_TYPE_BASE",
                    "soundFileName": "a",  # Single character is valid
                    "trackedEvents": ["SPELL_CAST_SUCCESS"]
                },
                5: {
                    "name": "Test5",
                    "type": "SPELL_TYPE_BASE",
                    "soundFileName": "_leading_underscore",
                    "trackedEvents": ["SPELL_CAST_SUCCESS"]
                }
            }
        }

        validator = SoundFileNameValidator()
        validator.validate(test_entries)

        errors = validator.get_errors()
        assert len(errors) == 0
    
    def test_valid_sound_file_names_from_fixture(self, valid_spell_variations):
        """Test various valid sound file name patterns using fixture."""
        validator = SoundFileNameValidator()
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
        
        validator = SoundFileNameValidator()
        validator.validate(test_entries)
        
        errors = validator.get_errors()
        assert len(errors) == 0
