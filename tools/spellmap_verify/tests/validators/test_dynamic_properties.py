"""
Tests for dynamic property detection using pytest with Lua fixtures.
"""

import pytest
from spellmap_verifier.validators import NameValidator


class TestDynamicProperties:
    """Test suite for dynamic property detection."""

    def test_dynamic_faction_name_detection(self, missing_names_spellmap, fixture_loader):
        """Test detection of faction-specific dynamic names using fixtures."""
        # The missing_names fixture contains a dynamic faction-specific name
        dynamic_props = fixture_loader.lua_parser.get_dynamic_properties()

        # Should have detected the dynamic property for spell 438273
        assert len(dynamic_props) > 0
        assert any("438273" in prop for prop in dynamic_props)

        # Dynamic properties are stored as keys only (e.g., "items[438273]")
        dynamic_prop = [p for p in dynamic_props if "438273" in p][0]
        assert "items[438273]" == dynamic_prop

    def test_name_validator_handles_dynamic_properties(self, missing_names_spellmap, fixture_loader):
        """Test that NameValidator correctly handles dynamic properties from fixtures."""
        dynamic_props = fixture_loader.lua_parser.get_dynamic_properties()

        # Create validator with dynamic properties
        validator = NameValidator(dynamic_props)
        validator.validate(missing_names_spellmap)

        errors = validator.get_errors()

        # Should not have errors for the dynamic property spell
        assert not any("438273" in error for error in errors)

        # But should still have errors for actual missing/empty names
        assert any("12323" in error for error in errors)  # Missing name
        assert any("18499" in error for error in errors)  # Empty name

    def test_no_dynamic_properties_in_valid_fixture(self, valid_spellmap, fixture_loader):
        """Test that valid spellmap fixture has no dynamic properties."""
        # Reset parser to clear any previous dynamic properties
        fixture_loader.lua_parser.dynamic_properties = []

        # Load valid spellmap (should have no dynamic properties)
        fixture_loader.load_fixture("valid_spellmap")
        dynamic_props = fixture_loader.lua_parser.get_dynamic_properties()

        # Should have no dynamic properties
        assert len(dynamic_props) == 0
