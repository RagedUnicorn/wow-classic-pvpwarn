"""
Validator for hasFade property in SpellMap entries.
"""

from typing import Dict, Any
from .base_validator import BaseValidator


class HasFadeValidator(BaseValidator):
    """Validates that hasFade property exists and is a boolean."""
    
    def get_name(self) -> str:
        """Return the name of this validator."""
        return "HasFadeValidator"
    
    def validate(self, spell_entries: Dict[str, Dict[int, Dict[str, Any]]], content: str = None) -> None:
        """
        Validate hasFade property for all spell entries.
        
        Args:
            spell_entries: Parsed spell entries organized by category
            content: Optional raw file content (not used by this validator)
        """
        self.reset()
        
        for category, spells in spell_entries.items():
            for spell_id, spell_data in spells.items():
                self._validate_spell_has_fade(category, spell_id, spell_data)
    
    def _validate_spell_has_fade(self, category: str, spell_id: int, spell_data: Dict[str, Any]) -> None:
        """
        Validate hasFade property for a single spell entry.
        
        Args:
            category: The spell category
            spell_id: The spell ID
            spell_data: The spell data dictionary
        """
        # Skip reference entries
        if self._is_reference_entry(spell_data):
            return
        
        # Check if hasFade exists
        if "hasFade" not in spell_data:
            self.add_error(
                f"{category}[{spell_id}]: Missing 'hasFade' property"
            )
            return
        
        has_fade = spell_data.get("hasFade")
        
        # Check if hasFade is a boolean
        if not isinstance(has_fade, bool):
            self.add_error(
                f"{category}[{spell_id}]: 'hasFade' must be a boolean (true or false), got {type(has_fade).__name__}"
            )
            return
        
        # Note: We don't need to validate the value itself since any boolean (True or False) is valid
    
    def _is_reference_entry(self, spell_data: Dict[str, Any]) -> bool:
        """
        Check if the spell entry is a reference entry.
        
        Args:
            spell_data: The spell data dictionary
            
        Returns:
            True if the entry only contains a refId, False otherwise
        """
        return len(spell_data) == 1 and "refId" in spell_data