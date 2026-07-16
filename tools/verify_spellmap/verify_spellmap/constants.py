"""
Constants and configuration for the SpellMap Verifier.

The Lua environment mocks and parsing patterns live in the shared
tools/spellmap_core package; only verifier-specific constants remain here.
"""

# Regex patterns (used by DuplicateValidator's raw-content scan)
SPELL_ID_PATTERN = r'\[(\d+)\]\s*=\s*\{'
NAME_VALUE_PATTERN = r'name\s*=\s*"([^"]+)"'

# Report formatting
REPORT_WIDTH = 60
REPORT_TITLE = "SpellMap Verification Report (Lua Parser)"

# Error/Success prefixes
ERROR_PREFIX = "[ERROR]"
SUCCESS_PREFIX = "[OK]"
