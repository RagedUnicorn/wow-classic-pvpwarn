"""Spell-map access for sound-file verification.

The Lua parsing itself lives in the shared library tools/spellmap_core/ — the single
implementation across tools/. This module only wraps its union loader (every spell
defined in any branch needs its sound file on disk) and projects the result down to
the fields sound verification cares about.
"""

import sys
from pathlib import Path

# Reuse the shared loader from the sibling spellmap_core library, which must stay
# co-located under tools/.
sys.path.insert(0, str(Path(__file__).resolve().parent.parent.parent / "spellmap_core"))

from spellmap_core.map_loader import load_union_map  # noqa: E402


class LuaParser:
    """Parser facade for PVPWarn Lua spell configuration directories."""

    def parse_spell_map(self, spellmap_dir):
        """Parse code/spellmap/ (Base.lua + overlay/) and return spell data keyed by category.

        Returns:
            ``{category: {spell_id_str: {name, soundFileName, hasFade, hasCast}}}``
        """
        assembled = load_union_map(spellmap_dir)
        return self._extract_sound_entries(assembled, is_avoid=False)

    def parse_spell_avoid_map(self, spellavoidmap_dir):
        """Parse code/spellavoidmap/ (Base.lua + overlay/) and return spell data keyed by category.

        Returns:
            ``{category: {spell_id_str: {name, soundFileName, self_avoid, enemy_avoid}}}``
        """
        assembled = load_union_map(spellavoidmap_dir, is_avoid_map=True)
        return self._extract_sound_entries(assembled, is_avoid=True)

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
