"""
Report generation and output formatting.
"""

import sys
from typing import Dict, List
from .constants import REPORT_SEPARATOR, INDENT


class Reporter:
    """Handles report generation and output formatting."""

    def __init__(self, output_format: str = 'summary', verbose: bool = False):
        """
        Initialize the reporter.

        Args:
            output_format: 'summary' or 'detailed'
            verbose: Enable verbose logging
        """
        self.output_format = output_format
        self.verbose = verbose

    def log(self, message: str):
        """Log a message if verbose mode is enabled."""
        if self.verbose:
            print(f"[INFO] {message}")

    def error(self, message: str):
        """Print an error message."""
        print(f"[ERROR] {message}", file=sys.stderr)

    def generate_report(self, results: Dict):
        """
        Generate and print the verification report.

        Args:
            results: Verification results dictionary
        """
        print("\nSound File Verification Report")
        print(REPORT_SEPARATOR)

        if self.output_format == 'detailed':
            self._generate_detailed_report(results)
        else:
            self._generate_summary_report(results)

    def _generate_summary_report(self, results: Dict):
        """Generate a summary report."""
        # Statistics
        print("\nStatistics:")
        print(f"{INDENT}SpellMap:")
        print(f"{INDENT}{INDENT}Total spells: {results['spell_map_stats']['total_spells']}")
        print(f"{INDENT}{INDENT}Spells with fade: {results['spell_map_stats']['spells_with_fade']}")
        print(f"{INDENT}{INDENT}Spells with cast: {results['spell_map_stats']['spells_with_cast']}")

        print(f"\n{INDENT}SpellAvoidMap:")
        print(f"{INDENT}{INDENT}Total spells: {results['spell_avoid_map_stats']['total_spells']}")
        print(f"{INDENT}{INDENT}Self avoid spells: {results['spell_avoid_map_stats']['self_avoid_spells']}")
        print(f"{INDENT}{INDENT}Enemy avoid spells: {results['spell_avoid_map_stats']['enemy_avoid_spells']}")

        # File summary
        total_required = len(results['required_files'])
        total_found = len(results['found_files'])
        total_missing = len(results['missing_files'])

        print(f"\nFile Summary:")
        print(f"{INDENT}Required files: {total_required}")
        print(f"{INDENT}Found files: {total_found}")
        print(f"{INDENT}Missing files: {total_missing}")

        if total_missing > 0:
            print(f"\nMissing Files ({total_missing}):")
            for file_path in sorted(results['missing_files']):
                print(f"{INDENT}- {file_path}")
        else:
            print("\n✓ All required sound files found!")

        # Completion percentage
        if total_required > 0:
            completion = (total_found / total_required) * 100
            print(f"\nCompletion: {completion:.1f}%")

    def _generate_detailed_report(self, results: Dict):
        """Generate a detailed report."""
        # Start with summary stats
        self._generate_summary_report(results)

        # Add detailed file listings
        print(f"\n{REPORT_SEPARATOR}")
        print("Detailed File List:")

        # Group files by category
        file_groups = self._group_files_by_category(results['required_files'])

        for category, files in sorted(file_groups.items()):
            print(f"\n{category.upper()}:")
            for file_path in sorted(files):
                status = "✓" if file_path in results['found_files'] else "✗"
                print(f"{INDENT}{status} {file_path}")

    def _group_files_by_category(self, file_paths: List[str]) -> Dict[str, List[str]]:
        """
        Group file paths by category.

        Args:
            file_paths: List of file paths

        Returns:
            Dictionary mapping category to list of files
        """
        groups = {}

        for file_path in file_paths:
            parts = file_path.split('/')
            if parts:
                category = parts[0]
                if category not in groups:
                    groups[category] = []
                groups[category].append(file_path)

        return groups
