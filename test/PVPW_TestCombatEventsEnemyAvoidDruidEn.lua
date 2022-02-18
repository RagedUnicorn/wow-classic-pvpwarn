--[[
  MIT License

  Copyright (c) 2022 Michael Wiesendanger

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
mod.testCombatEventsEnemyAvoidDruidEn = me

me.tag = "TestCombatEventsEnemyAvoidDruidEn"

local testGroupName = "CombatEventsEnemyAvoidDruidEn"
local testCategory = "druid"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFeralChargeEffectImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFeralChargeEffectResisted)
end

function me.TestCombatEventEnemyAvoidEntanglingRootsImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsImmune",
    testCategory,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsResisted",
    testCategory,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireImmune",
    testCategory,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireResisted",
    testCategory,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralImmune",
    testCategory,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralResisted",
    testCategory,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidBashDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashDodged",
    testCategory,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidBashParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashParried",
    testCategory,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidBashImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashImmune",
    testCategory,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidBashMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashMissed",
    testCategory,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidBashResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashResisted",
    testCategory,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFeralChargeEffectImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFeralChargeEffectImmune",
    testCategory,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFeralChargeEffectResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFeralChargeEffectResisted",
    testCategory,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end
