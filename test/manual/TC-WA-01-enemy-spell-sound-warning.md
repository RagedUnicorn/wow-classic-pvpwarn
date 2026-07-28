# TC-WA-01 — Enemy spell produces the sound warning

**Area:** Warnings | **Client:** Era | **Mandatory:** yes

## Preconditions

- A duel partner or a battleground, so a hostile player can cast on you
- Sound enabled in the client; game sound not muted
- The spell under test has `spellActive` and `soundWarningActive` enabled in its category
  panel (default for the class profile)

## Steps

1. Have the enemy cast a tracked spell on you (a Mage Polymorph or a Priest Psychic Scream
   are easy picks)
2. Listen for the warning and watch the screen
3. Repeat with a spell detected through `SPELL_AURA_APPLIED` rather than `SPELL_CAST_SUCCESS`
4. Repeat with a spell whose aura is removed again (`SPELL_AURA_REMOVED`)

## Expected

- The sound warning plays once per detection, naming the spell
- The vignette flash fires in the spell's configured `visualWarningColor`
- A detection bar appears carrying the spell icon, the event text and the enemy's name with
  the realm suffix stripped
- The `SPELL_AURA_REMOVED` detection is announced as the spell going **down**, not as a new
  cast
- No Lua errors
