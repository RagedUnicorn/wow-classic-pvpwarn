# TC-AV-03 — Irrelevant miss types stay silent

**Area:** Avoid | **Client:** Era | **Mandatory:** yes

## Preconditions

- A duel partner and a melee-heavy exchange, so plenty of `SPELL_MISSED` events fire
- Avoid warnings enabled for at least one spell in the relevant category

## Steps

1. Trade melee with the duel partner for a while so dodges, parries and misses accumulate on
   both sides
2. Listen for spurious announcements
3. Have a pet or a guardian attack the enemy and watch for pet-sourced announcements
4. Reapply an already-active debuff on yourself (let the enemy refresh a DoT) and listen

## Expected

- Only miss types that the spell declares as relevant produce a warning — an ordinary melee
  dodge does **not** trigger a spell-avoid announcement
- Pet-sourced events are filtered out and never warn
- A refreshed debuff that is already applied does not announce a second time
- The stream of untracked combat-log traffic produces silence, not noise
- No Lua errors
