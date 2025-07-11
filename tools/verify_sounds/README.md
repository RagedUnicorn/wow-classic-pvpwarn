# Verify Sounds Tool

A Python tool for verifying that voice packs have complete sound file coverage for all spells defined in PVPWarn's SpellMap.lua and SpellAvoidMap.lua.

## Overview

This tool parses the spell configuration files and checks that all required sound files exist in the specified voice pack directory. It ensures that:

1. Every spell in SpellMap.lua has a corresponding sound file
2. Spells with `hasFade = true` have both normal and `_down` sound files
3. Spells with `hasCast = true` have a `_cast` sound file
4. Spells in SpellAvoidMap.lua with `self_avoid = true` have sound files in the `self_avoid` folder
5. Spells in SpellAvoidMap.lua with `enemy_avoid = true` have sound files in the `enemy_avoid` folder

## Installation

1. Navigate to the tools directory and activate the virtual environment:
```bash
cd tools
# On Linux/Mac:
source venv/.venv/bin/activate
# On Windows:
venv\.venv\Scripts\activate
```

2. Install dependencies:
```bash
cd verify_sounds
pip install -r requirements.txt
```

## Usage

### Basic Usage

Verify the default PVPWarn sound files:

```bash
python verify_sounds.py
```

### Verify a Custom Voice Pack

```bash
python verify_sounds.py --sound-path /path/to/voice/pack/assets
```

### Specify Custom Spell Map Locations

```bash
python verify_sounds.py --spell-map /path/to/SpellMap.lua --spell-avoid-map /path/to/SpellAvoidMap.lua
```

### Generate Detailed Report

```bash
python verify_sounds.py --output-format detailed > verification_report.txt
```

### Command Line Arguments

- `--sound-path`: Path to the sound files directory (default: `../../assets`)
- `--spell-map`: Path to SpellMap.lua (default: `../../code/SpellMap.lua`)
- `--spell-avoid-map`: Path to SpellAvoidMap.lua (default: `../../code/SpellAvoidMap.lua`)
- `--output-format`: Output format: `summary` or `detailed` (default: `summary`)
- `--file-extension`: Expected sound file extension (default: `.mp3`)
- `--verbose`: Enable verbose logging

## Sound File Naming Conventions

### SpellMap.lua Sound Files

Based on the `soundFileName` property:

- **Normal spell**: `{soundFileName}.mp3`
- **Fade sound** (when `hasFade = true`): `{soundFileName}_down.mp3`
- **Cast sound** (when `hasCast = true`): `{soundFileName}_cast.mp3`

### SpellAvoidMap.lua Sound Files

- **Self avoid** (when `self_avoid = true`): `self_avoid/you_avoided_{soundFileName}.mp3`
- **Enemy avoid** (when `enemy_avoid = true`): `enemy_avoid/enemy_avoided_{soundFileName}.mp3`

## Examples

### Example 1: Verify Default Voice Pack

```bash
python verify_sounds.py
```

Output:
```
Verifying sound files...
Parsed 245 spells from SpellMap.lua
Parsed 189 spells from SpellAvoidMap.lua

Missing files:
- warrior/battle_shout.mp3
- priest/shadow_word_pain_down.mp3
- enemy_avoid/enemy_avoided_frost_nova.mp3

Summary: 3 missing files out of 523 required files
```

### Example 2: Verify Custom Voice Pack with Detailed Output

```bash
python verify_sounds.py --sound-path ../../../PVPWarn_VoicePack_Custom/assets --output-format detailed
```

### Example 3: Check Only SpellMap.lua

```bash
python verify_sounds.py --spell-avoid-map ""
```

## Output Format

### Summary Format

Lists only missing files and provides a total count.

### Detailed Format

Provides:
- List of all parsed spells
- Required files for each spell
- Status of each file (found/missing)
- Summary statistics

## Exit Codes

- `0`: All required sound files found
- `1`: Missing sound files detected
- `2`: Error parsing Lua files or accessing directories

## Development

### Project Structure

```
verify_sounds/
├── README.md
├── requirements.txt
├── verify_sounds.py          # Main entry point
├── verify_sounds/
│   ├── __init__.py
│   ├── constants.py          # Configuration constants
│   ├── lua_parser.py         # Lua file parsing
│   ├── sound_verifier.py     # Sound verification logic
│   └── reporter.py           # Output formatting
└── tests/
    ├── __init__.py
    ├── test_lua_parser.py
    └── fixtures/
        ├── test_spellmap.lua
        └── test_spellavoidmap.lua
```

### Running Tests

```bash
python -m pytest tests/
```
