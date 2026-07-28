# TC-PR-03 — Export / import round-trip

**Area:** Profiles | **Client:** Era | **Mandatory:** yes

## Preconditions

- At least one non-default profile with recognisably custom settings (TC-PR-02)
- A second character available, ideally on another realm, to import into

## Steps

1. Select the custom profile and click **Export**
2. Copy the string out of the *Profile String* box
3. Try **Export** with no profile selected
4. On the same character, paste the string back and click **Import**, giving a new name at
   the prompt
5. Load the imported profile and compare its settings against the original
6. Log in on the second character, paste the same string and import it there
7. `/reload` on both and re-check

## Expected

- **Export** fills the box with an encoded share string; the box selects cleanly for copying
- Exporting with nothing selected prints `user_message_select_profile_before_export`
- **Import** prompts for a name (`profile_import_name_prompt`) and prints
  `profile_import_success` with that name on success
- The imported profile is byte-equivalent to the original across all three spell lists —
  round-tripping loses nothing
- The import works on a different character and a different realm; profiles are portable
- Both profiles survive `/reload`
- No Lua errors
