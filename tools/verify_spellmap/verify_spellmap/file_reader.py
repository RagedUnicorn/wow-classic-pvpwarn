"""
File reading functionality for SpellMap verification.
"""

import sys
from pathlib import Path
from typing import Optional


class SpellMapFileReader:
    """Handles reading the SpellMap.lua file."""

    def __init__(self, file_path: str):
        """
        Initialize the file reader.

        Args:
            file_path: Path to the SpellMap.lua file
        """
        self.file_path = Path(file_path)

    def read(self) -> str:
        """
        Read the SpellMap.lua file.

        Returns:
            The content of the file as a string

        Raises:
            SystemExit: If the file cannot be read
        """
        try:
            with open(self.file_path, 'r', encoding='utf-8') as f:
                return f.read()
        except FileNotFoundError:
            print(f"Error: File not found: {self.file_path}")
            sys.exit(1)
        except Exception as e:
            print(f"Error reading file: {e}")
            sys.exit(1)

    def exists(self) -> bool:
        """Check if the file exists."""
        return self.file_path.exists()

    def get_path(self) -> Path:
        """Get the file path."""
        return self.file_path
