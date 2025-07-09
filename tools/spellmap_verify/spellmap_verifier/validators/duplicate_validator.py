"""
Duplicate spell ID validator for spell map entries.
"""

import re
from typing import Dict, List

from .base_validator import BaseValidator
from ..constants import (
    SPELLMAP_DEFINITION,
    CATEGORY_PATTERN,
    SPELL_ID_PATTERN,
    NAME_VALUE_PATTERN
)


class DuplicateValidator(BaseValidator):
    """Validates that spell IDs are unique both within and across categories."""

    def get_name(self) -> str:
        """Get the name of this validator."""
        return "Duplicate Spell ID Validator"

    def validate(self, spell_entries: Dict[str, Dict[int, Dict]],
                 content: str = None, **kwargs) -> None:
        """
        Validate for duplicate spell IDs.

        Args:
            spell_entries: Dictionary of spell entries organized by category
            content: Raw file content for source-level duplicate detection
        """
        self.reset()

        # Check source code for duplicates (before Lua parsing)
        if content:
            self._check_source_duplicates(content)

        # Check for cross-category duplicates
        self._check_cross_category_duplicates(spell_entries)

    def _check_source_duplicates(self, content: str) -> None:
        """
        Detect duplicate spell IDs in the source code before Lua parsing.
        This catches duplicates that would be overwritten in Lua.
        """
        # Find where spellMap is defined
        spellmap_start = content.find(SPELLMAP_DEFINITION)
        if spellmap_start == -1:
            return

        # Track current category and spell IDs
        current_category = None
        category_spell_ids: Dict[str, Dict[int, int]] = {}

        # Split content into lines for easier processing
        lines = content[spellmap_start:].split('\n')

        for line_num, line in enumerate(lines):
            # Check for category definition
            category_match = re.search(CATEGORY_PATTERN, line)
            if category_match:
                current_category = category_match.group(1)
                if current_category not in category_spell_ids:
                    category_spell_ids[current_category] = {}
            # Check for spell ID definition (only if we didn't find a category and have a current category)
            elif current_category:
                spell_match = re.search(SPELL_ID_PATTERN, line)
                if spell_match:
                    spell_id = int(spell_match.group(1))

                    if spell_id in category_spell_ids[current_category]:
                        # Find the name of the duplicate entry
                        name = self._extract_spell_name(lines, line_num)

                        self.add_error(
                            f"Duplicate spell ID {spell_id} in category '{current_category}' "
                            f"will overwrite previous definition. "
                            f"Second occurrence has name: \"{name}\""
                        )
                    else:
                        category_spell_ids[current_category][spell_id] = line_num

    def _extract_spell_name(self, lines: List[str], start_line: int) -> str:
        """
        Extract spell name from the lines following a spell definition.

        Args:
            lines: All lines from the file
            start_line: Line number where the spell definition starts

        Returns:
            The spell name or "unknown" if not found
        """
        name = "unknown"
        for i in range(1, min(10, len(lines) - start_line)):
            name_line = lines[start_line + i]
            name_match = re.search(NAME_VALUE_PATTERN, name_line)
            if name_match:
                name = name_match.group(1)
                break
            if '},' in name_line:  # End of spell definition
                break
        return name

    def _check_cross_category_duplicates(self, spell_entries: Dict[str, Dict[int, Dict]]) -> None:
        """Check for duplicate spell IDs across different categories."""
        spell_id_to_categories: Dict[int, List[str]] = {}

        # Build a map of spell_id to list of categories it appears in
        for category, spells in spell_entries.items():
            for spell_id in spells:
                if spell_id not in spell_id_to_categories:
                    spell_id_to_categories[spell_id] = []
                spell_id_to_categories[spell_id].append(category)

        # Find duplicates across categories
        cross_category_duplicates = {
            spell_id: categories
            for spell_id, categories in spell_id_to_categories.items()
            if len(categories) > 1
        }

        # Report cross-category duplicates
        if cross_category_duplicates:
            for spell_id, categories in sorted(cross_category_duplicates.items()):
                # Get spell names from each category for better reporting
                spell_names = []
                for category in categories:
                    spell_data = spell_entries[category][spell_id]
                    if 'name' in spell_data:
                        spell_names.append(f"{category}: \"{spell_data['name']}\"")
                    elif 'refId' in spell_data:
                        spell_names.append(f"{category}: refId={spell_data['refId']}")
                    else:
                        spell_names.append(f"{category}: <no name>")

                self.add_error(
                    f"Duplicate spell ID {spell_id} found in multiple categories:\n" +
                    "\n".join(f"    - {name}" for name in spell_names)
                )
