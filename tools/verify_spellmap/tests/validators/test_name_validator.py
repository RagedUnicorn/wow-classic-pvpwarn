"""
Tests for NameValidator using pytest with Lua fixtures.
"""

import pytest
from verify_spellmap.validators import NameValidator


class TestNameValidator:
    """Test suite for NameValidator."""

    def test_missing_names_fixture(self, missing_names_spellmap):
        """Test name validation using the missing_names fixture."""
        validator = NameValidator()
        validator.validate(missing_names_spellmap)

        errors = validator.get_errors()

        # Should have 2 errors: one missing name and one empty name
        assert len(errors) == 2

        # Check for missing name error (spell 12323)
        assert any("12323" in error and "Missing" in error for error in errors)

        # Check for empty name error (spell 18499)
        assert any("18499" in error and "Empty" in error for error in errors)

    def test_valid_spellmap_fixture(self, valid_spellmap):
        """Test that valid spellmap produces no name errors."""
        validator = NameValidator()
        validator.validate(valid_spellmap)

        errors = validator.get_errors()
        assert len(errors) == 0

    def test_reference_entries_in_fixture(self, valid_spellmap):
        """Test that reference entries are properly skipped in fixtures."""
        validator = NameValidator()
        validator.validate(valid_spellmap)

        errors = validator.get_errors()
        # Reference entry (99999) should not cause errors
        assert not any("99999" in error for error in errors)
