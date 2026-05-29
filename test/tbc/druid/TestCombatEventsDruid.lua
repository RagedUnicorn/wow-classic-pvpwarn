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
mod.testCombatEventsDruidTbc = me

me.tag = "TestCombatEventsDruidTbc"

local testCategory = "druid"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testcombatevent druid")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventNaturesGraspApplied_27009)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventNaturesGraspRemoved_27009)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFrenziedRegenerationApplied_26999)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFrenziedRegenerationRemoved_26999)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFaerieFireSuccess_26993)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFaerieFireFeralSuccess_27011)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventCycloneSuccess_33786)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventCycloneStart_33786)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMaimSuccess_22570)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventForceOfNatureSuccess_33831)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMangleBearSuccess_33878)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMangleCatSuccess_33876)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventLacerateSuccess_33745)
end

function me.TestCombatEventNaturesGraspApplied_27009()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventNaturesGraspApplied_27009",
    testCategory,
    "Nature's Grasp",
    27009
  )
end

function me.TestCombatEventNaturesGraspRemoved_27009()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventNaturesGraspRemoved_27009",
    testCategory,
    "Nature's Grasp",
    27009
  )
end

function me.TestCombatEventFrenziedRegenerationApplied_26999()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFrenziedRegenerationApplied_26999",
    testCategory,
    "Frenzied Regeneration",
    26999
  )
end

function me.TestCombatEventFrenziedRegenerationRemoved_26999()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFrenziedRegenerationRemoved_26999",
    testCategory,
    "Frenzied Regeneration",
    26999
  )
end

function me.TestCombatEventFaerieFireSuccess_26993()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFaerieFireSuccess_26993",
    testCategory,
    "Faerie Fire",
    26993
  )
end

function me.TestCombatEventFaerieFireFeralSuccess_27011()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFaerieFireFeralSuccess_27011",
    testCategory,
    "Faerie Fire (Feral)",
    27011
  )
end

function me.TestCombatEventCycloneSuccess_33786()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventCycloneSuccess_33786",
    testCategory,
    "Cyclone",
    33786
  )
end

function me.TestCombatEventCycloneStart_33786()
  mod.testHelper.TestCombatEventStart(
    "TestCombatEventCycloneStart_33786",
    testCategory,
    "Cyclone",
    33786
  )
end

function me.TestCombatEventMaimSuccess_22570()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMaimSuccess_22570",
    testCategory,
    "Maim",
    22570
  )
end

function me.TestCombatEventForceOfNatureSuccess_33831()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventForceOfNatureSuccess_33831",
    testCategory,
    "Force of Nature",
    33831
  )
end

function me.TestCombatEventMangleBearSuccess_33878()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMangleBearSuccess_33878",
    testCategory,
    "Mangle (Bear)",
    33878
  )
end

function me.TestCombatEventMangleCatSuccess_33876()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMangleCatSuccess_33876",
    testCategory,
    "Mangle (Cat)",
    33876
  )
end

function me.TestCombatEventLacerateSuccess_33745()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventLacerateSuccess_33745",
    testCategory,
    "Lacerate",
    33745
  )
end
