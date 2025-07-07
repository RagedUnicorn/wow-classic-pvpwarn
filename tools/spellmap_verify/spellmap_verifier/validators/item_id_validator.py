"""
Validator for optional itemId property in SpellMap entries.
"""

from typing import Dict
from .base_validator import BaseValidator


class ItemIdValidator(BaseValidator):
    """Validates optional itemId property in SpellMap entries."""

    def __init__(self):
        """Initialize the item ID validator."""
        super().__init__()

    def get_name(self) -> str:
        """Get the name of this validator."""
        return "ItemIdValidator"

    def validate(self, spell_entries: Dict[str, Dict[int, Dict]], content: str = None, **kwargs) -> None:
        """
        Validate itemId property for spell entries.

        Args:
            spell_entries: Parsed spell entries from the Lua file
            content: Raw content of the Lua file
            **kwargs: Additional keyword arguments
        """
        self.errors.clear()

        for category, spells in spell_entries.items():
            for spell_id, spell_data in spells.items():
                # Skip reference entries
                if 'refId' in spell_data:
                    continue

                # Check if itemId is present
                if 'itemId' in spell_data:
                    item_id = spell_data['itemId']

                    # Validate that itemId is an integer
                    if not isinstance(item_id, int):
                        self.add_error(
                            f"Spell {spell_id} ({spell_data.get('name', 'Unknown')}) in category '{category}' "
                            f"has invalid itemId type: {type(item_id).__name__} (expected int)"
                        )

                    # Validate that itemId is positive
                    elif item_id <= 0:
                        self.add_error(
                            f"Spell {spell_id} ({spell_data.get('name', 'Unknown')}) in category '{category}' "
                            f"has invalid itemId value: {item_id} (must be positive)"
                        )
