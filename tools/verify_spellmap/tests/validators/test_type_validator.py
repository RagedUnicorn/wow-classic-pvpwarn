"""
Tests for TypeValidator using pytest with Lua fixtures.
"""

import pytest
from verify_spellmap.validators import TypeValidator


class TestTypeValidator:
    """Test suite for TypeValidator."""

    def test_invalid_types_fixture(self, invalid_types_spellmap):
        """Test type validation using the invalid_types fixture."""
        validator = TypeValidator()
        validator.validate(invalid_types_spellmap)

        errors = validator.get_errors()

        # The fixture has 4 invalid types:
        # - 12323: Missing type
        # - 18499: Empty type
        # - 20230: Invalid type value "INVALID_TYPE"
        # - 25275: Invalid constant SPELL_TYPE_INVALID
        # - 1719: Valid type (should not error)
        assert len(errors) == 4

        # Check for missing type error
        assert any("12323" in error and "Missing" in error for error in errors)

        # Check for empty type error
        assert any("18499" in error and "Empty" in error for error in errors)

        # Check for invalid type errors
        assert any("20230" in error and "Invalid" in error for error in errors)
        assert any("25275" in error and ("Invalid" in error or "Missing" in error) for error in errors)

        # Valid spell should not have errors
        assert not any("1719" in error for error in errors)

    def test_valid_spellmap_types(self, valid_spellmap):
        """Test that valid spellmap produces no type errors."""
        validator = TypeValidator()
        validator.validate(valid_spellmap)

        errors = validator.get_errors()
        assert len(errors) == 0

    def test_reference_entries_skip_type_check(self, valid_spellmap):
        """Test that reference entries are skipped for type validation."""
        # The valid_spellmap has a reference entry (99999) without a type
        validator = TypeValidator()
        validator.validate(valid_spellmap)

        errors = validator.get_errors()
        # Reference entries should not cause type errors
        assert not any("99999" in error for error in errors)
