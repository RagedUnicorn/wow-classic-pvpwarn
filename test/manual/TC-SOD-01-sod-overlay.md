# TC-SOD-01 — SoD overlay spells warn correctly

**Area:** Season of Discovery | **Client:** Era (SoD) | **Mandatory:** conditional

> Run only if a Season of Discovery character is available, or if SoD-related code
> (`code/Season.lua`, `code/spellmap/overlay/Sod.lua`, `code/spellavoidmap/overlay/Sod.lua`)
> was touched since the last release.

## Preconditions

- A character on a Season of Discovery realm
- A duel partner able to cast a rune-granted or otherwise SoD-only spell
- At least one spell known to be added or re-keyed by the SoD overlay

## Steps

1. Log in on the SoD character and open a category panel
2. Look for a spell that exists only in the SoD overlay and confirm it is listed
3. Have the duel partner cast it and listen for the warning
4. Have them cast a spell that the SoD overlay **removes** from the base map
5. Log in on a non-SoD Classic Era character and re-check both spells in the panel

## Expected

- The branch resolves to `sod` via `C_Seasons`, so the assembled map is base + the SoD
  overlay
- Overlay-added spells appear in the panels and warn correctly
- Overlay-removed spells are absent from the panels and do not warn
- The non-SoD character sees the **plain Classic Era** catalog — the two branches memoize
  separately and do not leak into each other
- No overlay validation errors are logged on login (a bad op is LogError'd and skipped)
- No Lua errors
