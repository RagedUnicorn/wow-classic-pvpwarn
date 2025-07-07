"""Combat log reader and parser."""

from typing import Dict, List, Tuple
from pathlib import Path
from .constants import (
    TRACKED_EVENTS
)


class CombatLogReader:
    """Reads and parses WoW combat log files."""

    def __init__(self, logs_directory: str):
        """
        Initialize the combat log reader.

        Args:
            logs_directory: Path to directory containing combat log files
        """
        self.logs_directory = Path(logs_directory)
        self.spell_events: Dict[Tuple[int, str], List[str]] = {}
        self.logs_processed: List[str] = []
        self.total_lines = 0

    def read_all_logs(self) -> Dict[Tuple[int, str], List[str]]:
        """
        Read all combat log files and extract spell events.

        Returns:
            Dictionary mapping (spell_id, event_type) to list of example lines
        """
        if not self.logs_directory.exists():
            print(f"Warning: Combat logs directory not found: {self.logs_directory}")
            return {}

        # Find all .txt files in the directory
        log_files = list(self.logs_directory.glob("*.txt"))

        if not log_files:
            print(f"Warning: No combat log files found in {self.logs_directory}")
            return {}

        print(f"Found {len(log_files)} combat log files")

        for log_file in log_files:
            print(f"Processing: {log_file.name}")
            self._process_log_file(log_file)

        return self.spell_events

    def _process_log_file(self, log_file: Path) -> None:
        """Process a single combat log file."""
        try:
            with open(log_file, 'r', encoding='utf-8') as f:
                lines_in_file = 0
                for line in f:
                    lines_in_file += 1
                    self._parse_line(line.strip(), log_file.name)

                self.total_lines += lines_in_file
                self.logs_processed.append(log_file.name)
                print(f"  - Processed {lines_in_file} lines")

        except Exception as e:
            print(f"Error reading {log_file}: {e}")

    def _parse_line(self, line: str, filename: str) -> None:
        """Parse a single combat log line."""
        if not line:
            return

        # Split by double space first to separate timestamp from rest
        parts = line.split('  ', 1)
        if len(parts) != 2:
            return

        timestamp = parts[0]
        event_data = parts[1]

        # Split the event data by commas
        # Note: Some fields might contain commas in quoted strings
        fields = self._split_csv_line(event_data)

        if len(fields) < 13:  # Need at least 13 fields for spell events
            return

        event_type = fields[0]


        # Check if this is a tracked event
        if event_type not in TRACKED_EVENTS:
            return

        try:
            # Spell ID is at position 9 (0-indexed), spell name at position 10
            spell_id = int(fields[9])

            # Store the example
            key = (spell_id, event_type)
            example = f"{timestamp}  {event_data}"

            if key not in self.spell_events:
                self.spell_events[key] = []

            # Store full line as example (limit to 1 example per spell/event combo)
            if not self.spell_events[key]:
                self.spell_events[key].append(f"Found in: {filename}")
                self.spell_events[key].append(f"Example: `{example}`")

        except (ValueError, IndexError):
            # Skip lines that don't have valid spell data
            pass

    def _split_csv_line(self, line: str) -> List[str]:
        """
        Split a CSV line respecting quoted strings.

        Args:
            line: CSV line to split

        Returns:
            List of fields
        """
        # For WoW combat logs, a simple comma split works fine
        # as quoted strings don't contain commas
        return line.split(',')

    def get_statistics(self) -> Dict[str, any]:
        """Get statistics about processed logs."""
        return {
            'logs_processed': len(self.logs_processed),
            'log_files': self.logs_processed,
            'total_lines': self.total_lines,
            'unique_spell_events': len(self.spell_events),
            'events_by_type': self._count_events_by_type()
        }

    def _count_events_by_type(self) -> Dict[str, int]:
        """Count spell events by type."""
        counts = {}
        for (spell_id, event_type), examples in self.spell_events.items():
            counts[event_type] = counts.get(event_type, 0) + 1
        return counts
