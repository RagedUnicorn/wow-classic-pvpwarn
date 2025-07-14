#!/usr/bin/env python
"""
Main entry point for the verify_sounds tool.

This tool verifies that all required sound files exist for spells defined
in SpellMap.lua and SpellAvoidMap.lua.
"""

import argparse
import sys
import os

from verify_sounds.lua_parser import LuaParser
from verify_sounds.sound_verifier import SoundVerifier
from verify_sounds.reporter import Reporter
from verify_sounds.constants import (
    DEFAULT_SOUND_PATH,
    DEFAULT_SPELL_MAP_PATH,
    DEFAULT_SPELL_AVOID_MAP_PATH,
    DEFAULT_FILE_EXTENSION,
    EXIT_SUCCESS,
    EXIT_MISSING_FILES,
    EXIT_ERROR
)


def parse_arguments():
    """Parse command line arguments."""
    parser = argparse.ArgumentParser(
        description='Verify sound files for PVPWarn voice packs'
    )

    parser.add_argument(
        '--sound-path',
        default=DEFAULT_SOUND_PATH,
        help=f'Path to sound files directory (default: {DEFAULT_SOUND_PATH})'
    )

    parser.add_argument(
        '--spell-map',
        default=DEFAULT_SPELL_MAP_PATH,
        help=f'Path to SpellMap.lua (default: {DEFAULT_SPELL_MAP_PATH})'
    )

    parser.add_argument(
        '--spell-avoid-map',
        default=DEFAULT_SPELL_AVOID_MAP_PATH,
        help=f'Path to SpellAvoidMap.lua (default: {DEFAULT_SPELL_AVOID_MAP_PATH})'
    )

    parser.add_argument(
        '--output-format',
        choices=['summary', 'detailed'],
        default='summary',
        help='Output format (default: summary)'
    )

    parser.add_argument(
        '--file-extension',
        default=DEFAULT_FILE_EXTENSION,
        help=f'Expected sound file extension (default: {DEFAULT_FILE_EXTENSION})'
    )

    parser.add_argument(
        '--verbose',
        action='store_true',
        help='Enable verbose logging'
    )

    return parser.parse_args()


def main():
    """Main entry point."""
    args = parse_arguments()

    try:
        # Initialize components
        lua_parser = LuaParser()
        reporter = Reporter(output_format=args.output_format, verbose=args.verbose)

        # Parse spell maps
        spell_map_data = {}
        spell_avoid_map_data = {}

        if args.spell_map and os.path.exists(args.spell_map):
            reporter.log(f"Parsing SpellMap from: {args.spell_map}")
            spell_map_data = lua_parser.parse_spell_map(args.spell_map)
            total_spells = sum(len(spells) for spells in spell_map_data.values())
            reporter.log(f"Parsed {total_spells} spells from SpellMap.lua")

        if args.spell_avoid_map and os.path.exists(args.spell_avoid_map):
            reporter.log(f"Parsing SpellAvoidMap from: {args.spell_avoid_map}")
            spell_avoid_map_data = lua_parser.parse_spell_avoid_map(args.spell_avoid_map)
            total_avoid_spells = sum(len(spells) for spells in spell_avoid_map_data.values())
            reporter.log(f"Parsed {total_avoid_spells} spells from SpellAvoidMap.lua")

        if not spell_map_data and not spell_avoid_map_data:
            reporter.error("No spell data found to verify")
            return EXIT_ERROR

        # Verify sound files
        verifier = SoundVerifier(
            sound_path=args.sound_path,
            file_extension=args.file_extension
        )

        reporter.log(f"Verifying sound files in: {args.sound_path}")
        verification_results = verifier.verify_all(spell_map_data, spell_avoid_map_data)

        # Generate report
        reporter.generate_report(verification_results)

        # Return appropriate exit code
        if verification_results['missing_files']:
            return EXIT_MISSING_FILES
        else:
            return EXIT_SUCCESS

    except Exception as e:
        reporter.error(f"Error: {str(e)}")
        if args.verbose:
            import traceback
            traceback.print_exc()
        return EXIT_ERROR


if __name__ == '__main__':
    sys.exit(main())
