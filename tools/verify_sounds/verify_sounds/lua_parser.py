"""
Lua parser for extracting spell data from SpellMap.lua and SpellAvoidMap.lua.
"""

import re
import os
from lupa import LuaRuntime
from pathlib import Path


class LuaParser:
    """Parser for PVPWarn Lua spell configuration files."""

    def __init__(self):
        """Initialize the Lua parser."""
        self.lua = LuaRuntime(unpack_returned_tuples=True)

    def parse_spell_map(self, file_path):
        """
        Parse SpellMap.lua and extract spell data.

        Args:
            file_path: Path to SpellMap.lua

        Returns:
            Dictionary with spell data organized by category
        """
        if not os.path.exists(file_path):
            raise FileNotFoundError(f"SpellMap.lua not found at: {file_path}")

        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        # Create a sandboxed Lua environment
        lua_code = self._prepare_spell_map_environment() + content + self._extract_spell_map_data()

        try:
            result = self.lua.execute(lua_code)
            return self._convert_lua_table_to_dict(result)
        except Exception as e:
            raise RuntimeError(f"Failed to parse SpellMap.lua: {str(e)}")

    def parse_spell_avoid_map(self, file_path):
        """
        Parse SpellAvoidMap.lua and extract spell data.

        Args:
            file_path: Path to SpellAvoidMap.lua

        Returns:
            Dictionary with spell avoid data organized by category
        """
        if not os.path.exists(file_path):
            raise FileNotFoundError(f"SpellAvoidMap.lua not found at: {file_path}")

        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        # Create a sandboxed Lua environment
        lua_code = self._prepare_spell_avoid_map_environment() + content + self._extract_spell_avoid_map_data()

        try:
            result = self.lua.execute(lua_code)
            return self._convert_lua_table_to_dict(result)
        except Exception as e:
            raise RuntimeError(f"Failed to parse SpellAvoidMap.lua: {str(e)}")

    def _prepare_spell_map_environment(self):
        """Prepare Lua environment for parsing SpellMap."""
        return """
        -- Mock PVPWarn environment
        local rgpvpw = {}
        local me = {}
        rgpvpw.spellMap = me

        -- Mock constants
        RGPVPW_CONSTANTS = {
            SPELL_TYPE_BASE = 1,
            SPELL_TYPE_STANCE = 2,
            SPELL_TYPE_SOD = 3,
            SPELL_TYPES = {
                SPELL = 1,
                BUFF = 2,
                DEBUFF = 3
            },
            SPELL_EFFECT_VISUAL_TYPES = {
                NONE = 0,
                NORMAL = 1,
                SELF_AVOID = 2,
                ENEMY_AVOID = 3
            },
            SPELL_EFFECT_SOUND_TYPES = {
                NONE = 0,
                SPECIAL = 1
            }
        }

        -- Categories
        local categories = {
            WARRIOR = "warrior",
            PRIEST = "priest",
            ROGUE = "rogue",
            MAGE = "mage",
            HUNTER = "hunter",
            WARLOCK = "warlock",
            PALADIN = "paladin",
            DRUID = "druid",
            SHAMAN = "shaman",
            RACIALS = "racials",
            ITEMS = "items",
            MISC = "misc"
        }

        -- Make rgpvpw and categories global
        _G.rgpvpw = rgpvpw
        _G.categories = categories

        -- Mock UnitFactionGroup function
        function UnitFactionGroup(unit)
            return "Alliance", "Alliance"
        end
        """

    def _prepare_spell_avoid_map_environment(self):
        """Prepare Lua environment for parsing SpellAvoidMap."""
        return """
        -- Mock PVPWarn environment
        local rgpvpw = {}
        local me = {}
        rgpvpw.spellAvoidMap = me

        -- Mock constants (needed for avoid map too)
        RGPVPW_CONSTANTS = {
            SPELL_TYPE_BASE = 1,
            SPELL_TYPE_STANCE = 2,
            SPELL_TYPE_SOD = 3
        }

        -- Categories
        local categories = {
            WARRIOR = "warrior",
            PRIEST = "priest",
            ROGUE = "rogue",
            MAGE = "mage",
            HUNTER = "hunter",
            WARLOCK = "warlock",
            PALADIN = "paladin",
            DRUID = "druid",
            SHAMAN = "shaman",
            RACIALS = "racials",
            ITEMS = "items",
            MISC = "misc"
        }

        -- Make rgpvpw and categories global
        _G.rgpvpw = rgpvpw
        _G.categories = categories

        -- Mock UnitFactionGroup function
        function UnitFactionGroup(unit)
            return "Alliance", "Alliance"
        end
        """

    def _extract_spell_map_data(self):
        """Lua code to extract spell map data."""
        return """
        -- Extract data from the local spellMap variable
        local result = {}
        if spellMap then
            for category, spells in pairs(spellMap) do
                result[category] = {}
                for spellId, spell in pairs(spells) do
                    -- Only include spells with soundFileName
                    if spell.soundFileName then
                        result[category][tostring(spellId)] = {
                            name = spell.name,
                            soundFileName = spell.soundFileName,
                            hasFade = spell.hasFade or false,
                            hasCast = spell.hasCast or false
                        }
                    end
                end
            end
        end
        return result
        """

    def _extract_spell_avoid_map_data(self):
        """Lua code to extract spell avoid map data."""
        return """
        -- Extract data from the local spellAvoidMap variable
        local result = {}
        if spellAvoidMap then
            for category, spells in pairs(spellAvoidMap) do
                result[category] = {}
                for spellId, spell in pairs(spells) do
                    -- Only include spells with soundFileName
                    if spell.soundFileName then
                        result[category][tostring(spellId)] = {
                            name = spell.name,
                            soundFileName = spell.soundFileName,
                            self_avoid = spell.self_avoid or false,
                            enemy_avoid = spell.enemy_avoid or false
                        }
                    end
                end
            end
        end
        return result
        """

    def _convert_lua_table_to_dict(self, lua_table):
        """
        Convert Lua table to Python dictionary.

        Args:
            lua_table: Lua table object

        Returns:
            Python dictionary
        """
        if lua_table is None:
            return {}

        result = {}
        for key in lua_table:
            value = lua_table[key]
            if hasattr(value, '__iter__') and not isinstance(value, str):
                # Recursively convert nested tables
                result[key] = self._convert_lua_table_to_dict(value)
            else:
                result[key] = value

        return result
