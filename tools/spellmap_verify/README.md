# SpellMap Verification Tool

A Python tool to verify the integrity of both `PVPW_SpellMap.lua` and `PVPW_SpellAvoidMap.lua` files using full Lua parsing capabilities.

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
cd spellmap_verify
pip install -r requirements.txt
```

## Usage

```bash
# From the spellmap_verify directory (with venv activated)
python verify_spellmap.py
```

The tool uses the `lupa` library to properly parse Lua code, including:
- Function-based dynamic properties
- Faction-specific names
- Complex Lua expressions

## Features

### Common Validators (Both Maps)
- **Name Property Validation**: Verifies that every spell entry has a `name` property with a non-empty string value
- **Type Property Validation**: Validates spell types (SPELL_TYPE_BASE, SPELL_TYPE_SOD, etc.)
- **Duplicate Spell ID Detection**: Checks for spell IDs that appear multiple times within the same category
- **Sound File Name Validation**: Ensures soundFileName property exists and is non-empty
- **Spell Icon Validation**: Validates spellIcon property exists and is non-empty
- **All Ranks Validation**: Verifies allRanks property is a valid array of integers

### SpellMap-Specific Validators
- **Tracked Events Validation**: Ensures trackedEvents array exists with valid event types
- **Active Property Validation**: Validates active property is a boolean when present
- **Has Fade Validation**: Checks hasFade property is boolean and consistent with trackedEvents
- **Item ID Validation**: Validates optional itemId property is a positive integer when present

### SpellAvoidMap-Specific Validators
- **Avoid Properties Validation**: Ensures self_avoid and/or enemy_avoid boolean properties exist

### Additional Features
- **Dynamic Property Detection**: Identifies and reports faction-specific or function-based values
- **Comprehensive Parsing**: Full Lua parsing including complex expressions and function calls
- **Dual Map Support**: Verifies both SpellMap and SpellAvoidMap in a single run

## Example Output

```
Starting SpellMap verification with Lua parser...

Starting SpellAvoidMap verification...

============================================================
SpellMap Verification Report (Lua Parser)
============================================================

PVPW_SpellMap.lua
------------------------------------------------------------
Total categories found: 12
Total spell definitions: 317
Total spell references: 216
Total unique spell IDs: 533
Dynamic properties detected: 1

Spells per category:
  druid: 42 spells
  hunter: 45 spells
  items: 43 spells
  mage: 57 spells
  misc: 26 spells
  paladin: 52 spells
  priest: 61 spells
  racials: 10 spells
  rogue: 38 spells
  shaman: 85 spells
  warlock: 31 spells
  warrior: 43 spells

Validators run:
  [OK] Duplicate Spell ID Validator: PASSED
  [OK] Name Property Validator: PASSED
  [OK] Type Property Validator: PASSED
  [OK] SoundFileNameValidator: PASSED
  [OK] SpellIconValidator: PASSED
  [OK] AllRanksValidator: PASSED
  [OK] TrackedEventsValidator: PASSED
  [OK] ActiveValidator: PASSED
  [OK] HasFadeValidator: PASSED
  [OK] ItemIdValidator: PASSED

[OK] No errors found!


PVPW_SpellAvoidMap.lua
------------------------------------------------------------
Total categories found: 9
Total spell definitions: 50
Total spell references: 117
Total unique spell IDs: 167

Spells per category:
  druid: 18 spells
  hunter: 18 spells
  mage: 16 spells
  paladin: 5 spells
  priest: 33 spells
  rogue: 35 spells
  shaman: 17 spells
  warlock: 10 spells
  warrior: 15 spells

Validators run:
  [OK] Duplicate Spell ID Validator: PASSED
  [OK] Name Property Validator: PASSED
  [OK] Type Property Validator: PASSED
  [OK] SoundFileNameValidator: PASSED
  [OK] SpellIconValidator: PASSED
  [OK] AllRanksValidator: PASSED
  [OK] Avoid Properties Validator: PASSED

[OK] No errors found!

[OK] All spell entries in both maps are valid!
```

## Error Example

When errors are found, they are clearly reported:

```
PVPW_SpellMap.lua
------------------------------------------------------------
...
Validators run:
  [OK] Duplicate Spell ID Validator: PASSED
  [OK] Name Property Validator: PASSED
  [ERROR] Type Property Validator: FAILED (2 errors)
  ...

ERRORS (2):
  [ERROR] Spell 12345 (Test Spell) in category 'warrior' has invalid type: SPELL_TYPE_INVALID
  [ERROR] Spell 67890 (Another Spell) in category 'mage' is missing type property
```

## Output

The tool generates a comprehensive report showing:
- Total categories and spells found
- Breakdown of spells per category
- Errors found (missing properties, duplicates)
- Clear success/failure status

Exit code is 0 if no errors are found, 1 otherwise.

## Project Structure

```
spellmap_verify/
├── verify_spellmap.py      # Main script with SpellMapVerifier class
├── requirements.txt        # Python dependencies
├── pytest.ini              # pytest configuration
├── README.md               # This file
├── spellmap_verifier/      # Verification modules
│   ├── __init__.py         # Package initialization
│   ├── file_reader.py      # File I/O operations
│   ├── lua_parser.py       # Lua parsing and environment
│   ├── reporter.py         # Report generation
│   ├── constants.py        # Shared constants
│   └── validators/         # Validation modules
│       ├── __init__.py
│       ├── base_validator.py           # Abstract base class
│       ├── name_validator.py           # Name validation
│       ├── type_validator.py           # Type validation
│       ├── duplicate_validator.py      # Duplicate detection
│       ├── sound_file_name_validator.py # Sound file validation
│       ├── spell_icon_validator.py     # Spell icon validation
│       ├── all_ranks_validator.py      # All ranks validation
│       ├── tracked_events_validator.py # Tracked events validation
│       ├── active_validator.py         # Active property validation
│       ├── has_fade_validator.py       # Has fade validation
│       ├── avoid_properties_validator.py # Avoid properties validation
│       └── item_id_validator.py        # Item ID validation
└── tests/                  # Test suite
    ├── fixtures/           # Test Lua files
    └── validators/         # Validator tests
