"""
Type property validator for spell map entries.
"""

from typing import Dict

from .base_validator import BaseValidator


class TypeValidator(BaseValidator):
    """Validates that all spell entries have proper type properties."""

    # Valid spell types
    VALID_TYPES = {
        "SPELL_TYPE_BASE",
        "SPELL_TYPE_SOD"
    }

    def get_name(self) -> str:
        """Get the name of this validator."""
        return "Type Property Validator"

    def validate(self, spell_entries: Dict[str, Dict[int, Dict]],
                 content: str = None, **kwargs) -> None:
        """
        Validate that all spell entries have a valid type property.

        Args:
            spell_entries: Dictionary of spell entries organized by category
            content: Raw file content (not used for this validator)
        """
        self.reset()

        for category, spells in spell_entries.items():
            for spell_id, spell_data in spells.items():
                spell_key = f"{category}[{spell_id}]"

                # Skip reference entries
                if 'refId' in spell_data and len(spell_data) == 1:
                    continue

                if 'type' not in spell_data:
                    self.add_error(
                        f"{spell_key}: Missing or invalid 'type' property. "
                        f"Expected: RGPVPW_CONSTANTS.SPELL_TYPE_BASE or RGPVPW_CONSTANTS.SPELL_TYPE_SOD"
                    )
                elif not spell_data['type']:
                    self.add_error(
                        f"{spell_key}: Empty 'type' property. "
                        f"Expected: RGPVPW_CONSTANTS.SPELL_TYPE_BASE or RGPVPW_CONSTANTS.SPELL_TYPE_SOD"
                    )
                elif spell_data['type'] not in self.VALID_TYPES:
                    self.add_error(
                        f"{spell_key}: Invalid type '{spell_data['type']}'. "
                        f"Expected: RGPVPW_CONSTANTS.SPELL_TYPE_BASE or RGPVPW_CONSTANTS.SPELL_TYPE_SOD"
                    )
