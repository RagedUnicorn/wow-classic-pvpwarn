--[[
  MIT License

  Copyright (c) 2025 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
]]--

local mod = rgpvpw
local me = {}
mod.testCombatEventsHunter = me

me.tag = "TestCombatEventsHunter"

local testGroupName = "CombatEventsHunter"
local testCategory = "hunter"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventConcussiveShotSuccess_5116)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAspectOfTheMonkeySuccess_13163)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAspectOfTheHawkSuccess_25296)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAspectOfTheHawkSuccess_13165)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAspectOfTheHawkSuccess_14318)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAspectOfTheHawkSuccess_14319)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAspectOfTheHawkSuccess_14320)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAspectOfTheHawkSuccess_14321)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAspectOfTheHawkSuccess_14322)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRapidFireApplied_3045)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRapidFireRemoved_3045)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventExplosiveTrapSuccess_14317)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventExplosiveTrapSuccess_13813)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventExplosiveTrapSuccess_14316)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFreezingTrapSuccess_27753)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFreezingTrapSuccess_1499)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFreezingTrapSuccess_14310)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFreezingTrapSuccess_14311)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventImmolationTrapSuccess_14305)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventImmolationTrapSuccess_13795)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventImmolationTrapSuccess_14302)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventImmolationTrapSuccess_14303)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventImmolationTrapSuccess_14304)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostTrapSuccess_13809)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventViperStingSuccess_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventViperStingSuccess_3034)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventViperStingSuccess_14279)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventScatterShotSuccess_19503)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFlareSuccess_1543)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFlareSuccess_1543)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIntimidationApplied_24394)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIntimidationRemoved_24394)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBestialWrathApplied_19574)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBestialWrathRemoved_19574)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDeterrenceApplied_19263)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDeterrenceRemoved_19263)

  -- start runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSniperTrainingApplied_415399)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSniperTrainingRemoved_415399)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventKillShotSuccess_409974)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFlankingStrikeSuccess_415320)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventChimeraShotSuccess_409433)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventExplosiveShotSuccess_409552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventExplosiveShotSuccess_409552)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLockAndLoadApplied_415413)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLockAndLoadRemoved_415413)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHitAndRunApplied_440533)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHitAndRunRemoved_440533)
end

function me.TestCombatEventConcussiveShotSuccess_5116()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventConcussiveShotSuccess_5116",
    testCategory,
    "Concussive Shot",
    5116
  )
end

function me.TestCombatEventAspectOfTheMonkeySuccess_13163()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventAspectOfTheMonkeySuccess_13163",
    testCategory,
    "Aspect of the Monkey",
    13163
  )
end

function me.TestCombatEventAspectOfTheHawkSuccess_25296()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventAspectOfTheHawkSuccess_25296",
    testCategory,
    "Aspect of the Hawk",
    25296
  )
end

function me.TestCombatEventAspectOfTheHawkSuccess_13165()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventAspectOfTheHawkSuccess_13165",
    testCategory,
    "Aspect of the Hawk",
    13165
  )
end

function me.TestCombatEventAspectOfTheHawkSuccess_14318()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventAspectOfTheHawkSuccess_14318",
    testCategory,
    "Aspect of the Hawk",
    14318
  )
end

function me.TestCombatEventAspectOfTheHawkSuccess_14319()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventAspectOfTheHawkSuccess_14319",
    testCategory,
    "Aspect of the Hawk",
    14319
  )
end

function me.TestCombatEventAspectOfTheHawkSuccess_14320()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventAspectOfTheHawkSuccess_14320",
    testCategory,
    "Aspect of the Hawk",
    14320
  )
end

function me.TestCombatEventAspectOfTheHawkSuccess_14321()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventAspectOfTheHawkSuccess_14321",
    testCategory,
    "Aspect of the Hawk",
    14321
  )
end

function me.TestCombatEventAspectOfTheHawkSuccess_14322()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventAspectOfTheHawkSuccess_14322",
    testCategory,
    "Aspect of the Hawk",
    14322
  )
end

function me.TestCombatEventRapidFireApplied_3045()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventRapidFireApplied_3045",
    testCategory,
    "Rapid Fire",
    3045
  )
end

function me.TestCombatEventRapidFireRemoved_3045()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventRapidFireRemoved_3045",
    testCategory,
    "Rapid Fire",
    3045
  )
end

function me.TestCombatEventExplosiveTrapSuccess_14317()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventExplosiveTrapSuccess_14317",
    testCategory,
    "Explosive Trap",
    14317
  )
end

function me.TestCombatEventExplosiveTrapSuccess_13813()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventExplosiveTrapSuccess_13813",
    testCategory,
    "Explosive Trap",
    13813
  )
end

function me.TestCombatEventExplosiveTrapSuccess_14316()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventExplosiveTrapSuccess_14316",
    testCategory,
    "Explosive Trap",
    14316
  )
end

function me.TestCombatEventFreezingTrapSuccess_27753()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFreezingTrapSuccess_27753",
    testCategory,
    "Freezing Trap",
    27753
  )
end

function me.TestCombatEventFreezingTrapSuccess_1499()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFreezingTrapSuccess_1499",
    testCategory,
    "Freezing Trap",
    1499
  )
end

function me.TestCombatEventFreezingTrapSuccess_14310()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFreezingTrapSuccess_14310",
    testCategory,
    "Freezing Trap",
    14310
  )
end

function me.TestCombatEventFreezingTrapSuccess_14311()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFreezingTrapSuccess_14311",
    testCategory,
    "Freezing Trap",
    14311
  )
end

function me.TestCombatEventImmolationTrapSuccess_14305()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventImmolationTrapSuccess_14305",
    testCategory,
    "Immolation Trap",
    14305
  )
end

function me.TestCombatEventImmolationTrapSuccess_13795()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventImmolationTrapSuccess_13795",
    testCategory,
    "Immolation Trap",
    13795
  )
end

function me.TestCombatEventImmolationTrapSuccess_14302()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventImmolationTrapSuccess_14302",
    testCategory,
    "Immolation Trap",
    14302
  )
end

function me.TestCombatEventImmolationTrapSuccess_14303()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventImmolationTrapSuccess_14303",
    testCategory,
    "Immolation Trap",
    14303
  )
end

function me.TestCombatEventImmolationTrapSuccess_14304()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventImmolationTrapSuccess_14304",
    testCategory,
    "Immolation Trap",
    14304
  )
end

function me.TestCombatEventFrostTrapSuccess_13809()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostTrapSuccess_13809",
    testCategory,
    "Frost Trap",
    13809
  )
end

function me.TestCombatEventViperStingSuccess_14280()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventViperStingSuccess_14280",
    testCategory,
    "Viper Sting",
    14280
  )
end

function me.TestCombatEventViperStingSuccess_3034()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventViperStingSuccess_3034",
    testCategory,
    "Viper Sting",
    3034
  )
end

function me.TestCombatEventViperStingSuccess_14279()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventViperStingSuccess_14279",
    testCategory,
    "Viper Sting",
    14279
  )
end

function me.TestCombatEventScatterShotSuccess_19503()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventScatterShotSuccess_19503",
    testCategory,
    "Scatter Shot",
    19503
  )
end

function me.TestCombatEventFlareSuccess_1543()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFlareSuccess_1543",
    testCategory,
    "Flare",
    1543
  )
end

function me.TestCombatEventFlareSuccess_1543()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFlareSuccess_1543",
    testCategory,
    "Flare",
    1543
  )
end

function me.TestCombatEventIntimidationApplied_24394()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventIntimidationApplied_24394",
    testCategory,
    "Intimidation",
    24394
  )
end

function me.TestCombatEventIntimidationRemoved_24394()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventIntimidationRemoved_24394",
    testCategory,
    "Intimidation",
    24394
  )
end

function me.TestCombatEventBestialWrathApplied_19574()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBestialWrathApplied_19574",
    testCategory,
    "Bestial Wrath",
    19574
  )
end

function me.TestCombatEventBestialWrathRemoved_19574()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBestialWrathRemoved_19574",
    testCategory,
    "Bestial Wrath",
    19574
  )
end

function me.TestCombatEventDeterrenceApplied_19263()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDeterrenceApplied_19263",
    testCategory,
    "Deterrence",
    19263
  )
end

function me.TestCombatEventDeterrenceRemoved_19263()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventDeterrenceRemoved_19263",
    testCategory,
    "Deterrence",
    19263
  )
end

function me.TestCombatEventSniperTrainingApplied_415399()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSniperTrainingApplied_415399",
    testCategory,
    "Sniper Training",
    415399
  )
end

function me.TestCombatEventSniperTrainingRemoved_415399()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSniperTrainingRemoved_415399",
    testCategory,
    "Sniper Training",
    415399
  )
end

function me.TestCombatEventKillShotSuccess_409974()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventKillShotSuccess_409974",
    testCategory,
    "Kill Shot",
    409974
  )
end

function me.TestCombatEventFlankingStrikeSuccess_415320()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFlankingStrikeSuccess_415320",
    testCategory,
    "Flanking Strike",
    415320
  )
end

function me.TestCombatEventChimeraShotSuccess_409433()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventChimeraShotSuccess_409433",
    testCategory,
    "Chimera Shot",
    409433
  )
end

function me.TestCombatEventExplosiveShotSuccess_409552()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventExplosiveShotSuccess_409552",
    testCategory,
    "Explosive Shot",
    409552
  )
end

function me.TestCombatEventExplosiveShotSuccess_409552()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventExplosiveShotSuccess_409552",
    testCategory,
    "Explosive Shot",
    409552
  )
end

function me.TestCombatEventLockAndLoadApplied_415413()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventLockAndLoadApplied_415413",
    testCategory,
    "Lock and Load",
    415413
  )
end

function me.TestCombatEventLockAndLoadRemoved_415413()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventLockAndLoadRemoved_415413",
    testCategory,
    "Lock and Load",
    415413
  )
end

function me.TestCombatEventHitAndRunApplied_440533()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventHitAndRunApplied_440533",
    testCategory,
    "Hit and Run",
    440533
  )
end

function me.TestCombatEventHitAndRunRemoved_440533()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventHitAndRunRemoved_440533",
    testCategory,
    "Hit and Run",
    440533
  )
end
