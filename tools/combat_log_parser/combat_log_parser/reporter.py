"""Generate summary reports for combat log parsing."""

from typing import Dict, Any
from pathlib import Path
from datetime import datetime
from .constants import SUMMARY_FILE, REPORT_WIDTH, REPORT_TITLE


class Reporter:
    """Generates summary reports for the combat log parser."""

    def __init__(self, output_dir: str):
        """
        Initialize the reporter.

        Args:
            output_dir: Directory to write the summary report
        """
        self.output_dir = Path(output_dir)

    def generate_summary(self,
                        stats: Dict[str, Any],
                        log_stats: Dict[str, Any],
                        total_spells: int) -> None:
        """
        Generate and write a summary report.

        Args:
            stats: Statistics from spell tracker
            log_stats: Statistics from combat log reader
            total_spells: Total number of spells in SpellMap
        """
        summary_file = self.output_dir / SUMMARY_FILE

        with open(summary_file, 'w', encoding='utf-8') as f:
            # Header
            f.write("# Combat Log Parser Summary\n\n")
            f.write(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")

            # Overall Statistics
            f.write("## Overall Statistics\n")
            f.write(f"- Total spells in SpellMap: {total_spells}\n")
            f.write(f"- Spells with all events found: {stats['total_complete']} ({self._percentage(stats['total_complete'], total_spells)}%)\n")
            f.write(f"- Spells partially found: {stats['total_partial']} ({self._percentage(stats['total_partial'], total_spells)}%)\n")
            f.write(f"- Spells not found: {stats['total_missing']} ({self._percentage(stats['total_missing'], total_spells)}%)\n\n")

            # Category Breakdown
            f.write("## Category Breakdown\n\n")

            for category in sorted(stats['categories'].keys()):
                cat_stats = stats['categories'][category]
                total = cat_stats['total']

                f.write(f"### {category.capitalize()} ({total} spells)\n")
                f.write(f"- Complete: {cat_stats['complete']} ({self._percentage(cat_stats['complete'], total)}%)\n")
                f.write(f"- Partial: {cat_stats['partial']} ({self._percentage(cat_stats['partial'], total)}%)\n")
                f.write(f"- Missing: {cat_stats['missing']} ({self._percentage(cat_stats['missing'], total)}%)\n\n")

            # Combat Logs Processed
            f.write("## Combat Logs Processed\n")
            for log_file in log_stats['log_files']:
                f.write(f"- {log_file}\n")
            f.write(f"- Total lines parsed: {log_stats['total_lines']:,}\n")
            f.write(f"- Unique spell/event combinations found: {log_stats['unique_spell_events']}\n\n")

            # Events by Type
            f.write("## Events Found by Type\n")
            for event_type, count in sorted(log_stats['events_by_type'].items()):
                f.write(f"- {event_type}: {count}\n")

    def print_console_report(self,
                           stats: Dict[str, Any],
                           log_stats: Dict[str, Any],
                           total_spells: int) -> None:
        """Print a summary report to the console."""
        print("\n" + "=" * REPORT_WIDTH)
        print(REPORT_TITLE.center(REPORT_WIDTH))
        print("=" * REPORT_WIDTH)

        print(f"\nTotal spells in SpellMap: {total_spells}")
        print(f"Combat logs processed: {log_stats['logs_processed']}")
        print(f"Total lines parsed: {log_stats['total_lines']:,}")

        print(f"\nOverall Results:")
        print(f"  Complete: {stats['total_complete']} ({self._percentage(stats['total_complete'], total_spells)}%)")
        print(f"  Partial: {stats['total_partial']} ({self._percentage(stats['total_partial'], total_spells)}%)")
        print(f"  Missing: {stats['total_missing']} ({self._percentage(stats['total_missing'], total_spells)}%)")

        print(f"\nSummary written to: {self.output_dir / SUMMARY_FILE}")
        print("Hit/miss files written for each category")

    def _percentage(self, value: int, total: int) -> float:
        """Calculate percentage with one decimal place."""
        if total == 0:
            return 0.0
        return round((value / total) * 100, 1)
