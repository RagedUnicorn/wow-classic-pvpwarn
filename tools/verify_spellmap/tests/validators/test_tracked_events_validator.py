"""
Tests for TrackedEventsValidator using pytest with Lua fixtures.
"""

import pytest
from verify_spellmap.validators import TrackedEventsValidator


class TestTrackedEventsValidator:
    """Test suite for TrackedEventsValidator."""

    def test_invalid_tracked_events_fixture(self, invalid_tracked_events_spellmap):
        """Test tracked events validation using the invalid_tracked_events fixture."""
        validator = TrackedEventsValidator()
        validator.validate(invalid_tracked_events_spellmap)

        errors = validator.get_errors()

        # Expected errors:
        # - 12323: Missing trackedEvents
        # - 18499: Empty trackedEvents array
        # - 20230: trackedEvents not an array
        # - 25275: Contains invalid event "INVALID_EVENT"
        # - 1719: Contains non-string value 123
        # - 11958: Contains invalid events "SPELL_DAMAGE" and "SPELL_MISSED"
        # - 12042: Valid (no errors)
        # - 99999: Reference entry (skipped)
        assert len(errors) == 6

        # Check for missing trackedEvents
        assert any("12323" in error and "Missing" in error for error in errors)

        # Check for empty array
        assert any("18499" in error and "empty" in error for error in errors)

        # Check for non-array type
        assert any("20230" in error and "must be a list" in error for error in errors)

        # Check for invalid events
        assert any("25275" in error and "INVALID_EVENT" in error for error in errors)
        assert any("11958" in error and "SPELL_DAMAGE" in error for error in errors)

        # Check for non-string values
        assert any("1719" in error and "123" in error for error in errors)

        # Valid spell should not have errors
        assert not any("12042" in error for error in errors)

        # Reference entry should be skipped
        assert not any("99999" in error for error in errors)

    def test_valid_spellmap_tracked_events(self, valid_spellmap):
        """Test that valid spellmap produces no tracked events errors."""
        validator = TrackedEventsValidator()
        validator.validate(valid_spellmap)

        errors = validator.get_errors()
        assert len(errors) == 0

    def test_all_allowed_events(self):
        """Test that all allowed events are accepted."""
        test_entries = {
            "test": {
                1: {
                    "name": "Test1",
                    "type": "SPELL_TYPE_BASE",
                    "trackedEvents": ["SPELL_AURA_APPLIED"]
                },
                2: {
                    "name": "Test2",
                    "type": "SPELL_TYPE_BASE",
                    "trackedEvents": ["SPELL_AURA_REMOVED"]
                },
                3: {
                    "name": "Test3",
                    "type": "SPELL_TYPE_BASE",
                    "trackedEvents": ["SPELL_CAST_SUCCESS"]
                },
                4: {
                    "name": "Test4",
                    "type": "SPELL_TYPE_BASE",
                    "trackedEvents": ["SPELL_AURA_REFRESH"]
                },
                5: {
                    "name": "Test5",
                    "type": "SPELL_TYPE_BASE",
                    "trackedEvents": [
                        "SPELL_AURA_APPLIED",
                        "SPELL_AURA_REMOVED",
                        "SPELL_CAST_SUCCESS",
                        "SPELL_AURA_REFRESH"
                    ]
                }
            }
        }

        validator = TrackedEventsValidator()
        validator.validate(test_entries)

        errors = validator.get_errors()
        assert len(errors) == 0
    
    def test_all_allowed_events_from_fixture(self, valid_spell_variations):
        """Test that all allowed events are accepted using fixture."""
        validator = TrackedEventsValidator()
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
        
        validator = TrackedEventsValidator()
        validator.validate(test_entries)
        
        errors = validator.get_errors()
        assert len(errors) == 0
