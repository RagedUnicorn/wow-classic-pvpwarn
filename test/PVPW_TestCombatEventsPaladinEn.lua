--[[
  MIT License

  Copyright (c) 2021 Michael Wiesendanger

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
mod.testCombatEventsPaladinEn = me

me.tag = "TestCombatEventsPaladinEn"

local testGroupName = "CombatEventsPaladinEn"
local testCategory = "paladin"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDevotionAuraSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRetributionAuraSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventConcentrationAuraSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowResistanceAuraSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostResistanceAuraSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireResistanceAuraSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlessingOfProtectionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlessingOfProtectionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlessingOfFreedomApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlessingOfFreedomRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlessingOfSacrificeApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlessingOfSacrificeRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHammerOfJusticeSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRepentanceSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDivineShieldApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDivineShieldRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventForbearanceApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventForbearanceRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLayOnHandsSuccess)
end

function me.TestCombatEventDevotionAuraSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDevotionAuraSuccess",
    testCategory,
    "Devotion Aura"
  )
end

function me.TestCombatEventRetributionAuraSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRetributionAuraSuccess",
    testCategory,
    "Retribution Aura"
  )
end

function me.TestCombatEventConcentrationAuraSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventConcentrationAuraSuccess",
    testCategory,
    "Concentration Aura"
  )
end

function me.TestCombatEventShadowResistanceAuraSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowResistanceAuraSuccess",
    testCategory,
    "Shadow Resistance Aura"
  )
end

function me.TestCombatEventFrostResistanceAuraSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostResistanceAuraSuccess",
    testCategory,
    "Frost Resistance Aura"
  )
end

function me.TestCombatEventFireResistanceAuraSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireResistanceAuraSuccess",
    testCategory,
    "Fire Resistance Aura"
  )
end

function me.TestCombatEventBlessingOfProtectionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBlessingOfProtectionApplied",
    testCategory,
    "Blessing of Protection"
  )
end

function me.TestCombatEventBlessingOfProtectionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBlessingOfProtectionRemoved",
    testCategory,
    "Blessing of Protection"
  )
end

function me.TestCombatEventBlessingOfFreedomApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBlessingOfFreedomApplied",
    testCategory,
    "Blessing of Freedom"
  )
end

function me.TestCombatEventBlessingOfFreedomRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBlessingOfFreedomRemoved",
    testCategory,
    "Blessing of Freedom"
  )
end

function me.TestCombatEventBlessingOfSacrificeApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBlessingOfSacrificeApplied",
    testCategory,
    "Blessing of Sacrifice"
  )
end

function me.TestCombatEventBlessingOfSacrificeRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBlessingOfSacrificeRemoved",
    testCategory,
    "Blessing of Sacrifice"
  )
end

function me.TestCombatEventHammerOfJusticeSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHammerOfJusticeSuccess",
    testCategory,
    "Hammer of Justice"
  )
end

function me.TestCombatEventRepentanceSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRepentanceSuccess",
    testCategory,
    "Repentance"
  )
end

function me.TestCombatEventDivineShieldApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDivineShieldApplied",
    testCategory,
    "Divine Shield"
  )
end

function me.TestCombatEventDivineShieldRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventDivineShieldRemoved",
    testCategory,
    "Divine Shield"
  )
end

function me.TestCombatEventForbearanceApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventForbearanceApplied",
    testCategory,
    "Forbearance"
  )
end

function me.TestCombatEventForbearanceRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventForbearanceRemoved",
    testCategory,
    "Forbearance"
  )
end

function me.TestCombatEventLayOnHandsSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventLayOnHandsSuccess",
    testCategory,
    "Lay on Hands"
  )
end
