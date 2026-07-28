# TC-DB-05 — Global disable suppresses every bar

**Area:** Detection bar | **Client:** Era | **Mandatory:** yes

## Preconditions

- A duel partner able to cast a tracked spell
- Detection bar currently enabled

## Steps

1. Uncheck **Enable detection bar** in `/rgpvpw opt` → Detection Bar
2. Run `/rgpvpw bar test`
3. Have the enemy cast a tracked spell at you
4. Walk a category panel's Spells tab and look for any per-spell detection bar control
5. Re-enable, `/reload`, and repeat step 3

## Expected

- No bars appear from either the test command or a real detection while disabled
- The sound warning and the flash still fire — only the bar channel is off
- There is **no** per-spell detection bar checkbox anywhere; the bar is a single global
  on/off (`PVPWarnConfiguration.detectionBar.enabled`) by design
- Re-enabling restores bars immediately and the setting survives `/reload`
- No Lua errors
