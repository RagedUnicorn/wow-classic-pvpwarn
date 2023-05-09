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
mod.testCombatEventsSelfAvoidWarriorEn = me

me.tag = "TestCombatEventsSelfAvoidWarriorEn"

local testGroupName = "CombatEventsSelfAvoidWarriorEn"
local testCategory = "warrior"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidChargeStunImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidChargeStunResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringBlocked)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidIntimidatingShoutImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidIntimidatingShoutResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelBlocked)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDisarmDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDisarmParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDisarmImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDisarmMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDisarmBlocked)
end

function me.TestCombatEventSelfAvoidChargeStunImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidChargeStunImmune",
    testCategory,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidChargeStunResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidChargeStunResisted",
    testCategory,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidInterceptStunImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunImmune",
    testCategory,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidInterceptStunResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunResisted",
    testCategory,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidHamstringDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringDodged",
    testCategory,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidHamstringParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringParried",
    testCategory,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidHamstringImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringImmune",
    testCategory,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidHamstringMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringMissed",
    testCategory,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidHamstringBlocked()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringBlocked",
    testCategory,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeDodged",
    testCategory,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeParried",
    testCategory,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeImmune",
    testCategory,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeMissed",
    testCategory,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidIntimidatingShoutImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidIntimidatingShoutImmune",
    testCategory,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidIntimidatingShoutResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidIntimidatingShoutResisted",
    testCategory,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidPummelDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelDodged",
    testCategory,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidPummelParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelParried",
    testCategory,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidPummelImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelImmune",
    testCategory,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidPummelMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelMissed",
    testCategory,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidPummelBlocked()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelBlocked",
    testCategory,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidDisarmDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDisarmDodged",
    testCategory,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidDisarmParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDisarmParried",
    testCategory,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidDisarmImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDisarmImmune",
    testCategory,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDisarmMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDisarmMissed",
    testCategory,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDisarmBlocked()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDisarmBlocked",
    testCategory,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.BLOCK
  )
end
