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
mod.testCombatEventsSelfAvoidWarlockTbc = me

me.tag = "TestCombatEventsSelfAvoidWarlockTbc"

local testCategory = "warlock"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testselfavoidcombatevent warlock")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDeathCoilDodge_27223)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDeathCoilBlock_27223)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDeathCoilParry_27223)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDeathCoilMiss_27223)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDeathCoilResist_27223)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDeathCoilImmune_27223)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDeathCoilReflect_27223)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDeathCoilAbsorbIgnored_27223)
end

function me.TestCombatEventSelfAvoidDeathCoilDodge_27223()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilDodge_27223",
    testCategory,
    27223,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidDeathCoilBlock_27223()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilBlock_27223",
    testCategory,
    27223,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidDeathCoilParry_27223()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilParry_27223",
    testCategory,
    27223,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidDeathCoilMiss_27223()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilMiss_27223",
    testCategory,
    27223,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDeathCoilResist_27223()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilResist_27223",
    testCategory,
    27223,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDeathCoilImmune_27223()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilImmune_27223",
    testCategory,
    27223,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDeathCoilReflect_27223()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeathCoilReflect_27223",
    testCategory,
    27223,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidDeathCoilAbsorbIgnored_27223()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidDeathCoilAbsorbIgnored_27223",
    testCategory,
    27223,
    "Death Coil",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
