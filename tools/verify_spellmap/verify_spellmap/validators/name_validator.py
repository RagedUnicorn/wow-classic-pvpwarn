"""
Name property validator for spell map entries.
"""

from typing import Dict

from .base_validator import BaseValidator


class NameValidator(BaseValidator):
    """Validates that all spell entries have proper name properties."""

    def get_name(self) -> str:
        """Get the name of this validator."""
        return "Name Property Validator"

    def validate(self, spell_entries: Dict[str, Dict[int, Dict]],
                 content: str = None, **kwargs) -> None:
        """
        Validate that all spell entries have a name property.

        Args:
            spell_entries: Dictionary of spell entries organized by category
            content: Raw file content (unused by this validator)
        """
        self.reset()

        for category, spells in spell_entries.items():
            for spell_id, spell_data in spells.items():
                spell_key = f"{category}[{spell_id}]"

                # Skip reference entries
                if 'refId' in spell_data and len(spell_data) == 1:
                    continue

                if 'name' not in spell_data:
                    self.add_error(f"{spell_key}: Missing 'name' property")
                elif not spell_data['name']:
                    self.add_error(f"{spell_key}: Empty 'name' property")
