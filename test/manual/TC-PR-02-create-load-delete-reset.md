# TC-PR-02 — Create, load, rename, delete and reset to defaults

**Area:** Profiles | **Client:** Era | **Mandatory:** yes

## Preconditions

- `/rgpvpw opt` → Profiles open
- At least one spell setting changed away from the default so a profile has something to hold

## Steps

1. Change a few per-spell settings, then click **Create new Profile** and name it `Alpha`
2. Change more settings, create a second profile `Beta`
3. Change one more setting while `Beta` is active, then select `Alpha` and click **Load**,
   confirming the dialog
4. Open a category panel and check the live settings; then load `Beta` again and check that
   the setting changed in step 3 is still there
5. Select `Alpha`, click **Rename**, and rename it to `Gamma`; try renaming it to `Beta` and
   to `Default`
6. Select `Gamma` (not active) and click **Delete**, confirming the dialog
7. Select `Beta` (the active profile) and click **Delete**, reading the dialog before confirming
8. Change a setting, click **Reset to defaults**, confirm, and check the category panel
9. Try **Load**, **Rename**, **Delete** and **Export** with **no** profile selected
10. Try creating a profile with a name that is already taken
11. `/reload` and re-open the panel

## Expected

- Each of load / delete / reset raises a Yes / No confirmation dialog before acting; create and
  rename raise a name prompt
- **Create new Profile** stores the live settings under the new name and makes it the active
  profile — exactly one row is gold and reads `<name> (active)` at any time, while the
  translucent gold selection box stays on whatever row was clicked last
- **Load** restores the saved per-spell settings across all three spell lists and makes the
  loaded profile active; the profile that was active keeps every edit made while it was active
  (step 4: the step-3 setting survived the round trip through `Alpha`) — nothing is lost either
  way. Loading the active profile is greyed out
- **Rename** prefills the current name, renames in place (same list position) and re-selects
  the row under the new name; a taken name and the `Default` name are refused with a message
  and the prompt stays open. Renaming the active profile keeps it active
- **Delete** of a non-active profile removes it from the list and from `PVPWarnProfiles`
  without touching the live settings
- **Delete** of the active profile shows the dialog that says `Default` takes over; on Yes
  the profile goes, `Default` becomes the active (gold) row and its stored settings are live
- **Reset to defaults** confirms, then the live settings and the active profile's stored copy
  both equal the class defaults; the active profile stays the same
- With nothing selected the four selection-bound buttons are greyed out; a click that reaches
  a handler prints its own `user_message_select_profile_before_*` error and does nothing
- A duplicate name is refused with `user_message_select_profile_already_exists` and the prompt
  stays open
- The list, the active profile, the selection-independent state and the stored data survive
  `/reload`; after the reload the active profile's stored lists equal the live lists
- No Lua errors
