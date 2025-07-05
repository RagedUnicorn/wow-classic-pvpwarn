"""
Tests for DuplicateValidator using pytest with Lua fixtures.
"""

import pytest
from spellmap_verifier.validators import DuplicateValidator


class TestDuplicateValidator:
    """Test suite for DuplicateValidator."""

    def test_duplicate_spells_fixture(self, duplicate_spells_spellmap, fixture_loader):
        """Test duplicate detection using the duplicate_spells fixture."""
        # Get the raw content for line-based validation
        fixture_path = fixture_loader.fixtures_dir / "duplicate_spells.lua"
        with open(fixture_path, 'r') as f:
            content = f.read()

        validator = DuplicateValidator()
        validator.validate(duplicate_spells_spellmap, content)

        errors = validator.get_errors()

        # Should detect cross-category duplicates
        # Note: within-category duplicates in Lua tables overwrite each other,
        # so only the last definition remains in the parsed data
        assert len(errors) > 0

        # Check for cross-category duplicate (12323 appears in warrior, items, and mage)
        duplicate_errors = [e for e in errors if "12323" in e and "Duplicate" in e]
        assert len(duplicate_errors) > 0

        # Should mention the categories where duplicates appear
        error_text = " ".join(duplicate_errors)
        assert "warrior" in error_text
        assert ("items" in error_text or "mage" in error_text)

    def test_valid_spellmap_no_duplicates(self, valid_spellmap, fixture_loader):
        """Test that valid spellmap has no duplicate errors."""
        # Get the raw content
        fixture_path = fixture_loader.fixtures_dir / "valid_spellmap.lua"
        with open(fixture_path, 'r') as f:
            content = f.read()

        validator = DuplicateValidator()
        validator.validate(valid_spellmap, content)

        errors = validator.get_errors()
        assert len(errors) == 0

    def test_reference_entries_allowed(self, valid_spellmap, fixture_loader):
        """Test that reference entries don't count as duplicates."""
        # The valid_spellmap has spell 99999 as a reference to 18499
        # This should not be considered a duplicate
        fixture_path = fixture_loader.fixtures_dir / "valid_spellmap.lua"
        with open(fixture_path, 'r') as f:
            content = f.read()

        validator = DuplicateValidator()
        validator.validate(valid_spellmap, content)

        errors = validator.get_errors()
        # Reference entries should not cause duplicate errors
        assert not any("99999" in error for error in errors)
