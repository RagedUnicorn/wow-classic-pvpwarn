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

-- luacheck: ignore _

local mod = rgpvpw
local me = {}
mod.testCombatEventsEnemyAvoidMageEn = me

me.tag = "TestCombatEventsEnemyAvoidMageEn"

local testGroupName = "CombatEventsEnemyAvoidMageEn"
local testCategory = "mage"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCounterspellMisse)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCounterspellMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCounterspellSilencedMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdMissed)
end

function me.TestCombatEventEnemyAvoidCounterspellMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCounterspellMissed",
    testCategory,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY
  )
end

function me.TestCombatEventEnemyAvoidCounterspellSilencedMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCounterspellSilencedMissed",
    testCategory,
    "Counterspell - Silenced",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY
  )
end

function me.TestCombatEventEnemyAvoidPolymorphMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphMissed",
    testCategory,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaMissed",
    testCategory,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdMissed",
    testCategory,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY
  )
end
