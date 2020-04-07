# Test

> PVPWarn has an extensive testsuite for all supported spells. Testing in the World of Warcraft client is limited though.

### Language Support

The combat log is matching the clients language and thus support for spells has to be added separately for every language. This includes different tests and a different spell map for different languages.

### Category Test Setup

Every testmodule should have a `Test` function that starts a new TestGroup, collects all testcases, runs them and ultimately stops the testgroup when done.

```lua
function me.Test()
  mod.testReporter.StartTestGroup(testGroupName) -- start a new testgroup

  me.CollectTestCases() -- function to collect all testcases

  --[[
    Play through all testcases. There is a delay between the testcases because playing a soundfile
    takes some time and we need to make sure to play one after another. Once where done the callback is invoked
    and finishes the testgroup.
  ]]--
  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
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

The `testSound(PVPW_TestSound.lua)` module is testing whether there is a required testcase for every spell that is found in the spellmap.

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

The `testCombatEvent(PVPW_TestCombatEvent.lua)` module is testing whether there is a required testcase for every spell found in the spellmap and its tracked events.

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
