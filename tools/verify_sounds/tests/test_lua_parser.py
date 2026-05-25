"""
Tests for the Lua parser module.
"""

import pytest
from pathlib import Path

from verify_sounds.lua_parser import LuaParser


class TestLuaParser:
    """Test cases for LuaParser."""

    @pytest.fixture
    def parser(self):
        """Create a LuaParser instance."""
        return LuaParser()

    @pytest.fixture
    def fixtures_path(self):
        """Get path to test fixtures."""
        return Path(__file__).parent / "fixtures"

    def test_parse_spell_map(self, parser, fixtures_path):
        """Test parsing a SpellMap directory (Base.lua + empty overlays)."""
        result = parser.parse_spell_map(str(fixtures_path / "test_spellmap_dir"))

        # Check structure
        assert "warrior" in result
        assert "priest" in result
        assert "mage" in result

        # Warrior spells
        warrior_spells = result["warrior"]
        assert len(warrior_spells) == 2

        battle_shout = warrior_spells.get("1")
        assert battle_shout is not None
        assert battle_shout["name"] == "Battle Shout"
        assert battle_shout["soundFileName"] == "battle_shout"
        assert battle_shout["hasFade"] is True

        # Priest spell with hasCast
        priest_spells = result["priest"]
        mind_control = priest_spells.get("2")
        assert mind_control is not None
        assert mind_control["hasCast"] is True

        # Mage spell with both hasCast and hasFade
        mage_spells = result["mage"]
        polymorph = mage_spells.get("1")
        assert polymorph is not None
        assert polymorph["hasCast"] is True
        assert polymorph["hasFade"] is True

    def test_parse_spell_avoid_map(self, parser, fixtures_path):
        """Test parsing a SpellAvoidMap directory (Base.lua + empty overlays)."""
        result = parser.parse_spell_avoid_map(str(fixtures_path / "test_spellavoidmap_dir"))

        # Check structure
        assert "warrior" in result
        assert "rogue" in result
        assert "mage" in result

        # Warrior spell with both avoid types
        hamstring = result["warrior"].get("1")
        assert hamstring is not None
        assert hamstring["self_avoid"] is True
        assert hamstring["enemy_avoid"] is True

        # Rogue spells with single avoid types
        cheap_shot = result["rogue"].get("1")
        assert cheap_shot is not None
        assert cheap_shot["self_avoid"] is True
        assert cheap_shot["enemy_avoid"] is False

        blind = result["rogue"].get("2")
        assert blind is not None
        assert blind["self_avoid"] is False
        assert blind["enemy_avoid"] is True

    def test_parse_nonexistent_directory(self, parser):
        """Test parsing a non-existent directory raises FileNotFoundError."""
        with pytest.raises(FileNotFoundError):
            parser.parse_spell_map("/nonexistent/path/SpellMap")

    def test_parse_directory_missing_base(self, parser, tmp_path):
        """Test parsing a directory without Base.lua raises FileNotFoundError."""
        empty_dir = tmp_path / "EmptyMap"
        empty_dir.mkdir()
        with pytest.raises(FileNotFoundError):
            parser.parse_spell_map(str(empty_dir))
