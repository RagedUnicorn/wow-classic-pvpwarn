# TC-PR-02 — Create, load, update and delete

**Area:** Profiles | **Client:** Era | **Mandatory:** yes

## Preconditions

- `/rgpvpw opt` → Profiles open
- At least one spell setting changed away from the default so a profile has something to hold

## Steps

1. Change a few per-spell settings, then click **Create new Profile** and name it `Alpha`
2. Change more settings, create a second profile `Beta`
3. Select `Alpha` and click **Load Profile**, confirming the dialog
4. Change one setting, then select `Alpha` and click **Update Profile**
5. Load `Beta`, then load `Alpha` again and verify the update stuck
6. Select `Beta` and click **Delete Profile**, confirming the dialog
7. Try each of the four buttons with **no** profile selected
8. Try creating a profile named `Alpha` again
9. `/reload` and re-open the panel

## Expected

- Each of create/load/update/delete raises a confirmation dialog before acting
- **Load Profile** restores the saved per-spell settings across all three spell lists
- **Update Profile** overwrites the stored profile with the live configuration
- **Delete Profile** removes it from the list and from `PVPWarnProfiles`
- With nothing selected each button prints its own `user_message_select_profile_before_*`
  error and does nothing
- A duplicate name is refused with `user_message_select_profile_already_exists`
- The list, the selection and the stored data survive `/reload`
- No Lua errors
