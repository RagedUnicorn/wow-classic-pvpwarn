# verify_sounds Testing Guide

This document describes how to run and understand the tests for the Sound File verification tool.

## Test Structure

The test suite focuses on verifying the Lua parser functionality that extracts spell data from SpellMap.lua and SpellAvoidMap.lua files:

```
tests/
├── __init__.py                   # Package initialization
├── fixtures/                    # Test data files
│   ├── test_spellmap.lua        # Valid SpellMap for testing
│   └── test_spellavoidmap.lua   # Valid SpellAvoidMap for testing
└── test_lua_parser.py           # Unit tests for Lua parser
```

## Running Tests

### Using Docker (Recommended)

Run all tests:
```bash
docker compose -f docker-compose.test.yml run --rm verify-sounds-tests
```

This will:
- Install all dependencies automatically
- Run the complete test suite
- Output JUnit XML for CI/CD integration

Results will be saved to:
- `./target/test_results/verify_sounds/junit.xml` - JUnit test results

### Using Local Python Environment

If you have Python and the requirements installed locally:

```bash
cd tools/verify_sounds

# Install dependencies
pip install -r requirements.txt

# Run all tests
python -m pytest tests/ --verbose

# Run with JUnit output
python -m pytest tests/ --junit-xml=junit.xml

# Run specific test file
python -m pytest tests/test_lua_parser.py -v

# Run specific test method
python -m pytest tests/test_lua_parser.py::TestLuaParser::test_parse_spell_map -v
```

## Lua Parser Tests (`test_lua_parser.py`)

#### SpellMap Parsing (`test_parse_spell_map`)
Tests parsing of SpellMap.lua files:
- ✅ **Structure validation** - Verifies correct category structure (warrior, priest, mage)
- ✅ **Spell properties** - Validates spell name, soundFileName, spellId
- ✅ **Fade detection** - Checks hasFade property for spells requiring "down" sounds
- ✅ **Cast detection** - Validates hasCast property for spells with casting sounds
- ✅ **Multi-property spells** - Tests spells with both hasCast and hasFade

Example assertions:
```python
# Check warrior spells
warrior_spells = result['warrior']
assert len(warrior_spells) == 2

# Check specific spell properties
battle_shout = warrior_spells.get('1')
assert battle_shout['name'] == 'Battle Shout'
assert battle_shout['soundFileName'] == 'battle_shout'
assert battle_shout['hasFade'] is True
```

#### SpellAvoidMap Parsing (`test_parse_spell_avoid_map`)
Tests parsing of SpellAvoidMap.lua files:
- ✅ **Avoid types** - Validates self_avoid and enemy_avoid properties
- ✅ **Category structure** - Verifies correct organization by class
- ✅ **Single avoid types** - Tests spells with only self_avoid or enemy_avoid
- ✅ **Dual avoid types** - Tests spells with both avoid types

Example test cases:
```python
# Warrior spell with both avoid types
hamstring = warrior_spells.get('1')
assert hamstring['self_avoid'] is True
assert hamstring['enemy_avoid'] is True

# Rogue spell with only self_avoid
cheap_shot = rogue_spells.get('1')
assert cheap_shot['self_avoid'] is True
assert cheap_shot.get('enemy_avoid', False) is False
```

#### Error Handling (`test_parse_nonexistent_file`)
Tests proper error handling:
- ❌ **FileNotFoundError** - Ensures parser raises appropriate errors for missing files
- ✅ **Graceful failure** - Validates error messages are descriptive

#### Internal Functions (`test_convert_lua_table_to_dict`)
Tests internal conversion logic:
- ✅ **Lua table conversion** - Validates conversion from Lua tables to Python dictionaries
- ✅ **Data type preservation** - Ensures boolean, string, and numeric types are preserved

## Test Fixtures

### `test_spellmap.lua`
A minimal but complete SpellMap.lua file containing:
- **Warrior spells**: Battle Shout (with hasFade), Charge (basic spell)
- **Priest spells**: Mind Control (with hasCast)
- **Mage spells**: Polymorph (with both hasCast and hasFade)

### `test_spellavoidmap.lua`
A SpellAvoidMap.lua file containing:
- **Warrior spells**: Hamstring (both avoid types)
- **Rogue spells**: Cheap Shot (self_avoid only), Blind (enemy_avoid only)
- **Mage spells**: Various avoid scenarios

## Integration with Sound Verification

While the tests focus on Lua parsing, the parsed data is used by the sound verification process to:

1. **Extract spell information** from SpellMap.lua and SpellAvoidMap.lua
2. **Determine required sound files** based on spell properties:
   - Basic spells: `soundFileName.mp3`
   - Spells with hasFade: `soundFileName_down.mp3`
   - Spells with hasCast: Casting sound variations
   - Avoid spells: `enemy_avoided_soundFileName.mp3`, `you_avoided_soundFileName.mp3`
3. **Verify sound file existence** in the specified sound directory

## Adding New Tests

### For New Spell Properties

When adding support for new spell properties:

1. **Update test fixtures** with examples of the new property
2. **Add test assertions** to verify the property is parsed correctly
3. **Test both positive and negative cases**

Example:
```python
def test_new_property_parsing(self, parser, fixtures_path):
    """Test parsing of new spell property."""
    spell_map_path = fixtures_path / 'test_spellmap.lua'
    result = parser.parse_spell_map(str(spell_map_path))

    # Test spell with new property
    spell = result['warrior']['1']
    assert spell['newProperty'] is True

    # Test spell without new property
    spell2 = result['warrior']['2']
    assert spell2.get('newProperty', False) is False
```

### For New Lua File Formats

When supporting new Lua file structures:

1. **Create new test fixture** with the new format
2. **Add parsing test method** specific to the new format
3. **Verify backward compatibility** with existing formats

## Continuous Integration

The tests are designed for CI/CD integration:

- **JUnit XML output** for test result reporting
- **Fast execution** (< 10 seconds for full suite)
- **Docker-based consistency** across different environments
- **Clear pass/fail indicators** via exit codes

## Troubleshooting

### Common Issues

**ImportError when running tests locally:**
```bash
# Ensure you're in the correct directory
cd tools/verify_sounds

# Install dependencies
pip install -r requirements.txt

# Run tests
python -m pytest tests/
```

**Lua parsing errors:**
- Check that test fixtures have valid Lua syntax
- Verify that the lupa library is properly installed
- Ensure file encoding is UTF-8

**Test fixture not found:**
```bash
# Verify fixture files exist
ls tests/fixtures/

# Check file permissions
chmod 644 tests/fixtures/*.lua
```

### Debug Mode

Run tests with verbose output:
```bash
python -m pytest tests/ -v -s --tb=long
```

For debugging Lua parsing issues:
```bash
python -m pytest tests/test_lua_parser.py -v -s --capture=no
```
