# TC-PR-06 — Macro profile load bridge

**Area:** Profiles | **Client:** Era | **Mandatory:** yes

## Preconditions

- Two profiles with recognisably different settings, e.g. `Alpha` and `Beta` (TC-PR-02)

## Steps

1. Run `/run _G["RGPVPW_MACRO_LOADPROFILE"]("Alpha")`
2. Open a category panel and confirm `Alpha`'s settings are live
3. Run the same with `"Beta"` and re-check
4. Run it with a profile name that does not exist
5. Run it with no argument at all
6. Put the call in a real macro button and click it
7. `/reload` and confirm the last loaded profile is still active

## Expected

- The macro loads the named profile and the panels reflect it without a reload
- The loaded configuration is identical to what **Load Profile** produces from the UI
- A non-existent name fails gracefully with a user-visible message, not a Lua error
- A missing argument also fails gracefully
- The call works from a macro button, which is its actual purpose
- The loaded state persists across `/reload`
- No Lua errors
