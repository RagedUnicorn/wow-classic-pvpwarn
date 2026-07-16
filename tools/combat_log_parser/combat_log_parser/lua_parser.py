"""Spell-map access for the combat log parser.

The Lua parsing itself lives in the shared library tools/spellmap_core/ — the single
implementation across tools/. This module only wraps its union loader (every spell
across every branch, which is what a combat-log replay wants when scanning historic
logs) and projects it down to the entries log matching cares about.
"""

import sys
from pathlib import Path
from typing import Dict, List, Any, Tuple

# Reuse the shared loader from the sibling spellmap_core library, which must stay
# co-located under tools/.
sys.path.insert(0, str(Path(__file__).resolve().parent.parent.parent / "spellmap_core"))

from spellmap_core.map_loader import load_union_map  # noqa: E402


class LuaParser:
    """Provides the union spell map (Base.lua + every overlay's adds and replaces)
    for combat-log matching."""

    def __init__(self, spellmap_dir: str):
        """
        Initialize the Lua parser.

        Args:
            spellmap_dir: Path to the code/spellmap directory (containing Base.lua and overlay/).
        """
        self.spellmap_dir = spellmap_dir
        self.spell_entries: Dict[str, Dict[int, Dict[str, Any]]] = {}

    def parse_spellmap(self) -> Dict[str, Dict[int, Dict[str, Any]]]:
        """Load the union spell map covering every entry across all branches.

        Returns:
            Union spell map keyed by category, then spellId.
        """
        self.spell_entries = load_union_map(self.spellmap_dir)
        return self.spell_entries

    def get_all_spells_by_category(self) -> Dict[str, List[Tuple[int, Dict[str, Any]]]]:
        """
        Get all spells organized by category.

        Returns:
            Dictionary with categories as keys and list of (spell_id, spell_data) tuples
        """
        result = {}

        for category, spells in self.spell_entries.items():
            result[category] = []

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
