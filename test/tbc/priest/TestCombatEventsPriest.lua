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
mod.testCombatEventsPriestTbc = me

me.tag = "TestCombatEventsPriestTbc"

local testCategory = "priest"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testcombatevent priest")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireApplied_25431)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireRemoved_25431)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireRefresh_25431)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDevouringPlagueSuccess_25467)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessApplied_25460)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessRemoved_25460)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessRefresh_25460)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDesperatePrayerSuccess_25437)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHexOfWeaknessSuccess_25470)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardApplied_25477)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardRemoved_25477)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardRefresh_25477)
end

function me.TestCombatEventInnerFireApplied_25431()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventInnerFireApplied_25431",
    testCategory,
    "Inner Fire",
    25431
  )
end

function me.TestCombatEventInnerFireRemoved_25431()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventInnerFireRemoved_25431",
    testCategory,
    "Inner Fire",
    25431
  )
end

function me.TestCombatEventInnerFireRefresh_25431()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventInnerFireRefresh_25431",
    testCategory,
    "Inner Fire",
    25431
  )
end

function me.TestCombatEventDevouringPlagueSuccess_25467()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDevouringPlagueSuccess_25467",
    testCategory,
    "Devouring Plague",
    25467
  )
end

function me.TestCombatEventTouchOfWeaknessApplied_25460()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventTouchOfWeaknessApplied_25460",
    testCategory,
    "Touch of Weakness",
    25460
  )
end

function me.TestCombatEventTouchOfWeaknessRemoved_25460()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventTouchOfWeaknessRemoved_25460",
    testCategory,
    "Touch of Weakness",
    25460
  )
end

function me.TestCombatEventTouchOfWeaknessRefresh_25460()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventTouchOfWeaknessRefresh_25460",
    testCategory,
    "Touch of Weakness",
    25460
  )
end

function me.TestCombatEventDesperatePrayerSuccess_25437()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDesperatePrayerSuccess_25437",
    testCategory,
    "Desperate Prayer",
    25437
  )
end

function me.TestCombatEventHexOfWeaknessSuccess_25470()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHexOfWeaknessSuccess_25470",
    testCategory,
    "Hex of Weakness",
    25470
  )
end

function me.TestCombatEventShadowguardApplied_25477()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowguardApplied_25477",
    testCategory,
    "Shadowguard",
    25477
  )
end

function me.TestCombatEventShadowguardRemoved_25477()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowguardRemoved_25477",
    testCategory,
    "Shadowguard",
    25477
  )
end

function me.TestCombatEventShadowguardRefresh_25477()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventShadowguardRefresh_25477",
    testCategory,
    "Shadowguard",
    25477
  )
end
