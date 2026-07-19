"""
File reading functionality for the SpellMap / SpellAvoidMap source.
"""

import sys
from pathlib import Path


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
