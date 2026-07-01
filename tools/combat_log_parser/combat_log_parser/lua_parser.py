"""Lua parser for reading SpellMap data from the base + overlay directory layout."""

import lupa
from typing import Dict, List, Any, Tuple
from pathlib import Path


class LuaParser:
    """Parses the SpellMap directory (Base.lua + overlay/Sod.lua + overlay/Tbc.lua) and assembles
    a union spell map covering every entry across all branches."""

    def __init__(self, spellmap_dir: str):
        """
        Initialize the Lua parser.

        Args:
            spellmap_dir: Path to the code/spellmap directory (containing Base.lua and overlay/).
        """
        self.spellmap_dir = Path(spellmap_dir)
        self.lua = lupa.LuaRuntime(unpack_returned_tuples=True)
        self.spell_entries: Dict[str, Dict[int, Dict[str, Any]]] = {}

    def parse_spellmap(self) -> Dict[str, Dict[int, Dict[str, Any]]]:
        """Load Base.lua, then merge every overlay's adds + replaces (we ignore `remove` ops so
        the result is a union of every spell across every branch - which is what a combat-log
        replay wants when scanning historic logs).

        Returns:
            Union spell map keyed by category, then spellId.
        """
        base_path = self.spellmap_dir / "Base.lua"
        if not base_path.exists():
            raise FileNotFoundError(f"Base.lua not found in: {self.spellmap_dir}")

        # Set up Lua environment once; we'll execute multiple files into the same runtime.
        self._setup_lua_environment()

        # 1. Base
        self.spell_entries = self._parse_base_file(base_path)

        # 2. Overlays (union: apply add + replace, skip remove)
        for overlay_path in (
            self.spellmap_dir / "overlay" / "Sod.lua",
            self.spellmap_dir / "overlay" / "Tbc.lua",
        ):
            if overlay_path.exists():
                overlay = self._parse_overlay_file(overlay_path)
                self._union_merge_overlay(self.spell_entries, overlay)

        return self.spell_entries

    def _parse_base_file(self, path: Path) -> Dict[str, Dict[int, Dict[str, Any]]]:
        """Parse a Base.lua file (top-level ``local spellMap = {...}``) into a Python dict."""
        with open(path, "r", encoding="utf-8") as f:
            content = f.read()

        modified = content + "\n_G.spellMap = spellMap\n"
        self.lua.execute(modified)

        spellmap = self.lua.globals().spellMap
        if not spellmap:
            raise ValueError(f"No spellMap table found in {path}")

        result: Dict[str, Dict[int, Dict[str, Any]]] = {}
        for category in spellmap:
            category_table = spellmap[category]
            result[category] = {}
            for spell_id in category_table:
                spell_data = category_table[spell_id]
                if lupa.lua_type(spell_data) == "table":
                    result[category][spell_id] = self._convert_spell_data(spell_data)
                else:
                    result[category][spell_id] = spell_data
        return result

    def _parse_overlay_file(self, path: Path) -> Dict[str, Dict[str, Any]]:
        """Parse an overlay/*.lua file (``function me.GetOverlay() return {...} end``)."""
        with open(path, "r", encoding="utf-8") as f:
            content = f.read()

        if "function me.GetOverlay()" not in content:
            raise ValueError(f"Overlay file {path} has no `function me.GetOverlay()` entry point")

        # Reset the capture slot first so a previous overlay's result can't leak through.
        self.lua.execute("_G.__overlay_result = nil")
        self.lua.execute(content + "\n_G.__overlay_result = me.GetOverlay()\n")

        overlay_table = self.lua.eval("_G.__overlay_result")
        if overlay_table is None:
            return {}

        result: Dict[str, Dict[str, Any]] = {}
        for category_name in overlay_table:
            category = str(category_name)
            ops = overlay_table[category_name]
            entry: Dict[str, Any] = {"add": {}, "replace": {}}
            if lupa.lua_type(ops) == "table":
                for op_name in ("add", "replace"):
                    section = ops[op_name]
                    if lupa.lua_type(section) == "table":
                        section_dict: Dict[int, Dict[str, Any]] = {}
                        for spell_id in section:
                            spell_data = section[spell_id]
                            if lupa.lua_type(spell_data) == "table":
                                section_dict[int(spell_id)] = self._convert_spell_data(spell_data)
                            else:
                                section_dict[int(spell_id)] = spell_data
                        entry[op_name] = section_dict
            result[category] = entry
        return result

    @staticmethod
    def _union_merge_overlay(base: Dict[str, Dict[int, Dict[str, Any]]],
                             overlay: Dict[str, Dict[str, Any]]) -> None:
        """Merge an overlay's `add` and `replace` ops into the base in place. Skips `remove`
        - the union view keeps Classic content visible even when a branch overlay removes it."""
        for category, ops in overlay.items():
            if category not in base:
                base[category] = {}
            for spell_id, spell_data in (ops.get("add") or {}).items():
                base[category][int(spell_id)] = spell_data
            for spell_id, spell_data in (ops.get("replace") or {}).items():
                base[category][int(spell_id)] = spell_data

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
