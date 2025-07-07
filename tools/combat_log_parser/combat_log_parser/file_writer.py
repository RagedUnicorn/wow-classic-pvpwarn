"""Write hit-and-miss files for spell tracking."""

from typing import Dict, List, Tuple, Any
from pathlib import Path
from datetime import datetime
from .constants import HIT_FILE_SUFFIX, MISS_FILE_SUFFIX


class FileWriter:
    """Handles writing hit-and-miss files."""

    def __init__(self, output_dir: str):
        """
        Initialize the file writer.

        Args:
            output_dir: Directory to write output files
        """
        self.output_dir = Path(output_dir)

    def write_hit_file(self, category: str, spell_map: Dict[int, Dict[str, Any]],
                      hit_data: Dict[int, Dict[str, Any]]) -> None:
        """
        Write a hit file for a category.

        Args:
            category: Category name
            spell_map: Dictionary of spell_id to spell data from SpellMap
            hit_data: Dictionary of spell_id to hit information
        """
        if not hit_data:
            return

        hit_file = self.output_dir / f"{category}{HIT_FILE_SUFFIX}"

        with open(hit_file, 'w', encoding='utf-8') as f:
            f.write(f"# {category.capitalize()} - Found Spell Examples\n\n")
            f.write(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")

            # Group hit data by base spell
            spell_groups = {}
            for rank_id in sorted(hit_data.keys()):
                # Find the base spell this rank belongs to
                base_spell_id = None
                for spell_id, spell_data in spell_map.items():
                    if rank_id in spell_data.get('allRanks', []):
                        base_spell_id = spell_id
                        break

                if base_spell_id:
                    if base_spell_id not in spell_groups:
                        spell_groups[base_spell_id] = {}
                    spell_groups[base_spell_id][rank_id] = hit_data[rank_id]

            # Write grouped spells
            for spell_id in sorted(spell_groups.keys()):
                spell_info = spell_map.get(spell_id, {})
                spell_name = spell_info.get('name', 'Unknown')
                all_ranks = spell_info.get('allRanks', [spell_id])

                f.write(f"## {spell_name} ({spell_id})\n")
                f.write(f"### All ranks: {', '.join(map(str, all_ranks))}\n\n")

                # Write each rank that was found
                for rank_id in sorted(spell_groups[spell_id].keys()):
                    events = spell_groups[spell_id][rank_id]['events']

                    if rank_id == spell_id:
                        f.write(f"#### Main rank ({rank_id})\n")
                    else:
                        f.write(f"#### Rank {rank_id}\n")

                    # Write each event and its example
                    for event, example_lines in sorted(events.items()):
                        f.write(f"- Event: {event}\n")
                        for line in example_lines:
                            f.write(f"- {line}\n")
                        f.write("\n")


    def write_miss_file(self, category: str, missing_spells: List[Tuple[int, str, List[str]]]) -> None:
        """
        Write a miss file for a category.

        Args:
            category: Category name
            missing_spells: List of (spell_id, spell_name, missing_rank_events) tuples
        """
        if not missing_spells:
            # Remove miss file if no spells are missing
            miss_file = self.output_dir / f"{category}{MISS_FILE_SUFFIX}"
            if miss_file.exists():
                miss_file.unlink()
            return

        miss_file = self.output_dir / f"{category}{MISS_FILE_SUFFIX}"

        with open(miss_file, 'w', encoding='utf-8') as f:
            f.write(f"# {category.capitalize()} - Missing Spell Examples\n\n")
            f.write(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")

            # Sort by spell ID
            for spell_id, spell_name, missing_rank_events in sorted(missing_spells):
                f.write(f"## {spell_name} ({spell_id})\n")

                # Show missing ranks and their events
                for rank_id, missing_events in sorted(missing_rank_events.items()):
                    if rank_id == spell_id:
                        f.write(f"- Main rank ({rank_id}): {', '.join(missing_events)} not found\n")
                    else:
                        f.write(f"- Rank {rank_id}: {', '.join(missing_events)} not found\n")

                f.write("\n")


    def write_all_files(self, spells_by_category: Dict[str, List[Tuple[int, Dict[str, Any]]]],
                       missing_spells: Dict[str, List[Tuple[int, str, List[str]]]],
    hit_data_by_category: Dict[str, Dict[int, Dict[str, Any]]]) -> None:
        """
        Write all hit-and-miss files.

        Args:
            self : Instance of FileWriter
            spells_by_category: All spells organized by category
            missing_spells: Missing spells by category
            hit_data_by_category: Hit data with examples by category
        """
        # Process each category
        for category in spells_by_category.keys():
            # Create spell_map for this category
            spell_map = {spell_id: spell_data for spell_id, spell_data in spells_by_category[category]}

            # Write hit file
            hit_data = hit_data_by_category.get(category, {})
            if hit_data:
                self.write_hit_file(category, spell_map, hit_data)

            # Write miss file
            category_misses = missing_spells.get(category, [])
            self.write_miss_file(category, category_misses)
