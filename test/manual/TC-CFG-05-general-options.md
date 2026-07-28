# TC-CFG-05 — General options and the warning mode dropdown

**Area:** Spell configuration | **Client:** Era | **Mandatory:** yes

## Preconditions

- `/rgpvpw opt` → Options open

## Steps

1. Toggle each of the five checkboxes in turn: Enable combatstate tracking, Lock combatstate
   frame, Enable stancestate tracking, Lock stancestate frame, Hide unknown stance
2. Open the **Warning mode** dropdown and read both entries
3. Switch to "Warn me for my current opponent", then back to "Warn me as much as possible"
4. Hover each control and read its tooltip
5. Open the root **PVPWarn** panel and read the About block
6. `/reload` and re-check every control
7. Log out and inspect the SavedVariables

## Expected

- Every checkbox reflects its stored value on panel open and writes it immediately
- The Warning mode dropdown offers exactly two entries, mapping to
  `targetFilter.mode = "warnAll"` and `"currentTarget"`
- Tooltips render for each control without error
- The About block shows the author, e-mail, the issues URL and the version read from the TOC
  metadata — the version must match the `## Version:` of the build under test
- All settings survive `/reload`
- No Lua errors
