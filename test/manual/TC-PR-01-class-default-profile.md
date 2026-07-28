# TC-PR-01 — Class default profile seeded on first run

**Area:** Profiles | **Client:** Era | **Mandatory:** yes

## Preconditions

- A fresh SavedVariables state (carry over directly from TC-SV-01)
- Ideally a character whose class differs from the one used last release, so the per-class
  profile files rotate through coverage over time

## Steps

1. Log in on the fresh state
2. Open `/rgpvpw opt` → Profiles and read the profile list
3. Select the `Default` profile and try **Delete Profile**
4. Try **Update Profile** on it
5. Open a category panel for your own class and check which spells are pre-enabled
6. Open a category panel for a different class and compare

## Expected

- The list holds **exactly one** entry named `Default`, seeded from
  `mod.<class>Profile.GetSpellProfile(...)` for the logged-in character's class
- The pre-enabled spell selection is class-appropriate — a Warrior's default differs from a
  Mage's
- **Delete Profile** on `Default` is refused with
  `user_message_default_profile_cannot_be_deleted`
- **Update Profile** on `Default` is refused with
  `user_message_default_profile_cannot_be_modified`
- The profile carries a `version` field stamped with the current addon version
- No Lua errors
