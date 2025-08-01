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
mod.testCombatEventsEnemyAvoidWarlock = me

me.tag = "TestCombatEventsEnemyAvoidWarlock"

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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCurseOfTonguesDodge_11719)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCurseOfTonguesBlock_11719)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCurseOfTonguesParry_11719)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCurseOfTonguesMiss_11719)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCurseOfTonguesResist_11719)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCurseOfTonguesImmune_11719)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCurseOfTonguesReflect_11719)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCurseOfTonguesAbsorbIgnored_11719)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCurseOfTonguesDodge_1714)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCurseOfTonguesBlock_1714)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCurseOfTonguesParry_1714)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCurseOfTonguesMiss_1714)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCurseOfTonguesResist_1714)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCurseOfTonguesImmune_1714)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCurseOfTonguesReflect_1714)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCurseOfTonguesAbsorbIgnored_1714)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilDodge_17926)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilBlock_17926)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilParry_17926)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilMiss_17926)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilResist_17926)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilImmune_17926)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilReflect_17926)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilAbsorbIgnored_17926)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilDodge_17925)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilBlock_17925)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilParry_17925)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilMiss_17925)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilResist_17925)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilImmune_17925)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilReflect_17925)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilAbsorbIgnored_17925)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilDodge_6789)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilBlock_6789)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilParry_6789)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilMiss_6789)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilResist_6789)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilImmune_6789)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilReflect_6789)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeathCoilAbsorbIgnored_6789)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearDodge_6215)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearBlock_6215)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearParry_6215)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearMiss_6215)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearResist_6215)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearImmune_6215)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearReflect_6215)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearAbsorbIgnored_6215)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearDodge_6213)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearBlock_6213)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearParry_6213)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearMiss_6213)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearResist_6213)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearImmune_6213)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearReflect_6213)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearAbsorbIgnored_6213)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearDodge_5782)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearBlock_5782)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearParry_5782)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearMiss_5782)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearResist_5782)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearImmune_5782)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearReflect_5782)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFearAbsorbIgnored_5782)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidHowlOfTerrorDodge_17928)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidHowlOfTerrorBlock_17928)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidHowlOfTerrorParry_17928)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidHowlOfTerrorMiss_17928)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidHowlOfTerrorResist_17928)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidHowlOfTerrorImmune_17928)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidHowlOfTerrorReflect_17928)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidHowlOfTerrorAbsorbIgnored_17928)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidHowlOfTerrorDodge_5484)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidHowlOfTerrorBlock_5484)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidHowlOfTerrorParry_5484)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidHowlOfTerrorMiss_5484)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidHowlOfTerrorResist_5484)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidHowlOfTerrorImmune_5484)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidHowlOfTerrorReflect_5484)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidHowlOfTerrorAbsorbIgnored_5484)
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesDodge_11719()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCurseOfTonguesDodge_11719",
    testCategory,
    11719,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesBlock_11719()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCurseOfTonguesBlock_11719",
    testCategory,
    11719,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesParry_11719()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCurseOfTonguesParry_11719",
    testCategory,
    11719,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesMiss_11719()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCurseOfTonguesMiss_11719",
    testCategory,
    11719,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesResist_11719()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCurseOfTonguesResist_11719",
    testCategory,
    11719,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesImmune_11719()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCurseOfTonguesImmune_11719",
    testCategory,
    11719,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesReflect_11719()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCurseOfTonguesReflect_11719",
    testCategory,
    11719,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesAbsorbIgnored_11719()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidCurseOfTonguesAbsorbIgnored_11719",
    testCategory,
    11719,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesDodge_1714()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCurseOfTonguesDodge_1714",
    testCategory,
    1714,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesBlock_1714()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCurseOfTonguesBlock_1714",
    testCategory,
    1714,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesParry_1714()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCurseOfTonguesParry_1714",
    testCategory,
    1714,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesMiss_1714()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCurseOfTonguesMiss_1714",
    testCategory,
    1714,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesResist_1714()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCurseOfTonguesResist_1714",
    testCategory,
    1714,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesImmune_1714()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCurseOfTonguesImmune_1714",
    testCategory,
    1714,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesReflect_1714()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCurseOfTonguesReflect_1714",
    testCategory,
    1714,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidCurseOfTonguesAbsorbIgnored_1714()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidCurseOfTonguesAbsorbIgnored_1714",
    testCategory,
    1714,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilDodge_17926()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilDodge_17926",
    testCategory,
    17926,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilBlock_17926()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilBlock_17926",
    testCategory,
    17926,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilParry_17926()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilParry_17926",
    testCategory,
    17926,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilMiss_17926()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilMiss_17926",
    testCategory,
    17926,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilResist_17926()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilResist_17926",
    testCategory,
    17926,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilImmune_17926()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilImmune_17926",
    testCategory,
    17926,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilReflect_17926()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilReflect_17926",
    testCategory,
    17926,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilAbsorbIgnored_17926()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidDeathCoilAbsorbIgnored_17926",
    testCategory,
    17926,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilDodge_17925()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilDodge_17925",
    testCategory,
    17925,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilBlock_17925()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilBlock_17925",
    testCategory,
    17925,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilParry_17925()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilParry_17925",
    testCategory,
    17925,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilMiss_17925()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilMiss_17925",
    testCategory,
    17925,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilResist_17925()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilResist_17925",
    testCategory,
    17925,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilImmune_17925()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilImmune_17925",
    testCategory,
    17925,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilReflect_17925()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilReflect_17925",
    testCategory,
    17925,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilAbsorbIgnored_17925()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidDeathCoilAbsorbIgnored_17925",
    testCategory,
    17925,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilDodge_6789()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilDodge_6789",
    testCategory,
    6789,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilBlock_6789()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilBlock_6789",
    testCategory,
    6789,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilParry_6789()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilParry_6789",
    testCategory,
    6789,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilMiss_6789()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilMiss_6789",
    testCategory,
    6789,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilResist_6789()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilResist_6789",
    testCategory,
    6789,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilImmune_6789()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilImmune_6789",
    testCategory,
    6789,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilReflect_6789()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeathCoilReflect_6789",
    testCategory,
    6789,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidDeathCoilAbsorbIgnored_6789()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidDeathCoilAbsorbIgnored_6789",
    testCategory,
    6789,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFearDodge_6215()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearDodge_6215",
    testCategory,
    6215,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFearBlock_6215()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearBlock_6215",
    testCategory,
    6215,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFearParry_6215()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearParry_6215",
    testCategory,
    6215,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFearMiss_6215()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearMiss_6215",
    testCategory,
    6215,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFearResist_6215()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearResist_6215",
    testCategory,
    6215,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFearImmune_6215()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearImmune_6215",
    testCategory,
    6215,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFearReflect_6215()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearReflect_6215",
    testCategory,
    6215,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFearAbsorbIgnored_6215()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFearAbsorbIgnored_6215",
    testCategory,
    6215,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFearDodge_6213()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearDodge_6213",
    testCategory,
    6213,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFearBlock_6213()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearBlock_6213",
    testCategory,
    6213,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFearParry_6213()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearParry_6213",
    testCategory,
    6213,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFearMiss_6213()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearMiss_6213",
    testCategory,
    6213,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFearResist_6213()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearResist_6213",
    testCategory,
    6213,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFearImmune_6213()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearImmune_6213",
    testCategory,
    6213,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFearReflect_6213()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearReflect_6213",
    testCategory,
    6213,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFearAbsorbIgnored_6213()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFearAbsorbIgnored_6213",
    testCategory,
    6213,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFearDodge_5782()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearDodge_5782",
    testCategory,
    5782,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFearBlock_5782()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearBlock_5782",
    testCategory,
    5782,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFearParry_5782()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearParry_5782",
    testCategory,
    5782,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFearMiss_5782()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearMiss_5782",
    testCategory,
    5782,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFearResist_5782()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearResist_5782",
    testCategory,
    5782,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFearImmune_5782()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearImmune_5782",
    testCategory,
    5782,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFearReflect_5782()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFearReflect_5782",
    testCategory,
    5782,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFearAbsorbIgnored_5782()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFearAbsorbIgnored_5782",
    testCategory,
    5782,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorDodge_17928()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHowlOfTerrorDodge_17928",
    testCategory,
    17928,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorBlock_17928()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHowlOfTerrorBlock_17928",
    testCategory,
    17928,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorParry_17928()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHowlOfTerrorParry_17928",
    testCategory,
    17928,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorMiss_17928()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHowlOfTerrorMiss_17928",
    testCategory,
    17928,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorResist_17928()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHowlOfTerrorResist_17928",
    testCategory,
    17928,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorImmune_17928()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHowlOfTerrorImmune_17928",
    testCategory,
    17928,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorReflect_17928()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHowlOfTerrorReflect_17928",
    testCategory,
    17928,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorAbsorbIgnored_17928()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidHowlOfTerrorAbsorbIgnored_17928",
    testCategory,
    17928,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorDodge_5484()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHowlOfTerrorDodge_5484",
    testCategory,
    5484,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorBlock_5484()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHowlOfTerrorBlock_5484",
    testCategory,
    5484,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorParry_5484()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHowlOfTerrorParry_5484",
    testCategory,
    5484,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorMiss_5484()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHowlOfTerrorMiss_5484",
    testCategory,
    5484,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorResist_5484()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHowlOfTerrorResist_5484",
    testCategory,
    5484,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorImmune_5484()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHowlOfTerrorImmune_5484",
    testCategory,
    5484,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorReflect_5484()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHowlOfTerrorReflect_5484",
    testCategory,
    5484,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidHowlOfTerrorAbsorbIgnored_5484()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidHowlOfTerrorAbsorbIgnored_5484",
    testCategory,
    5484,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
