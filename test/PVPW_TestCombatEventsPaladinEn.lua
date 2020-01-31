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
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDevotionAuraApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRetributionAuraApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventConcentrationAuraApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowResistanceAuraApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostResistanceAuraApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireResistanceAuraApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlessingOfProtectionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlessingOfProtectionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlessingOfProtectionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlessingOfProtectionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlessingOfProtectionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlessingOfProtectionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHammerOfJusticeSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRepentanceSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDivineShieldApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDivineShieldRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventForbearanceApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventForbearanceRemoved)
end

function me.TestCombatEventDevotionAuraApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDevotionAuraApplied",
    testCategory,
    "Devotion Aura"
  )
end

function me.TestCombatEventRetributionAuraApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventRetributionAuraApplied",
    testCategory,
    "Retribution Aura"
  )
end

function me.TestCombatEventConcentrationAuraApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventConcentrationAuraApplied",
    testCategory,
    "Concentration Aura"
  )
end

function me.TestCombatEventShadowResistanceAuraApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowResistanceAuraApplied",
    testCategory,
    "Shadow Resistance Aura"
  )
end

function me.TestCombatEventFrostResistanceAuraApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFrostResistanceAuraApplied",
    testCategory,
    "Frost Resistance Aura"
  )
end

function me.TestCombatEventFireResistanceAuraApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFireResistanceAuraApplied",
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

function me.TestCombatEventBlessingOfProtectionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBlessingOfProtectionApplied",
    testCategory,
    "Blessing of Freedom"
  )
end

function me.TestCombatEventBlessingOfProtectionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBlessingOfProtectionRemoved",
    testCategory,
    "Blessing of Freedom"
  )
end

function me.TestCombatEventBlessingOfProtectionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBlessingOfProtectionApplied",
    testCategory,
    "Blessing of Sacrifice"
  )
end

function me.TestCombatEventBlessingOfProtectionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBlessingOfProtectionRemoved",
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
