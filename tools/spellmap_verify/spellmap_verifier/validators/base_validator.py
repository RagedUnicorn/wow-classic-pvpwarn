"""
Base validator class for spell map validation.
"""

from abc import ABC, abstractmethod
from typing import Dict, List, Any


class BaseValidator(ABC):
    """Abstract base class for all validators."""

    def __init__(self):
        """Initialize the validator."""
        self.errors: List[str] = []

    @abstractmethod
    def validate(self, spell_entries: Dict[str, Dict[int, Dict]],
                 content: str = None, **kwargs) -> None:
        """
        Perform validation on spell entries.

        Args:
            spell_entries: Dictionary of spell entries organized by category
            content: Optional raw file content for source-level validation
            **kwargs: Additional arguments specific to each validator
        """
        pass

    @abstractmethod
    def get_name(self) -> str:
        """Get the name of this validator for reporting."""
        pass

    def add_error(self, message: str) -> None:
        """Add an error message."""
        self.errors.append(message)


    def get_errors(self) -> List[str]:
        """Get all error messages."""
        return self.errors.copy()


    def has_errors(self) -> bool:
        """Check if there are any errors."""
        return len(self.errors) > 0


    def reset(self) -> None:
        """Reset the validator state."""
        self.errors.clear()
