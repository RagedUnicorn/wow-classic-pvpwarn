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
mod.testSoundWarriorSod = me

me.tag = "TestSoundWarriorSod"

local testCategory = "warrior"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound warrior")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRagingBlow_402911)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundConsumedByRage_425418)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownConsumedByRage_425418)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundQuickStrike_429765)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnragedRegeneration_402913)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEnragedRegeneration_402913)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRallyingCry_426490)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRallyingCry_426490)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntervene_403338)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCommandingShout_403215)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRampage_426940)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRampage_426940)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMeathook_403228)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShockwave_440488)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSuddenDeath_440113)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSuddenDeath_440113)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundValorOfAzeroth_461475)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownValorOfAzeroth_461475)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVictoryRush_402927)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGladiatorStance_412513)
end

function me.TestSoundRagingBlow_402911()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRagingBlow_402911",
    testCategory,
    402911
  )
end

function me.TestSoundConsumedByRage_425418()
  mod.testHelper.TestSoundApplied(
    "TestSoundConsumedByRage_425418",
    testCategory,
    425418
  )
end

function me.TestSoundDownConsumedByRage_425418()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownConsumedByRage_425418",
    testCategory,
    425418
  )
end

function me.TestSoundQuickStrike_429765()
  mod.testHelper.TestSoundSuccess(
    "TestSoundQuickStrike_429765",
    testCategory,
    429765
  )
end

function me.TestSoundEnragedRegeneration_402913()
  mod.testHelper.TestSoundApplied(
    "TestSoundEnragedRegeneration_402913",
    testCategory,
    402913
  )
end

function me.TestSoundDownEnragedRegeneration_402913()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEnragedRegeneration_402913",
    testCategory,
    402913
  )
end

function me.TestSoundRallyingCry_426490()
  mod.testHelper.TestSoundApplied(
    "TestSoundRallyingCry_426490",
    testCategory,
    426490
  )
end

function me.TestSoundDownRallyingCry_426490()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownRallyingCry_426490",
    testCategory,
    426490
  )
end

function me.TestSoundIntervene_403338()
  mod.testHelper.TestSoundSuccess(
    "TestSoundIntervene_403338",
    testCategory,
    403338
  )
end

function me.TestSoundCommandingShout_403215()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCommandingShout_403215",
    testCategory,
    403215
  )
end

function me.TestSoundRampage_426940()
  mod.testHelper.TestSoundApplied(
    "TestSoundRampage_426940",
    testCategory,
    426940
  )
end

function me.TestSoundDownRampage_426940()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownRampage_426940",
    testCategory,
    426940
  )
end

function me.TestSoundMeathook_403228()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMeathook_403228",
    testCategory,
    403228
  )
end

function me.TestSoundShockwave_440488()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShockwave_440488",
    testCategory,
    440488
  )
end

function me.TestSoundSuddenDeath_440113()
  mod.testHelper.TestSoundApplied(
    "TestSoundSuddenDeath_440113",
    testCategory,
    440113
  )
end

function me.TestSoundDownSuddenDeath_440113()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSuddenDeath_440113",
    testCategory,
    440113
  )
end

function me.TestSoundValorOfAzeroth_461475()
  mod.testHelper.TestSoundApplied(
    "TestSoundValorOfAzeroth_461475",
    testCategory,
    461475
  )
end

function me.TestSoundDownValorOfAzeroth_461475()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownValorOfAzeroth_461475",
    testCategory,
    461475
  )
end

function me.TestSoundVictoryRush_402927()
  mod.testHelper.TestSoundSuccess(
    "TestSoundVictoryRush_402927",
    testCategory,
    402927
  )
end

function me.TestSoundGladiatorStance_412513()
  mod.testHelper.TestSoundApplied(
    "TestSoundGladiatorStance_412513",
    testCategory,
    412513
  )
end
