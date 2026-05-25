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
mod.testCombatEventsWarriorSod = me

me.tag = "TestCombatEventsWarriorSod"

local testCategory = "warrior"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testcombatevent warrior")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventRagingBlowSuccess_402911)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventConsumedByRageApplied_425418)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventConsumedByRageRemoved_425418)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventQuickStrikeSuccess_429765)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnragedRegenerationApplied_402913)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnragedRegenerationRemoved_402913)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventRallyingCryApplied_426490)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventRallyingCryRemoved_426490)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInterveneSuccess_403338)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventCommandingShoutSuccess_403215)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventRampageApplied_426940)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventRampageRemoved_426940)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMeathookSuccess_403228)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShockwaveSuccess_440488)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSuddenDeathApplied_440113)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSuddenDeathRemoved_440113)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventValorOfAzerothApplied_461475)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventValorOfAzerothRemoved_461475)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventVictoryRushSuccess_402927)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGladiatorStanceApplied_412513)
end

function me.TestCombatEventRagingBlowSuccess_402911()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRagingBlowSuccess_402911",
    testCategory,
    "Raging Blow",
    402911
  )
end

function me.TestCombatEventConsumedByRageApplied_425418()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventConsumedByRageApplied_425418",
    testCategory,
    "Consumed By Rage",
    425418
  )
end

function me.TestCombatEventConsumedByRageRemoved_425418()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventConsumedByRageRemoved_425418",
    testCategory,
    "Consumed By Rage",
    425418
  )
end

function me.TestCombatEventQuickStrikeSuccess_429765()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventQuickStrikeSuccess_429765",
    testCategory,
    "Quick Strike",
    429765
  )
end

function me.TestCombatEventEnragedRegenerationApplied_402913()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventEnragedRegenerationApplied_402913",
    testCategory,
    "Enraged Regeneration",
    402913
  )
end

function me.TestCombatEventEnragedRegenerationRemoved_402913()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventEnragedRegenerationRemoved_402913",
    testCategory,
    "Enraged Regeneration",
    402913
  )
end

function me.TestCombatEventRallyingCryApplied_426490()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventRallyingCryApplied_426490",
    testCategory,
    "Rallying Cry",
    426490
  )
end

function me.TestCombatEventRallyingCryRemoved_426490()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventRallyingCryRemoved_426490",
    testCategory,
    "Rallying Cry",
    426490
  )
end

function me.TestCombatEventInterveneSuccess_403338()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInterveneSuccess_403338",
    testCategory,
    "Intervene",
    403338
  )
end

function me.TestCombatEventCommandingShoutSuccess_403215()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventCommandingShoutSuccess_403215",
    testCategory,
    "Commanding Shout",
    403215
  )
end

function me.TestCombatEventRampageApplied_426940()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventRampageApplied_426940",
    testCategory,
    "Rampage",
    426940
  )
end

function me.TestCombatEventRampageRemoved_426940()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventRampageRemoved_426940",
    testCategory,
    "Rampage",
    426940
  )
end

function me.TestCombatEventMeathookSuccess_403228()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMeathookSuccess_403228",
    testCategory,
    "Meathook",
    403228
  )
end

function me.TestCombatEventShockwaveSuccess_440488()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShockwaveSuccess_440488",
    testCategory,
    "Shockwave",
    440488
  )
end

function me.TestCombatEventSuddenDeathApplied_440113()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSuddenDeathApplied_440113",
    testCategory,
    "Sudden Death",
    440113
  )
end

function me.TestCombatEventSuddenDeathRemoved_440113()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSuddenDeathRemoved_440113",
    testCategory,
    "Sudden Death",
    440113
  )
end

function me.TestCombatEventValorOfAzerothApplied_461475()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventValorOfAzerothApplied_461475",
    testCategory,
    "Valor of Azeroth",
    461475
  )
end

function me.TestCombatEventValorOfAzerothRemoved_461475()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventValorOfAzerothRemoved_461475",
    testCategory,
    "Valor of Azeroth",
    461475
  )
end

function me.TestCombatEventVictoryRushSuccess_402927()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventVictoryRushSuccess_402927",
    testCategory,
    "Victory Rush",
    402927
  )
end

function me.TestCombatEventGladiatorStanceApplied_412513()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGladiatorStanceApplied_412513",
    testCategory,
    "Gladiator Stance",
    412513
  )
end
