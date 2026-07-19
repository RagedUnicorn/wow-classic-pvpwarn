"""Constants for the combat log parser."""

# Tracked events from SpellMap
TRACKED_EVENTS = {
    "SPELL_CAST_START",
    "SPELL_CAST_SUCCESS",
    "SPELL_AURA_APPLIED",
    "SPELL_AURA_REMOVED",
    "SPELL_AURA_REFRESH"
}

# File paths
SPELLMAP_RELATIVE_PATH = "../../code/spellmap"
COMBAT_LOGS_RELATIVE_PATH = "combat_logs"
OUTPUT_RELATIVE_PATH = "output"

# Output file suffixes
HIT_FILE_SUFFIX = ".hit.md"
MISS_FILE_SUFFIX = ".miss.md"
SUMMARY_FILE = "summary.md"

# Report formatting
REPORT_WIDTH = 60
REPORT_TITLE = "Combat Log Parser Report"
