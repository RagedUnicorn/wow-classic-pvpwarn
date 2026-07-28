# TC-TF-02 — currentTarget mode suppresses non-target events

**Area:** Target filter | **Client:** Era | **Mandatory:** yes

## Preconditions

- A battleground or any fight with **two or more** hostile players present — a single duel
  partner cannot distinguish this mode from `warnAll`
- `/rgpvpw opt` → Options → **Warning mode** set to "Warn me for my current opponent"

## Steps

1. Switch the dropdown to "Warn me for my current opponent"
2. Target enemy A and have enemy B cast a tracked spell at someone who is not you
3. Switch your target to enemy B and have B cast the same spell again
4. Have enemy A avoid one of your spells while B is targeted, then while A is targeted
5. `/reload` and confirm the mode stuck

## Expected

- Events that involve neither you nor your current target are **suppressed** on every
  channel — no sound, no flash, **no detection bar**. The filter runs in
  `ShouldWarnForTarget` before any channel fires
- Re-targeting enemy B makes B's casts warn again immediately; the filter follows
  `PLAYER_TARGET_CHANGED`, no reload needed
- Enemy-avoid events follow the same rule — only your current target's avoids announce
- `targetFilter.mode` reads `"currentTarget"` and survives `/reload`
- No Lua errors
