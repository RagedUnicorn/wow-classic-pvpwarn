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

    def test_dynamic_properties_in_fixture(self, missing_names_spellmap, fixture_loader):
        """Test that dynamic properties are detected from fixtures."""
        # The missing_names fixture has a dynamic faction-specific name
        dynamic_props = fixture_loader.lua_parser.get_dynamic_properties()

        # Should have detected the dynamic property for spell 438273
        assert len(dynamic_props) > 0
        assert any("438273" in prop for prop in dynamic_props)

        # Validator should handle dynamic properties without errors
        validator = NameValidator(dynamic_props)
        validator.validate(missing_names_spellmap)

        errors = validator.get_errors()
        # Should only have errors for missing/empty names, not for dynamic property
        assert not any("438273" in error for error in errors)

    def test_reference_entries_in_fixture(self, valid_spellmap):
        """Test that reference entries are properly skipped in fixtures."""
        validator = NameValidator()
        validator.validate(valid_spellmap)

        errors = validator.get_errors()
        # Reference entry (99999) should not cause errors
        assert not any("99999" in error for error in errors)
