#!/usr/bin/env python3
"""
SpellMap Verification Tool for PVPWarn
Main entry point that orchestrates the verification process.
"""

import sys
from pathlib import Path
from typing import List

from spellmap_verifier import SpellMapFileReader, LuaParser, Reporter
from spellmap_verifier.validators import (
    NameValidator, DuplicateValidator, TypeValidator, 
    TrackedEventsValidator, SoundFileNameValidator, SpellIconValidator, 
    AllRanksValidator, BaseValidator
)


class SpellMapVerifier:
    """Main verifier class that coordinates all verification components."""

    def __init__(self, spellmap_path: str):
        """
        Initialize the verifier with all components.

        Args:
            spellmap_path: Path to the SpellMap.lua file
        """
        self.file_reader = SpellMapFileReader(spellmap_path)
        self.lua_parser = LuaParser()
        self.reporter = Reporter(self.file_reader.get_path())
        self.validators: List[BaseValidator] = []

        # File content and parsed data
        self.content = ""
        self.spell_entries = {}

    def setup_validators(self) -> None:
        """Set up all validators to be used."""
        # Create validators with dependencies
        name_validator = NameValidator(self.lua_parser.get_dynamic_properties())
        duplicate_validator = DuplicateValidator()
        type_validator = TypeValidator()
        tracked_events_validator = TrackedEventsValidator()
        sound_file_name_validator = SoundFileNameValidator()
        spell_icon_validator = SpellIconValidator()
        all_ranks_validator = AllRanksValidator()

        # Add validators in order of execution
        self.validators = [
            duplicate_validator,       # Check duplicates first
            name_validator,           # Then check names
            type_validator,           # Then check types
            tracked_events_validator, # Then check tracked events
            sound_file_name_validator, # Then check sound file names
            spell_icon_validator,     # Then check spell icons
            all_ranks_validator,      # Then check all ranks
        ]

    def run(self) -> bool:
        """
        Run the complete verification process.

        Returns:
            True if no errors were found, False otherwise
        """
        print("Starting SpellMap verification with Lua parser...")

        try:
            # Step 1: Read the file
            self.content = self.file_reader.read()

            # Step 2: Set up Lua environment and parse
            self.lua_parser.setup_environment()
            self.spell_entries = self.lua_parser.parse_spellmap(self.content)

            # Step 3: Set up validators with dynamic properties
            self.setup_validators()

            # Step 4: Run all validators
            for validator in self.validators:
                validator.validate(self.spell_entries, self.content)

            # Step 5: Collect results
            self._collect_results()

            # Step 6: Generate and print report
            self.reporter.print_report()

            # Return success if no errors
            return not self.reporter.has_errors()

        except Exception as e:
            print(f"Fatal error during verification: {str(e)}")
            return False

    def _collect_results(self) -> None:
        """Collect results from all components for reporting."""
        # Set spell entries for statistics
        self.reporter.set_spell_entries(self.spell_entries)

        # Set dynamic properties found during parsing
        self.reporter.set_dynamic_properties(self.lua_parser.get_dynamic_properties())

        # Collect errors from all validators
        for validator in self.validators:
            self.reporter.add_errors(validator.get_errors())


def main():
    """Main entry point."""
    # Determine path to SpellMap.lua
    script_dir = Path(__file__).parent
    addon_root = script_dir.parent.parent
    spellmap_path = addon_root / "code" / "PVPW_SpellMap.lua"

    # Create and run verifier
    verifier = SpellMapVerifier(str(spellmap_path))
    success = verifier.run()

    # Exit with appropriate code
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()