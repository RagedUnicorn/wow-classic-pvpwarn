"""
Validator for SpellAvoidMap specific properties.
"""

from typing import Dict
from .base_validator import BaseValidator


class AvoidPropertiesValidator(BaseValidator):
    """Validates avoid-specific properties in SpellAvoidMap entries."""

    def __init__(self):
        """Initialize the avoid properties validator."""
        super().__init__()

    def get_name(self) -> str:
        """Get the name of this validator."""
        return "Avoid Properties Validator"

    def validate(self, spell_entries: Dict[str, Dict[int, Dict]], content: str = None, **kwargs) -> None:
        """
        Validate avoid properties for spell entries.

        Args:
            spell_entries: Parsed spell entries from the Lua file
            content: Raw content of the Lua file
        """
        self.errors.clear()

        for category, spells in spell_entries.items():
            for spell_id, spell_data in spells.items():
                # Skip reference entries
                if 'refId' in spell_data:
                    continue

                # Check for avoid properties
                has_self_avoid = spell_data.get('self_avoid')
                has_enemy_avoid = spell_data.get('enemy_avoid')

                # Validate that at least one avoid property is present
                if has_self_avoid is None and has_enemy_avoid is None:
                    self.add_error(
                        f"Spell {spell_id} ({spell_data.get('name', 'Unknown')}) in category '{category}' is missing both self_avoid and enemy_avoid properties"
                    )

                # Validate that avoid properties are boolean
                if has_self_avoid is not None and not isinstance(has_self_avoid, bool):
                    self.add_error(
                        f"Spell {spell_id} ({spell_data.get('name', 'Unknown')}) in category '{category}' has invalid self_avoid value: {has_self_avoid} (expected boolean)"
                    )

                if has_enemy_avoid is not None and not isinstance(has_enemy_avoid, bool):
                    self.add_error(
                        f"Spell {spell_id} ({spell_data.get('name', 'Unknown')}) in category '{category}' has invalid enemy_avoid value: {has_enemy_avoid} (expected boolean)"
                    )
