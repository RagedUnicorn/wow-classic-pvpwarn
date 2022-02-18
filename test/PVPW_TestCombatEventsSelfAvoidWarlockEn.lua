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
mod.testCombatEventsSelfAvoidWarlockEn = me

me.tag = "TestCombatEventsSelfAvoidWarlockEn"

local testGroupName = "CombatEventsSelfAvoidWarlockEn"
local testCategory = "warlock"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorResisted)
end

function me.TestCombatEventSelfAvoidCurseOfTonguesImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCurseOfTonguesImmune",
    testCategory,
    "Curse of Tongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidCurseOfTonguesResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCurseOfTonguesResisted",
    testCategory,
    "Curse of Tongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDeathCoilImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilImmune",
    testCategory,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDeathCoilResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilResisted",
    testCategory,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFearImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearImmune",
    testCategory,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFearResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearResisted",
    testCategory,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHowlOfTerrorImmune",
    testCategory,
    "Howl of Terror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHowlOfTerrorResisted",
    testCategory,
    "Howl of Terror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end
