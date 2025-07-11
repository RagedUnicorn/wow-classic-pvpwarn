"""
Sound file verification logic.
"""

import os
from pathlib import Path
from typing import Dict, List, Tuple, Set

from .constants import (
    FADE_SUFFIX,
    CAST_SUFFIX,
    SELF_AVOID_PREFIX,
    ENEMY_AVOID_PREFIX,
    SELF_AVOID_FOLDER,
    ENEMY_AVOID_FOLDER
)


class SoundVerifier:
    """Verifies that all required sound files exist."""

    def __init__(self, sound_path: str, file_extension: str = '.mp3'):
        """
        Initialize the sound verifier.

        Args:
            sound_path: Path to the sound files directory
            file_extension: Expected file extension for sound files
        """
        self.sound_path = Path(sound_path)
        self.file_extension = file_extension

        if not self.sound_path.exists():
            raise ValueError(f"Sound path does not exist: {sound_path}")

    def verify_all(self, spell_map_data: Dict, spell_avoid_map_data: Dict) -> Dict:
        """
        Verify all sound files for both spell maps.

        Args:
            spell_map_data: Parsed data from SpellMap.lua
            spell_avoid_map_data: Parsed data from SpellAvoidMap.lua

        Returns:
            Dictionary with verification results
        """
        results = {
            'required_files': [],
            'missing_files': [],
            'found_files': [],
            'spell_map_stats': {
                'total_spells': 0,
                'spells_with_fade': 0,
                'spells_with_cast': 0
            },
            'spell_avoid_map_stats': {
                'total_spells': 0,
                'self_avoid_spells': 0,
                'enemy_avoid_spells': 0
            }
        }

        # Verify SpellMap
        self._verify_spell_map(spell_map_data, results)

        # Verify SpellAvoidMap
        self._verify_spell_avoid_map(spell_avoid_map_data, results)

        return results

    def _verify_spell_map(self, spell_map_data: Dict, results: Dict):
        """Verify sound files for SpellMap entries."""
        for category, spells in spell_map_data.items():
            for spell_id, spell_data in spells.items():
                results['spell_map_stats']['total_spells'] += 1

                sound_file_name = spell_data['soundFileName']
                base_path = self.sound_path / category

                # Base sound file
                required_file = base_path / f"{sound_file_name}{self.file_extension}"
                self._check_file(required_file, results)

                # Fade sound
                if spell_data.get('hasFade', False):
                    results['spell_map_stats']['spells_with_fade'] += 1
                    fade_file = base_path / f"{sound_file_name}{FADE_SUFFIX}{self.file_extension}"
                    self._check_file(fade_file, results)

                # Cast sound
                if spell_data.get('hasCast', False):
                    results['spell_map_stats']['spells_with_cast'] += 1
                    cast_file = base_path / f"{sound_file_name}{CAST_SUFFIX}{self.file_extension}"
                    self._check_file(cast_file, results)

    def _verify_spell_avoid_map(self, spell_avoid_map_data: Dict, results: Dict):
        """Verify sound files for SpellAvoidMap entries."""
        for category, spells in spell_avoid_map_data.items():
            for spell_id, spell_data in spells.items():
                results['spell_avoid_map_stats']['total_spells'] += 1

                sound_file_name = spell_data['soundFileName']
                base_path = self.sound_path / category

                # Self avoid sound
                if spell_data.get('self_avoid', False):
                    results['spell_avoid_map_stats']['self_avoid_spells'] += 1
                    self_avoid_file = base_path / SELF_AVOID_FOLDER / f"{SELF_AVOID_PREFIX}{sound_file_name}{self.file_extension}"
                    self._check_file(self_avoid_file, results)

                # Enemy avoid sound
                if spell_data.get('enemy_avoid', False):
                    results['spell_avoid_map_stats']['enemy_avoid_spells'] += 1
                    enemy_avoid_file = base_path / ENEMY_AVOID_FOLDER / f"{ENEMY_AVOID_PREFIX}{sound_file_name}{self.file_extension}"
                    self._check_file(enemy_avoid_file, results)

    def _check_file(self, file_path: Path, results: Dict):
        """
        Check if a file exists and update results.

        Args:
            file_path: Path to check
            results: Results dictionary to update
        """
        # Store relative path for cleaner output
        relative_path = file_path.relative_to(self.sound_path)
        results['required_files'].append(str(relative_path))

        if file_path.exists():
            results['found_files'].append(str(relative_path))
        else:
            results['missing_files'].append(str(relative_path))
