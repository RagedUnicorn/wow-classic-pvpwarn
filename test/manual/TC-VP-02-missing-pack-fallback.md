# TC-VP-02 — Missing voice pack falls back to default

**Area:** Voice packs | **Client:** Era | **Mandatory:** yes

## Preconditions

- A voice pack addon installed, selected and working (TC-VP-01)
- Client fully logged out for the disable step

## Steps

1. With the pack selected, log out
2. Disable the voice pack addon in the character-select AddOns list, leaving PVPWarn enabled
3. Log back in and watch for errors on login
4. Have a duel partner cast a tracked spell and listen
5. Open `/rgpvpw opt` → Voice Packs and inspect the dropdown
6. Re-enable the pack addon, log back in, and confirm it is selected again

## Expected

- Login produces **no** Lua error despite `activeVoicePack` naming an addon that is not
  loaded
- Warnings fall back to the built-in default sounds and stay audible — the addon does not go
  silent
- The dropdown no longer offers the missing pack
- Re-enabling the addon restores it; the stored `activeVoicePack` value was never clobbered
  by the fallback
- No Lua errors
