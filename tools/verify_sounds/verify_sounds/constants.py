"""
Constants for the verify_sounds tool.
"""

import os
from pathlib import Path

# Get the tool's root directory
TOOL_ROOT = Path(__file__).parent.parent

# Default paths relative to tool location
DEFAULT_SOUND_PATH = os.path.join(TOOL_ROOT, '..', '..', 'assets')
DEFAULT_SPELL_MAP_PATH = os.path.join(TOOL_ROOT, '..', '..', 'code', 'spellmap')
DEFAULT_SPELL_AVOID_MAP_PATH = os.path.join(TOOL_ROOT, '..', '..', 'code', 'spellavoidmap')

# File configuration
DEFAULT_FILE_EXTENSION = '.mp3'

# Sound file naming patterns
FADE_SUFFIX = '_down'
CAST_SUFFIX = '_cast'
SELF_AVOID_PREFIX = 'you_avoided_'
ENEMY_AVOID_PREFIX = 'enemy_avoided_'

# Folder names
SELF_AVOID_FOLDER = 'self_avoid'
ENEMY_AVOID_FOLDER = 'enemy_avoid'

# Exit codes
EXIT_SUCCESS = 0
EXIT_MISSING_FILES = 1
EXIT_ERROR = 2

# Report formatting
REPORT_SEPARATOR = '-' * 60
INDENT = '  '
