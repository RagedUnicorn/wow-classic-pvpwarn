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
mod.testCombatEventsEnemyAvoidShamanEn = me

me.tag = "TestCombatEventsEnemyAvoidShamanEn"

local testGroupName = "CombatEventsEnemyAvoidShamanEn"
local testCategory = "shaman"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEarthShockImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEarthShockResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFlameShockImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFlameShockResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostShockImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostShockResisted)
end

function me.TestCombatEventEnemyAvoidEarthShockImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockImmune",
    testCategory,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidEarthShockResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockResisted",
    testCategory,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFlameShockImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockImmune",
    testCategory,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFlameShockResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockResisted",
    testCategory,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFrostShockImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockImmune",
    testCategory,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFrostShockResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockResisted",
    testCategory,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end
