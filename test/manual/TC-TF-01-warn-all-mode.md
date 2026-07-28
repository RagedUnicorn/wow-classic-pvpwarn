# TC-TF-01 — warnAll mode warns for every enemy

**Area:** Target filter | **Client:** Era | **Mandatory:** yes

## Preconditions

- A battleground or any fight with two or more hostile players present
- `/rgpvpw opt` → Options → **Warning mode** set to "Warn me as much as possible"
  (`targetFilter.mode = "warnAll"`, the default)

## Steps

1. Confirm the dropdown reads "Warn me as much as possible"
2. Target one enemy
3. Have a **different** enemy cast a tracked spell nearby, not on you
4. Clear your target entirely and repeat
5. Log out and check `PVPWarnConfiguration.targetFilter.mode`

## Expected

- Warnings fire for tracked spells regardless of who cast them and who you have targeted
- Clearing the target changes nothing — no filtering happens in this mode
- Sound, flash and detection bar all fire
- `targetFilter.mode` reads `"warnAll"`
- No Lua errors
