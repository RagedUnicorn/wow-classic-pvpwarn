# SpellMap Verification Tool

A Python tool to verify the integrity of `PVPW_SpellMap.lua` entries using full Lua parsing capabilities.

## Installation

```bash
# Install dependencies
pip install -r requirements.txt
```

## Usage

```bash
python3 verify_spellmap.py
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

## Architecture

The tool is modularly designed with the following components:
- `verify_spellmap.py` - Main entry point and orchestrator
- `spellmap_verifier/` - Core verification package
  - `file_reader.py` - Handles file I/O operations
  - `lua_parser.py` - Lua parsing and environment setup
  - `reporter.py` - Report generation and formatting
  - `validators/` - Validation modules
    - `base_validator.py` - Abstract base class for validators
    - `name_validator.py` - Name property validation
    - `duplicate_validator.py` - Duplicate spell ID detection
