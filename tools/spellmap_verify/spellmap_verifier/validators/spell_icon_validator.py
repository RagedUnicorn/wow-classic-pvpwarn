"""
Validator for spellIcon property in SpellMap entries.
"""

import re
from typing import Dict
from .base_validator import BaseValidator


class SpellIconValidator(BaseValidator):
    """Validates that spellIcon property exists and contains only valid characters."""

    # Pattern for valid spell icons: lowercase letters, numbers, and underscores
    VALID_PATTERN = re.compile(r'^[a-z0-9_]+$')

    def get_name(self) -> str:
        """Return the name of this validator."""
        return "SpellIconValidator"

    def validate(self, spell_entries: Dict[str, Dict[int, Dict]], content: str = None, **kwargs) -> None:
        """
        Validate spellIcon property for all spell entries.

        Args:
            spell_entries: Parsed spell entries organized by category
            content: Optional raw file content (not used by this validator)
        """
        self.reset()

        for category, spells in spell_entries.items():
            for spell_id, spell_data in spells.items():
                self._validate_spell_icon(category, spell_id, spell_data)

    def _validate_spell_icon(self, category: str, spell_id: int, spell_data: Dict) -> None:
        """
        Validate spellIcon for a single spell entry.

        Args:
            category: The spell category
            spell_id: The spell ID
            spell_data: The spell data dictionary
        """
        # Skip reference entries
        if self._is_reference_entry(spell_data):
            return

        # Check if spellIcon exists
        if "spellIcon" not in spell_data:
            self.add_error(
                f"{category}[{spell_id}]: Missing 'spellIcon' property"
            )
            return

        spell_icon = spell_data.get("spellIcon")

        # Check if spellIcon is a string
        if not isinstance(spell_icon, str):
            self.add_error(
                f"{category}[{spell_id}]: 'spellIcon' must be a string, got {type(spell_icon).__name__}"
            )
            return

        # Check if spellIcon is empty
        if not spell_icon:
            self.add_error(
                f"{category}[{spell_id}]: 'spellIcon' is empty"
            )
            return

        # Check if spellIcon contains only valid characters (a-z, 0-9, and _)
        if not self.VALID_PATTERN.match(spell_icon):
            invalid_chars = set(c for c in spell_icon if c not in 'abcdefghijklmnopqrstuvwxyz0123456789_')
            self.add_error(
                f"{category}[{spell_id}]: Invalid 'spellIcon' '{spell_icon}'. "
                f"Only lowercase letters (a-z), numbers (0-9), and underscores (_) are allowed. "
                f"Found invalid characters: {', '.join(repr(c) for c in sorted(invalid_chars))}"
            )

    def _is_reference_entry(self, spell_data: Dict) -> bool:
        """
        Check if the spell entry is a reference entry.

        Args:
            spell_data: The spell data dictionary

        Returns:
            True if the entry only contains a refId, False otherwise
        """
        return len(spell_data) == 1 and "refId" in spell_data
