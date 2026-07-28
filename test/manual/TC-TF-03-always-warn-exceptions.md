# TC-TF-03 — Spells on the player always warn (fail open)

**Area:** Target filter | **Client:** Era | **Mandatory:** yes

## Preconditions

- Warning mode set to "Warn me for my current opponent" (TC-TF-02)
- Two or more hostile players present

## Steps

1. Target enemy A
2. Have enemy **B** cast a tracked spell directly **on you**
3. Clear your target entirely and have any enemy cast a tracked spell on you
4. Provoke a detection whose caster cannot be resolved — an area effect or a spell landing
   from an enemy who is out of range/dead by the time it lands

## Expected

- A spell aimed at **you** always warns, even in `currentTarget` mode and even from an enemy
  you are not targeting. This is built in and deliberately **not** configurable
- With no target at all, spells on you still warn
- An unresolvable caster **fails open** — the warning fires rather than being swallowed
- No Lua errors
