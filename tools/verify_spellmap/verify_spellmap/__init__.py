"""
SpellMap Verifier Package
A modular tool for verifying World of Warcraft addon spell map entries.
"""

__version__ = "1.0.0"
__author__ = "Michael Wiesendanger"

from .file_reader import SpellMapFileReader
from .lua_parser import LuaParser
from .reporter import Reporter

__all__ = ["SpellMapFileReader", "LuaParser", "Reporter"]
