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
mod.testCombatEventsSelfAvoidDruidTbc = me

me.tag = "TestCombatEventsSelfAvoidDruidTbc"

local testCategory = "druid"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testselfavoidcombatevent druid")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidEntanglingRootsDodge_26989)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidEntanglingRootsBlock_26989)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidEntanglingRootsParry_26989)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidEntanglingRootsMiss_26989)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidEntanglingRootsResist_26989)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidEntanglingRootsImmune_26989)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidEntanglingRootsReflect_26989)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_26989)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFaerieFireDodge_26993)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFaerieFireBlock_26993)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFaerieFireParry_26993)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFaerieFireMiss_26993)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFaerieFireResist_26993)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFaerieFireImmune_26993)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFaerieFireReflect_26993)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFaerieFireAbsorbIgnored_26993)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFaerieFireFeralDodge_27011)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFaerieFireFeralBlock_27011)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFaerieFireFeralParry_27011)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFaerieFireFeralMiss_27011)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFaerieFireFeralResist_27011)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFaerieFireFeralImmune_27011)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFaerieFireFeralReflect_27011)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFaerieFireFeralAbsorbIgnored_27011)
end

function me.TestCombatEventSelfAvoidEntanglingRootsDodge_26989()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsDodge_26989",
    testCategory,
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsBlock_26989()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsBlock_26989",
    testCategory,
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsParry_26989()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsParry_26989",
    testCategory,
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsMiss_26989()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsMiss_26989",
    testCategory,
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsResist_26989()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsResist_26989",
    testCategory,
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsImmune_26989()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsImmune_26989",
    testCategory,
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsReflect_26989()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsReflect_26989",
    testCategory,
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_26989()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_26989",
    testCategory,
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFaerieFireDodge_26993()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireDodge_26993",
    testCategory,
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireBlock_26993()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireBlock_26993",
    testCategory,
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFaerieFireParry_26993()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireParry_26993",
    testCategory,
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFaerieFireMiss_26993()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireMiss_26993",
    testCategory,
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFaerieFireResist_26993()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireResist_26993",
    testCategory,
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFaerieFireImmune_26993()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireImmune_26993",
    testCategory,
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireReflect_26993()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireReflect_26993",
    testCategory,
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFaerieFireAbsorbIgnored_26993()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFaerieFireAbsorbIgnored_26993",
    testCategory,
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralDodge_27011()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralDodge_27011",
    testCategory,
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralBlock_27011()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralBlock_27011",
    testCategory,
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralParry_27011()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralParry_27011",
    testCategory,
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralMiss_27011()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralMiss_27011",
    testCategory,
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralResist_27011()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralResist_27011",
    testCategory,
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralImmune_27011()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralImmune_27011",
    testCategory,
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralReflect_27011()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralReflect_27011",
    testCategory,
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralAbsorbIgnored_27011()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFaerieFireFeralAbsorbIgnored_27011",
    testCategory,
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
