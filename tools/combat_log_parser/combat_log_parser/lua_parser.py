"""Lua parser for reading SpellMap data."""

import lupa
from typing import Dict, List, Any, Set, Tuple
from pathlib import Path


class LuaParser:
    """Parses the SpellMap.lua file to extract spell information."""

    def __init__(self, spellmap_path: str):
        """
        Initialize the Lua parser.

        Args:
            spellmap_path: Path to the SpellMap.lua file
        """
        self.spellmap_path = Path(spellmap_path)
        self.lua = lupa.LuaRuntime(unpack_returned_tuples=True)
        self.spell_entries: Dict[str, Dict[int, Dict[str, Any]]] = {}

    def parse_spellmap(self) -> Dict[str, Dict[int, Dict[str, Any]]]:
        """
        Parse the SpellMap.lua file and return spell entries by category.

        Returns:
            Dictionary with categories as keys and spell dictionaries as values
        """
        if not self.spellmap_path.exists():
            raise FileNotFoundError(f"SpellMap not found: {self.spellmap_path}")

        # Read the file content
        with open(self.spellmap_path, 'r', encoding='utf-8') as f:
            content = f.read()

        # Set up Lua environment
        self._setup_lua_environment()

        # Modify the content to capture the local spellMap variable
        # Add code at the end to expose the spellMap globally
        modified_content = content + "\n\n-- Export spellMap for parser\n_G.spellMap = spellMap\n"

        # Execute the modified Lua code
        self.lua.execute(modified_content)

        # Extract the spellMap from globals
        spellmap = self.lua.globals().spellMap

        if not spellmap:
            raise ValueError("No spellMap table found in the file")

        # Convert Lua tables to Python dictionaries
        # Force dict conversion for the top-level spellMap
        self.spell_entries = {}

        # Iterate through categories
        for category in spellmap:
            category_table = spellmap[category]
            self.spell_entries[category] = {}

            # Iterate through spells in this category
            for spell_id in category_table:
                spell_data = category_table[spell_id]

                # Convert spell data
                if lupa.lua_type(spell_data) == 'table':
                    self.spell_entries[category][spell_id] = self._convert_spell_data(spell_data)
                else:
                    self.spell_entries[category][spell_id] = spell_data

        return self.spell_entries

    def _setup_lua_environment(self):
        """Set up the Lua environment with required constants."""
        # Define the RGPVPW_CONSTANTS table and mod structure
        self.lua.execute("""
            RGPVPW_CONSTANTS = {
                SPELL_TYPE_BASE = 1,
                SPELL_TYPE_MISSED = 2,
                SPELL_TYPE_BUFF = 3,
                SPELL_TYPE_DEBUFF = 4,
                SPELL_TYPE_SELF_BUFF = 5,
                SPELL_TYPE_SELF_DEBUFF = 6,
                SPELL_TYPE_SOD = 7
            }

            -- Mock the mod structure expected by SpellMap
            rgpvpw = {}
            local mod = rgpvpw

            -- Mock UnitFactionGroup function
            function UnitFactionGroup(unit)
                return "Alliance"
            end
        """)

    def _convert_lua_table(self, lua_table, force_dict=False) -> Dict:
        """
        Convert a Lua table to a Python dictionary.

        Args:
            lua_table: Lua table to convert
            force_dict: Force conversion to dict even for numeric keys

        Returns:
            Python dictionary
        """
        result = {}

        for key in lua_table:
            value = lua_table[key]

            # Convert based on type
            if lupa.lua_type(value) == 'table':
                # For spell tables (numeric keys), always use dict
                if isinstance(key, int) and not force_dict:
                    # This is a spell entry, convert as dict
                    result[key] = self._convert_lua_table(value, force_dict=True)
                elif self._is_array_table(value) and not isinstance(key, int):
                    # Only convert to array if it's not a spell table
                    result[key] = self._convert_lua_array(value)
                else:
                    result[key] = self._convert_lua_table(value, force_dict=True)
            else:
                # Handle simple values
                result[key] = value

        return result

    def _is_array_table(self, lua_table) -> bool:
        """Check if a Lua table is array-like (sequential numeric keys)."""
        try:
            # Get the length of the table
            length = len(lua_table)
            if length == 0:
                return True  # Empty tables are considered arrays

            # Check if all keys from 1 to length exist
            for i in range(1, length + 1):
                if lua_table[i] is None:
                    return False
            return True
        except:
            return False

    def _convert_lua_array(self, lua_table) -> List:
        """Convert a Lua array table to a Python list."""
        result = []
        for i in range(1, len(lua_table) + 1):
            value = lua_table[i]
            if lupa.lua_type(value) == 'table':
                result.append(self._convert_lua_table(value))
            else:
                result.append(value)
        return result

    def _convert_spell_data(self, spell_data) -> Dict[str, Any]:
        """Convert spell data from Lua table to Python dict."""
        result = {}

        for key in spell_data:
            value = spell_data[key]

            if lupa.lua_type(value) == 'table':
                # Check if it's an array (like trackedEvents or allRanks)
                if self._is_array_table(value):
                    result[key] = self._convert_lua_array(value)
                else:
                    result[key] = self._convert_lua_table(value, force_dict=True)
            else:
                result[key] = value

        return result

    def get_all_spells_by_category(self) -> Dict[str, List[Tuple[int, Dict[str, Any]]]]:
        """
        Get all spells organized by category.

        Returns:
            Dictionary with categories as keys and list of (spell_id, spell_data) tuples
        """
        result = {}

        for category, spells in self.spell_entries.items():
            result[category] = []

            # Handle the case where spells might be a list (shouldn't happen with our conversion)
            if isinstance(spells, list):
                print(f"Warning: Category {category} is a list, skipping")
                continue

            for spell_id, spell_data in spells.items():
                # Skip reference entries (only have refId)
                if isinstance(spell_data, dict) and 'refId' in spell_data and len(spell_data) == 1:
                    continue

                # Only include spells with trackedEvents
                if isinstance(spell_data, dict) and 'trackedEvents' in spell_data:
                    result[category].append((spell_id, spell_data))

        return result

    def get_spell_count_by_category(self) -> Dict[str, int]:
        """Get the count of spells (excluding references) by category."""
        counts = {}

        for category, spells in self.get_all_spells_by_category().items():
            counts[category] = len(spells)

        return counts
