# TC-CFG-01 — Spells tab settings persist

**Area:** Spell configuration | **Client:** Era | **Mandatory:** yes

## Preconditions

- `/rgpvpw opt` open
- A **development** build is fine, but no test session may be active — see the note in
  TC-WA-04

## Steps

1. Open a category panel (Mage is a good pick) and select the **Spells** tab
2. Scroll the whole list to the bottom and back
3. Toggle **Enable Sound** off for one spell and on for another
4. Toggle **Enable Sound Fade** and **Enable Sound Cast** where they are offered
5. `/reload` and re-open the same panel
6. Repeat for one class panel, the **Items**, **Racials** and **Misc** panels
7. Log out and inspect `PVPWarnConfiguration.spellList`

## Expected

- Every category panel and both tabs open without a Lua error
- The scrollable list renders every spell in the category, with no blank or duplicated rows
- Each toggle takes effect immediately and survives `/reload`
- `spellList[<category>]` is keyed by **numeric spellId**, and each entry carries
  `spellActive`, `soundWarningActive` and `visualWarningColor`, plus
  `soundFadeWarningActive` / `soundStartWarningActive` only for spells declaring
  `hasFade` / `hasCast`
- Changing a setting marks the active profile as modified — the flag is no longer surfaced
  in the UI, so check `PVPWarnProfiles.modified` in the SavedVariables file (or via
  `/dump PVPWarnProfiles.modified`) rather than looking for a marker in the profile list
- No Lua errors
