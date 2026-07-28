# TC-PR-04 — Corrupted import string rejected

**Area:** Profiles | **Client:** Era | **Mandatory:** yes

## Preconditions

- A valid exported profile string to mutate (TC-PR-03)
- Note the current profile list and one live per-spell setting, to confirm afterwards that
  nothing was touched

## Steps

1. Paste the valid string but change a few characters in the middle, then click **Import**
2. Click **Import** with the box completely empty
3. Import random text (`hello world`)
4. Import the valid string with its prefix stripped
5. Import an export string from another addon if one is available (a GearMenu or Pulse
   profile string)
6. Hand-edit the version marker in a valid string to a higher version and import that
7. Re-check the profile list and the live configuration

## Expected

- Every invalid string is **rejected with a user-visible error message**, each mapping to its
  own case: `profile_error_checksum` for the mutated string, `profile_error_empty` for the
  empty box, `profile_error_invalid` for unparseable input, `profile_error_wrong_addon` for a
  foreign string, `profile_error_version` for a newer-version string
- No profile is created; the existing profile list and the live configuration are **untouched**
- No Lua errors — rejection is a handled failure (checksum/parse validation in
  `code/Encoder.lua` / `code/Serializer.lua` / `profiles/Profile.lua`), never a crash
