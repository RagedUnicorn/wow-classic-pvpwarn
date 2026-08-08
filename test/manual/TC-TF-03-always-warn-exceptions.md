# TC-TF-03 — Spells on the player always warn

**Area:** Target filter | **Client:** Era | **Mandatory:** yes

## Preconditions

- Warning mode set to "Warn me for my current opponent" (TC-TF-02)
- Two or more hostile players present

## Steps

1. Target enemy A
2. Have enemy **B** cast a tracked spell directly **on you**
3. Clear your target entirely and have any enemy cast a tracked spell on you

## Expected

- A spell aimed at **you** always warns, even in `currentTarget` mode and even from an enemy
  you are not targeting. This is built in and deliberately **not** configurable
- With no target at all, spells on you still warn
- No Lua errors

## Notes

`ShouldWarnForTarget`'s missing-source fail-open branch is **not** manually reproducible and
is deliberately not covered here. Every subevent PVPWarn tracks carries the caster's GUID
whether or not that caster is in range, alive or nameplate-visible, and the sourceless events
that do exist (`UNIT_DIED` and friends) carry `COMBATLOG_OBJECT_NONE` source flags that never
pass the hostile-player gate in `ProcessUnfilteredCombatLogEvent`. The branch is covered
headlessly instead — see `test/headless/spec/TargetFilterSpec.lua`.

An out-of-range or dead caster is a **different** condition: the GUID is still present, so the
target filter is unaffected. Only `GetPlayerInfoByGUID` may fail to resolve a class, in which
case the detection bar renders the name in neutral white (`gui/DetectionBar.lua`). That is
documented graceful degradation, not a fail-open case.
