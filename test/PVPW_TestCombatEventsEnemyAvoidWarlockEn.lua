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
mod.testCombatEventsEnemyAvoidWarlockEn = me

me.tag = "TestCombatEventsEnemyAvoidWarlockEn"

local testGroupName = "CombatEventsEnemyAvoidWarlockEn"
local testCategory = "warlock"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCurseOfTonguesImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCurseOfTonguesResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDeathCoilImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDeathCoilResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFearImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFearResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHowlOfTerrorImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHowlOfTerrorResisted)
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCurseOfTonguesImmune",
    testCategory,
    "Curse of Tongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCurseOfTonguesResisted",
    testCategory,
    "Curse of Tongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilImmune",
    testCategory,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilResisted",
    testCategory,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFearImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearImmune",
    testCategory,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFearResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearResisted",
    testCategory,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHowlOfTerrorImmune",
    testCategory,
    "Howl of Terror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHowlOfTerrorResisted",
    testCategory,
    "Howl of Terror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end
