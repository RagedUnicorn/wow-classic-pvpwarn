# TC-PR-01 — Class default profile seeded on first run

**Area:** Profiles | **Client:** Era | **Mandatory:** yes

## Preconditions

- A fresh SavedVariables state (carry over directly from TC-SV-01)
- Ideally a character whose class differs from the one used last release, so the per-class
  profile files rotate through coverage over time

## Steps

1. Log in on the fresh state
2. Open `/rgpvpw opt` → Profiles and read the profile list
3. With nothing selected, check the state of **Load**, **Rename**, **Delete** and **Export**
4. Select the `Default` profile and check the state of **Load**, **Rename** and **Delete**
5. Create a second profile, select that one, and check the three buttons again; then select
   `Default` once more
6. Open a category panel for your own class and check which spells are pre-enabled
7. Open a category panel for a different class and compare

## Expected

- The list holds **exactly one** entry, drawn in gold and reading `Default (active)`, seeded
  from `mod.<class>Profile.GetSpellProfile(...)` for the logged-in character's class
- The pre-enabled spell selection is class-appropriate — a Warrior's default differs from a
  Mage's
- With nothing selected, **Load**, **Rename**, **Delete** and **Export** are greyed out;
  **Create new Profile**, **Reset to defaults** and **Import** are always enabled
- While `Default` is selected, **Rename** and **Delete** are greyed out and cannot be
  clicked; **Load** is greyed out too because `Default` is the active profile
- After creating a second profile it is the active one (its row is gold and reads
  `<name> (active)`); selecting it greys **Load** but enables **Rename** and **Delete**;
  selecting `Default` again enables **Load** and greys **Rename** / **Delete**
- The click-time refusals still stand behind the greying out — a click that does reach them
  prints `user_message_default_profile_cannot_be_deleted` /
  `user_message_default_profile_cannot_be_renamed`
- The profile carries a `version` field stamped with the current addon version, and
  `PVPWarnProfiles.activeProfile` is `"Default"`
- No Lua errors
