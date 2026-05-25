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
mod.testCombatEventsHunterSod = me

me.tag = "TestCombatEventsHunterSod"

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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventExplosiveTrapSuccess_409535)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventExplosiveTrapSuccess_409532)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventExplosiveTrapSuccess_409534)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFreezingTrapSuccess_409519)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFreezingTrapSuccess_409510)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFreezingTrapSuccess_409512)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventImmolationTrapSuccess_409530)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventImmolationTrapSuccess_409521)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventImmolationTrapSuccess_409524)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventImmolationTrapSuccess_409526)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventImmolationTrapSuccess_409528)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFrostTrapSuccess_409520)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSniperTrainingApplied_415399)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSniperTrainingRemoved_415399)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventKillShotSuccess_409974)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFlankingStrikeSuccess_415320)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventChimeraShotSuccess_409433)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventExplosiveShotSuccess_409552)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventExplosiveShotSuccess_409552)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventLockAndLoadApplied_415413)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventLockAndLoadRemoved_415413)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHitAndRunApplied_440533)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHitAndRunRemoved_440533)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheFalconApplied_469145)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheFalconRemoved_469145)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheViperApplied_415423)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheViperRemoved_415423)
end

function me.TestCombatEventExplosiveTrapSuccess_409535()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventExplosiveTrapSuccess_409535",
    testCategory,
    "Explosive Trap",
    409535
  )
end

function me.TestCombatEventExplosiveTrapSuccess_409532()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventExplosiveTrapSuccess_409532",
    testCategory,
    "Explosive Trap",
    409532
  )
end

function me.TestCombatEventExplosiveTrapSuccess_409534()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventExplosiveTrapSuccess_409534",
    testCategory,
    "Explosive Trap",
    409534
  )
end

function me.TestCombatEventFreezingTrapSuccess_409519()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFreezingTrapSuccess_409519",
    testCategory,
    "Freezing Trap",
    409519
  )
end

function me.TestCombatEventFreezingTrapSuccess_409510()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFreezingTrapSuccess_409510",
    testCategory,
    "Freezing Trap",
    409510
  )
end

function me.TestCombatEventFreezingTrapSuccess_409512()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFreezingTrapSuccess_409512",
    testCategory,
    "Freezing Trap",
    409512
  )
end

function me.TestCombatEventImmolationTrapSuccess_409530()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventImmolationTrapSuccess_409530",
    testCategory,
    "Immolation Trap",
    409530
  )
end

function me.TestCombatEventImmolationTrapSuccess_409521()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventImmolationTrapSuccess_409521",
    testCategory,
    "Immolation Trap",
    409521
  )
end

function me.TestCombatEventImmolationTrapSuccess_409524()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventImmolationTrapSuccess_409524",
    testCategory,
    "Immolation Trap",
    409524
  )
end

function me.TestCombatEventImmolationTrapSuccess_409526()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventImmolationTrapSuccess_409526",
    testCategory,
    "Immolation Trap",
    409526
  )
end

function me.TestCombatEventImmolationTrapSuccess_409528()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventImmolationTrapSuccess_409528",
    testCategory,
    "Immolation Trap",
    409528
  )
end

function me.TestCombatEventFrostTrapSuccess_409520()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostTrapSuccess_409520",
    testCategory,
    "Frost Trap",
    409520
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

function me.TestCombatEventAspectOfTheFalconApplied_469145()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfTheFalconApplied_469145",
    testCategory,
    "Aspect of the Falcon",
    469145
  )
end

function me.TestCombatEventAspectOfTheFalconRemoved_469145()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfTheFalconRemoved_469145",
    testCategory,
    "Aspect of the Falcon",
    469145
  )
end

function me.TestCombatEventAspectOfTheViperApplied_415423()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfTheViperApplied_415423",
    testCategory,
    "Aspect of the Viper",
    415423
  )
end

function me.TestCombatEventAspectOfTheViperRemoved_415423()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfTheViperRemoved_415423",
    testCategory,
    "Aspect of the Viper",
    415423
  )
end
