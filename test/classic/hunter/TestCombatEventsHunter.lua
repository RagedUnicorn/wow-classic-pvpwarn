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
mod.testCombatEventsHunterClassic = me

me.tag = "TestCombatEventsHunterClassic"

local testCategory = "hunter"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testcombatevent hunter")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    if type(completionCallback) == "function" then
      completionCallback()
    end
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventConcussiveShotSuccess_5116)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheMonkeyApplied_13163)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheMonkeyRemoved_13163)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheHawkApplied_25296)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheHawkRemoved_25296)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheHawkApplied_13165)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheHawkRemoved_13165)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheHawkApplied_14318)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheHawkRemoved_14318)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheHawkApplied_14319)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheHawkRemoved_14319)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheHawkApplied_14320)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheHawkRemoved_14320)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheHawkApplied_14321)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheHawkRemoved_14321)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheHawkApplied_14322)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheHawkRemoved_14322)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfThePackApplied_13159)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfThePackRemoved_13159)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheCheetahApplied_5118)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheCheetahRemoved_5118)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheWildApplied_20190)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheWildRemoved_20190)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheWildApplied_20043)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheWildRemoved_20043)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheBeastApplied_13161)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheBeastRemoved_13161)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventRapidFireApplied_3045)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventRapidFireRemoved_3045)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventExplosiveTrapSuccess_14317)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventExplosiveTrapSuccess_13813)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventExplosiveTrapSuccess_14316)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFreezingTrapSuccess_1499)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFreezingTrapSuccess_14310)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFreezingTrapSuccess_14311)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventImmolationTrapSuccess_14305)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventImmolationTrapSuccess_13795)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventImmolationTrapSuccess_14302)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventImmolationTrapSuccess_14303)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventImmolationTrapSuccess_14304)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFrostTrapSuccess_13809)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventViperStingSuccess_14280)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventViperStingSuccess_3034)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventViperStingSuccess_14279)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventScatterShotSuccess_19503)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFlareSuccess_1543)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFlareSuccess_1543)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventIntimidationApplied_24394)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventIntimidationRemoved_24394)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBestialWrathApplied_19574)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBestialWrathRemoved_19574)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDeterrenceApplied_19263)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDeterrenceRemoved_19263)
end

function me.TestCombatEventConcussiveShotSuccess_5116()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventConcussiveShotSuccess_5116",
    testCategory,
    "Concussive Shot",
    5116
  )
end

function me.TestCombatEventAspectOfTheMonkeyApplied_13163()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfTheMonkeyApplied_13163",
    testCategory,
    "Aspect of the Monkey",
    13163
  )
end

function me.TestCombatEventAspectOfTheMonkeyRemoved_13163()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfTheMonkeyRemoved_13163",
    testCategory,
    "Aspect of the Monkey",
    13163
  )
end

function me.TestCombatEventAspectOfTheHawkApplied_25296()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfTheHawkApplied_25296",
    testCategory,
    "Aspect of the Hawk",
    25296
  )
end

function me.TestCombatEventAspectOfTheHawkRemoved_25296()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfTheHawkRemoved_25296",
    testCategory,
    "Aspect of the Hawk",
    25296
  )
end

function me.TestCombatEventAspectOfTheHawkApplied_13165()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfTheHawkApplied_13165",
    testCategory,
    "Aspect of the Hawk",
    13165
  )
end

function me.TestCombatEventAspectOfTheHawkRemoved_13165()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfTheHawkRemoved_13165",
    testCategory,
    "Aspect of the Hawk",
    13165
  )
end

function me.TestCombatEventAspectOfTheHawkApplied_14318()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfTheHawkApplied_14318",
    testCategory,
    "Aspect of the Hawk",
    14318
  )
end

function me.TestCombatEventAspectOfTheHawkRemoved_14318()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfTheHawkRemoved_14318",
    testCategory,
    "Aspect of the Hawk",
    14318
  )
end

function me.TestCombatEventAspectOfTheHawkApplied_14319()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfTheHawkApplied_14319",
    testCategory,
    "Aspect of the Hawk",
    14319
  )
end

function me.TestCombatEventAspectOfTheHawkRemoved_14319()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfTheHawkRemoved_14319",
    testCategory,
    "Aspect of the Hawk",
    14319
  )
end

function me.TestCombatEventAspectOfTheHawkApplied_14320()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfTheHawkApplied_14320",
    testCategory,
    "Aspect of the Hawk",
    14320
  )
end

function me.TestCombatEventAspectOfTheHawkRemoved_14320()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfTheHawkRemoved_14320",
    testCategory,
    "Aspect of the Hawk",
    14320
  )
end

function me.TestCombatEventAspectOfTheHawkApplied_14321()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfTheHawkApplied_14321",
    testCategory,
    "Aspect of the Hawk",
    14321
  )
end

function me.TestCombatEventAspectOfTheHawkRemoved_14321()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfTheHawkRemoved_14321",
    testCategory,
    "Aspect of the Hawk",
    14321
  )
end

function me.TestCombatEventAspectOfTheHawkApplied_14322()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfTheHawkApplied_14322",
    testCategory,
    "Aspect of the Hawk",
    14322
  )
end

function me.TestCombatEventAspectOfTheHawkRemoved_14322()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfTheHawkRemoved_14322",
    testCategory,
    "Aspect of the Hawk",
    14322
  )
end

function me.TestCombatEventAspectOfThePackApplied_13159()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfThePackApplied_13159",
    testCategory,
    "Aspect of the Pack",
    13159
  )
end

function me.TestCombatEventAspectOfThePackRemoved_13159()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfThePackRemoved_13159",
    testCategory,
    "Aspect of the Pack",
    13159
  )
end

function me.TestCombatEventAspectOfTheCheetahApplied_5118()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfTheCheetahApplied_5118",
    testCategory,
    "Aspect of the Cheetah",
    5118
  )
end

function me.TestCombatEventAspectOfTheCheetahRemoved_5118()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfTheCheetahRemoved_5118",
    testCategory,
    "Aspect of the Cheetah",
    5118
  )
end

function me.TestCombatEventAspectOfTheWildApplied_20190()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfTheWildApplied_20190",
    testCategory,
    "Aspect of the Wild",
    20190
  )
end

function me.TestCombatEventAspectOfTheWildRemoved_20190()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfTheWildRemoved_20190",
    testCategory,
    "Aspect of the Wild",
    20190
  )
end

function me.TestCombatEventAspectOfTheWildApplied_20043()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfTheWildApplied_20043",
    testCategory,
    "Aspect of the Wild",
    20043
  )
end

function me.TestCombatEventAspectOfTheWildRemoved_20043()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfTheWildRemoved_20043",
    testCategory,
    "Aspect of the Wild",
    20043
  )
end

function me.TestCombatEventAspectOfTheBeastApplied_13161()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfTheBeastApplied_13161",
    testCategory,
    "Aspect of the Beast",
    13161
  )
end

function me.TestCombatEventAspectOfTheBeastRemoved_13161()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfTheBeastRemoved_13161",
    testCategory,
    "Aspect of the Beast",
    13161
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
