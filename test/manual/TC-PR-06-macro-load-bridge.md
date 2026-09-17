# TC-PR-06 — Macro profile load bridge

**Area:** Profiles | **Client:** Era | **Mandatory:** yes

## Preconditions

- Two profiles with recognisably different settings, e.g. `Alpha` and `Beta` (TC-PR-02)

## Steps

1. Run `/run _G["RGPVPW_MACRO_LOADPROFILE"]("Alpha")`
2. Open a category panel and confirm `Alpha`'s settings are live
3. Change one setting, then run the same with `"Beta"` and re-check
4. Run it with `"Alpha"` again and check that the setting changed in step 3 is still there
5. Run it with a profile name that does not exist
6. Run it with no argument at all
7. Run it with the name of the profile that is active already
8. Put the call in a real macro button and click it
9. Open `/rgpvpw opt` → Profiles and read the list
10. `/reload` and confirm the last loaded profile is still active

## Expected

- The macro switches to the named profile and the panels reflect it without a reload
- The switch is identical to what **Load** produces from the UI: the profile that was active
  keeps every edit made while it was active (step 4), the named one takes over and becomes
  the active profile
- A non-existent name prints `user_message_profile_not_found` in chat, not a Lua error
- A missing argument prints the same message with `nil` as the name
- Naming the active profile is a no-op — nothing changes and no error appears
- The call works from a macro button, which is its actual purpose
- The Profiles page shows the switched-to profile as the gold `(active)` row once re-opened
- The active profile persists across `/reload`
- No Lua errors
