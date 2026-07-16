"""
Directory-level loading of the SpellMap / SpellAvoidMap base + overlay layout.

The sibling tools (combat_log_parser, verify_sounds, voice_generator) all consume a
cross-branch *union* view of a map: Base.lua plus every overlay's add / replace /
appendRanks ops, with `remove` skipped so Classic content stays visible even when a
branch overlay drops it (a combat-log replay, sound check or voice generation must
cover every branch's spells at once). This module owns that view so there is exactly
one Lua loading implementation across tools/ — export_spellmap reuses LuaParser and
the per-branch assembler directly for its branch-accurate views.
"""

from pathlib import Path
from typing import Dict, List, Optional

from . import assembler
from .lua_parser import LuaParser

OVERLAY_FILE_NAMES = ("Sod.lua", "Tbc.lua")


def load_union_map(map_dir, is_avoid_map: bool = False) -> Dict[str, Dict[int, Dict]]:
    """Load Base.lua + overlay/*.lua from ``map_dir`` and return the union view.

    Args:
        map_dir: Path to code/spellmap or code/spellavoidmap (containing Base.lua
            and overlay/).
        is_avoid_map: True when the directory holds a SpellAvoidMap
            (``local spellAvoidMap = {...}`` in Base.lua) instead of a SpellMap.

    Returns:
        ``{category: {spellId: entry}}`` with every entry across all branches.

    Raises:
        FileNotFoundError: If ``map_dir`` or its Base.lua does not exist.
    """
    map_dir = Path(map_dir)
    if not map_dir.is_dir():
        raise FileNotFoundError(f"SpellMap directory not found: {map_dir}")

    base_path = map_dir / "Base.lua"
    if not base_path.exists():
        raise FileNotFoundError(f"Base.lua not found in: {map_dir}")

    parser = LuaParser()
    parser.setup_environment()

    base_content = base_path.read_text(encoding="utf-8")
    if is_avoid_map:
        base = parser.parse_spell_avoid_map(base_content)
    else:
        base = parser.parse_spellmap(base_content)

    overlays = []
    for overlay_name in OVERLAY_FILE_NAMES:
        overlay_path = map_dir / "overlay" / overlay_name
        if overlay_path.exists():
            overlays.append(parser.parse_overlay(overlay_path.read_text(encoding="utf-8")))

    return union_apply(base, overlays)


def union_apply(base: Dict[str, Dict[int, Dict]],
                overlays: Optional[List[Dict[str, Dict]]]) -> Dict[str, Dict[int, Dict]]:
    """Build the union view of a base map and any number of branch overlays.

    Applies every overlay's add, replace and appendRanks ops while skipping remove,
    so entries dropped by one branch stay visible. Delegates the op semantics to
    assembler.apply — base and overlays are not mutated.
    """
    stripped = [
        {
            category: {op: payload for op, payload in ops.items() if op != "remove"}
            for category, ops in overlay.items()
        }
        for overlay in overlays or []
    ]
    return assembler.apply(base, stripped)
