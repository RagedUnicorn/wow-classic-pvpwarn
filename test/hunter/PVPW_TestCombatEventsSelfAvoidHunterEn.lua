--[[
  MIT License

  Copyright (c) 2024 Michael Wiesendanger

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
mod.testCombatEventsSelfAvoidHunterEn = me

me.tag = "TestCombatEventsSelfAvoidHunterEn"

local testGroupName = "CombatEventsSelfAvoidHunterEn"
local testCategory = "hunter"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConcussiveShotImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConcussiveShotResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConcussiveShotMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidScatterShotImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidScatterShotMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapEffectImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapEffectResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipBlocked)
end

function me.TestCombatEventSelfAvoidConcussiveShotImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConcussiveShotImmune",
    testCategory,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidConcussiveShotResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConcussiveShotResisted",
    testCategory,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidConcussiveShotMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConcussiveShotMissed",
    testCategory,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidScatterShotImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidScatterShotImmune",
    testCategory,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidScatterShotMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidScatterShotMissed",
    testCategory,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSerpentStingImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingImmune",
    testCategory,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingMissed",
    testCategory,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidViperStingImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingImmune",
    testCategory,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidViperStingMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingMissed",
    testCategory,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapEffectImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFreezingTrapEffectImmune",
    testCategory,
    "Freezing Trap Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapEffectResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFreezingTrapEffectResisted",
    testCategory,
    "Freezing Trap Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidWingClipDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipDodged",
    testCategory,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidWingClipParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipParried",
    testCategory,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidWingClipImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipImmune",
    testCategory,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidWingClipMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipMissed",
    testCategory,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidWingClipBlocked()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipBlocked",
    testCategory,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.BLOCK
  )
end
