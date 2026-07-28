# TC-CFG-02 — Self-Avoid tab settings persist

**Area:** Spell configuration | **Client:** Era | **Mandatory:** yes

## Preconditions

- `/rgpvpw opt` open
- No test session active

## Steps

1. Open a category panel and select the **Avoid** tab
2. Confirm the list differs from the Spells tab — it holds the spells you can avoid, not all
   tracked spells
3. Toggle **Enable Sound** off for one entry
4. Change one entry's **Visual Warning** color
5. Switch back to the **Spells** tab and back again
6. `/reload` and re-open
7. Log out and inspect `PVPWarnConfiguration.spellSelfAvoidList`

## Expected

- The tab switch renders the correct list each time, with no rows bleeding across from the
  other tab
- Toggles and the color survive the tab switch and `/reload`
- `spellSelfAvoidList[<category>]` is keyed by **numeric spellId**
- The Spells tab settings for the same spell are independent — changing the Avoid tab does
  not alter them
- No Lua errors
