"""
Report generation for SpellMap verification results.
"""

from typing import Dict, List, Optional, Set, Tuple
from pathlib import Path

from .constants import (
    REPORT_WIDTH,
    REPORT_TITLE,
    ERROR_PREFIX,
    SUCCESS_PREFIX
)


class Reporter:
    """Handles report generation and formatting for verification results."""

    def __init__(self, file_path: Path):
        """
        Initialize the reporter.

        Args:
            file_path: Path to the SpellMap file being verified
        """
        self.file_path = file_path
        self.spell_entries: Dict[str, Dict[int, Dict]] = {}
        self.spell_avoid_entries: Dict[str, Dict[int, Dict]] = {}
        self.errors: Dict[str, List[str]] = {"SpellMap": [], "SpellAvoidMap": []}
        self.dynamic_properties: List[str] = []
        self.validator_results: Dict[str, List[Tuple[str, int, List[str]]]] = {
            "SpellMap": [],
            "SpellAvoidMap": []
        }

    def set_spell_entries(self, spell_entries: Dict[str, Dict[int, Dict]]) -> None:
        """Set the spell entries for reporting."""
        self.spell_entries = spell_entries

    def set_spell_avoid_entries(self, spell_avoid_entries: Dict[str, Dict[int, Dict]]) -> None:
        """Set the spell avoid entries for reporting."""
        self.spell_avoid_entries = spell_avoid_entries

    def add_errors(self, errors: List[str], map_name: str = "SpellMap") -> None:
        """Add error messages.

        Args:
            errors: List of error messages
            map_name: Name of the map (SpellMap or SpellAvoidMap)
        """
        self.errors[map_name].extend(errors)

    def set_dynamic_properties(self, dynamic_properties: List[str]) -> None:
        """Set the list of dynamic properties."""
        self.dynamic_properties = dynamic_properties

    def add_validator_result(self, validator_name: str, error_count: int, errors: List[str], map_name: str = "SpellMap") -> None:
        """Add a validator's result to the report.

        Args:
            validator_name: Name of the validator
            error_count: Number of errors found
            errors: List of error messages
            map_name: Name of the map (SpellMap or SpellAvoidMap)
        """
        self.validator_results[map_name].append((validator_name, error_count, errors))

    def generate_report(self) -> str:
        """
        Generate a formatted report string.

        Returns:
            The complete formatted report
        """
        lines = ["=" * REPORT_WIDTH, REPORT_TITLE, "=" * REPORT_WIDTH, ""]

        # Header

        # SpellMap section
        if self.spell_entries:
            lines.append("SpellMap.lua")
            lines.append("-" * REPORT_WIDTH)
            lines.extend(self._generate_summary("SpellMap"))
            lines.append("")
            lines.extend(self._generate_category_breakdown("SpellMap"))
            lines.append("")
            lines.extend(self._generate_validator_section("SpellMap"))
            lines.append("")
            lines.extend(self._generate_error_section("SpellMap"))
            lines.append("")
            lines.append("")

        # SpellAvoidMap section
        if self.spell_avoid_entries:
            lines.append("SpellAvoidMap.lua")
            lines.append("-" * REPORT_WIDTH)
            lines.extend(self._generate_summary("SpellAvoidMap"))
            lines.append("")
            lines.extend(self._generate_category_breakdown("SpellAvoidMap"))
            lines.append("")
            lines.extend(self._generate_validator_section("SpellAvoidMap"))
            lines.append("")
            lines.extend(self._generate_error_section("SpellAvoidMap"))

        # Overall success message if no issues in either map
        total_errors = sum(len(errors) for errors in self.errors.values())
        if total_errors == 0:
            lines.append("")
            lines.append(f"{SUCCESS_PREFIX} All spell entries in both maps are valid!")

        return "\n".join(lines)

    def print_report(self) -> None:
        """Print the report to stdout."""
        print(self.generate_report())

    def _generate_summary(self, map_name: str) -> List[str]:
        """Generate summary statistics for a specific map.

        Args:
            map_name: Name of the map (SpellMap or SpellAvoidMap)
        """
        entries = self.spell_entries if map_name == "SpellMap" else self.spell_avoid_entries

        total_spells = 0
        total_references = 0
        unique_spell_ids = set()

        for category_spells in entries.values():
            for spell_id, spell_data in category_spells.items():
                unique_spell_ids.add(spell_id)
                if 'refId' in spell_data and len(spell_data) == 1:
                    total_references += 1
                else:
                    total_spells += 1

        lines = [
            f"Total categories found: {len(entries)}",
            f"Total spell definitions: {total_spells}",
            f"Total spell references: {total_references}",
            f"Total unique spell IDs: {len(unique_spell_ids)}"
        ]

        if map_name == "SpellMap":
            lines.append(f"Dynamic properties detected: {len(self.dynamic_properties)}")

        return lines

    def _generate_category_breakdown(self, map_name: str) -> List[str]:
        """Generate category breakdown for a specific map.

        Args:
            map_name: Name of the map (SpellMap or SpellAvoidMap)
        """
        entries = self.spell_entries if map_name == "SpellMap" else self.spell_avoid_entries

        lines = ["Spells per category:"]
        for category, spells in sorted(entries.items()):
            lines.append(f"  {category}: {len(spells)} spells")
        return lines

    def _generate_error_section(self, map_name: str) -> List[str]:
        """Generate error section for a specific map.

        Args:
            map_name: Name of the map (SpellMap or SpellAvoidMap)
        """
        errors = self.errors[map_name]

        if errors:
            lines = [f"ERRORS ({len(errors)}):"]
            for error in errors:
                # Handle multi-line errors
                error_lines = error.split('\n')
                lines.append(f"  {ERROR_PREFIX} {error_lines[0]}")
                for additional_line in error_lines[1:]:
                    lines.append(f"  {additional_line}")
            return lines
        else:
            return [f"{SUCCESS_PREFIX} No errors found!"]

    def has_errors(self) -> bool:
        """Check if there are any errors in any map."""
        return any(len(errors) > 0 for errors in self.errors.values())

    def _generate_validator_section(self, map_name: str) -> List[str]:
        """Generate validator results section for a specific map.

        Args:
            map_name: Name of the map (SpellMap or SpellAvoidMap)
        """
        results = self.validator_results[map_name]

        if not results:
            return []

        lines = ["Validators run:"]
        for validator_name, error_count, errors in results:
            if error_count == 0:
                lines.append(f"  {SUCCESS_PREFIX} {validator_name}: PASSED")
            else:
                lines.append(f"  {ERROR_PREFIX} {validator_name}: FAILED ({error_count} errors)")

        return lines
