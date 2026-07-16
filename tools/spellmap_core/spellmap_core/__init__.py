"""
SpellMap Core Package
Shared SpellMap / SpellAvoidMap loading and assembly for the PVPWarn tools.

Consumed by verify_spellmap, export_spellmap, combat_log_parser, verify_sounds and
voice_generator — the single Lua parsing implementation across tools/.
"""

__version__ = "1.0.0"
__author__ = "Michael Wiesendanger"

from .file_reader import SpellMapFileReader
from .lua_parser import LuaParser
from .map_loader import load_union_map, union_apply

__all__ = ["SpellMapFileReader", "LuaParser", "load_union_map", "union_apply"]
