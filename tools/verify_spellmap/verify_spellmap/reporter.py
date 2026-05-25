"""
Report generation for SpellMap verification results.

Reports are organised into "sections" — typically one per (map, branch) combination plus an
optional overlay-operations section. Each section keeps its own summary, validator results, and
errors, so the same Reporter can drive a clean per-branch view of the new base+overlay layout.
"""

from typing import Dict, List, Optional, Tuple

from .constants import (
    REPORT_WIDTH,
    REPORT_TITLE,
    ERROR_PREFIX,
    SUCCESS_PREFIX,
)


class ReportSection:
    """A single titled block in the report — typically one map+branch combination."""

    def __init__(self, title: str):
        self.title = title
        self.spell_entries: Dict[str, Dict[int, Dict]] = {}
        self.errors: List[str] = []
        # (validator_name, error_count, errors)
        self.validator_results: List[Tuple[str, int, List[str]]] = []
        self.dynamic_properties: List[str] = []


class Reporter:
    """Accumulates one or more report sections and prints a combined report."""

    def __init__(self, root_path):
        """
        Args:
            root_path: Path of the input being verified — only used in the report header.
        """
        self.root_path = root_path
        self.sections: List[ReportSection] = []

    def add_section(self, section: ReportSection) -> None:
        self.sections.append(section)

    def has_errors(self) -> bool:
        return any(section.errors for section in self.sections)

    def generate_report(self) -> str:
        lines = ["=" * REPORT_WIDTH, REPORT_TITLE, "=" * REPORT_WIDTH, ""]

        for section in self.sections:
            lines.append(section.title)
            lines.append("-" * REPORT_WIDTH)
            lines.extend(self._render_section(section))
            lines.append("")
            lines.append("")

        if not self.has_errors():
            lines.append(f"{SUCCESS_PREFIX} All branches valid")

        return "\n".join(lines)

    def print_report(self) -> None:
        print(self.generate_report())

    def _render_section(self, section: ReportSection) -> List[str]:
        lines: List[str] = []

        if section.spell_entries:
            lines.extend(self._summary_lines(section))
            lines.append("")
            lines.extend(self._category_lines(section))
            lines.append("")

        if section.validator_results:
            lines.append("Validators run:")
            for name, error_count, _ in section.validator_results:
                if error_count == 0:
                    lines.append(f"  {SUCCESS_PREFIX} {name}: PASSED")
                else:
                    lines.append(f"  {ERROR_PREFIX} {name}: FAILED ({error_count} errors)")
            lines.append("")

        lines.extend(self._error_lines(section))
        return lines

    @staticmethod
    def _summary_lines(section: ReportSection) -> List[str]:
        entries = section.spell_entries
        total_spells = 0
        total_references = 0
        unique_ids = set()

        for category_spells in entries.values():
            for spell_id, spell_data in category_spells.items():
                unique_ids.add(spell_id)
                if isinstance(spell_data, dict) and len(spell_data) == 1 and "refId" in spell_data:
                    total_references += 1
                else:
                    total_spells += 1

        lines = [
            f"Total categories found: {len(entries)}",
            f"Total spell definitions: {total_spells}",
            f"Total spell references: {total_references}",
            f"Total unique spell IDs: {len(unique_ids)}",
        ]
        if section.dynamic_properties:
            lines.append(f"Dynamic properties detected: {len(section.dynamic_properties)}")
        return lines

    @staticmethod
    def _category_lines(section: ReportSection) -> List[str]:
        lines = ["Spells per category:"]
        for category, spells in sorted(section.spell_entries.items()):
            lines.append(f"  {category}: {len(spells)} spells")
        return lines

    @staticmethod
    def _error_lines(section: ReportSection) -> List[str]:
        if not section.errors:
            return [f"{SUCCESS_PREFIX} No errors found!"]

        lines = [f"ERRORS ({len(section.errors)}):"]
        for error in section.errors:
            error_lines = error.split("\n")
            lines.append(f"  {ERROR_PREFIX} {error_lines[0]}")
            for extra in error_lines[1:]:
                lines.append(f"  {extra}")
        return lines
