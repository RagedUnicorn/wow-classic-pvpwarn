# Test

> PVPWarn has an extensive testsuite for all supported spells. Testing in the World of Warcraft client is limited though.

### Language Support

The combat log is matching the clients language and thus support for spells has to be added separately for every language. This includes different tests and a different spell map for different languages.

### Category Test Setup

Every testmodule should have a `Test` function that starts a new TestGroup, collects all testcases, runs them and ultimately stops the testgroup when done.

```lua
function me.Test()
  mod.testReporter.StartTestGroup(testGroupName) -- start a new test group

  me.CollectTestCases() -- function to collect all testcases

  --[[
    Play through all testcases. There is a delay between the testcases because playing a soundfile
    takes some time and we need to make sure to play one after another. Once where done the callback is invoked
    and finishes the test group.
  ]]--
  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end
```

### Sound Test

Sound tests have the goal of testing whether playing a certain sound is working. This catches issues such as a missing sound file or typos in those.

#####  Filename pattern to follow when adding categories or other languages

```
PVPW_TestSound[category][language].lua
```

##### Manual execution of a specific category and language testmodule

```lua
/run rgpvpw.testSound[category][language].Test()
```

#### Sound Test Base

The `testSound(PVPW_TestSound.lua)` module is testing whether there is a required testcase for every spell that is
found in the spell map.

#### Run Tests

```lua
-- language e.g. "En", category e.g. "priest"
/run rgpvpw.testSound.ShouldHaveSoundTestForAllSpells(language [, categoryName])
-- language e.g. "En", category e.g. "priest"
/run rgpvpw.testSound.ShouldHaveSoundDownTestForAllSpells(language [, categoryName])
```

##### Sound Test

A soundtest is required for all spells that are found in the spellmap.

```lua
function me.TestSound[spellname]() -- without whitespace e.g. BerserkerRage
  mod.testHelper.TestSoundSuccess(
    "TestSound[spellname]", -- without whitespace e.g. BerserkerRage
    testCategory,
    "[spellname]" -- as displayed e.g. Berserker Rage
  )
end
```

##### Sound Fade Test

A soundfadetest is optional and only required if the spell has `hasFade` set to true in the spellmap.

```lua
function me.TestSoundDown[spellname]() -- without whitespace e.g. BerserkerRage
  mod.testHelper.TestSoundRemoved(
  "TestSoundDown[spellname]", -- without whitespace e.g. BerserkerRage
  testCategory,
  "[spellname]" -- as displayed e.g. Berserker Rage
  )
end
```

##### Sound Self Avoid Test

A soundselfavoid may be optional (if the spell only supports enemy avoid).

```lua
function me.TestSoundSelfAvoid[spellname]() -- without whitespace e.g. BerserkerRage
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoid[spellname]", -- without whitespace e.g. BerserkerRage
    testCategory,
    "[spellname]" -- as displayed e.g. Berserker Rage
  )
end
```

##### Sound Enemy Avoid Test

A soundenemyavoid may be optional (if the spell only supports self avoid).

```lua
function me.TestSoundEnemyAvoid[spellname]() -- without whitespace e.g. BerserkerRage
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoid[spellname]", -- without whitespace e.g. BerserkerRage
    testCategory,
    "[spellname]" -- as displayed e.g. Berserker Rage
  )
end
```

### Combat Event Test

Combat event test are testing whether the addon is able to handle certain expected events for a specific spell found in the spellmap. Different events might be relevant to some spells or not depending on the type of the spell.

Sound tests have the goal of testing whether playing a certain sound is working. This catches issues such as a missing sound file or typos in those.

#####  Filename pattern to follow when adding categories or other languages

```
PVPW_TestCombatEvents[category][language].lua
```
##### Manual execution of a specific category and language testmodule

```lua
/run rgpvpw.testCombatEvents[category][language].Test()
```

#### Combat Events Test Base

The `testCombatEvent(PVPW_TestCombatEvent.lua)` module is testing whether there is a required testcase for every
spell found in the spell map and its tracked events.

#### Run Tests

```lua
-- language e.g. "En", category e.g. "priest"
/run rgpvpw.testCombatEvent.Test(language [, categoryName])
```

##### Combat Event Aura Applied Test

Combat event `SPELL_AURA_APPLIED`

```lua
function me.TestCombatEvent[spellname]Applied() -- without whitespace e.g. BerserkerRage
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEvent[spellname]Applied", -- without whitespace e.g. BerserkerRage
    testCategory,
    "[spellname]" -- as displayed e.g. Berserker Rage
  )
end
```

##### Combat Event Aura Removed Test

Combat event `SPELL_AURA_REMOVED`

```lua
function me.TestCombatEvent[spellname]Removed() -- without whitespace e.g. BerserkerRage
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEvent[spellname]Removed", -- without whitespace e.g. BerserkerRage
    testCategory,
    "[spellname]" -- as displayed e.g. Berserker Rage
  )
end
```

##### Combat Event Aura Refresh Test

Combat event `SPELL_AURA_REFRESH`

```lua
function me.TestCombatEvent[spellname]Refresh() -- without whitespace e.g. BerserkerRage
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEvent[spellname]Refresh", -- without whitespace e.g. BerserkerRage
    testCategory,
    "[spellname]" -- as displayed e.g. Berserker Rage
  )
end
```

##### Combat Event Spellcast Success Test

Combat event `SPELL_CAST_SUCCESS`

```lua
function me.TestCombatEvent[spellname]Success() -- without whitespace e.g. BerserkerRage
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEvent[spellname]Success", -- without whitespace e.g. BerserkerRage
    testCategory,
    "[spellname]" -- as displayed e.g. Berserker Rage
  )
end
```

##### Combat Event Self/Enemy Avoid

Combat event `SPELL_MISSED`

Misstype one of:

* DODGE (dodged)
* PARRY (parried)
* IMMUNE (immune)
* MISS (missed)
* BLOCK (blocked)
* RESIST (resisted)

-- TODO update
```lua
function me.TestCombatEventSelfAvoid[spellname][misstype]() -- without whitespace e.g. BerserkerRage / miss type e.g
immune
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoid[spellname][misstype]", -- without whitespace e.g. BerserkerRage / miss type e.g immune
    testCategory,
    "[spellname]", -- as displayed e.g. Berserker Rage
    -- TODO SPELL_TYPES renamed
    RGPVPW_CONSTANTS.SPELL_TYPES.[enemy or self avoid], -- MISSED_SELF / MISSED_ENEMY
    RGPVPW_CONSTANTS.MISS_TYPES.[misstype] -- e.g. IMMUNE
  )
end
```
