"""
Lua parsing functionality for SpellMap verification.
"""

import re
from typing import Dict, List
import lupa
from lupa import LuaRuntime

from .constants import (
    LUA_ADDON_NAMESPACE_MOCK,
    LUA_DYNAMIC_VALUE_TRACKING,
    LUA_UNITFACTIONGROUP_MOCK,
    CATEGORY_PATTERN,
    DYNAMIC_NAME_PATTERN,
    SPELLMAP_DEFINITION,
    SPELLMAP_GLOBAL
)


class LuaParser:
    """Handles Lua parsing and conversion for SpellMap data."""

    def __init__(self):
        """Initialize the Lua parser with runtime."""
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        self.spell_entries: Dict[str, Dict[int, Dict]] = {}
        self.spell_avoid_entries: Dict[str, Dict[int, Dict]] = {}
        self.dynamic_properties: List[str] = []

    def setup_environment(self) -> None:
        """Set up the Lua environment with necessary mocks and constants."""
        self.lua.execute(LUA_ADDON_NAMESPACE_MOCK)
        self.lua.execute(LUA_DYNAMIC_VALUE_TRACKING)
        self.lua.execute(LUA_UNITFACTIONGROUP_MOCK)

    def parse_spellmap(self, content: str) -> Dict[str, Dict[int, Dict]]:
        """
        Parse the spellMap table using Lua runtime.

        Args:
            content: The raw Lua file content

        Returns:
            Dictionary of spell entries organized by category
        """
        # Reset state
        self.spell_entries.clear()
        self.dynamic_properties.clear()

        # Detect dynamic properties
        self._detect_dynamic_properties(content)

        # Modify content to expose spellMap globally
        modified_content = content.replace(SPELLMAP_DEFINITION, SPELLMAP_GLOBAL)

        # Execute in Lua environment
        try:
            self.lua.execute(modified_content)
        except Exception as e:
            raise RuntimeError(f"Failed to execute Lua content: {str(e)}")

        # Get the spellMap table
        spell_map = self.lua.eval("_G.spellMap")
        if not spell_map:
            raise ValueError("Could not find 'spellMap' variable in the file")

        # Convert to Python dict
        for category_name in spell_map:
            category = str(category_name)
            self.spell_entries[category] = {}

            category_spells = spell_map[category_name]
            for spell_id in category_spells:
                spell_data = category_spells[spell_id]
                spell_dict = self.lua_table_to_dict(spell_data)
                self.spell_entries[category][int(spell_id)] = spell_dict

        return self.spell_entries

    def parse_spell_avoid_map(self, content: str) -> Dict[str, Dict[int, Dict]]:
        """
        Parse the spellAvoidMap table using Lua runtime.

        Args:
            content: The raw Lua file content

        Returns:
            Dictionary of spell avoid entries organized by category
        """
        # Reset state
        self.spell_avoid_entries.clear()

        # Detect dynamic properties
        self._detect_dynamic_properties(content)

        # Modify content to expose spellAvoidMap globally
        modified_content = content.replace("local spellAvoidMap = {", "_G.spellAvoidMap = {")

        # Execute in Lua environment
        try:
            self.lua.execute(modified_content)
        except Exception as e:
            raise RuntimeError(f"Failed to execute Lua content: {str(e)}")

        # Get the spellAvoidMap table
        spell_avoid_map = self.lua.eval("_G.spellAvoidMap")
        if not spell_avoid_map:
            raise ValueError("Could not find 'spellAvoidMap' variable in the file")

        # Convert to Python dict
        for category_name in spell_avoid_map:
            category = str(category_name)
            self.spell_avoid_entries[category] = {}

            category_spells = spell_avoid_map[category_name]
            for spell_id in category_spells:
                spell_data = category_spells[spell_id]
                spell_dict = self.lua_table_to_dict(spell_data)
                self.spell_avoid_entries[category][int(spell_id)] = spell_dict

        return self.spell_avoid_entries

    def _detect_dynamic_properties(self, content: str) -> None:
        """Detect spell entries with dynamic (function-based) properties."""
        for match in re.finditer(DYNAMIC_NAME_PATTERN, content, re.DOTALL):
            spell_id = match.group(1)
            # Find which category this spell belongs to
            before_match = content[:match.start()]
            category_matches = list(re.finditer(CATEGORY_PATTERN, before_match))
            if category_matches:
                last_category = category_matches[-1].group(1)
                self.dynamic_properties.append(f"{last_category}[{spell_id}]")

    def lua_table_to_dict(self, lua_table) -> Dict:
        """Convert a Lua table to a Python dictionary."""
        if lupa.lua_type(lua_table) != 'table':
            return lua_table

        # Always use manual conversion to ensure nested tables are converted
        result = {}
        try:
            for key in list(lua_table):
                value = lua_table[key]
                if lupa.lua_type(value) == 'table':
                    result[key] = self.lua_table_to_list_or_dict(value)
                else:
                    result[key] = value
        except Exception:
            # Ignore table conversion issues - they don't affect functionality
            pass
        return result

    def lua_table_to_list_or_dict(self, lua_table):
        """Convert a Lua table to either a list or dict depending on its keys."""
        if lupa.lua_type(lua_table) != 'table':
            return lua_table

        keys = list(lua_table)
        if not keys:
            return []

        # Check if it's array-like (consecutive integers starting from 1)
        if all(isinstance(k, int) for k in keys):
            sorted_keys = sorted(keys)
            if sorted_keys == list(range(1, len(keys) + 1)):
                # It's a proper Lua array
                return [lua_table[i] for i in sorted_keys]

        # Otherwise treat as dictionary
        return self.lua_table_to_dict(lua_table)

    def analyze_table_structure(self, lua_table, name: str = "") -> str:
        """Analyze and describe the structure of a Lua table for debugging."""
        if lupa.lua_type(lua_table) != 'table':
            return f"{name}: {type(lua_table).__name__}"

        keys = list(lua_table)
        key_types = set(type(k).__name__ for k in keys)

        # Sample some values to understand content
        value_types = set()
        for i, key in enumerate(keys[:5]):  # Sample first 5 entries
            value = lua_table[key]
            if lupa.lua_type(value) == 'table':
                value_types.add('table')
            else:
                value_types.add(type(value).__name__)

        return f"{name}: Table with {len(keys)} keys, key types: {key_types}, value types: {value_types}"

    def get_dynamic_properties(self) -> List[str]:
        """Get the list of dynamic properties found during parsing."""
        return self.dynamic_properties.copy()
