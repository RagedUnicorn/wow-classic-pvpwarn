"""File management utilities for organizing voice files."""

import os
from typing import Dict, Optional, Set
from .constants import OUTPUT_RELATIVE_PATH


class FileManager:
    """Manages voice file organization."""

    def __init__(self, output_path: Optional[str] = None):
        """Initialize the file manager.

        Args:
            output_path: Custom output path, defaults to OUTPUT_RELATIVE_PATH
        """
        if output_path is None:
            # Get the tool's root directory (parent of the module directory)
            module_dir = os.path.dirname(os.path.abspath(__file__))
            tool_root = os.path.dirname(module_dir)
            output_path = os.path.normpath(
                os.path.join(tool_root, OUTPUT_RELATIVE_PATH)
            )

        self.output_path = output_path

    def ensure_output_directory(self) -> None:
        """Ensure the output directory exists."""
        os.makedirs(self.output_path, exist_ok=True)

    def ensure_category_directory(self, category: str, subcategory: Optional[str] = None) -> None:
        """Ensure a category subdirectory exists.

        Args:
            category: Category name for the subdirectory
            subcategory: Optional subcategory for further organization
        """
        if subcategory:
            category_path = os.path.join(self.output_path, category, subcategory)
        else:
            category_path = os.path.join(self.output_path, category)
        os.makedirs(category_path, exist_ok=True)

    def get_output_file_path(self, sound_file_name: str, category: Optional[str] = None, subcategory: Optional[str] = None) -> str:
        """Get the full output path for a sound file.

        Args:
            sound_file_name: Base name of the sound file (without extension)
            category: Optional category for organizing into subdirectories
            subcategory: Optional subcategory for further organization (e.g., 'enemy_avoid', 'self_avoid')

        Returns:
            Full path to the output file
        """
        # Add .mp3 extension if not present
        if not sound_file_name.endswith('.mp3'):
            sound_file_name += '.mp3'

        if category and subcategory:
            return os.path.join(self.output_path, category, subcategory, sound_file_name)
        elif category:
            return os.path.join(self.output_path, category, sound_file_name)
        else:
            return os.path.join(self.output_path, sound_file_name)

    def file_exists(self, sound_file_name: str, category: Optional[str] = None, subcategory: Optional[str] = None) -> bool:
        """Check if a file exists in the output directory.

        Args:
            sound_file_name: Base name of the sound file
            category: Optional category for checking in subdirectories
            subcategory: Optional subcategory for further organization

        Returns:
            True if file exists in output directory
        """
        output_path = self.get_output_file_path(sound_file_name, category, subcategory)
        return os.path.exists(output_path)

    def list_existing_files(self) -> Dict[str, Dict[str, Set[str]]]:
        """List all existing voice files in the output directory organized by category and subcategory.

        Returns:
            Dictionary mapping category names to dictionaries of subcategories and their file sets
            Format: {category: {subcategory: set(files), '': set(files_in_category_root)}}
        """
        existing_files = {}

        if os.path.exists(self.output_path):
            # Check files in root directory (uncategorized)
            uncategorized = set()
            for file_name in os.listdir(self.output_path):
                file_path = os.path.join(self.output_path, file_name)
                if os.path.isfile(file_path) and file_name.endswith('.mp3'):
                    # Remove extension
                    base_name = os.path.splitext(file_name)[0]
                    uncategorized.add(base_name)

            if uncategorized:
                existing_files[''] = {'': uncategorized}

            # Check subdirectories for categorized files
            for category_name in os.listdir(self.output_path):
                category_path = os.path.join(self.output_path, category_name)
                if os.path.isdir(category_path):
                    category_data = {}

                    # Check files directly in category directory
                    category_root_files = set()
                    for item in os.listdir(category_path):
                        item_path = os.path.join(category_path, item)
                        if os.path.isfile(item_path) and item.endswith('.mp3'):
                            # Remove extension
                            base_name = os.path.splitext(item)[0]
                            category_root_files.add(base_name)

                    if category_root_files:
                        category_data[''] = category_root_files

                    # Check subcategories
                    for subcategory_name in os.listdir(category_path):
                        subcategory_path = os.path.join(category_path, subcategory_name)
                        if os.path.isdir(subcategory_path):
                            subcategory_files = set()
                            for file_name in os.listdir(subcategory_path):
                                if file_name.endswith('.mp3'):
                                    # Remove extension
                                    base_name = os.path.splitext(file_name)[0]
                                    subcategory_files.add(base_name)

                            if subcategory_files:
                                category_data[subcategory_name] = subcategory_files

                    if category_data:
                        existing_files[category_name] = category_data

        return existing_files

    def clean_output_directory(self) -> int:
        """Remove all files from the output directory including subdirectories.

        Returns:
            Number of files removed
        """
        if not os.path.exists(self.output_path):
            return 0

        count = 0

        # Remove files in root directory
        for file_name in os.listdir(self.output_path):
            file_path = os.path.join(self.output_path, file_name)
            if os.path.isfile(file_path) and file_name.endswith('.mp3'):
                try:
                    os.remove(file_path)
                    count += 1
                except Exception as e:
                    print(f"Failed to remove {file_name}: {e}")

        # Remove files in subdirectories
        for category_name in os.listdir(self.output_path):
            category_path = os.path.join(self.output_path, category_name)
            if os.path.isdir(category_path):
                # Remove files directly in category directory
                for item in os.listdir(category_path):
                    item_path = os.path.join(category_path, item)
                    if os.path.isfile(item_path) and item.endswith('.mp3'):
                        try:
                            os.remove(item_path)
                            count += 1
                        except Exception as e:
                            print(f"Failed to remove {category_name}/{item}: {e}")
                    # Check subcategories
                    elif os.path.isdir(item_path):
                        for file_name in os.listdir(item_path):
                            if file_name.endswith('.mp3'):
                                file_path = os.path.join(item_path, file_name)
                                try:
                                    os.remove(file_path)
                                    count += 1
                                except Exception as e:
                                    print(f"Failed to remove {category_name}/{item}/{file_name}: {e}")

        return count

    def verify_file_integrity(self, sound_file_name: str, category: Optional[str] = None, subcategory: Optional[str] = None) -> bool:
        """Verify that a generated file has valid content.

        Args:
            sound_file_name: Base name of the sound file
            category: Optional category for checking in subdirectories
            subcategory: Optional subcategory for further organization

        Returns:
            True if file exists and has content
        """
        file_path = self.get_output_file_path(sound_file_name, category, subcategory)

        if not os.path.exists(file_path):
            return False

        # Check file size (should be more than just headers)
        file_size = os.path.getsize(file_path)
        return file_size > 1000  # MP3 files should be at least 1KB
