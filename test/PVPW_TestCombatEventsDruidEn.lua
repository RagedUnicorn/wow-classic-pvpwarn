--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

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

-- luacheck: ignore _

local mod = rgpvpw
local me = {}
mod.testCombatEventsDruidEn = me

--[[
  TODO nature swiftness can currently fail because the category might be shaman instead of druid
  depending on which one is found first in the spellmap. Need to find a solution for linked spells
  first and also fixing those tests
]]--

me.tag = "TestCombatEventsDruidEn"

local testGroupName = "CombatEventsDruidEn"
local testCategory = "druid"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBarkskinApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBarkskinRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesGraspApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesGraspRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBashSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFeralChargeSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrenziedRegenerationApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrenziedRegenerationRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAbolishPoisonApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAbolishPoisonRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInnervateApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInnervateRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesSwiftnessApplied) -- TODO
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesSwiftnessRemoved) -- TODO
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFaerieFireSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFaerieFireFeralSuccess)
end

function me.TestCombatEventBarkskinApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBarkskinApplied",
    testCategory,
    "Barkskin"
  )
end

function me.TestCombatEventBarkskinRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBarkskinRemoved",
    testCategory,
    "Barkskin"
  )
end

function me.TestCombatEventNaturesGraspApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventNaturesGraspApplied",
    testCategory,
    "Nature's Grasp"
  )
end

function me.TestCombatEventNaturesGraspRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventNaturesGraspRemoved",
    testCategory,
    "Nature's Grasp"
  )
end

function me.TestCombatEventBashSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBashSuccess",
    testCategory,
    "Bash"
  )
end

function me.TestCombatEventFeralChargeSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFeralChargeSuccess",
    testCategory,
    "Feral Charge"
  )
end

function me.TestCombatEventFrenziedRegenerationApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFrenziedRegenerationApplied",
    testCategory,
    "Frenzied Regeneration"
  )
end

function me.TestCombatEventFrenziedRegenerationRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFrenziedRegenerationRemoved",
    testCategory,
    "Frenzied Regeneration"
  )
end

function me.TestCombatEventAbolishPoisonApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAbolishPoisonApplied",
    testCategory,
    "Abolish Poison"
  )
end

function me.TestCombatEventAbolishPoisonRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAbolishPoisonRemoved",
    testCategory,
    "Abolish Poison"
  )
end

function me.TestCombatEventInnervateApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventInnervateApplied",
    testCategory,
    "Innervate"
  )
end

function me.TestCombatEventInnervateRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventInnervateRemoved",
    testCategory,
    "Innervate"
  )
end

function me.TestCombatEventNaturesSwiftnessApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventNaturesSwiftnessApplied",
    testCategory,
    "Nature's Swiftness"
  )
end

function me.TestCombatEventNaturesSwiftnessRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventNaturesSwiftnessRemoved",
    testCategory,
    "Nature's Swiftness"
  )
end

function me.TestCombatEventFaerieFireSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFaerieFireSuccess",
    testCategory,
    "Faerie Fire"
  )
end

function me.TestCombatEventFaerieFireFeralSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFaerieFireFeralSuccess",
    testCategory,
    "Faerie Fire (Feral)"
  )
end
