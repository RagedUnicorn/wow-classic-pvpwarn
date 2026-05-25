"""
Tests for OverlayOperationsValidator — wraps the Python assembler's validate() and surfaces
its errors as validator errors with optional branch labelling.
"""

from verify_spellmap.validators import OverlayOperationsValidator


def test_passes_for_valid_overlay(valid_spellmap, fixture_loader):
    overlay = fixture_loader.load_overlay_fixture("valid_overlay_sod")
    validator = OverlayOperationsValidator(branch_name="sod")
    validator.validate(valid_spellmap, overlays=[overlay])
    assert validator.get_errors() == []


def test_passes_for_empty_overlay(valid_spellmap, fixture_loader):
    overlay = fixture_loader.load_overlay_fixture("empty_overlay")
    validator = OverlayOperationsValidator(branch_name="tbc")
    validator.validate(valid_spellmap, overlays=[overlay])
    assert validator.get_errors() == []


def test_remove_of_missing_id_reports_error(valid_spellmap, fixture_loader):
    overlay = fixture_loader.load_overlay_fixture("invalid_overlay_remove_missing")
    validator = OverlayOperationsValidator(branch_name="sod")
    validator.validate(valid_spellmap, overlays=[overlay])
    errors = validator.get_errors()
    assert len(errors) == 1
    assert "[sod]" in errors[0]
    assert "warrior.remove" in errors[0]
    assert "99999" in errors[0]


def test_add_of_existing_id_reports_error(valid_spellmap, fixture_loader):
    overlay = fixture_loader.load_overlay_fixture("invalid_overlay_add_existing")
    validator = OverlayOperationsValidator(branch_name="sod")
    validator.validate(valid_spellmap, overlays=[overlay])
    errors = validator.get_errors()
    assert len(errors) == 1
    assert "warrior.add" in errors[0]
    assert "12323" in errors[0]


def test_branch_name_prefixes_each_error(valid_spellmap, fixture_loader):
    overlay = fixture_loader.load_overlay_fixture("invalid_overlay_remove_missing")
    validator = OverlayOperationsValidator(branch_name="tbc")
    validator.validate(valid_spellmap, overlays=[overlay])
    assert all(err.startswith("[tbc]") for err in validator.get_errors())


def test_no_branch_name_means_no_prefix(valid_spellmap, fixture_loader):
    overlay = fixture_loader.load_overlay_fixture("invalid_overlay_remove_missing")
    validator = OverlayOperationsValidator()
    validator.validate(valid_spellmap, overlays=[overlay])
    errors = validator.get_errors()
    assert errors
    assert not any(err.startswith("[") for err in errors)


def test_validator_name_includes_branch():
    validator = OverlayOperationsValidator(branch_name="sod")
    assert "sod" in validator.get_name()

    validator_unbranded = OverlayOperationsValidator()
    assert validator_unbranded.get_name() == "OverlayOperationsValidator"
