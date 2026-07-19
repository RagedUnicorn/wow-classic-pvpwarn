"""Constants for the voice generator."""

# Eleven Labs defaults
DEFAULT_VOICE_MODEL = "eleven_multilingual_v2"
DEFAULT_OUTPUT_FORMAT = "mp3_44100_128"

# Allowed Eleven Labs models
ALLOWED_LANGUAGE_MODELS = [
    "eleven_multilingual_v2",
    "eleven_turbo_v2_5",
    "eleven_flash_v2_5",
    "eleven_v3"
]

# Rate limiting
RATE_LIMIT_DELAY = 0.5  # seconds between API calls
MAX_RETRIES = 3
RETRY_DELAY = 2.0  # seconds

# File paths
SPELLMAP_RELATIVE_PATH = "../../../code/spellmap"
SPELLAVOIDMAP_RELATIVE_PATH = "../../../code/spellavoidmap"
OUTPUT_RELATIVE_PATH = "output"
