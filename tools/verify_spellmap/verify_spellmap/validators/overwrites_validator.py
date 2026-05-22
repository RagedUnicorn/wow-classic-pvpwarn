"""
Validator for the optional overwrites property in SpellMap entries.
"""

from typing import Dict
from .base_validator import BaseValidator


class OverwritesValidator(BaseValidator):
    """Validates the optional overwrites property in SpellMap entries.

    A Season of Discovery spell may declare ``overwrites = <spellId>`` to mark
    that it reworks and replaces a base game spell. The referenced spell must
    exist as a base (SPELL_TYPE_BASE) entry in the same category. The runtime
    uses this to hide the overwritten base spell while a SoD season is active.
    """

    SOD_TYPE = "SPELL_TYPE_SOD"
    BASE_TYPE = "SPELL_TYPE_BASE"

    def get_name(self) -> str:
        """Return the name of this validator."""
        return "OverwritesValidator"

    def validate(self, spell_entries: Dict[str, Dict[int, Dict]], content: str = None, **kwargs) -> None:
        """
        Validate the overwrites property for all spell entries.

        Args:
            spell_entries: Parsed spell entries organized by category
            content: Optional raw file content (not used by this validator)
        """
        self.reset()

        for category, spells in spell_entries.items():
            for spell_id, spell_data in spells.items():
                self._validate_spell_overwrites(category, spell_id, spell_data, spells)

    def _validate_spell_overwrites(self, category: str, spell_id: int, spell_data: Dict,
                                   category_spells: Dict[int, Dict]) -> None:
        """
        Validate the overwrites property for a single spell entry.

        Args:
            category: The spell category
            spell_id: The spell ID
            spell_data: The spell data dictionary
            category_spells: All spell entries within the same category
        """
        # Skip reference entries
        if self._is_reference_entry(spell_data):
            return

        # overwrites is optional
        if "overwrites" not in spell_data:
            return

        overwrites = spell_data.get("overwrites")

        # Check if overwrites is an integer (bool is a subclass of int, reject it explicitly)
        if not isinstance(overwrites, int) or isinstance(overwrites, bool):
            self.add_error(
                f"{category}[{spell_id}]: 'overwrites' must be an integer, got {type(overwrites).__name__}"
            )
            return

        # Only SoD spells may overwrite a base spell
        if spell_data.get("type") != self.SOD_TYPE:
            self.add_error(
                f"{category}[{spell_id}]: 'overwrites' is only allowed on {self.SOD_TYPE} entries"
            )
            return

        # The referenced spell must exist in the same category
        target = category_spells.get(overwrites)

        if target is None:
            self.add_error(
                f"{category}[{spell_id}]: 'overwrites' references spell ID {overwrites} which does not "
                f"exist in category '{category}'"
            )
            return

        # The referenced spell must be a real base spell, not a refId reference entry
        if self._is_reference_entry(target):
            self.add_error(
                f"{category}[{spell_id}]: 'overwrites' references spell ID {overwrites} which is a "
                f"refId reference entry, not a base spell"
            )
            return

        # The referenced spell must be of type SPELL_TYPE_BASE. Together with the SoD-only rule
        # above this also rules out overwrites chains - a base spell can never carry overwrites.
        if target.get("type") != self.BASE_TYPE:
            self.add_error(
                f"{category}[{spell_id}]: 'overwrites' must reference a {self.BASE_TYPE} spell, "
                f"but spell ID {overwrites} is not"
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
