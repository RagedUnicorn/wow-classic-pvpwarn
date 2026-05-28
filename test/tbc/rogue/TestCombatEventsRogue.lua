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
mod.testCombatEventsRogueTbc = me

me.tag = "TestCombatEventsRogueTbc"

local testCategory = "rogue"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testcombatevent rogue")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventKickSuccess_38768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEvasionApplied_26669)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEvasionRemoved_26669)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventVanishSuccess_26889)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowstepSuccess_36554)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDeadlyThrowSuccess_26679)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventCloakOfShadowsApplied_31224)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventCloakOfShadowsRemoved_31224)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShivSuccess_5938)
end

function me.TestCombatEventKickSuccess_38768()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventKickSuccess_38768",
    testCategory,
    "Kick",
    38768
  )
end

function me.TestCombatEventEvasionApplied_26669()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventEvasionApplied_26669",
    testCategory,
    "Evasion",
    26669
  )
end

function me.TestCombatEventEvasionRemoved_26669()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventEvasionRemoved_26669",
    testCategory,
    "Evasion",
    26669
  )
end

function me.TestCombatEventVanishSuccess_26889()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventVanishSuccess_26889",
    testCategory,
    "Vanish",
    26889
  )
end

function me.TestCombatEventShadowstepSuccess_36554()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowstepSuccess_36554",
    testCategory,
    "Shadowstep",
    36554
  )
end

function me.TestCombatEventDeadlyThrowSuccess_26679()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDeadlyThrowSuccess_26679",
    testCategory,
    "Deadly Throw",
    26679
  )
end

function me.TestCombatEventCloakOfShadowsApplied_31224()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventCloakOfShadowsApplied_31224",
    testCategory,
    "Cloak of Shadows",
    31224
  )
end

function me.TestCombatEventCloakOfShadowsRemoved_31224()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventCloakOfShadowsRemoved_31224",
    testCategory,
    "Cloak of Shadows",
    31224
  )
end

function me.TestCombatEventShivSuccess_5938()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShivSuccess_5938",
    testCategory,
    "Shiv",
    5938
  )
end
