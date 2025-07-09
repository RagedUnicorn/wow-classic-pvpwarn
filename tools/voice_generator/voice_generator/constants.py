"""Constants for the voice generator."""

# Eleven Labs defaults
DEFAULT_VOICE_MODEL = "eleven_multilingual_v2"
DEFAULT_OUTPUT_FORMAT = "mp3_44100_128"
DEFAULT_LANGUAGE = "en"

# Allowed Eleven Labs models
ALLOWED_LANGUAGE_MODELS = [
    "eleven_multilingual_v2",
    "eleven_monolingual_v1", 
    "eleven_turbo_v2_5",
    "eleven_flash_v2_5"
]

# Voice settings defaults
DEFAULT_STABILITY = None  # None means use voice's default
DEFAULT_SIMILARITY_BOOST = None  # None means use voice's default
DEFAULT_STYLE = None  # None means use voice's default (0 for newer models)
DEFAULT_USE_SPEAKER_BOOST = None  # None means use voice's default

# Rate limiting
RATE_LIMIT_DELAY = 0.5  # seconds between API calls
MAX_RETRIES = 3
RETRY_DELAY = 2.0  # seconds

# File paths
SPELLMAP_RELATIVE_PATH = "../../../code/PVPW_SpellMap.lua"
SPELLAVOIDMAP_RELATIVE_PATH = "../../../code/PVPW_SpellAvoidMap.lua"
OUTPUT_RELATIVE_PATH = "output"
