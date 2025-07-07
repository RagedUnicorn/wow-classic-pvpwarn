#!/usr/bin/env python3
"""
Combat Log Parser for PVPWarn
Parses WoW combat logs to find real examples of spells from the SpellMap.
"""

import sys
import argparse
from pathlib import Path

from combat_log_parser import (
    CombatLogReader, LuaParser, SpellTracker,
    FileWriter, Reporter
)
from combat_log_parser.constants import (
    SPELLMAP_RELATIVE_PATH, COMBAT_LOGS_RELATIVE_PATH,
    OUTPUT_RELATIVE_PATH
)


class CombatLogParser:
    """Main class that orchestrates the combat log parsing process."""

    def __init__(self, spellmap_path: str, logs_dir: str, output_dir: str):
        """
        Initialize the parser with all components.

        Args:
            spellmap_path: Path to SpellMap.lua
            logs_dir: Directory containing combat logs
            output_dir: Directory for output files
        """
        self.lua_parser = LuaParser(spellmap_path)
        self.log_reader = CombatLogReader(logs_dir)
        self.spell_tracker = SpellTracker(output_dir)
        self.file_writer = FileWriter(output_dir)
        self.reporter = Reporter(output_dir)

    def run(self) -> bool:
        """
        Run the complete parsing process.

        Returns:
            True if successful, False otherwise
        """
        try:
            print("🔍 Starting Combat Log Parser...\n")

            # Step 1: Parse SpellMap
            print("Parsing SpellMap.lua...")
            spell_entries = self.lua_parser.parse_spellmap()
            spells_by_category = self.lua_parser.get_all_spells_by_category()
            spell_counts = self.lua_parser.get_spell_count_by_category()
            total_spells = sum(spell_counts.values())
            print(f"Found {total_spells} spells across {len(spell_counts)} categories")

            # Step 2: Load existing hits
            print("\nLoading existing hit files...")
            self.spell_tracker.load_existing_hits()

            # Step 3: Parse combat logs
            print("\nParsing combat logs...")
            combat_log_events = self.log_reader.read_all_logs()
            log_stats = self.log_reader.get_statistics()

            if not combat_log_events:
                print("Warning: No combat log events found!")
                return False

            # Step 4: Process spells
            print("\nProcessing spells against combat logs...")
            self.spell_tracker.process_spells(spells_by_category, combat_log_events)

            # Step 5: Get statistics
            stats = self.spell_tracker.get_statistics()

            # Step 6: Prepare hit data with examples
            print("\nPreparing output files...")
            hit_data_by_category = {}
            for category in spells_by_category.keys():
                hit_data_by_category[category] = self.spell_tracker.get_hit_data(
                    category, combat_log_events
                )

            # Step 7: Write output files
            self.file_writer.write_all_files(
                spells_by_category,
                self.spell_tracker.missing_spells,
                hit_data_by_category
            )

            # Step 8: Generate reports
            self.reporter.generate_summary(stats, log_stats, total_spells)
            self.reporter.print_console_report(stats, log_stats, total_spells)

            return True

        except Exception as e:
            print(f"\n❌ Error: {str(e)}")
            import traceback
            traceback.print_exc()
            return False


def main():
    """Main entry point."""
    parser = argparse.ArgumentParser(
        description="Parse WoW combat logs to find spell examples"
    )

    # Determine default paths relative to this script
    script_dir = Path(__file__).parent
    default_spellmap = script_dir / SPELLMAP_RELATIVE_PATH
    default_logs = script_dir / COMBAT_LOGS_RELATIVE_PATH
    default_output = script_dir / OUTPUT_RELATIVE_PATH

    parser.add_argument(
        "--spellmap",
        type=str,
        default=str(default_spellmap),
        help="Path to SpellMap.lua file"
    )

    parser.add_argument(
        "--logs-dir",
        type=str,
        default=str(default_logs),
        help="Directory containing combat log files"
    )

    parser.add_argument(
        "--output-dir",
        type=str,
        default=str(default_output),
        help="Directory for output files"
    )

    args = parser.parse_args()

    # Convert relative paths to absolute paths
    spellmap_path = Path(args.spellmap).resolve()
    logs_dir = Path(args.logs_dir).resolve()
    output_dir = Path(args.output_dir).resolve()

    # Verify paths exist
    if not spellmap_path.exists():
        print(f"❌ Error: SpellMap file not found: {args.spellmap}")
        print(f"  Resolved to: {spellmap_path}")
        print(f"  Current working directory: {Path.cwd()}")
        sys.exit(1)

    if not logs_dir.exists():
        print(f"❌ Error: Logs directory not found: {args.logs_dir}")
        print(f"  Resolved to: {logs_dir}")
        sys.exit(1)

    # Create output directory if it doesn't exist
    output_dir.mkdir(parents=True, exist_ok=True)

    # Create parser and run
    combat_log_parser = CombatLogParser(str(spellmap_path), str(logs_dir), str(output_dir))
    success = combat_log_parser.run()

    # Exit with appropriate code
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
