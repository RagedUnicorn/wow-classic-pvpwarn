# TC-CFG-03 — Enemy Avoid panel settings persist

**Area:** Spell configuration | **Client:** Era | **Mandatory:** yes

## Preconditions

- `/rgpvpw opt` open
- No test session active
- Ideally run once per class across releases — the panel renders your **own** class's spells,
  so a single character only covers one class's data

## Steps

1. Open the **Enemy Avoid** panel and confirm it lists your own class's spells
2. Toggle **Enable Sound** off for one spell and change another's **Visual Warning** color
3. `/reload` and re-open the panel
4. Have a duel partner avoid that spell and confirm the setting actually took effect
   (cross-check with TC-AV-02)
5. Log out and inspect `PVPWarnConfiguration.spellEnemyAvoidList`

## Expected

- The panel renders without a Lua error on first open
- Settings survive `/reload` **and** are honoured by the combat-log read path
- `spellEnemyAvoidList[<category>]` is keyed by **numeric spellId**, never by spell name
- No Lua errors

> This panel once wrote name-keyed entries (PW-0014). Name-keyed writes can never match the
> numeric combat-log read path, so the toggles silently did nothing, and release builds threw
> on first render. Both the numeric key check and the "setting actually takes effect" step
> above exist specifically to catch a regression of that.
