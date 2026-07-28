# TC-AV-02 — Enemy-avoid warns when an enemy avoids

**Area:** Avoid | **Client:** Era | **Mandatory:** yes

## Preconditions

- A duel partner who can avoid one of **your** spells (dodge a melee special, resist or
  immune a cast)
- The spell enabled on the **Enemy Avoid** panel — this panel lists your own class's spells,
  not the enemy's

## Steps

1. Open `/rgpvpw opt` → Enemy Avoid and note which of your spells are enabled
2. Cast or use one of them and have the enemy avoid it
3. Listen for the warning
4. Uncheck **Enable Sound** for that spell and repeat
5. `/reload` and confirm the unchecked state survived, then re-enable

## Expected

- The warning announces that the **enemy** avoided your spell
- The source is your own `SPELL_MISSED` event, so it fires even when the enemy never casts
  anything at you
- Unchecking silences it; the setting survives `/reload`
- The panel writes its settings under **numeric spellId** keys in
  `PVPWarnConfiguration.spellEnemyAvoidList[<category>]` — see TC-CFG-03, which checks this
  explicitly
- No Lua errors
