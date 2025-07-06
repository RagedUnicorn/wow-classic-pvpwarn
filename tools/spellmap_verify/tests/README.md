# SpellMap Verifier Test Suite

This directory contains comprehensive tests for the SpellMap verification tool.

## Structure

```
tests/
├── fixtures/           # Test fixture files (Lua spell maps)
│   ├── valid_spellmap.lua      # Valid spell map with no errors
│   ├── missing_names.lua       # Test cases for name validation
│   ├── invalid_types.lua       # Test cases for type validation
│   └── duplicate_spells.lua    # Test cases for duplicate detection
└── validators/         # Individual validator tests
    ├── test_name_validator.py      # Tests for NameValidator
    ├── test_type_validator.py      # Tests for TypeValidator
    ├── test_duplicate_validator.py # Tests for DuplicateValidator
    └── test_dynamic_properties.py  # Tests for dynamic property handling
```

## Running Tests

### Install Test Dependencies

```bash
cd tools/spellmap_verify
pip install -r requirements.txt  # This includes pytest
```

### Run All Tests with pytest

```bash
cd tools/spellmap_verify

# Run all tests
pytest

# Run with coverage report (if pytest-cov is installed)
pytest --cov=spellmap_verifier --cov-report=html

# Run tests with detailed output
pytest -vv
```

### Run Specific Test Files

```bash
# Run only name validator tests
pytest tests/validators/test_name_validator.py

# Run only type validator tests
pytest tests/validators/test_type_validator.py

# Run only duplicate validator tests
pytest tests/validators/test_duplicate_validator.py

# Run only dynamic property tests
pytest tests/validators/test_dynamic_properties.py
```

### Run Specific Test Methods

```bash
# Run a specific test class
pytest tests/validators/test_name_validator.py::TestNameValidator

# Run a specific test method
pytest tests/validators/test_name_validator.py::TestNameValidator::test_basic_name_validation

# Run tests matching a pattern
pytest -k "duplicate"
```


## pytest Features Used

- **Test Classes**: Tests are organized into classes for better structure
- **Fixtures**: Reusable test data and setup using `@pytest.fixture`
- **Parametrized Tests**: Run the same test with different inputs using `@pytest.mark.parametrize`
- **Assertions**: Simple `assert` statements for test validation
- **Test Discovery**: Automatic discovery of test files and methods

## Test Fixtures

### valid_spellmap.lua
A completely valid spell map that should pass all validations.

### missing_names.lua
Tests for NameValidator:
- Missing name property
- Empty name property
- Dynamic faction-specific names

### invalid_types.lua
Tests for TypeValidator:
- Missing type property
- Empty type property
- Invalid type string
- Invalid RGPVPW_CONSTANTS reference

### duplicate_spells.lua
Tests for DuplicateValidator:
- Same spell ID in the same category (source-level duplicate)
- Same spell ID across different categories
- Reference entries pointing to duplicates

## Adding New Tests

### 1. Add a new test method to an existing test file

```python
def test_my_new_scenario(self):
    """Test description."""
    test_entries = {
        "warrior": {
            12345: {"name": "Test Spell", "type": "SPELL_TYPE_BASE"}
        }
    }

    validator = NameValidator()
    validator.validate(test_entries)

    errors = validator.get_errors()
    assert len(errors) == 0  # or whatever you expect
```

### 2. Create a new test file

Create a new file in `tests/validators/` following the naming pattern `test_*.py`:

```python
"""
Tests for MyNewValidator using pytest.
"""

import pytest
from spellmap_verifier.validators import MyNewValidator


class TestMyNewValidator:
    """Test suite for MyNewValidator."""

    def test_basic_validation(self):
        """Test basic validation."""
        # Your test code here
        assert True
```

### 3. Use parametrized tests for multiple scenarios

```python
@pytest.mark.parametrize("input_value,expected", [
    ("valid", True),
    ("invalid", False),
    ("", False),
])
def test_validation_scenarios(input_value, expected):
    """Test various input scenarios."""
    # Your test code here
    assert result == expected
```

### 4. Use fixtures for reusable test data

```python
@pytest.fixture
def sample_spell_entries():
    """Provide sample spell entries for testing."""
    return {
        "warrior": {
            12345: {"name": "Test", "type": "SPELL_TYPE_BASE"}
        }
    }

def test_with_fixture(sample_spell_entries):
    """Test using fixture data."""
    validator = SomeValidator()
    validator.validate(sample_spell_entries)
    assert len(validator.get_errors()) == 0
```
