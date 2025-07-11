"""Constants for the combat log parser."""

# Combat log field positions (1-indexed for consistency with Lua)
TIMESTAMP_POS = 1
EVENT_TYPE_POS = 2
SOURCE_GUID_POS = 3
SOURCE_NAME_POS = 4
SOURCE_FLAGS_POS = 5
SOURCE_RAID_FLAGS_POS = 6
DEST_GUID_POS = 7
DEST_NAME_POS = 8
DEST_FLAGS_POS = 9
DEST_RAID_FLAGS_POS = 10
SPELL_ID_POS = 11
SPELL_NAME_POS = 12
SPELL_SCHOOL_POS = 13

# Tracked events from SpellMap
TRACKED_EVENTS = {
    "SPELL_CAST_START",
    "SPELL_CAST_SUCCESS",
    "SPELL_AURA_APPLIED",
    "SPELL_AURA_REMOVED",
    "SPELL_AURA_REFRESH"
}

# File paths
SPELLMAP_RELATIVE_PATH = "../../code/SpellMap.lua"
COMBAT_LOGS_RELATIVE_PATH = "combat_logs"
OUTPUT_RELATIVE_PATH = "output"

# Output file suffixes
HIT_FILE_SUFFIX = ".hit.md"
MISS_FILE_SUFFIX = ".miss.md"
SUMMARY_FILE = "summary.md"

# Report formatting
REPORT_WIDTH = 60
REPORT_TITLE = "Combat Log Parser Report"
