"""
Pytest configuration and fixtures for SpellMap tests.
"""

import pytest
from pathlib import Path
from typing import Dict, Any

from verify_spellmap import LuaParser, SpellMapFileReader


class FixtureLoader:
    """Helper class to load and parse Lua fixture files."""

    def __init__(self):
        self.fixtures_dir = Path(__file__).parent / "fixtures"
        self.lua_parser = LuaParser()
        self.lua_parser.setup_environment()

    def load_fixture(self, fixture_name: str) -> Dict[str, Any]:
        """
        Load and parse a Lua fixture file.

        Args:
            fixture_name: Name of the fixture file (without .lua extension)

        Returns:
            Parsed spell entries dictionary
        """
        fixture_path = self.fixtures_dir / f"{fixture_name}.lua"

        # Read the fixture file
        file_reader = SpellMapFileReader(str(fixture_path))
        content = file_reader.read()

        # Parse the Lua content
        spell_entries = self.lua_parser.parse_spellmap(content)

        return spell_entries


@pytest.fixture(scope="session")
def fixture_loader():
    """Provide a fixture loader instance for tests."""
    return FixtureLoader()


@pytest.fixture
def valid_spellmap(fixture_loader):
    """Load the valid spellmap fixture."""
    return fixture_loader.load_fixture("valid_spellmap")


@pytest.fixture
def missing_names_spellmap(fixture_loader):
    """Load the spellmap with missing names."""
    return fixture_loader.load_fixture("missing_names")


@pytest.fixture
def duplicate_spells_spellmap(fixture_loader):
    """Load the spellmap with duplicate spells."""
    return fixture_loader.load_fixture("duplicate_spells")


@pytest.fixture
def invalid_types_spellmap(fixture_loader):
    """Load the spellmap with invalid types."""
    return fixture_loader.load_fixture("invalid_types")


@pytest.fixture
def invalid_tracked_events_spellmap(fixture_loader):
    """Load the spellmap with invalid tracked events."""
    return fixture_loader.load_fixture("invalid_tracked_events")


@pytest.fixture
def invalid_sound_file_names_spellmap(fixture_loader):
    """Load the spellmap with invalid sound file names."""
    return fixture_loader.load_fixture("invalid_sound_file_names")


@pytest.fixture
def invalid_spell_icons_spellmap(fixture_loader):
    """Load the spellmap with invalid spell icons."""
    return fixture_loader.load_fixture("invalid_spell_icons")


@pytest.fixture
def valid_spell_variations(fixture_loader):
    """Load the spellmap with various valid spell patterns."""
    return fixture_loader.load_fixture("valid_spell_variations")


@pytest.fixture
def invalid_all_ranks_spellmap(fixture_loader):
    """Load the spellmap with invalid all ranks."""
    return fixture_loader.load_fixture("invalid_all_ranks")


@pytest.fixture
def invalid_active_spellmap(fixture_loader):
    """Load the spellmap with invalid active values."""
    return fixture_loader.load_fixture("invalid_active")


@pytest.fixture
def minimal_valid_spell():
    """Provide a minimal valid spell entry for testing."""
    return {
        "name": "Test Spell",
        "type": "SPELL_TYPE_BASE",
        "soundFileName": "test_sound",
        "spellIcon": "test_icon",
        "trackedEvents": ["SPELL_CAST_SUCCESS"]
    }


@pytest.fixture 
def reference_entry():
    """Provide a reference entry for testing."""
    return {"refId": 12345}
