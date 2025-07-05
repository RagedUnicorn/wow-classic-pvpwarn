"""
Validator for soundFileName property in SpellMap entries.
"""

import re
from typing import Dict, Any
from .base_validator import BaseValidator


class SoundFileNameValidator(BaseValidator):
    """Validates that soundFileName property exists and contains only valid characters."""

    # Pattern for valid sound file names: only lowercase letters and underscores
    VALID_PATTERN = re.compile(r'^[a-z_]+$')

    def get_name(self) -> str:
        """Return the name of this validator."""
        return "SoundFileNameValidator"

    def validate(self, spell_entries: Dict[str, Dict[int, Dict[str, Any]]], content: str = None) -> None:
        """
        Validate soundFileName property for all spell entries.

        Args:
            spell_entries: Parsed spell entries organized by category
            content: Optional raw file content (not used by this validator)
        """
        self.reset()

        for category, spells in spell_entries.items():
            for spell_id, spell_data in spells.items():
                self._validate_spell_sound_file_name(category, spell_id, spell_data)

    def _validate_spell_sound_file_name(self, category: str, spell_id: int, spell_data: Dict[str, Any]) -> None:
        """
        Validate soundFileName for a single spell entry.

        Args:
            category: The spell category
            spell_id: The spell ID
            spell_data: The spell data dictionary
        """
        # Skip reference entries
        if self._is_reference_entry(spell_data):
            return

        # Check if soundFileName exists
        if "soundFileName" not in spell_data:
            self.add_error(
                f"{category}[{spell_id}]: Missing 'soundFileName' property"
            )
            return

        sound_file_name = spell_data.get("soundFileName")

        # Check if soundFileName is a string
        if not isinstance(sound_file_name, str):
            self.add_error(
                f"{category}[{spell_id}]: 'soundFileName' must be a string, got {type(sound_file_name).__name__}"
            )
            return

        # Check if soundFileName is empty
        if not sound_file_name:
            self.add_error(
                f"{category}[{spell_id}]: 'soundFileName' is empty"
            )
            return

        # Check if soundFileName contains only valid characters (a-z and _)
        if not self.VALID_PATTERN.match(sound_file_name):
            invalid_chars = set(c for c in sound_file_name if c not in 'abcdefghijklmnopqrstuvwxyz_')
            self.add_error(
                f"{category}[{spell_id}]: Invalid 'soundFileName' '{sound_file_name}'. "
                f"Only lowercase letters (a-z) and underscores (_) are allowed. "
                f"Found invalid characters: {', '.join(repr(c) for c in sorted(invalid_chars))}"
            )

    def _is_reference_entry(self, spell_data: Dict[str, Any]) -> bool:
        """
        Check if the spell entry is a reference entry.

        Args:
            spell_data: The spell data dictionary

        Returns:
            True if the entry only contains a refId, False otherwise
        """
        return len(spell_data) == 1 and "refId" in spell_data
