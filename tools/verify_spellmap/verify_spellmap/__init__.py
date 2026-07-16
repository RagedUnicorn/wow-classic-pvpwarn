"""
SpellMap Verifier Package
A modular tool for verifying World of Warcraft addon spell map entries.
"""

__version__ = "1.0.0"
__author__ = "Michael Wiesendanger"

import sys
from pathlib import Path

# The Lua parsing / assembly implementation lives in the sibling tools/spellmap_core
# package (shared across tools/). Wire it up here so every part of this package —
# notably validators.overlay_operations_validator — can import spellmap_core no matter
# which entry point (CLI, pytest) loaded us first.
sys.path.insert(0, str(Path(__file__).resolve().parent.parent.parent / "spellmap_core"))

from .reporter import Reporter

__all__ = ["Reporter"]
