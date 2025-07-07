# SpellMap Verification Tool

A Python tool to verify the integrity of `PVPW_SpellMap.lua` entries using full Lua parsing capabilities.

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

- **Name Property Validation**: Verifies that every spell entry has a `name` property with a non-empty string value
- **Dynamic Property Detection**: Identifies and reports faction-specific or function-based values
- **Duplicate Spell ID Detection**: Checks for spell IDs that appear multiple times within the same category or across different categories
- **Comprehensive Parsing**: Full Lua parsing including complex expressions and function calls
- **Detailed Reporting**: Clear error messages with spell locations

## Example Output

```
SpellMap Verification Report (Lua Parser)
============================================================
File: /path/to/PVPW_SpellMap.lua

Total categories found: 12
Total spell definitions: 308
Total spell references: 215
Total unique spell IDs: 523
Dynamic properties detected: 1

ERRORS (1):
  ❌ Duplicate spell ID 12345 found in multiple categories:
    - warrior: "Charge"
    - items: "Charge"

✅ All spell entries are valid!
```

## Future Enhancements

- Verify other required properties (type, soundFileName, trackedEvents)
- Check if sound files exist
- Check for consistency in linked spells (refId validation)
- Validate spell icon references
- Check allRanks arrays for consistency

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
│       ├── base_validator.py      # Abstract base class
│       ├── name_validator.py      # Name validation
│       ├── type_validator.py      # Type validation
│       └── duplicate_validator.py # Duplicate detection
└── tests/                  # Test suite
    ├── fixtures/           # Test Lua files
    └── validators/         # Validator tests
