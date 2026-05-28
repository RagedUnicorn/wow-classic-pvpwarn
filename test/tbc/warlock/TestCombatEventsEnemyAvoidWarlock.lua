--[[
  MIT License

  Copyright (c) 2025 Michael Wiesendanger

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
mod.testCombatEventsEnemyAvoidWarlockTbc = me

me.tag = "TestCombatEventsEnemyAvoidWarlockTbc"

local testCategory = "warlock"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testenemycombatevent warlock")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    if type(completionCallback) == "function" then
      completionCallback()
    end
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilDodge_27223)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilBlock_27223)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilParry_27223)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilMiss_27223)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilResist_27223)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilImmune_27223)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilReflect_27223)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilAbsorbIgnored_27223)
end

function me.TestCombatEventEnemyAvoidDeathCoilDodge_27223()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilDodge_27223",
    testCategory,
    27223,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilBlock_27223()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilBlock_27223",
    testCategory,
    27223,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilParry_27223()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilParry_27223",
    testCategory,
    27223,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilMiss_27223()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilMiss_27223",
    testCategory,
    27223,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilResist_27223()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilResist_27223",
    testCategory,
    27223,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilImmune_27223()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilImmune_27223",
    testCategory,
    27223,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilReflect_27223()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilReflect_27223",
    testCategory,
    27223,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilAbsorbIgnored_27223()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidDeathCoilAbsorbIgnored_27223",
    testCategory,
    27223,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
