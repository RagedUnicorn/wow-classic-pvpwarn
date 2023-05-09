--[[
  MIT License

  Copyright (c) 2023 Michael Wiesendanger

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
mod.testCombatEventsSelfAvoidDruidEn = me

me.tag = "TestCombatEventsSelfAvoidDruidEn"

local testGroupName = "CombatEventsSelfAvoidDruidEn"
local testCategory = "druid"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFeralChargeEffectImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFeralChargeEffectResisted)
end

function me.TestCombatEventSelfAvoidEntanglingRootsImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsImmune",
    testCategory,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsResisted",
    testCategory,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFaerieFireImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireImmune",
    testCategory,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireResisted",
    testCategory,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralImmune",
    testCategory,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralResisted",
    testCategory,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidBashDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashDodged",
    testCategory,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidBashParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashParried",
    testCategory,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidBashImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashImmune",
    testCategory,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidBashMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashMissed",
    testCategory,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidBashResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashResisted",
    testCategory,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFeralChargeEffectImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFeralChargeEffectImmune",
    testCategory,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFeralChargeEffectResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFeralChargeEffectResisted",
    testCategory,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end
