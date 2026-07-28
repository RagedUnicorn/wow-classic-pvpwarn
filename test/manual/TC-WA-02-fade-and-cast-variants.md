# TC-WA-02 — Fade and cast-start sound variants

**Area:** Warnings | **Client:** Era | **Mandatory:** yes

## Preconditions

- A duel partner able to cast a spell that has `hasFade` (an aura that expires) and one that
  has `hasCast` (a warning on `SPELL_CAST_START`)
- The category panel for that spell shows the extra **Enable Sound Fade** / **Enable Sound
  Cast** checkboxes — they only render for spells that declare `hasFade` / `hasCast`

## Steps

1. Enable **Enable Sound Fade** for a fading spell, have the enemy apply it, then let it
   expire without dispelling
2. Disable **Enable Sound Fade**, repeat, and confirm only the apply warning plays
3. Enable **Enable Sound Cast** for a cast spell and have the enemy start casting it
4. Interrupt the cast before it completes
5. Disable **Enable Sound Cast** and repeat step 3

## Expected

- With fade enabled, a distinct fade sound plays when the aura expires
- With fade disabled, the expiry is silent while the apply warning still plays
- With cast enabled, the warning fires on `SPELL_CAST_START`, i.e. **before** the spell lands
- An interrupted cast still produced its start warning and produces no completion warning
- With cast disabled, only the completion/apply warning plays
- The checkboxes are absent entirely for spells without `hasFade` / `hasCast`
- No Lua errors
