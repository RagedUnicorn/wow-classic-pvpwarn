"""
Tests for the Lua parser module.
"""

import os
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
        return Path(__file__).parent / 'fixtures'

    def test_parse_spell_map(self, parser, fixtures_path):
        """Test parsing SpellMap.lua."""
        spell_map_path = fixtures_path / 'test_spellmap.lua'
        result = parser.parse_spell_map(str(spell_map_path))

        # Check structure
        assert 'warrior' in result
        assert 'priest' in result
        assert 'mage' in result

        # Check warrior spells
        warrior_spells = result['warrior']
        assert len(warrior_spells) == 2

        # Check specific spell properties
        battle_shout = warrior_spells.get('1')
        assert battle_shout is not None
        assert battle_shout['name'] == 'Battle Shout'
        assert battle_shout['soundFileName'] == 'battle_shout'
        assert battle_shout['hasFade'] is True

        # Check priest spell with hasCast
        priest_spells = result['priest']
        mind_control = priest_spells.get('2')
        assert mind_control is not None
        assert mind_control['hasCast'] is True

        # Check mage spell with both hasCast and hasFade
        mage_spells = result['mage']
        polymorph = mage_spells.get('1')
        assert polymorph is not None
        assert polymorph['hasCast'] is True
        assert polymorph['hasFade'] is True

    def test_parse_spell_avoid_map(self, parser, fixtures_path):
        """Test parsing SpellAvoidMap.lua."""
        spell_avoid_map_path = fixtures_path / 'test_spellavoidmap.lua'
        result = parser.parse_spell_avoid_map(str(spell_avoid_map_path))

        # Check structure
        assert 'warrior' in result
        assert 'rogue' in result
        assert 'mage' in result

        # Check warrior spell with both avoid types
        warrior_spells = result['warrior']
        hamstring = warrior_spells.get('1')
        assert hamstring is not None
        assert hamstring['self_avoid'] is True
        assert hamstring['enemy_avoid'] is True

        # Check rogue spells with single avoid types
        rogue_spells = result['rogue']
        cheap_shot = rogue_spells.get('1')
        assert cheap_shot is not None
        assert cheap_shot['self_avoid'] is True
        assert cheap_shot.get('enemy_avoid', False) is False

        blind = rogue_spells.get('2')
        assert blind is not None
        assert blind.get('self_avoid', False) is False
        assert blind['enemy_avoid'] is True

    def test_parse_nonexistent_file(self, parser):
        """Test parsing a non-existent file raises error."""
        with pytest.raises(FileNotFoundError):
            parser.parse_spell_map('/nonexistent/path/SpellMap.lua')

    def test_convert_lua_table_to_dict(self, parser):
        """Test Lua table to Python dict conversion."""
        # This is tested implicitly through the other tests
        # but could be expanded with direct tests if needed
        pass
