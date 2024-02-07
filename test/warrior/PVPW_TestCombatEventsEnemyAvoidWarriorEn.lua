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
mod.testCombatEventsEnemyAvoidWarriorEn = me

me.tag = "TestCombatEventsEnemyAvoidWarriorEn"

local testGroupName = "CombatEventsEnemyAvoidWarriorEn"
local testCategory = "warrior"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidChargeStunImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidChargeStunResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringBlocked)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidIntimidatingShoutImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidIntimidatingShoutResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelBlocked)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDisarmDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDisarmParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDisarmImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDisarmMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDisarmBlocked)
end

function me.TestCombatEventEnemyAvoidChargeStunImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidChargeStunImmune",
    testCategory,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidChargeStunResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidChargeStunResisted",
    testCategory,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunImmune",
    testCategory,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunResisted",
    testCategory,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidHamstringDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringDodged",
    testCategory,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidHamstringParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringParried",
    testCategory,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidHamstringImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringImmune",
    testCategory,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidHamstringMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringMissed",
    testCategory,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidHamstringBlocked()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringBlocked",
    testCategory,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeDodged",
    testCategory,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeParried",
    testCategory,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeImmune",
    testCategory,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeMissed",
    testCategory,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidIntimidatingShoutImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidIntimidatingShoutImmune",
    testCategory,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidIntimidatingShoutResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidIntimidatingShoutResisted",
    testCategory,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidPummelDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelDodged",
    testCategory,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidPummelParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelParried",
    testCategory,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidPummelImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelImmune",
    testCategory,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidPummelMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelMissed",
    testCategory,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidPummelBlocked()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelBlocked",
    testCategory,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidDisarmDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDisarmDodged",
    testCategory,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidDisarmParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDisarmParried",
    testCategory,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidDisarmImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDisarmImmune",
    testCategory,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDisarmMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDisarmMissed",
    testCategory,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidDisarmBlocked()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDisarmBlocked",
    testCategory,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.BLOCK
  )
end
