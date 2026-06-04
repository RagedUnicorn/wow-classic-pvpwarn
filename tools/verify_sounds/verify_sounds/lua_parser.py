"""
Lua parser for extracting spell data from the SpellMap / SpellAvoidMap directory layout.

The source is a base + overlay split:
    <map_dir>/Base.lua                 -- Classic content (`local spellMap = {...}`)
    <map_dir>/Overlay/Sod.lua          -- SoD add/remove/replace ops
    <map_dir>/Overlay/Tbc.lua          -- TBC add/remove/replace ops (empty today)

For sound-file verification we want a union view: every spell defined in any branch needs its
sound file on disk. We load Base, then merge each overlay's `add` and `replace` entries on top
(skipping `remove` so Classic content visible to non-SoD players stays in the iteration).
"""

import os
from pathlib import Path
from lupa import LuaRuntime
import lupa


class LuaParser:
    """Parser for PVPWarn Lua spell configuration directories."""

    def __init__(self):
        """Initialize the Lua parser."""
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        self._env_initialized = False

    def parse_spell_map(self, spellmap_dir):
        """Parse code/SpellMap/ (Base.lua + Overlay/) and return spell data keyed by category.

        Returns:
            ``{category: {spell_id_str: {name, soundFileName, hasFade, hasCast}}}``
        """
        assembled = self._load_dir(spellmap_dir, "spellMap")
        return self._extract_sound_entries(assembled, is_avoid=False)

    def parse_spell_avoid_map(self, spellavoidmap_dir):
        """Parse code/SpellAvoidMap/ (Base.lua + Overlay/) and return spell data keyed by category.

        Returns:
            ``{category: {spell_id_str: {name, soundFileName, self_avoid, enemy_avoid}}}``
        """
        assembled = self._load_dir(spellavoidmap_dir, "spellAvoidMap")
        return self._extract_sound_entries(assembled, is_avoid=True)

    # ------------------------------------------------------------------
    # Directory loading: Base.lua + overlay union
    # ------------------------------------------------------------------

    def _load_dir(self, map_dir, base_global_name):
        """Load Base.lua + each Overlay/*.lua and return the union assembled map (no filtering)."""
        if not os.path.isdir(map_dir):
            raise FileNotFoundError(f"SpellMap directory not found: {map_dir}")

        base_path = Path(map_dir) / "Base.lua"
        if not base_path.exists():
            raise FileNotFoundError(f"Base.lua not found in: {map_dir}")

        self._setup_environment()

        assembled = self._parse_base_file(base_path, base_global_name)

        for overlay_path in (
            Path(map_dir) / "Overlay" / "Sod.lua",
            Path(map_dir) / "Overlay" / "Tbc.lua",
        ):
            if overlay_path.exists():
                overlay = self._parse_overlay_file(overlay_path)
                self._union_merge_overlay(assembled, overlay)

        return assembled

    def _setup_environment(self):
        """Inject the mocks the addon source files expect. Idempotent within one parser
        instance - the overlay files reference the same rgpvpw / RGPVPW_CONSTANTS namespace as
        the base file."""
        if self._env_initialized:
            return
        self.lua.execute(
            """
            rgpvpw = {}
            RGPVPW_CONSTANTS = {
                SPELL_TYPE_BASE = "SPELL_TYPE_BASE",
                SPELL_TYPE_SOD = "SPELL_TYPE_SOD",
                SPELL_TYPE_TBC = "SPELL_TYPE_TBC",
                SPELL_TYPE_STANCE = "SPELL_TYPE_STANCE",
                SPELL_TYPES = {SPELL = 1, BUFF = 2, DEBUFF = 3},
                SPELL_EFFECT_VISUAL_TYPES = {NONE = 0, NORMAL = 1, SELF_AVOID = 2, ENEMY_AVOID = 3},
                SPELL_EFFECT_SOUND_TYPES = {NONE = 0, SPECIAL = 1}
            }
            function UnitFactionGroup(unit)
                return "Alliance", "Alliance"
            end
            """
        )
        self._env_initialized = True

    def _parse_base_file(self, path, base_global_name):
        """Parse a Base.lua file (``local spellMap = {...}`` or ``local spellAvoidMap = {...}``)."""
        with open(path, "r", encoding="utf-8") as f:
            content = f.read()

        # Expose the local table on `_G` so we can read it back.
        suffix = f"\n_G.{base_global_name} = {base_global_name}\n"
        try:
            self.lua.execute(content + suffix)
        except Exception as e:
            raise RuntimeError(f"Failed to parse {path}: {e}") from e

        table = getattr(self.lua.globals(), base_global_name)
        if table is None:
            raise ValueError(f"No `{base_global_name}` table found in {path}")

        return self._lua_table_to_python(table)

    def _parse_overlay_file(self, path):
        """Parse an Overlay/*.lua file (``function me.GetOverlay() return {...} end``)."""
        with open(path, "r", encoding="utf-8") as f:
            content = f.read()

        if "function me.GetOverlay()" not in content:
            raise ValueError(f"Overlay file {path} has no `function me.GetOverlay()` entry")

        self.lua.execute("_G.__overlay_result = nil")
        try:
            self.lua.execute(content + "\n_G.__overlay_result = me.GetOverlay()\n")
        except Exception as e:
            raise RuntimeError(f"Failed to parse overlay {path}: {e}") from e

        overlay_table = self.lua.eval("_G.__overlay_result")
        if overlay_table is None:
            return {}

        result = {}
        for category_name in overlay_table:
            category = str(category_name)
            ops = overlay_table[category_name]
            entry = {"add": {}, "replace": {}}
            if lupa.lua_type(ops) == "table":
                for op_name in ("add", "replace"):
                    section = ops[op_name]
                    if lupa.lua_type(section) == "table":
                        section_dict = {}
                        for spell_id in section:
                            spell_data = section[spell_id]
                            if lupa.lua_type(spell_data) == "table":
                                section_dict[int(spell_id)] = self._lua_table_to_python(spell_data)
                            else:
                                section_dict[int(spell_id)] = spell_data
                        entry[op_name] = section_dict
            result[category] = entry
        return result

    @staticmethod
    def _union_merge_overlay(assembled, overlay):
        """Merge an overlay's add + replace into the base in place. Skips `remove`."""
        for category, ops in overlay.items():
            if category not in assembled:
                assembled[category] = {}
            for spell_id, spell_data in (ops.get("add") or {}).items():
                assembled[category][int(spell_id)] = spell_data
            for spell_id, spell_data in (ops.get("replace") or {}).items():
                assembled[category][int(spell_id)] = spell_data

    def _lua_table_to_python(self, lua_table):
        """Convert a Lua table into a Python dict, recursively handling nested tables."""
        if lupa.lua_type(lua_table) != "table":
            return lua_table
        result = {}
        for key in lua_table:
            value = lua_table[key]
            if lupa.lua_type(value) == "table":
                result[key] = self._lua_table_to_python(value)
            else:
                result[key] = value
        return result

    # ------------------------------------------------------------------
    # Sound-file projection
    # ------------------------------------------------------------------

    @staticmethod
    def _extract_sound_entries(assembled, is_avoid):
        """Project the assembled map down to the fields verify_sounds cares about.

        Drops refId-only alias entries (no soundFileName) and entries without a soundFileName.
        """
        result = {}
        for category, spells in assembled.items():
            category_str = str(category)
            result[category_str] = {}
            for spell_id, spell_data in spells.items():
                if not isinstance(spell_data, dict):
                    continue
                sound_file = spell_data.get("soundFileName")
                if not sound_file:
                    continue
                entry = {
                    "name": spell_data.get("name"),
                    "soundFileName": sound_file,
                }
                if is_avoid:
                    entry["self_avoid"] = bool(spell_data.get("self_avoid", False))
                    entry["enemy_avoid"] = bool(spell_data.get("enemy_avoid", False))
                else:
                    entry["hasFade"] = bool(spell_data.get("hasFade", False))
                    entry["hasCast"] = bool(spell_data.get("hasCast", False))
                result[category_str][str(spell_id)] = entry
        return result
