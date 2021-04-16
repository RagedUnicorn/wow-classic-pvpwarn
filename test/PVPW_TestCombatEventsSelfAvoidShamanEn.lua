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
mod.testCombatEventsSelfAvoidShamanEn = me

me.tag = "TestCombatEventsSelfAvoidShamanEn"

local testGroupName = "CombatEventsSelfAvoidShamanEn"
local testCategory = "shaman"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockResisted)
end

function me.TestCombatEventSelfAvoidEarthShockImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockImmune",
    testCategory,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidEarthShockResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockResisted",
    testCategory,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFlameShockImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockImmune",
    testCategory,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFlameShockResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockResisted",
    testCategory,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFrostShockImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockImmune",
    testCategory,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFrostShockResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockResisted",
    testCategory,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end
