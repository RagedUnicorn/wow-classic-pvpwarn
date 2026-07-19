#!/usr/bin/env python3
"""
SpellMap Verification Tool for PVPWarn.

The Lua source lives in a base + overlay layout (post-refactor):

    code/spellmap/
      Base.lua                      -- Classic Era content
      overlay/Sod.lua               -- SoD add/remove/replace ops
      overlay/Tbc.lua               -- TBC add/remove/replace ops (empty stub today)

Same shape for code/spellavoidmap/. The verifier:

1. Reads Base.lua + both overlays per map.
2. Validates each overlay's structural ops (remove of missing, add of existing, ...) against
   the base - using the Python port of mod.spellMapAssembler.Validate.
3. For each branch (classic, sod, tbc), assembles that branch's view of the map and runs every
   per-entry validator against it.
4. Reports per-branch + an overall pass/fail.
"""

import sys
import argparse
from pathlib import Path
from typing import Dict, List, Tuple

from verify_spellmap import Reporter
from verify_spellmap.reporter import ReportSection
# verify_spellmap/__init__.py wires the sibling tools/spellmap_core package onto sys.path.
from spellmap_core import LuaParser, SpellMapFileReader
from spellmap_core.assembler import apply as assemble_apply, \
    synthesize_rank_aliases
from verify_spellmap.validators import (
    NameValidator, DuplicateValidator, TypeValidator,
    TrackedEventsValidator, SoundFileNameValidator,
    AllRanksValidator, ActiveValidator, HasFadeValidator, HasCastValidator,
    BaseValidator, AvoidPropertiesValidator, ItemIdValidator,
    OverlayOperationsValidator,
)


BRANCHES = ("classic", "sod", "tbc")


def _build_entry_validators(is_avoid_map: bool) -> List[BaseValidator]:
    """Build the per-entry validator stack for one branch pass."""
    validators: List[BaseValidator] = [
        DuplicateValidator(),
        NameValidator(),
        TypeValidator(),
        SoundFileNameValidator(),
        AllRanksValidator(),
    ]

    if is_avoid_map:
        validators.append(AvoidPropertiesValidator())
    else:
        validators.extend([
            TrackedEventsValidator(),
            ActiveValidator(),
            HasFadeValidator(),
            HasCastValidator(),
            ItemIdValidator(),
        ])

    return validators


class MapVerifier:
    """Verifies a single map (SpellMap or SpellAvoidMap) across all three branches."""

    def __init__(self, map_name: str, base_path: Path, sod_path: Path, tbc_path: Path,
                 is_avoid_map: bool):
        self.map_name = map_name
        self.base_path = base_path
        self.sod_path = sod_path
        self.tbc_path = tbc_path
        self.is_avoid_map = is_avoid_map

    def run(self, reporter: Reporter) -> bool:
        """Run the verification and append sections to ``reporter``. Returns False on errors."""
        print(f"\nVerifying {self.map_name} from {self.base_path.parent}")

        parser = LuaParser()
        parser.setup_environment()

        base_entries = parser.parse_spell_avoid_map(SpellMapFileReader(str(self.base_path)).read()) \
            if self.is_avoid_map \
            else parser.parse_spellmap(SpellMapFileReader(str(self.base_path)).read())

        sod_overlay = parser.parse_overlay(SpellMapFileReader(str(self.sod_path)).read())
        tbc_overlay = parser.parse_overlay(SpellMapFileReader(str(self.tbc_path)).read())

        overlay_section = ReportSection(f"{self.map_name} (overlay structural validation)")
        ops_validator = OverlayOperationsValidator(branch_name="sod")
        ops_validator.validate(base_entries, overlays=[sod_overlay])
        overlay_section.validator_results.append(
            (ops_validator.get_name(), len(ops_validator.get_errors()), ops_validator.get_errors())
        )
        overlay_section.errors.extend(ops_validator.get_errors())

        ops_validator_tbc = OverlayOperationsValidator(branch_name="tbc")
        ops_validator_tbc.validate(base_entries, overlays=[tbc_overlay])
        overlay_section.validator_results.append(
            (ops_validator_tbc.get_name(), len(ops_validator_tbc.get_errors()), ops_validator_tbc.get_errors())
        )
        overlay_section.errors.extend(ops_validator_tbc.get_errors())
        reporter.add_section(overlay_section)

        branch_overlays = {
            "classic": [],
            "sod":     [sod_overlay],
            "tbc":     [tbc_overlay],
        }

        any_errors = bool(overlay_section.errors)

        for branch in BRANCHES:
            assembled = assemble_apply(base_entries, branch_overlays[branch])
            synthesis_errors = synthesize_rank_aliases(assembled)
            section = ReportSection(f"{self.map_name} ({branch} branch)")
            section.spell_entries = assembled

            if synthesis_errors:
                section.validator_results.append(
                    ("RankAliasSynthesis", len(synthesis_errors), synthesis_errors)
                )
                section.errors.extend(synthesis_errors)
                any_errors = True

            validators = _build_entry_validators(self.is_avoid_map)
            for validator in validators:
                validator.validate(assembled)
                errors = validator.get_errors()
                section.validator_results.append((validator.get_name(), len(errors), errors))
                section.errors.extend(errors)
                if errors:
                    any_errors = True

            reporter.add_section(section)

        return not any_errors


def _resolve_map_paths(directory: Path, label: str) -> Tuple[Path, Path, Path]:
    base = directory / "Base.lua"
    sod = directory / "overlay" / "Sod.lua"
    tbc = directory / "overlay" / "Tbc.lua"
    for path in (base, sod, tbc):
        if not path.exists():
            print(f"Error: missing {label} file: {path}")
            sys.exit(1)
    return base, sod, tbc


def parse_arguments():
    parser = argparse.ArgumentParser(
        description="Verify the PVPWarn SpellMap / SpellAvoidMap source tree (base + overlays).",
    )

    script_dir = Path(__file__).parent
    addon_root = script_dir.parent.parent
    default_spellmap_dir = addon_root / "code" / "spellmap"
    default_spellavoidmap_dir = addon_root / "code" / "spellavoidmap"

    parser.add_argument(
        "--spellmap-dir",
        default=str(default_spellmap_dir),
        help=f"Path to code/spellmap/ (default: {default_spellmap_dir})",
    )
    parser.add_argument(
        "--spellavoidmap-dir",
        default=str(default_spellavoidmap_dir),
        help=f"Path to code/spellavoidmap/ (default: {default_spellavoidmap_dir})",
    )

    return parser.parse_args()


def main():
    args = parse_arguments()

    spellmap_dir = Path(args.spellmap_dir)
    spellavoidmap_dir = Path(args.spellavoidmap_dir)

    spellmap_paths = _resolve_map_paths(spellmap_dir, "SpellMap")
    spellavoidmap_paths = _resolve_map_paths(spellavoidmap_dir, "SpellAvoidMap")

    reporter = Reporter()

    spellmap_verifier = MapVerifier(
        "SpellMap", *spellmap_paths, is_avoid_map=False,
    )
    spellavoidmap_verifier = MapVerifier(
        "SpellAvoidMap", *spellavoidmap_paths, is_avoid_map=True,
    )

    success = True
    try:
        success &= spellmap_verifier.run(reporter)
        success &= spellavoidmap_verifier.run(reporter)
    except Exception as exc:
        print(f"Fatal error during verification: {exc}")
        sys.exit(1)

    reporter.print_report()
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
