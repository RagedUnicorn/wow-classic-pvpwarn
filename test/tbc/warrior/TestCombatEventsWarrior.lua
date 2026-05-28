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
mod.testCombatEventsWarriorTbc = me

me.tag = "TestCombatEventsWarriorTbc"

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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInterceptSuccess_25272)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInterceptSuccess_25275)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShieldSlamSuccess_25258)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShieldSlamSuccess_30356)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShieldBashSuccess_29704)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventLastStandApplied_12976)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventLastStandRemoved_12976)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventCommandingShoutSuccess_469)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInterveneSuccess_3411)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSpellReflectionApplied_23920)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSpellReflectionRemoved_23920)
end

function me.TestCombatEventInterceptSuccess_25272()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInterceptSuccess_25272",
    testCategory,
    "Intercept",
    25272
  )
end

function me.TestCombatEventInterceptSuccess_25275()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInterceptSuccess_25275",
    testCategory,
    "Intercept",
    25275
  )
end

function me.TestCombatEventShieldSlamSuccess_25258()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShieldSlamSuccess_25258",
    testCategory,
    "Shield Slam",
    25258
  )
end

function me.TestCombatEventShieldSlamSuccess_30356()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShieldSlamSuccess_30356",
    testCategory,
    "Shield Slam",
    30356
  )
end

function me.TestCombatEventShieldBashSuccess_29704()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShieldBashSuccess_29704",
    testCategory,
    "Shield Bash",
    29704
  )
end

function me.TestCombatEventLastStandApplied_12976()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventLastStandApplied_12976",
    testCategory,
    "Last Stand",
    12976
  )
end

function me.TestCombatEventLastStandRemoved_12976()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventLastStandRemoved_12976",
    testCategory,
    "Last Stand",
    12976
  )
end

function me.TestCombatEventCommandingShoutSuccess_469()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventCommandingShoutSuccess_469",
    testCategory,
    "Commanding Shout",
    469
  )
end

function me.TestCombatEventInterveneSuccess_3411()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInterveneSuccess_3411",
    testCategory,
    "Intervene",
    3411
  )
end

function me.TestCombatEventSpellReflectionApplied_23920()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSpellReflectionApplied_23920",
    testCategory,
    "Spell Reflection",
    23920
  )
end

function me.TestCombatEventSpellReflectionRemoved_23920()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSpellReflectionRemoved_23920",
    testCategory,
    "Spell Reflection",
    23920
  )
end
