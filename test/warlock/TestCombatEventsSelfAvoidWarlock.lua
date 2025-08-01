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
mod.testCombatEventsSelfAvoidWarlock = me

me.tag = "TestCombatEventsSelfAvoidWarlock"

local testGroupName = "CombatEventsSelfAvoidWarlock"
local testCategory = "warlock"

function me.Test()
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testselfavoidcombatevent warlock")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesDodge_11719)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesBlock_11719)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesParry_11719)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesMiss_11719)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesResist_11719)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesImmune_11719)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesReflect_11719)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesAbsorbIgnored_11719)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesDodge_1714)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesBlock_1714)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesParry_1714)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesMiss_1714)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesResist_1714)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesImmune_1714)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesReflect_1714)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCurseOfTonguesAbsorbIgnored_1714)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilDodge_17926)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilBlock_17926)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilParry_17926)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilMiss_17926)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilResist_17926)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilImmune_17926)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilReflect_17926)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilAbsorbIgnored_17926)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilDodge_17925)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilBlock_17925)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilParry_17925)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilMiss_17925)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilResist_17925)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilImmune_17925)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilReflect_17925)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilAbsorbIgnored_17925)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilDodge_6789)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilBlock_6789)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilParry_6789)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilMiss_6789)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilResist_6789)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilImmune_6789)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilReflect_6789)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDeathCoilAbsorbIgnored_6789)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearDodge_6215)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearBlock_6215)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearParry_6215)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearMiss_6215)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearResist_6215)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearImmune_6215)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearReflect_6215)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearAbsorbIgnored_6215)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearDodge_6213)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearBlock_6213)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearParry_6213)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearMiss_6213)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearResist_6213)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearImmune_6213)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearReflect_6213)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearAbsorbIgnored_6213)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearDodge_5782)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearBlock_5782)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearParry_5782)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearMiss_5782)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearResist_5782)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearImmune_5782)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearReflect_5782)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFearAbsorbIgnored_5782)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorDodge_17928)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorBlock_17928)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorParry_17928)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorMiss_17928)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorResist_17928)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorImmune_17928)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorReflect_17928)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorAbsorbIgnored_17928)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorDodge_5484)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorBlock_5484)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorParry_5484)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorMiss_5484)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorResist_5484)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorImmune_5484)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorReflect_5484)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHowlOfTerrorAbsorbIgnored_5484)
end

function me.TestCombatEventSelfAvoidCurseOfTonguesDodge_11719()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCurseOfTonguesDodge_11719",
    testCategory,
    11719,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidCurseOfTonguesBlock_11719()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCurseOfTonguesBlock_11719",
    testCategory,
    11719,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidCurseOfTonguesParry_11719()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCurseOfTonguesParry_11719",
    testCategory,
    11719,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidCurseOfTonguesMiss_11719()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCurseOfTonguesMiss_11719",
    testCategory,
    11719,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidCurseOfTonguesResist_11719()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCurseOfTonguesResist_11719",
    testCategory,
    11719,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidCurseOfTonguesImmune_11719()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCurseOfTonguesImmune_11719",
    testCategory,
    11719,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidCurseOfTonguesReflect_11719()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCurseOfTonguesReflect_11719",
    testCategory,
    11719,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidCurseOfTonguesAbsorbIgnored_11719()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidCurseOfTonguesAbsorbIgnored_11719",
    testCategory,
    11719,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidCurseOfTonguesDodge_1714()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCurseOfTonguesDodge_1714",
    testCategory,
    1714,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidCurseOfTonguesBlock_1714()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCurseOfTonguesBlock_1714",
    testCategory,
    1714,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidCurseOfTonguesParry_1714()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCurseOfTonguesParry_1714",
    testCategory,
    1714,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidCurseOfTonguesMiss_1714()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCurseOfTonguesMiss_1714",
    testCategory,
    1714,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidCurseOfTonguesResist_1714()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCurseOfTonguesResist_1714",
    testCategory,
    1714,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidCurseOfTonguesImmune_1714()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCurseOfTonguesImmune_1714",
    testCategory,
    1714,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidCurseOfTonguesReflect_1714()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCurseOfTonguesReflect_1714",
    testCategory,
    1714,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidCurseOfTonguesAbsorbIgnored_1714()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidCurseOfTonguesAbsorbIgnored_1714",
    testCategory,
    1714,
    "CurseOfTongues",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidDeathCoilDodge_17926()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilDodge_17926",
    testCategory,
    17926,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidDeathCoilBlock_17926()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilBlock_17926",
    testCategory,
    17926,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidDeathCoilParry_17926()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilParry_17926",
    testCategory,
    17926,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidDeathCoilMiss_17926()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilMiss_17926",
    testCategory,
    17926,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDeathCoilResist_17926()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilResist_17926",
    testCategory,
    17926,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDeathCoilImmune_17926()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilImmune_17926",
    testCategory,
    17926,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDeathCoilReflect_17926()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilReflect_17926",
    testCategory,
    17926,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidDeathCoilAbsorbIgnored_17926()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidDeathCoilAbsorbIgnored_17926",
    testCategory,
    17926,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidDeathCoilDodge_17925()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilDodge_17925",
    testCategory,
    17925,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidDeathCoilBlock_17925()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilBlock_17925",
    testCategory,
    17925,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidDeathCoilParry_17925()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilParry_17925",
    testCategory,
    17925,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidDeathCoilMiss_17925()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilMiss_17925",
    testCategory,
    17925,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDeathCoilResist_17925()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilResist_17925",
    testCategory,
    17925,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDeathCoilImmune_17925()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilImmune_17925",
    testCategory,
    17925,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDeathCoilReflect_17925()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilReflect_17925",
    testCategory,
    17925,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidDeathCoilAbsorbIgnored_17925()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidDeathCoilAbsorbIgnored_17925",
    testCategory,
    17925,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidDeathCoilDodge_6789()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilDodge_6789",
    testCategory,
    6789,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidDeathCoilBlock_6789()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilBlock_6789",
    testCategory,
    6789,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidDeathCoilParry_6789()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilParry_6789",
    testCategory,
    6789,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidDeathCoilMiss_6789()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilMiss_6789",
    testCategory,
    6789,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDeathCoilResist_6789()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilResist_6789",
    testCategory,
    6789,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDeathCoilImmune_6789()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilImmune_6789",
    testCategory,
    6789,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDeathCoilReflect_6789()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilReflect_6789",
    testCategory,
    6789,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidDeathCoilAbsorbIgnored_6789()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidDeathCoilAbsorbIgnored_6789",
    testCategory,
    6789,
    "DeathCoil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFearDodge_6215()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearDodge_6215",
    testCategory,
    6215,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFearBlock_6215()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearBlock_6215",
    testCategory,
    6215,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFearParry_6215()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearParry_6215",
    testCategory,
    6215,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFearMiss_6215()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearMiss_6215",
    testCategory,
    6215,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFearResist_6215()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearResist_6215",
    testCategory,
    6215,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFearImmune_6215()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearImmune_6215",
    testCategory,
    6215,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFearReflect_6215()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearReflect_6215",
    testCategory,
    6215,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFearAbsorbIgnored_6215()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFearAbsorbIgnored_6215",
    testCategory,
    6215,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFearDodge_6213()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearDodge_6213",
    testCategory,
    6213,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFearBlock_6213()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearBlock_6213",
    testCategory,
    6213,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFearParry_6213()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearParry_6213",
    testCategory,
    6213,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFearMiss_6213()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearMiss_6213",
    testCategory,
    6213,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFearResist_6213()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearResist_6213",
    testCategory,
    6213,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFearImmune_6213()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearImmune_6213",
    testCategory,
    6213,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFearReflect_6213()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearReflect_6213",
    testCategory,
    6213,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFearAbsorbIgnored_6213()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFearAbsorbIgnored_6213",
    testCategory,
    6213,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFearDodge_5782()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearDodge_5782",
    testCategory,
    5782,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFearBlock_5782()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearBlock_5782",
    testCategory,
    5782,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFearParry_5782()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearParry_5782",
    testCategory,
    5782,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFearMiss_5782()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearMiss_5782",
    testCategory,
    5782,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFearResist_5782()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearResist_5782",
    testCategory,
    5782,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFearImmune_5782()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearImmune_5782",
    testCategory,
    5782,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFearReflect_5782()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFearReflect_5782",
    testCategory,
    5782,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFearAbsorbIgnored_5782()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFearAbsorbIgnored_5782",
    testCategory,
    5782,
    "Fear",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorDodge_17928()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHowlOfTerrorDodge_17928",
    testCategory,
    17928,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorBlock_17928()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHowlOfTerrorBlock_17928",
    testCategory,
    17928,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorParry_17928()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHowlOfTerrorParry_17928",
    testCategory,
    17928,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorMiss_17928()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHowlOfTerrorMiss_17928",
    testCategory,
    17928,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorResist_17928()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHowlOfTerrorResist_17928",
    testCategory,
    17928,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorImmune_17928()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHowlOfTerrorImmune_17928",
    testCategory,
    17928,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorReflect_17928()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHowlOfTerrorReflect_17928",
    testCategory,
    17928,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorAbsorbIgnored_17928()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidHowlOfTerrorAbsorbIgnored_17928",
    testCategory,
    17928,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorDodge_5484()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHowlOfTerrorDodge_5484",
    testCategory,
    5484,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorBlock_5484()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHowlOfTerrorBlock_5484",
    testCategory,
    5484,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorParry_5484()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHowlOfTerrorParry_5484",
    testCategory,
    5484,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorMiss_5484()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHowlOfTerrorMiss_5484",
    testCategory,
    5484,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorResist_5484()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHowlOfTerrorResist_5484",
    testCategory,
    5484,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorImmune_5484()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHowlOfTerrorImmune_5484",
    testCategory,
    5484,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorReflect_5484()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHowlOfTerrorReflect_5484",
    testCategory,
    5484,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidHowlOfTerrorAbsorbIgnored_5484()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidHowlOfTerrorAbsorbIgnored_5484",
    testCategory,
    5484,
    "HowlOfTerror",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
