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
    AllRanksValidator, ActiveValidator, HasFadeValidator, BaseValidator,
    AvoidPropertiesValidator
)


class SpellMapVerifier:
    """Main verifier class that coordinates all verification components."""

    def __init__(self, spellmap_path: str, spell_avoid_map_path: str = None):
        """
        Initialize the verifier with all components.

        Args:
            spellmap_path: Path to the SpellMap.lua file
            spell_avoid_map_path: Optional path to the SpellAvoidMap.lua file
        """
        self.file_reader = SpellMapFileReader(spellmap_path)
        self.avoid_file_reader = SpellMapFileReader(spell_avoid_map_path) if spell_avoid_map_path else None
        self.lua_parser = LuaParser()
        self.reporter = Reporter(self.file_reader.get_path())
        self.validators: List[BaseValidator] = []

        # File content and parsed data
        self.content = ""
        self.avoid_content = ""
        self.spell_entries = {}
        self.spell_avoid_entries = {}

    def setup_validators(self, is_avoid_map: bool = False) -> None:
        """Set up all validators to be used.

        Args:
            is_avoid_map: Whether we're validating the avoid map
        """
        # Create validators with dependencies
        name_validator = NameValidator(self.lua_parser.get_dynamic_properties())
        duplicate_validator = DuplicateValidator()
        type_validator = TypeValidator()
        sound_file_name_validator = SoundFileNameValidator()
        spell_icon_validator = SpellIconValidator()
        all_ranks_validator = AllRanksValidator()

        # Add validators in order of execution
        validators_list: List[BaseValidator] = [
            duplicate_validator,       # Check duplicates first
            name_validator,           # Then check names
            type_validator,           # Then check types
            sound_file_name_validator, # Then check sound file names
            spell_icon_validator,     # Then check spell icons
            all_ranks_validator,      # Then check all ranks
        ]
        self.validators = validators_list

        # Add map-specific validators
        if is_avoid_map:
            avoid_properties_validator = AvoidPropertiesValidator()
            self.validators.append(avoid_properties_validator)
        else:
            tracked_events_validator = TrackedEventsValidator()
            active_validator = ActiveValidator()
            has_fade_validator = HasFadeValidator()
            self.validators.extend([
                tracked_events_validator, # Then check tracked events
                active_validator,         # Then check active property
                has_fade_validator,       # Then check hasFade property
            ])

    def run(self) -> bool:
        """
        Run the complete verification process.

        Returns:
            True if no errors were found, False otherwise
        """
        print("\nStarting SpellMap verification with Lua parser...\n")

        try:
            # Step 1: Read the SpellMap file
            self.content = self.file_reader.read()

            # Step 2: Set up Lua environment and parse SpellMap
            self.lua_parser.setup_environment()
            self.spell_entries = self.lua_parser.parse_spellmap(self.content)

            # Step 3: Set up validators for SpellMap
            self.setup_validators(is_avoid_map=False)

            # Step 4: Run all validators on SpellMap
            for validator in self.validators:
                validator.validate(self.spell_entries, self.content)

            # Step 5: Collect SpellMap results
            self._collect_results("SpellMap")

            # Step 6: If SpellAvoidMap exists, verify it too
            if self.avoid_file_reader:
                print("\nStarting SpellAvoidMap verification...\n")

                # Read the SpellAvoidMap file
                self.avoid_content = self.avoid_file_reader.read()

                # Parse SpellAvoidMap
                self.spell_avoid_entries = self.lua_parser.parse_spell_avoid_map(self.avoid_content)

                # Set up validators for SpellAvoidMap
                self.setup_validators(is_avoid_map=True)

                # Run all validators on SpellAvoidMap
                for validator in self.validators:
                    validator.validate(self.spell_avoid_entries, self.avoid_content)

                # Collect SpellAvoidMap results
                self._collect_results("SpellAvoidMap")

            # Step 7: Generate and print combined report
            self.reporter.print_report()

            # Return success if no errors
            return not self.reporter.has_errors()

        except Exception as e:
            print(f"Fatal error during verification: {str(e)}")
            return False

    def _collect_results(self, map_name: str) -> None:
        """Collect results from all components for reporting.

        Args:
            map_name: Name of the map being verified (SpellMap or SpellAvoidMap)
        """
        # Set spell entries for statistics
        if map_name == "SpellMap":
            self.reporter.set_spell_entries(self.spell_entries)
        else:
            self.reporter.set_spell_avoid_entries(self.spell_avoid_entries)

        # Set dynamic properties found during parsing
        self.reporter.set_dynamic_properties(self.lua_parser.get_dynamic_properties())

        # Collect errors and results from all validators
        for validator in self.validators:
            errors = validator.get_errors()
            self.reporter.add_errors(errors, map_name)
            self.reporter.add_validator_result(
                validator.get_name(),
                len(errors),
                errors,
                map_name
            )


def main():
    """Main entry point."""
    # Determine paths to Lua files
    script_dir = Path(__file__).parent
    addon_root = script_dir.parent.parent
    spellmap_path = addon_root / "code" / "PVPW_SpellMap.lua"
    spell_avoid_map_path = addon_root / "code" / "PVPW_SpellAvoidMap.lua"

    # Create and run verifier
    verifier = SpellMapVerifier(str(spellmap_path), str(spell_avoid_map_path))
    success = verifier.run()

    # Exit with appropriate code
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
