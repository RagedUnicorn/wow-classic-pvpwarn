"""
Lua parser for extracting spell data from the SpellMap / SpellAvoidMap directory layout.

The source is a base + overlay split:
    <map_dir>/Base.lua                 -- Classic content (`local spellMap = {...}`)
    <map_dir>/Overlay/Sod.lua          -- SoD ops
    <map_dir>/Overlay/Tbc.lua          -- TBC ops (empty stub today)

For voice generation we want a union view: every spell in any branch needs its voice file
generated. We load Base, then merge each overlay's `add` and `replace` (skipping `remove` —
Classic content shouldn't disappear just because SoD reworked a hunter trap).
"""

import os
from pathlib import Path
from typing import Dict, List, Optional, Set, Any

import lupa
from lupa import LuaRuntime

from .constants import SPELLMAP_RELATIVE_PATH, SPELLAVOIDMAP_RELATIVE_PATH


class LuaParser:
    """Parser for extracting spell data from the SpellMap / SpellAvoidMap directories."""

    def __init__(self, spellmap_path: Optional[str] = None, spellavoidmap_path: Optional[str] = None):
        """Initialize the parser.

        Args:
            spellmap_path: Path to the code/SpellMap directory. None uses the default relative path.
            spellavoidmap_path: Path to the code/SpellAvoidMap directory. None uses the default.
        """
        current_dir = os.path.dirname(os.path.abspath(__file__))

        if spellmap_path is None:
            spellmap_path = os.path.normpath(
                os.path.join(current_dir, SPELLMAP_RELATIVE_PATH)
            )

        if spellavoidmap_path is None:
            spellavoidmap_path = os.path.normpath(
                os.path.join(current_dir, SPELLAVOIDMAP_RELATIVE_PATH)
            )

        self.spellmap_path = spellmap_path
        self.spellavoidmap_path = spellavoidmap_path
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        self._env_initialized = False

    # ------------------------------------------------------------------
    # Public API used by generate_voices.py
    # ------------------------------------------------------------------

    def parse_spellmap(self) -> Dict[str, List[Dict]]:
        """Load SpellMap and return category-bucketed spell data with voice fields."""
        assembled = self._load_dir(self.spellmap_path, "spellMap", "SpellMap")
        return self._bucket_by_category(assembled, avoid=False)

    def parse_spellavoidmap(self) -> Dict[str, List[Dict]]:
        """Load SpellAvoidMap and return category-bucketed spell data with voice fields."""
        assembled = self._load_dir(self.spellavoidmap_path, "spellAvoidMap", "SpellAvoidMap")
        return self._bucket_by_category(assembled, avoid=True)

    # ------------------------------------------------------------------
    # Directory loading: Base.lua + overlay union
    # ------------------------------------------------------------------

    def _load_dir(self, map_dir: str, base_global_name: str, label: str) -> Dict[str, Dict[int, Dict]]:
        """Load Base.lua and merge every overlay's adds + replaces (skip removes)."""
        if not os.path.isdir(map_dir):
            raise FileNotFoundError(f"{label} directory not found: {map_dir}")

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

    def _setup_environment(self) -> None:
        """Inject the mocks the addon source files expect."""
        if self._env_initialized:
            return
        self.lua.execute(
            """
            rgpvpw = {
                spellMap = {},
                spellAvoidMap = {},
                logger = {
                    LogError = function() end,
                    LogInfo = function() end,
                    LogDebug = function() end
                },
                common = {
                    Clone = function(t) return t end
                }
            }

            PVPW_CLASSLIST = {}
            PVPW_RACELIST = {}
            PVPW_ITEMLIST = {}
            PVPW_MISCLIST = {}

            RGPVPW_CONSTANTS = {
                UNIT_ID_PLAYER = "player",
                SPELL_TYPE_BASE = "SPELL_TYPE_BASE",
                SPELL_TYPE_SOD = "SPELL_TYPE_SOD",
                SPELL_TYPE_BS = "SPELL_TYPE_BS",
                SPELL_TYPE_TBC = "SPELL_TYPE_TBC"
            }

            function UnitFactionGroup(unit)
                return "Alliance"
            end
            """
        )
        self._env_initialized = True

    def _parse_base_file(self, path: Path, base_global_name: str) -> Dict[str, Dict[int, Dict]]:
        """Parse a Base.lua file (top-level ``local spellMap = {...}`` / ``local spellAvoidMap = {...}``)."""
        with open(path, "r", encoding="utf-8") as f:
            content = f.read()

        suffix = f"\n_G.{base_global_name} = {base_global_name}\n"
        try:
            self.lua.execute(content + suffix)
        except Exception as e:
            raise RuntimeError(f"Failed to parse {path}: {e}") from e

        table = getattr(self.lua.globals(), base_global_name)
        if table is None:
            raise ValueError(f"No `{base_global_name}` table found in {path}")

        result: Dict[str, Dict[int, Dict]] = {}
        for category_name in table:
            category = str(category_name)
            category_table = table[category_name]
            result[category] = {}
            for spell_id in category_table:
                spell_data = category_table[spell_id]
                if lupa.lua_type(spell_data) == "table":
                    result[category][int(spell_id)] = self._lua_table_to_python(spell_data)
                else:
                    result[category][int(spell_id)] = spell_data
        return result

    def _parse_overlay_file(self, path: Path) -> Dict[str, Dict[str, Any]]:
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

        result: Dict[str, Dict[str, Any]] = {}
        for category_name in overlay_table:
            category = str(category_name)
            ops = overlay_table[category_name]
            entry: Dict[str, Any] = {"add": {}, "replace": {}}
            if lupa.lua_type(ops) == "table":
                for op_name in ("add", "replace"):
                    section = ops[op_name]
                    if lupa.lua_type(section) == "table":
                        section_dict: Dict[int, Dict] = {}
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
    def _union_merge_overlay(assembled: Dict[str, Dict[int, Dict]],
                             overlay: Dict[str, Dict[str, Any]]) -> None:
        """Merge an overlay's add + replace into the assembled map in place. Skips `remove`."""
        for category, ops in overlay.items():
            if category not in assembled:
                assembled[category] = {}
            for spell_id, spell_data in (ops.get("add") or {}).items():
                assembled[category][int(spell_id)] = spell_data
            for spell_id, spell_data in (ops.get("replace") or {}).items():
                assembled[category][int(spell_id)] = spell_data

    def _lua_table_to_python(self, lua_table) -> Any:
        """Recursive Lua table → Python dict/list conversion. Detects integer-keyed array tables
        that start at 1 (typical for ``allRanks`` and ``trackedEvents``) and surfaces them as
        Python lists; everything else becomes a dict."""
        if lupa.lua_type(lua_table) != "table":
            return lua_table

        keys = list(lua_table)
        if keys and all(isinstance(k, int) for k in keys):
            sorted_keys = sorted(keys)
            if sorted_keys == list(range(1, len(keys) + 1)):
                return [self._lua_table_to_python(lua_table[i]) for i in sorted_keys]

        result: Dict[Any, Any] = {}
        for key in keys:
            value = lua_table[key]
            if lupa.lua_type(value) == "table":
                result[key] = self._lua_table_to_python(value)
            else:
                result[key] = value
        return result

    # ------------------------------------------------------------------
    # Category bucketing (preserves the legacy "class_<name>" / "race_<name>" keys
    # generate_voices.py downstream code parses)
    # ------------------------------------------------------------------

    @staticmethod
    def _bucket_by_category(assembled: Dict[str, Dict[int, Dict]], avoid: bool) -> Dict[str, List[Dict]]:
        """Convert the assembled `{category: {spellId: data}}` shape into the legacy
        `{class_warrior: [spell_dict, ...], item_items: [...], ...}` shape that downstream code
        expects. Filters out entries lacking name + soundFileName."""
        result: Dict[str, List[Dict]] = {}

        for category, spells in assembled.items():
            category_lower = str(category).lower()
            spell_list: List[Dict] = []

            for spell_id, spell_data in spells.items():
                if not isinstance(spell_data, dict):
                    continue
                if not spell_data.get("name") or not spell_data.get("soundFileName"):
                    continue

                tracked_events = spell_data.get("trackedEvents") or []
                if not isinstance(tracked_events, list):
                    tracked_events = []

                spell_list.append({
                    "name": spell_data.get("name"),
                    "soundFileName": spell_data.get("soundFileName"),
                    "soundText": spell_data.get("soundText"),
                    "hasFade": bool(spell_data.get("hasFade", False)),
                    "hasCast": bool(spell_data.get("hasCast", False)),
                    "active": bool(spell_data.get("active", True)),
                    "spellId": int(spell_id),
                    "self_avoid": bool(spell_data.get("self_avoid", False)),
                    "enemy_avoid": bool(spell_data.get("enemy_avoid", False)),
                    "trackedEvents": [str(e) for e in tracked_events],
                })

            if not spell_list:
                continue

            if category_lower in {"warrior", "priest", "rogue", "mage", "hunter",
                                  "warlock", "paladin", "druid", "shaman"}:
                bucket_key = f"class_{category_lower}_avoid" if avoid else f"class_{category_lower}"
            elif category_lower == "racials":
                bucket_key = f"race_{category_lower}_avoid" if avoid else f"race_{category_lower}"
            elif category_lower == "items":
                bucket_key = f"item_{category_lower}_avoid" if avoid else f"item_{category_lower}"
            elif category_lower == "misc":
                bucket_key = f"misc_{category_lower}_avoid" if avoid else f"misc_{category_lower}"
            else:
                continue

            result[bucket_key] = spell_list

        return result

    # ------------------------------------------------------------------
    # Voice-generation helpers (unchanged shape, but consume the new bucketed data)
    # ------------------------------------------------------------------

    def get_spells_for_voice_generation(self, categories: Optional[List[str]] = None) -> List[Dict]:
        """Get all spells that need voice generation."""
        all_spell_data = self.parse_spellmap()
        spells_to_generate: List[Dict] = []

        for category, spells in all_spell_data.items():
            category_parts = category.split("_")
            category_name = category_parts[1] if len(category_parts) > 1 else category

            if categories and category_name.lower() not in [c.lower() for c in categories]:
                continue

            for spell in spells:
                if not spell.get("active", True):
                    continue
                spell["full_category"] = category
                spells_to_generate.append(spell)

        return spells_to_generate

    def get_avoid_spells_for_voice_generation(self, categories: Optional[List[str]] = None) -> List[Dict]:
        """Get all avoid spells that need voice generation."""
        all_spell_data = self.parse_spellavoidmap()
        spells_to_generate: List[Dict] = []

        for category, spells in all_spell_data.items():
            category_parts = category.split("_")
            category_name = category_parts[1] if len(category_parts) > 1 else category

            if categories and category_name.lower() not in [c.lower() for c in categories]:
                continue

            for spell in spells:
                if not (spell.get("self_avoid", False) or spell.get("enemy_avoid", False)):
                    continue
                spell["full_category"] = category
                spells_to_generate.append(spell)

        return spells_to_generate

    def get_voice_files_with_text(self, categories: Optional[List[str]] = None) -> List[Dict[str, str]]:
        """Get a list of voice files needed with their text content."""
        regular_spells = self.get_spells_for_voice_generation(categories)
        avoid_spells = self.get_avoid_spells_for_voice_generation(categories)

        voice_files: List[Dict[str, str]] = []
        seen_files: Set[str] = set()

        for spell in regular_spells:
            sound_file = spell.get("soundFileName")
            spell_name = spell.get("name")
            sound_text = spell.get("soundText")

            if not (sound_file and spell_name):
                continue

            full_category = spell.get("full_category", "")
            category_parts = full_category.split("_")
            category = category_parts[1] if len(category_parts) > 1 else full_category
            voice_text = sound_text if sound_text else spell_name

            if sound_file not in seen_files:
                voice_files.append({
                    "file_name": sound_file,
                    "text": voice_text,
                    "has_fade": spell.get("hasFade", False),
                    "category": category,
                })
                seen_files.add(sound_file)

            if spell.get("hasFade", False):
                fade_file = f"{sound_file}_down"
                if fade_file not in seen_files:
                    voice_files.append({
                        "file_name": fade_file,
                        "text": f"{voice_text} down",
                        "has_fade": False,
                        "category": category,
                    })
                    seen_files.add(fade_file)

            has_cast_event = spell.get("hasCast", False) or "SPELL_CAST_START" in spell.get("trackedEvents", [])
            if has_cast_event:
                cast_file = f"{sound_file}_cast"
                if cast_file not in seen_files:
                    voice_files.append({
                        "file_name": cast_file,
                        "text": f"{voice_text} cast",
                        "has_fade": False,
                        "category": category,
                    })
                    seen_files.add(cast_file)

        for spell in avoid_spells:
            sound_file = spell.get("soundFileName")
            spell_name = spell.get("name")
            sound_text = spell.get("soundText")

            if not (sound_file and spell_name):
                continue

            full_category = spell.get("full_category", "")
            category_parts = full_category.split("_")
            category = category_parts[1] if len(category_parts) > 1 else full_category
            voice_text = sound_text if sound_text else spell_name

            if spell.get("enemy_avoid", False):
                enemy_file = f"enemy_avoided_{sound_file}"
                if enemy_file not in seen_files:
                    voice_files.append({
                        "file_name": enemy_file,
                        "text": f"enemy avoided {voice_text}",
                        "has_fade": False,
                        "category": category,
                        "subcategory": "enemy_avoid",
                    })
                    seen_files.add(enemy_file)

            if spell.get("self_avoid", False):
                self_file = f"you_avoided_{sound_file}"
                if self_file not in seen_files:
                    voice_files.append({
                        "file_name": self_file,
                        "text": f"you avoided {voice_text}",
                        "has_fade": False,
                        "category": category,
                        "subcategory": "self_avoid",
                    })
                    seen_files.add(self_file)

        return voice_files

    def get_unique_voice_files_needed(self, categories: Optional[List[str]] = None) -> Set[str]:
        """Get a set of unique voice files that need to be generated."""
        voice_files: Set[str] = set()
        for voice_data in self.get_voice_files_with_text(categories):
            file_name = voice_data.get("file_name")
            if file_name:
                base_name = os.path.splitext(file_name)[0]
                voice_files.add(base_name)
        return voice_files
