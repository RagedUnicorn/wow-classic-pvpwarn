# verify_spellmap Testing Guide

This document describes how to run and understand the tests for the SpellMap verification tool.

## Test Structure

The test suite is organized into several categories:

```
tests/
├── conftest.py                   # Shared test configuration and fixtures
├── fixtures/                     # Test data files
│   ├── valid_spellmap.lua        # Valid SpellMap for testing
│   ├── duplicate_spells.lua      # SpellMap with duplicate spell IDs
│   ├── invalid_*.lua             # Various invalid SpellMap files
│   └── ...
└── validators/                   # Unit tests for each validator
    ├── test_name_validator.py    # Tests for name validation
    ├── test_type_validator.py    # Tests for type validation
    ├── test_duplicate_validator.py
    └── ...
```

## Running Tests

### Using Docker (Recommended)

Run all tests with coverage reporting:

```bash
docker compose -f docker-compose.test.yml run --rm verify-spellmap-tests
```

This will:
- Install all dependencies automatically
- Run the complete test suite
- Generate coverage reports
- Output JUnit XML for CI/CD integration

Results will be saved to:
- `./target/test_results/verify_spellmap/junit.xml` - JUnit test results
- `./target/test_results/verify_spellmap/coverage.xml` - Coverage XML report
- `./target/test_results/verify_spellmap/coverage_html/` - HTML coverage report

### Using Local Python Environment

If you have Python and the requirements installed locally:

```bash
cd tools/verify_spellmap

# Install dependencies
pip install -r requirements.txt

# Run all tests
python -m pytest tests/ --verbose

# Run with coverage
python -m pytest tests/ --cov=verify_spellmap --cov-report=html

# Run specific test file
python -m pytest tests/validators/test_name_validator.py -v

# Run specific test method
python -m pytest tests/validators/test_name_validator.py::TestNameValidator::test_valid_names -v
```

## Validator Tests (`tests/validators/`)

Each validator has its own test file that verifies:

#### Name Properties (`test_name_validator.py`)
- ✅ Valid spell names are accepted
- ❌ Missing names are detected
- ❌ Empty names are detected
- ✅ Dynamic properties (faction-specific names) are handled

#### Type Validation (`test_type_validator.py`)
- ✅ Valid spell types (SPELL_TYPE_BASE, SPELL_TYPE_SOD, etc.)
- ❌ Invalid spell types are detected
- ❌ Missing type properties are detected

#### Duplicate Detection (`test_duplicate_validator.py`)
- ❌ Duplicate spell IDs within categories are detected
- ✅ Same spell ID in different categories is allowed
- ✅ Unique spell IDs pass validation

#### Sound File Names (`test_sound_file_name_validator.py`)
- ✅ Valid sound file names are accepted
- ❌ Missing soundFileName properties are detected
- ❌ Empty sound file names are detected

#### Spell Icons (`test_spell_icon_validator.py`)
- ✅ Valid spell icons are accepted
- ❌ Missing spellIcon properties are detected
- ❌ Empty spell icons are detected

#### All Ranks Validation (`test_all_ranks_validator.py`)
- ✅ Valid integer arrays for allRanks
- ❌ Non-array allRanks values are detected
- ❌ Non-integer values in allRanks arrays are detected

#### Tracked Events (`test_tracked_events_validator.py`)
- ✅ Valid event arrays (SPELL_AURA_APPLIED, etc.)
- ❌ Invalid event types are detected
- ❌ Missing trackedEvents are detected

#### Active Property (`test_active_validator.py`)
- ✅ Boolean active properties are accepted
- ❌ Non-boolean active values are detected

#### Fade Properties (`test_has_fade_validator.py`)
- ✅ Boolean hasFade properties are accepted
- ❌ Non-boolean hasFade values are detected
- ✅ Consistency with trackedEvents is verified

#### Cast Properties (`test_has_cast_validator.py`)
- ✅ Boolean hasCast properties are accepted
- ❌ Non-boolean hasCast values are detected

## Test Fixtures

Test fixtures are Lua files that represent different scenarios:

- **`valid_spellmap.lua`** - A complete, valid SpellMap for positive testing
- **`duplicate_spells.lua`** - Contains duplicate spell IDs to test detection
- **`invalid_names.lua`** - Contains spells with missing/invalid names
- **`invalid_types.lua`** - Contains spells with invalid types
- **And more...**

## Coverage Reporting

The test suite includes comprehensive coverage reporting:

```bash
# Generate HTML coverage report
python -m pytest tests/ --cov=verify_spellmap --cov-report=html

# View coverage report
open htmlcov/index.html  # macOS
xdg-open htmlcov/index.html  # Linux
start htmlcov/index.html  # Windows
```

Target coverage: **90%+** for all modules

## Adding New Tests

### For a New Validator

1. Create test file: `tests/validators/test_new_validator.py`
2. Import the validator and base test class
3. Create test cases for valid and invalid scenarios
4. Add test fixtures if needed

Example:

```python
import pytest
from verify_spellmap.validators.new_validator import NewValidator

class TestNewValidator:
    @pytest.fixture
    def validator(self):
        return NewValidator()

    def test_valid_case(self, validator):
        # Test valid input
        pass

    def test_invalid_case(self, validator):
        # Test invalid input
        pass
```

### For New Test Fixtures

1. Create Lua file in `tests/fixtures/`
2. Follow SpellMap.lua structure
3. Include both valid and invalid examples as needed
4. Document the purpose in the file header

## Continuous Integration

The tests are designed to work with CI/CD systems:

- **JUnit XML output** for test result integration
- **Coverage XML output** for coverage tracking
- **Exit codes** indicate pass/fail status
- **Docker-based execution** ensures consistent environment

## Troubleshooting

### Common Issues

**ImportError when running tests locally:**

```bash
# Make sure you're in the correct directory
cd tools/verify_spellmap

# Install in development mode
pip install -e .
```

**Tests pass locally but fail in Docker:**
- Check file permissions (especially on Windows)
- Verify paths in docker-compose.test.yml are correct

**Coverage reporting not working:**

```bash
# Install coverage dependencies
pip install pytest-cov

# Run with explicit coverage settings
python -m pytest --cov=verify_spellmap --cov-config=.coveragerc
```

### Debug Mode

Run tests with more verbose output:

```bash
python -m pytest tests/ -v -s --tb=long
```

For even more detail:

```bash
python -m pytest tests/ -vvv -s --tb=long --capture=no
```
