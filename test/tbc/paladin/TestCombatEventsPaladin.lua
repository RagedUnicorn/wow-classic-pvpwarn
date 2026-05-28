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
mod.testCombatEventsPaladinTbc = me

me.tag = "TestCombatEventsPaladinTbc"

local testCategory = "paladin"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testcombatevent paladin")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDevotionAuraSuccess_27149)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventRetributionAuraSuccess_27150)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowResistanceAuraSuccess_27151)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFrostResistanceAuraSuccess_27152)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFireResistanceAuraSuccess_27153)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlessingOfSacrificeApplied_27147)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlessingOfSacrificeRemoved_27147)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlessingOfSacrificeApplied_27148)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlessingOfSacrificeRemoved_27148)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventLayOnHandsSuccess_27154)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAvengersShieldSuccess_31935)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAvengingWrathApplied_31884)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAvengingWrathRemoved_31884)
end

function me.TestCombatEventDevotionAuraSuccess_27149()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDevotionAuraSuccess_27149",
    testCategory,
    "Devotion Aura",
    27149
  )
end

function me.TestCombatEventRetributionAuraSuccess_27150()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRetributionAuraSuccess_27150",
    testCategory,
    "Retribution Aura",
    27150
  )
end

function me.TestCombatEventShadowResistanceAuraSuccess_27151()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowResistanceAuraSuccess_27151",
    testCategory,
    "Shadow Resistance Aura",
    27151
  )
end

function me.TestCombatEventFrostResistanceAuraSuccess_27152()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostResistanceAuraSuccess_27152",
    testCategory,
    "Frost Resistance Aura",
    27152
  )
end

function me.TestCombatEventFireResistanceAuraSuccess_27153()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireResistanceAuraSuccess_27153",
    testCategory,
    "Fire Resistance Aura",
    27153
  )
end

function me.TestCombatEventBlessingOfSacrificeApplied_27147()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBlessingOfSacrificeApplied_27147",
    testCategory,
    "Blessing of Sacrifice",
    27147
  )
end

function me.TestCombatEventBlessingOfSacrificeRemoved_27147()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBlessingOfSacrificeRemoved_27147",
    testCategory,
    "Blessing of Sacrifice",
    27147
  )
end

function me.TestCombatEventBlessingOfSacrificeApplied_27148()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBlessingOfSacrificeApplied_27148",
    testCategory,
    "Blessing of Sacrifice",
    27148
  )
end

function me.TestCombatEventBlessingOfSacrificeRemoved_27148()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBlessingOfSacrificeRemoved_27148",
    testCategory,
    "Blessing of Sacrifice",
    27148
  )
end

function me.TestCombatEventLayOnHandsSuccess_27154()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventLayOnHandsSuccess_27154",
    testCategory,
    "Lay on Hands",
    27154
  )
end

function me.TestCombatEventAvengersShieldSuccess_31935()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventAvengersShieldSuccess_31935",
    testCategory,
    "Avenger's Shield",
    31935
  )
end

function me.TestCombatEventAvengingWrathApplied_31884()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAvengingWrathApplied_31884",
    testCategory,
    "Avenging Wrath",
    31884
  )
end

function me.TestCombatEventAvengingWrathRemoved_31884()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAvengingWrathRemoved_31884",
    testCategory,
    "Avenging Wrath",
    31884
  )
end
