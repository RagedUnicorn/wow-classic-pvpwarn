# Test

> PVPWarn has an extensive testsuite for all supported spells. Testing in the World of Warcraft client is limited though.


## Language Support

The combat log is matching the clients language and thus support for spells has to be added separately for language. This includes different tests and a different spell map for different languages.

## Base Tests

The base tests are checking whether there are all appropriate testcases present.

### Sound

The `testSound(PVPW_TestSound.lua)` module is testing whether there is an appropriate testcase for every spell that is found in the spellMap.

#### Sound Test

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

#### Run Tests
```
/run rgpvpw.testSound.ShouldHaveSoundTestForAllSpells()
-- or for a specific category e.g. "priest"
/run rgpvpw.testSound.ShouldHaveSoundTestForAllSpells(category)
```

#### Sound Fade Test

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

#### Run Tests
```
/run rgpvpw.testSound.ShouldHaveSoundDownTestForAllSpells()
-- or for a specific category e.g. "priest"
/run rgpvpw.testSound.ShouldHaveSoundDownTestForAllSpells(category)
```


### Combat Event



## Combat Event Tests



## Sound Tests

Sound tests have the goal of testing whether playing a certain sound is working. This catches issues such as a missing sound file or typos in those.

##### Manual execution of a specific category and language testmodule

```
/run rgpvpw.testSound[category][language].Test()
```

#####  Filename pattern to follow when adding categories or other languages

```
PVPW_TestSound[category][language].lua
```

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


| Slotname          | Description                  |
|-------------------|------------------------------|
| TestSoundDruidEn          | Head/Helmet slot             |
| TestSoundHunterEn          | Neck slot                    |
| ShoulderSlot      | Shoulder slot                |
| ChestSlot         | Chest/Robe slot              |
| WaistSlot         | Waist/Belt slot              |
| LegsSlot          | Legs slot                    |
| FeetSlot          | Feet/Boots slot              |
| WristSlot         | Wrist/Bracers slot           |
| HandsSlot         | Hands slot                   |
| Finger0Slot       | First/Upper ring slot        |
| Finger1Slot       | Second/Upper ring slot       |
| Trinket0Slot      | First/Upper trinket slot     |
| Trinket1Slot      | Second/Lower trinket slot    |
| BackSlot          | Back/Cloak slot              |
| MainhandSlot      | Main-hand slot               |
| SecondaryHandSlot | Secondary-hand/Off-hand slot |
| RangedSlot        | Ranged slot                  |
