"""
Python port of code/SpellMap/Assemble.lua (and code/SpellAvoidMap/Assemble.lua).

Mirrors mod.spellMapAssembler.Apply and Validate exactly:
  - Apply deep-copies the base map and applies each overlay's remove, then add, then replace.
  - Validate checks structural invariants (remove of missing, add of existing, replace of missing)
    against a working copy, accumulating errors instead of raising.

Keep this in sync with the Lua side. Both modules are short and the rules are the same; a drift
between them shows up immediately the next time the verifier runs in CI / locally.
"""

import copy
from typing import Dict, List, Optional


def apply(base: Dict[str, Dict[int, Dict]],
          overlays: Optional[List[Dict[str, Dict]]]) -> Dict[str, Dict[int, Dict]]:
    """Build the assembled map for a branch.

    Args:
        base: Base spell map keyed by category, then by spellId.
        overlays: Ordered list of overlay tables to apply. May be None or empty.

    Returns:
        A new dict — base is not mutated, overlays are not mutated.
    """
    result = copy.deepcopy(base)

    if not overlays:
        return result

    for overlay in overlays:
        _apply_one(result, overlay)

    return result


def _apply_one(working: Dict[str, Dict[int, Dict]], overlay: Dict[str, Dict]) -> None:
    """Apply a single overlay to ``working`` in place. Operations within a category run in the
    order remove, add, replace — matching Assemble.lua's ApplyOne."""
    for category, ops in overlay.items():
        if category not in working:
            working[category] = {}

        for spell_id in ops.get("remove") or []:
            working[category].pop(int(spell_id), None)

        for spell_id, spell_data in (ops.get("add") or {}).items():
            working[category][int(spell_id)] = copy.deepcopy(spell_data)

        for spell_id, spell_data in (ops.get("replace") or {}).items():
            working[category][int(spell_id)] = copy.deepcopy(spell_data)


def validate(base: Dict[str, Dict[int, Dict]],
             overlays: Optional[List[Dict[str, Dict]]]) -> List[str]:
    """Validate every overlay's ops against the running state. Same rules as Assemble.Validate.

    Returns:
        A list of error strings. Empty list means valid.
    """
    errors: List[str] = []

    if not overlays:
        return errors

    working = copy.deepcopy(base)

    for index, overlay in enumerate(overlays, start=1):
        for category, ops in overlay.items():
            if category not in working:
                working[category] = {}

            for spell_id in ops.get("remove") or []:
                spell_id = int(spell_id)
                if spell_id not in working[category]:
                    errors.append(
                        f"overlay #{index} {category}.remove: spellId {spell_id} not present"
                    )
                else:
                    working[category].pop(spell_id, None)

            for spell_id, spell_data in (ops.get("add") or {}).items():
                spell_id = int(spell_id)
                if spell_id in working[category]:
                    errors.append(
                        f"overlay #{index} {category}.add: spellId {spell_id} already exists"
                    )
                else:
                    working[category][spell_id] = spell_data

            for spell_id, spell_data in (ops.get("replace") or {}).items():
                spell_id = int(spell_id)
                if spell_id not in working[category]:
                    errors.append(
                        f"overlay #{index} {category}.replace: spellId {spell_id} not present"
                    )
                else:
                    working[category][spell_id] = spell_data

    return errors
