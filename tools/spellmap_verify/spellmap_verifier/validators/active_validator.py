"""
Validator for active property in SpellMap entries.
"""

from typing import Dict
from .base_validator import BaseValidator


class ActiveValidator(BaseValidator):
    """Validates that active property exists and is a boolean."""
    
    def get_name(self) -> str:
        """Return the name of this validator."""
        return "ActiveValidator"
    
    def validate(self, spell_entries: Dict[str, Dict[int, Dict]], content: str = None, **kwargs) -> None:
        """
        Validate active property for all spell entries.
        
        Args:
            spell_entries: Parsed spell entries organized by category
            content: Optional raw file content (not used by this validator)
        """
        self.reset()
        
        for category, spells in spell_entries.items():
            for spell_id, spell_data in spells.items():
                self._validate_spell_active(category, spell_id, spell_data)
    
    def _validate_spell_active(self, category: str, spell_id: int, spell_data: Dict) -> None:
        """
        Validate active property for a single spell entry.
        
        Args:
            category: The spell category
            spell_id: The spell ID
            spell_data: The spell data dictionary
        """
        # Skip reference entries
        if self._is_reference_entry(spell_data):
            return
        
        # Check if active exists
        if "active" not in spell_data:
            self.add_error(
                f"{category}[{spell_id}]: Missing 'active' property"
            )
            return
        
        active = spell_data.get("active")
        
        # Check if active is a boolean
        if not isinstance(active, bool):
            self.add_error(
                f"{category}[{spell_id}]: 'active' must be a boolean (true or false), got {type(active).__name__}"
            )
            return
        
        # Note: We don't need to validate the value itself since any boolean (True or False) is valid
    
    def _is_reference_entry(self, spell_data: Dict) -> bool:
        """
        Check if the spell entry is a reference entry.
        
        Args:
            spell_data: The spell data dictionary
            
        Returns:
            True if the entry only contains a refId, False otherwise
        """
        return len(spell_data) == 1 and "refId" in spell_data