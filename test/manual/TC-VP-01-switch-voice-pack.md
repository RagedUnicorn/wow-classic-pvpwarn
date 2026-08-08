# TC-VP-01 — Voice pack switching and the test button

**Area:** Voice packs | **Client:** Era | **Mandatory:** yes

## Preconditions

- At least one voice pack addon installed and enabled alongside PVPWarn
  (`PVPWarn_VoicePack_GFC`, `_NFC` or `_UMC`)
- Sound enabled in the client

## Steps

1. Open `/rgpvpw opt` → Voice Packs and open the dropdown
2. Select **Default** and click **Test Voice Pack** a few times
3. Select an installed pack and click **Test Voice Pack** a few times
4. Have a duel partner cast a tracked spell and listen to which voice announces it
5. `/reload` and confirm the selection held
6. Log out and check `PVPWarnConfiguration.activeVoicePack`
7. Disable every voice pack addon, `/reload` and open the panel again

## Expected

- The dropdown lists **Default** plus every registered voice pack addon
- **Test Voice Pack** plays a random sound from the currently selected pack, audibly
  different between Default and an installed pack
- Real warnings use the selected pack, not just the test button
- The selection persists to `activeVoicePack` (`"default"` for the built-in sounds) and
  survives `/reload`
- The gray hint naming CurseForge and Wago renders under the dropdown row, wraps inside the
  panel instead of running past its right edge, and is shown whether or not a pack is
  installed - recheck in deDE and ruRU, whose strings are the longest
- No Lua errors
