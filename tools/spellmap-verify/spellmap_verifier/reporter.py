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
        self.errors: List[str] = []
        self.dynamic_properties: List[str] = []
        self.validator_results: List[Tuple[str, int, List[str]]] = []

    def set_spell_entries(self, spell_entries: Dict[str, Dict[int, Dict]]) -> None:
        """Set the spell entries for reporting."""
        self.spell_entries = spell_entries

    def add_errors(self, errors: List[str]) -> None:
        """Add error messages."""
        self.errors.extend(errors)

    def set_dynamic_properties(self, dynamic_properties: List[str]) -> None:
        """Set the list of dynamic properties."""
        self.dynamic_properties = dynamic_properties

    def add_validator_result(self, validator_name: str, error_count: int, errors: List[str]) -> None:
        """Add a validator's result to the report."""
        self.validator_results.append((validator_name, error_count, errors))

    def generate_report(self) -> str:
        """
        Generate a formatted report string.

        Returns:
            The complete formatted report
        """
        lines = []

        # Header
        lines.append("=" * REPORT_WIDTH)
        lines.append(REPORT_TITLE)
        lines.append("=" * REPORT_WIDTH)
        lines.append(f"File: {self.file_path}")
        lines.append("")

        # Summary statistics
        lines.extend(self._generate_summary())
        lines.append("")

        # Category breakdown
        lines.extend(self._generate_category_breakdown())
        lines.append("")

        # Validator results
        lines.extend(self._generate_validator_section())
        lines.append("")

        # Errors
        lines.extend(self._generate_error_section())

        # Success message if no issues
        if not self.errors:
            lines.append("")
            lines.append(f"{SUCCESS_PREFIX} All spell entries are valid!")

        return "\n".join(lines)

    def print_report(self) -> None:
        """Print the report to stdout."""
        print(self.generate_report())

    def _generate_summary(self) -> List[str]:
        """Generate summary statistics."""
        total_spells = 0
        total_references = 0
        unique_spell_ids = set()

        for category_spells in self.spell_entries.values():
            for spell_id, spell_data in category_spells.items():
                unique_spell_ids.add(spell_id)
                if 'refId' in spell_data and len(spell_data) == 1:
                    total_references += 1
                else:
                    total_spells += 1

        return [
            f"Total categories found: {len(self.spell_entries)}",
            f"Total spell definitions: {total_spells}",
            f"Total spell references: {total_references}",
            f"Total unique spell IDs: {len(unique_spell_ids)}",
            f"Dynamic properties detected: {len(self.dynamic_properties)}"
        ]

    def _generate_category_breakdown(self) -> List[str]:
        """Generate category breakdown."""
        lines = ["Spells per category:"]
        for category, spells in sorted(self.spell_entries.items()):
            lines.append(f"  {category}: {len(spells)} spells")
        return lines

    def _generate_error_section(self) -> List[str]:
        """Generate error section."""
        if self.errors:
            lines = [f"ERRORS ({len(self.errors)}):"]
            for error in self.errors:
                # Handle multi-line errors
                error_lines = error.split('\n')
                lines.append(f"  {ERROR_PREFIX} {error_lines[0]}")
                for additional_line in error_lines[1:]:
                    lines.append(f"  {additional_line}")
            return lines
        else:
            return [f"{SUCCESS_PREFIX} No errors found!"]

    def has_errors(self) -> bool:
        """Check if there are any errors."""
        return len(self.errors) > 0

    def _generate_validator_section(self) -> List[str]:
        """Generate validator results section."""
        if not self.validator_results:
            return []
        
        lines = ["Validators run:"]
        for validator_name, error_count, errors in self.validator_results:
            if error_count == 0:
                lines.append(f"  {SUCCESS_PREFIX} {validator_name}: PASSED")
            else:
                lines.append(f"  {ERROR_PREFIX} {validator_name}: FAILED ({error_count} errors)")
        
        return lines
