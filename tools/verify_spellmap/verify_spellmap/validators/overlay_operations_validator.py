"""
Validator for branch-overlay structural operations (remove / add / replace).

Mirrors mod.spellMapAssembler.Validate from code/spellmap/Assemble.lua. Catches authoring
mistakes that would silently break the in-game assembled map:
  - remove of a spellId that doesn't exist in the working state
  - add of a spellId that already exists
  - replace of a spellId that doesn't exist
"""

from typing import Dict, List
from .base_validator import BaseValidator
from spellmap_core import assembler


class OverlayOperationsValidator(BaseValidator):
    """Validate one or more branch overlays against a base map."""

    def __init__(self, branch_name: str = ""):
        """
        Args:
            branch_name: Optional branch label (e.g. "sod", "tbc") that gets prefixed onto each
                error message so a combined report can attribute errors to a branch.
        """
        super().__init__()
        self.branch_name = branch_name

    def get_name(self) -> str:
        if self.branch_name:
            return f"OverlayOperationsValidator ({self.branch_name})"
        return "OverlayOperationsValidator"

    def validate(self, spell_entries: Dict[str, Dict[int, Dict]], content: str = None,
                 overlays: List[Dict] = None, **kwargs) -> None:
        """
        Run structural validation.

        Args:
            spell_entries: The base spell map (`{category: {spellId: data}}`).
            content: Unused; kept for BaseValidator signature compatibility.
            overlays: A list of parsed overlay dicts (output of LuaParser.parse_overlay). May
                be empty or None.
        """
        self.reset()

        errors = assembler.validate(spell_entries, overlays)
        for error in errors:
            if self.branch_name:
                self.add_error(f"[{self.branch_name}] {error}")
            else:
                self.add_error(error)
