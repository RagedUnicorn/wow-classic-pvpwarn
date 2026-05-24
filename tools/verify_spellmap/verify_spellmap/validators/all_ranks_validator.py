"""
Validator for allRanks property in SpellMap entries.
"""

from typing import Dict, Set
from .base_validator import BaseValidator


class AllRanksValidator(BaseValidator):
    """Validates that allRanks property contains the spell's own ID and all referencing spell IDs."""

    VALID_RANK_TYPES = {
        "SPELL_TYPE_BASE",
        "SPELL_TYPE_SOD",
        "SPELL_TYPE_TBC",
    }

    def get_name(self) -> str:
        """Return the name of this validator."""
        return "AllRanksValidator"

    def validate(self, spell_entries: Dict[str, Dict[int, Dict]], content: str = None, **kwargs) -> None:
        """
        Validate allRanks property for all spell entries.

        Args:
            spell_entries: Parsed spell entries organized by category
            content: Optional raw file content (not used by this validator)
        """
        self.reset()

        # First, build a map of which spells reference which other spells
        reference_map = self._build_reference_map(spell_entries)

        # Then validate each spell's allRanks
        for category, spells in spell_entries.items():
            for spell_id, spell_data in spells.items():
                self._validate_spell_all_ranks(category, spell_id, spell_data, reference_map)

    def _build_reference_map(self, spell_entries: Dict[str, Dict[int, Dict]]) -> Dict[int, Set[int]]:
        """
        Build a map of spell_id -> set of spell_ids that reference it.

        Args:
            spell_entries: Parsed spell entries organized by category

        Returns:
            Dictionary mapping spell IDs to sets of referencing spell IDs
        """
        reference_map: Dict[int, Set[int]] = {}

        for category, spells in spell_entries.items():
            for spell_id, spell_data in spells.items():
                if "refId" in spell_data:
                    ref_id = spell_data["refId"]
                    if ref_id not in reference_map:
                        reference_map[ref_id] = set()
                    reference_map[ref_id].add(spell_id)

        return reference_map

    def _validate_spell_all_ranks(self, category: str, spell_id: int, spell_data: Dict,
                                  reference_map: Dict[int, Set[int]]) -> None:
        """
        Validate allRanks for a single spell entry.

        Args:
            category: The spell category
            spell_id: The spell ID
            spell_data: The spell data dictionary
            reference_map: Map of spell IDs to their referencing spells
        """
        # Skip reference entries
        if self._is_reference_entry(spell_data):
            return

        # Check if allRanks exists
        if "allRanks" not in spell_data:
            self.add_error(
                f"{category}[{spell_id}]: Missing 'allRanks' property"
            )
            return

        all_ranks = spell_data.get("allRanks")

        # Check if allRanks is a list
        if not isinstance(all_ranks, list):
            self.add_error(
                f"{category}[{spell_id}]: 'allRanks' must be a list, got {type(all_ranks).__name__}"
            )
            return

        # Check if allRanks is empty
        if not all_ranks:
            self.add_error(
                f"{category}[{spell_id}]: 'allRanks' list is empty"
            )
            return

        # Extract spell IDs from the structured entries: each rank is
        # `{ spellId = N, type = RGPVPW_CONSTANTS.SPELL_TYPE_* }`.
        try:
            all_ranks_int = [int(rank["spellId"]) for rank in all_ranks]
        except (TypeError, ValueError, KeyError):
            self.add_error(
                f"{category}[{spell_id}]: 'allRanks' entries must be tables with a numeric 'spellId' field"
            )
            return

        # Validate each rank's `type` field against the canonical set.
        self._validate_rank_types(category, spell_id, all_ranks)

        # Build expected allRanks: spell's own ID + all referencing IDs
        expected_ranks = {spell_id}
        if spell_id in reference_map:
            expected_ranks.update(reference_map[spell_id])

        # Convert lists to sets for comparison
        actual_ranks = set(all_ranks_int)

        # Check if spell's own ID is in allRanks
        if spell_id not in actual_ranks:
            self.add_error(
                f"{category}[{spell_id}]: 'allRanks' must contain the spell's own ID {spell_id}"
            )

        # Check for missing references
        missing_refs = expected_ranks - actual_ranks
        if missing_refs:
            missing_list = sorted(missing_refs)
            self.add_error(
                f"{category}[{spell_id}]: 'allRanks' is missing referencing spell IDs: {missing_list}"
            )

        # Check for extra IDs that don't reference this spell
        extra_ids = actual_ranks - expected_ranks
        if extra_ids:
            extra_list = sorted(extra_ids)
            self.add_error(
                f"{category}[{spell_id}]: 'allRanks' contains unexpected spell IDs: {extra_list}"
            )

    def _validate_rank_types(self, category: str, spell_id: int, all_ranks: list) -> None:
        """
        Validate that each rank entry has a `type` field set to one of the allowed values.

        Args:
            category: The spell category
            spell_id: The parent spell ID
            all_ranks: The list of rank dicts (each guaranteed to be a dict with a numeric spellId)
        """
        for rank in all_ranks:
            rank_spell_id = int(rank["spellId"])
            if "type" not in rank:
                self.add_error(
                    f"{category}[{spell_id}]: rank {rank_spell_id} is missing required 'type' field"
                )
                continue
            rank_type = rank["type"]
            if rank_type not in self.VALID_RANK_TYPES:
                self.add_error(
                    f"{category}[{spell_id}]: rank {rank_spell_id} has invalid type '{rank_type}', "
                    f"must be one of {sorted(self.VALID_RANK_TYPES)}"
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
