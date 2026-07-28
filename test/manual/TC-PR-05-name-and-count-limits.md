# TC-PR-05 — Profile name and count limits

**Area:** Profiles | **Client:** Era | **Mandatory:** yes

## Preconditions

- `/rgpvpw opt` → Profiles open
- Room to create several throwaway profiles; delete them afterwards

## Steps

1. Create a profile with a 30-character name
2. Create one with a 31-character name
3. Create one with an empty name
4. Create profiles until the list holds 10, then try to create an eleventh
5. Repeat the over-length name check on the **import** name prompt rather than the create
   dialog
6. Delete a profile and confirm creation is possible again

## Expected

- A 30-character name is accepted; 31 is refused with `user_message_profile_name_too_long`
  ("The profile name cannot be longer than 30 characters")
- An empty name does not create an unnamed profile
- The eleventh profile is refused with `user_message_add_new_profile_max_reached`
  ("A maximum of 10 profiles is allowed you reached the maximum")
- The import path enforces the **same** limits — the name prompt is not a bypass
- After deleting one, creation succeeds again
- Every rejection leaves the existing list untouched
- No Lua errors
