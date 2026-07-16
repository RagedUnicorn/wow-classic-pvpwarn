"""Spell-map access for voice generation.

The Lua parsing itself lives in the shared library tools/spellmap_core/ — the single
implementation across tools/. This module only wraps its union loader (every spell
in any branch needs its voice file generated) and projects the result into the
voice-generation shapes generate_voices.py consumes.
"""

import os
import sys
from pathlib import Path
from typing import Dict, List, Optional, Set

# Reuse the shared loader from the sibling spellmap_core library, which must stay
# co-located under tools/.
sys.path.insert(0, str(Path(__file__).resolve().parent.parent.parent / "spellmap_core"))

from spellmap_core.map_loader import load_union_map  # noqa: E402

from .constants import SPELLMAP_RELATIVE_PATH, SPELLAVOIDMAP_RELATIVE_PATH


class LuaParser:
    """Parser facade for extracting spell data from the SpellMap / SpellAvoidMap directories."""

    def __init__(self, spellmap_path: Optional[str] = None, spellavoidmap_path: Optional[str] = None):
        """Initialize the parser.

        Args:
            spellmap_path: Path to the code/spellmap directory. None uses the default relative path.
            spellavoidmap_path: Path to the code/spellavoidmap directory. None uses the default.
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

    # ------------------------------------------------------------------
    # Public API used by generate_voices.py
    # ------------------------------------------------------------------

    def parse_spellmap(self) -> Dict[str, List[Dict]]:
        """Load SpellMap and return category-bucketed spell data with voice fields."""
        assembled = load_union_map(self.spellmap_path)
        return self._bucket_by_category(assembled, avoid=False)

    def parse_spellavoidmap(self) -> Dict[str, List[Dict]]:
        """Load SpellAvoidMap and return category-bucketed spell data with voice fields."""
        assembled = load_union_map(self.spellavoidmap_path, is_avoid_map=True)
        return self._bucket_by_category(assembled, avoid=True)

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
