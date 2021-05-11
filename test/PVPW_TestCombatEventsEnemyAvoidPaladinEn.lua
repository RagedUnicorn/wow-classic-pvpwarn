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
mod.testCombatEventsEnemyAvoidPaladinEn = me

me.tag = "TestCombatEventsEnemyAvoidPaladinEn"

local testGroupName = "CombatEventsEnemyAvoidPaladinEn"
local testCategory = "paladin"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfWrathImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfWrathMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeResisted)
end

function me.TestCombatEventEnemyAvoidHammerOfWrathImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfWrathImmune",
    testCategory,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidHammerOfWrathMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfWrathMissed",
    testCategory,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeImmune",
    testCategory,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeResisted",
    testCategory,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end
