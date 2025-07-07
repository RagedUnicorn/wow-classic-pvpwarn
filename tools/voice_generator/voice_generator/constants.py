"""Constants for the voice generator."""

# Eleven Labs defaults
DEFAULT_VOICE_MODEL = "eleven_multilingual_v2"
DEFAULT_OUTPUT_FORMAT = "mp3_44100_128"
DEFAULT_LANGUAGE = "en"

# Rate limiting
RATE_LIMIT_DELAY = 0.5  # seconds between API calls
MAX_RETRIES = 3
RETRY_DELAY = 2.0  # seconds

# File paths
SPELLMAP_RELATIVE_PATH = "../../../code/PVPW_SpellMap.lua"
SPELLAVOIDMAP_RELATIVE_PATH = "../../../code/PVPW_SpellAvoidMap.lua"
OUTPUT_RELATIVE_PATH = "output"
