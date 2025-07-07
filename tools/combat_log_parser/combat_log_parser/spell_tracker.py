"""Track found and missing spells from combat logs."""

from typing import Dict, List, Tuple, Set, Any
from pathlib import Path


class SpellTracker:
    """Tracks which spells have been found in combat logs."""

    def __init__(self, output_dir: str):
        """
        Initialize the spell tracker.

        Args:
            output_dir: Directory to read/write hit-and-miss files
        """
        self.output_dir = Path(output_dir)
        self.found_spells: Dict[str, Set[Tuple[int, str]]] = {}
        self.missing_spells: Dict[str, List[Tuple[int, str, List[str]]]] = {}

    def load_existing_hits(self) -> None:
        """Load existing hit files to track already found spells."""
        for category in self._get_all_categories():
            hit_file = self.output_dir / f"{category}.hit.md"
            if hit_file.exists():
                self._parse_hit_file(hit_file, category)

    def _get_all_categories(self) -> List[str]:
        """Get all category names from existing files."""
        categories = set()

        # Look for .hit.md and .miss.md files
        for file in self.output_dir.glob("*.hit.md"):
            category = file.stem.replace(".hit", "")
            categories.add(category)

        for file in self.output_dir.glob("*.miss.md"):
            category = file.stem.replace(".miss", "")
            categories.add(category)

        return sorted(list(categories))

    def _parse_hit_file(self, hit_file: Path, category: str) -> None:
        """Parse a hit file to extract found spells."""
        if category not in self.found_spells:
            self.found_spells[category] = set()

        with open(hit_file, 'r', encoding='utf-8') as f:
            content = f.read()

        # Parse markdown sections for spell IDs and events
        lines = content.split('\n')
        current_rank_id = None

        for line in lines:
            # Look for rank headers like "#### Main rank (23922)" or "#### Rank 12345"
            if line.startswith('#### '):
                try:
                    # Extract rank ID from header
                    if '(' in line:
                        rank_id_str = line.split('(')[-1].rstrip(')')
                    else:
                        rank_id_str = line.split()[-1]
                    current_rank_id = int(rank_id_str)
                except (ValueError, IndexError):
                    current_rank_id = None

            # Look for event lines like "- Event: SPELL_CAST_SUCCESS"
            elif line.startswith('- Event: ') and current_rank_id:
                event = line.replace('- Event: ', '').strip()
                self.found_spells[category].add((current_rank_id, event))

    def process_spells(self,
                      spells_by_category: Dict[str, List[Tuple[int, Dict[str, Any]]]],
                      combat_log_events: Dict[Tuple[int, str], List[str]]) -> None:
        """
        Process spells against combat log events to find hits and misses.

        Args:
            spells_by_category: Spells organized by category from SpellMap
            combat_log_events: Events found in combat logs
        """
        for category, spells in spells_by_category.items():
            if category not in self.found_spells:
                self.found_spells[category] = set()
            if category not in self.missing_spells:
                self.missing_spells[category] = []

            for spell_id, spell_data in spells:
                spell_name = spell_data.get('name', 'Unknown')
                tracked_events = spell_data.get('trackedEvents', [])
                all_ranks = spell_data.get('allRanks', [spell_id])

                # For each rank of this spell
                missing_rank_events = {}
                for rank_id in all_ranks:
                    # Check each tracked event for this rank
                    missing_events = []
                    for event in tracked_events:
                        key = (rank_id, event)

                        # Skip if already found in previous runs
                        if key in self.found_spells[category]:
                            continue

                        # Check if found in current combat logs
                        if key in combat_log_events:
                            self.found_spells[category].add(key)
                        else:
                            missing_events.append(event)

                    # Track missing events for this rank
                    if missing_events:
                        missing_rank_events[rank_id] = missing_events

                # If any rank/events are missing, track this spell as incomplete
                if missing_rank_events:
                    self.missing_spells[category].append((spell_id, spell_name, missing_rank_events))

    def get_statistics(self) -> Dict[str, Any]:
        """Get statistics about found and missing spells."""
        stats = {
            'categories': {},
            'total_complete': 0,
            'total_partial': 0,
            'total_missing': 0
        }

        all_categories = set(self.found_spells.keys()) | set(self.missing_spells.keys())

        for category in all_categories:
            found = self.found_spells.get(category, set())
            missing = self.missing_spells.get(category, [])

            # Count unique spell IDs
            found_spell_ids = {spell_id for spell_id, event in found}
            missing_spell_ids = {spell_id for spell_id, name, events in missing}

            # Spells can be both found and missing (partial)
            complete_spells = found_spell_ids - missing_spell_ids
            partial_spells = found_spell_ids & missing_spell_ids
            never_found = missing_spell_ids - found_spell_ids

            stats['categories'][category] = {
                'complete': len(complete_spells),
                'partial': len(partial_spells),
                'missing': len(never_found),
                'total': len(found_spell_ids | missing_spell_ids)
            }

            stats['total_complete'] += len(complete_spells)
            stats['total_partial'] += len(partial_spells)
            stats['total_missing'] += len(never_found)

        return stats

    def get_hit_data(self, category: str, combat_log_events: Dict[Tuple[int, str], List[str]]) -> Dict[int, Dict[str, Any]]:
        """
        Get hit data for a category including examples from combat logs.

        Args:
            category: Category name
            combat_log_events: Combat log events with examples

        Returns:
            Dictionary of rank_id to spell hit data (includes all ranks, not just base spells)
        """
        hit_data = {}

        for rank_id, event in self.found_spells.get(category, set()):
            if rank_id not in hit_data:
                hit_data[rank_id] = {
                    'events': {}
                }

            # Get example from combat log
            key = (rank_id, event)
            if key in combat_log_events:
                hit_data[rank_id]['events'][event] = combat_log_events[key]
            else:
                # Use placeholder if no example (shouldn't happen)
                hit_data[rank_id]['events'][event] = [
                    "Found in: previous run",
                    "Example: (no example available)"
                ]

        return hit_data
