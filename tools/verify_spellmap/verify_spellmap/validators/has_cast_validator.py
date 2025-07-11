"""
Validator for hasCast property in SpellMap entries.
"""

from typing import Dict, Any
from .base_validator import BaseValidator


class HasCastValidator(BaseValidator):
    """Validates that hasCast property is a boolean if it exists."""

    def get_name(self) -> str:
        """Return the name of this validator."""
        return "HasCastValidator"

    def validate(self, spell_entries: Dict[str, Dict[int, Dict]], content: str = None, **kwargs) -> None:
        """
        Validate hasCast property for all spell entries.

        Args:
            spell_entries: Parsed spell entries organized by category
            content: Optional raw file content (not used by this validator)
        """
        self.reset()

        for category, spells in spell_entries.items():
            for spell_id, spell_data in spells.items():
                self._validate_spell_has_cast(category, spell_id, spell_data)

    def _validate_spell_has_cast(self, category: str, spell_id: int, spell_data: Dict[str, Any]) -> None:
        """
        Validate hasCast property for a single spell entry.

        Args:
            category: The spell category
            spell_id: The spell ID
            spell_data: The spell data dictionary
        """
        # Skip reference entries
        if self._is_reference_entry(spell_data):
            return

        # hasCast is optional, so only validate if it exists
        if "hasCast" not in spell_data:
            return

        has_cast = spell_data.get("hasCast")

        # Check if hasCast is a boolean
        if not isinstance(has_cast, bool):
            self.add_error(
                f"{category}[{spell_id}]: 'hasCast' must be a boolean (true or false), got {type(has_cast).__name__}"
            )
            return

        # Note: We don't need to validate the value itself since any boolean (True or False) is valid

    def _is_reference_entry(self, spell_data: Dict[str, Any]) -> bool:
        """
        Check if the spell entry is a reference entry.

        Args:
            spell_data: The spell data dictionary

        Returns:
            True if the entry only contains a refId, False otherwise
        """
        return len(spell_data) == 1 and "refId" in spell_data
