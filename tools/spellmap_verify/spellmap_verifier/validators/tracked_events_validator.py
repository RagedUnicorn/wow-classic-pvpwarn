"""
Validator for trackedEvents property in SpellMap entries.
"""

from typing import Dict, Any, List
from .base_validator import BaseValidator


class TrackedEventsValidator(BaseValidator):
    """Validates that trackedEvents property contains only allowed event types."""

    ALLOWED_EVENTS = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED",
        "SPELL_CAST_SUCCESS",
        "SPELL_AURA_REFRESH",
        "SPELL_CAST_START"
    }

    def get_name(self) -> str:
        """Return the name of this validator."""
        return "TrackedEventsValidator"

    def validate(self, spell_entries: Dict[str, Dict[int, Dict[str, Any]]], content: str = None) -> None:
        """
        Validate trackedEvents property for all spell entries.

        Args:
            spell_entries: Parsed spell entries organized by category
            content: Optional raw file content (not used by this validator)
        """
        self.reset()

        for category, spells in spell_entries.items():
            for spell_id, spell_data in spells.items():
                self._validate_spell_tracked_events(category, spell_id, spell_data)

    def _validate_spell_tracked_events(self, category: str, spell_id: int, spell_data: Dict[str, Any]) -> None:
        """
        Validate trackedEvents for a single spell entry.

        Args:
            category: The spell category
            spell_id: The spell ID
            spell_data: The spell data dictionary
        """
        # Skip reference entries
        if self._is_reference_entry(spell_data):
            return

        # Check if trackedEvents exists
        if "trackedEvents" not in spell_data:
            self.add_error(
                f"{category}[{spell_id}]: Missing 'trackedEvents' property"
            )
            return

        tracked_events = spell_data.get("trackedEvents")

        # Check if trackedEvents is a list (should be converted by Lua parser)
        if not isinstance(tracked_events, list):
            self.add_error(
                f"{category}[{spell_id}]: 'trackedEvents' must be a list, got {type(tracked_events).__name__}"
            )
            return

        # Check if trackedEvents is empty
        if not tracked_events:
            self.add_error(
                f"{category}[{spell_id}]: 'trackedEvents' list is empty"
            )
            return

        # Check each event
        invalid_events = []
        for event in tracked_events:
            if not isinstance(event, str):
                invalid_events.append(f"{event} (not a string)")
            elif event not in self.ALLOWED_EVENTS:
                invalid_events.append(event)

        if invalid_events:
            self.add_error(
                f"{category}[{spell_id}]: Invalid tracked events: {', '.join(invalid_events)}. "
                f"Allowed events: {', '.join(sorted(self.ALLOWED_EVENTS))}"
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
