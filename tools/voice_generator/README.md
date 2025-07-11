# Voice Generator

This tool generates voice files for the PVPWarn addon using the Eleven Labs text-to-speech API.

## Features

- Generate voice files for all spells in the SpellMap/SpellAvoidMap
- Generate individual voice files on demand
- Automatic handling of fade spells (generates both normal and "_down" versions)
- Caching to avoid regenerating existing files
- Progress tracking and detailed reporting
- Support for custom voices (including cloned voices)
- Batch processing with rate limiting

## Prerequisites

- Python 3.8 or higher
- Eleven Labs API account and API key

## Installation

1. Create and activate a virtual environment:
```bash
cd tools
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
```

2. Install dependencies:
```bash
cd voice_generator
pip install -r requirements.txt
```

3. Configure API credentials:
```bash
cp .env.example .env
# Edit .env and add your Eleven Labs API key
```

## Configuration

Create a `.env` file based on `.env.example`:

```env
# Required
ELEVENLABS_API_KEY=your_api_key_here

# Optional - but one of --voice, --voice-id, or this must be set
ELEVENLABS_VOICE_ID=your_voice_id  # Default voice to use
ELEVENLABS_MODEL=eleven_multilingual_v2  # TTS model
ELEVENLABS_OUTPUT_FORMAT=mp3_44100_128  # Audio format
```

## Usage

**Note**: You must specify a voice using one of these methods:
- `--voice "Voice Name"` - Select by voice name
- `--voice-id voice_id` - Use exact voice ID
- Set `ELEVENLABS_VOICE_ID` in your `.env` file

### Generate All Voice Files

Generate voice files for all spells in the SpellMap:

```bash
# With voice specified by ID
python generate_voices.py all --voice-id "voice_id"

# With voice specified by name
python generate_voices.py all --voice "[voice]"

# With voice ID from .env file
python generate_voices.py all

# Force regeneration of existing files
python generate_voices.py all --force

# Clean output directory before generation
python generate_voices.py all --clean

# Generate only specific categories
python generate_voices.py all --voice "Julie US" --categories items
python generate_voices.py all --voice "[voice]" --categories warrior priest
```

After generation, copy the files to the addon:
```bash
# Copy generated files to the addon's sound directory
cp output/*.mp3 ../../assets/sounds/en/
```

### Generate Single Voice File

Generate a specific voice file:

```bash
# Generate single voice file (--text is required)
python generate_voices.py single --file ice_barrier --text "Ice Barrier"
python generate_voices.py single --file ice_barrier_down --text "Ice Barrier down"

# Generate avoid sounds
python generate_voices.py single --file enemy_avoided_polymorph --text "enemy avoided Polymorph"
python generate_voices.py single --file you_avoided_kidney_shot --text "you avoided Kidney Shot"
```

### Command Line Options

- `mode`: Generation mode (`single` or `all`)
- `--file`: Sound file name to generate (required for single mode)
- `--text`: Text to speak (required for single mode)
- `--voice`: Voice name to use
- `--voice-id`: Voice ID to use (overrides --voice)
- `--force`: Force regeneration of existing files
- `--no-cache`: Disable caching
- `--output`: Custom output directory
- `--clean`: Clean output directory before generation
- `--categories`: Generate only specific categories (e.g., warrior priest druid items racials)

### Available Categories

The following categories can be used with the `--categories` parameter:

**Classes:**
- warrior, priest, druid, rogue, mage, paladin, hunter, warlock, shaman

**Other:**
- items (trinkets, engineering items, etc.)
- racials (race-specific abilities)
- misc (miscellaneous spells)

## How It Works

1. **Parsing**: The tool reads both `SpellMap.lua` and `SpellAvoidMap.lua`
   - Regular spells from SpellMap:
     - Uses spell `name` property for text-to-speech (e.g., "Berserker Rage")
     - Uses spell `soundFileName` property for output file name (e.g., "berserker_rage.mp3")
     - Automatically handles fade spells by generating both normal and "_down" versions
   - Avoid spells from SpellAvoidMap:
     - Enemy avoid: Generates "enemy_avoided_[soundFileName].mp3" with text "enemy avoided [spell name]"
     - Self avoid: Generates "you_avoided_[soundFileName].mp3" with text "you avoided [spell name]"
2. **Voice Generation**: Uses Eleven Labs API to generate speech
   - Rate limiting prevents API throttling
   - Automatic retries on failure
3. **File Management**:
   - Files saved to `output/` directory
   - Progress tracking and reporting

## File Structure

```
voice_generator/
├── generate_voices.py     # Main script
├── requirements.txt       # Python dependencies
├── .env.example           # Environment variable template
├── .env                   # Your API credentials (git-ignored)
├── voice_generator/       # Package modules
│   ├── __init__.py
│   ├── constants.py       # Configuration constants
│   ├── lua_parser.py      # SpellMap parser
│   ├── voice_client.py    # Eleven Labs API client
│   ├── file_manager.py    # File organization
│   └── reporter.py        # Progress reporting
└── output/                # Generated files (git-ignored)
```

## Troubleshooting

### "ELEVENLABS_API_KEY not found"
- Make sure you've created a `.env` file
- Verify the API key is set correctly

### "Voice not found"
- Check that the voice exists in your Eleven Labs account
- Use `--voice-id` with the exact voice ID

### Rate limiting errors
- The tool automatically handles rate limiting
- If persistent, wait a few minutes and try again

### Missing dependencies
- Make sure you're in the virtual environment
- Run `pip install -r requirements.txt` again

## API Usage

The tool uses the Eleven Labs API with:
- Automatic rate limiting (0.5s between calls)
- Retry logic (up to 3 attempts)
- Progress tracking for batch operations
