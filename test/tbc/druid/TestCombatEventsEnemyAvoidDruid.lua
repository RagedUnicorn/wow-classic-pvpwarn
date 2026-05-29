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
mod.testCombatEventsEnemyAvoidDruidTbc = me

me.tag = "TestCombatEventsEnemyAvoidDruidTbc"

local testCategory = "druid"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testenemycombatevent druid")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEntanglingRootsDodge_26989)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEntanglingRootsBlock_26989)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEntanglingRootsParry_26989)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEntanglingRootsMiss_26989)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEntanglingRootsResist_26989)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEntanglingRootsImmune_26989)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEntanglingRootsReflect_26989)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_26989)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFaerieFireDodge_26993)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFaerieFireBlock_26993)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFaerieFireParry_26993)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFaerieFireMiss_26993)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFaerieFireResist_26993)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFaerieFireImmune_26993)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFaerieFireReflect_26993)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFaerieFireAbsorbIgnored_26993)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFaerieFireFeralDodge_27011)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFaerieFireFeralBlock_27011)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFaerieFireFeralParry_27011)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFaerieFireFeralMiss_27011)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFaerieFireFeralResist_27011)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFaerieFireFeralImmune_27011)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFaerieFireFeralReflect_27011)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFaerieFireFeralAbsorbIgnored_27011)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCycloneDodge_33786)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCycloneBlock_33786)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCycloneParry_33786)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCycloneMiss_33786)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCycloneResist_33786)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCycloneImmune_33786)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCycloneReflect_33786)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidCycloneAbsorbIgnored_33786)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMaimDodge_22570)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMaimBlock_22570)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMaimParry_22570)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMaimMiss_22570)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMaimResist_22570)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMaimImmune_22570)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMaimReflect_22570)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMaimAbsorbIgnored_22570)
end

function me.TestCombatEventEnemyAvoidEntanglingRootsDodge_26989()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsDodge_26989",
    testCategory,
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsBlock_26989()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsBlock_26989",
    testCategory,
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsParry_26989()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsParry_26989",
    testCategory,
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsMiss_26989()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsMiss_26989",
    testCategory,
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsResist_26989()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsResist_26989",
    testCategory,
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsImmune_26989()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsImmune_26989",
    testCategory,
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsReflect_26989()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsReflect_26989",
    testCategory,
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_26989()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_26989",
    testCategory,
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireDodge_26993()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireDodge_26993",
    testCategory,
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireBlock_26993()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireBlock_26993",
    testCategory,
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireParry_26993()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireParry_26993",
    testCategory,
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireMiss_26993()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireMiss_26993",
    testCategory,
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireResist_26993()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireResist_26993",
    testCategory,
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireImmune_26993()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireImmune_26993",
    testCategory,
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireReflect_26993()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireReflect_26993",
    testCategory,
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireAbsorbIgnored_26993()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFaerieFireAbsorbIgnored_26993",
    testCategory,
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralDodge_27011()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralDodge_27011",
    testCategory,
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralBlock_27011()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralBlock_27011",
    testCategory,
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralParry_27011()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralParry_27011",
    testCategory,
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralMiss_27011()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralMiss_27011",
    testCategory,
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralResist_27011()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralResist_27011",
    testCategory,
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralImmune_27011()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralImmune_27011",
    testCategory,
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralReflect_27011()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralReflect_27011",
    testCategory,
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralAbsorbIgnored_27011()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFaerieFireFeralAbsorbIgnored_27011",
    testCategory,
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidCycloneDodge_33786()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCycloneDodge_33786",
    testCategory,
    33786,
    "Cyclone",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidCycloneBlock_33786()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCycloneBlock_33786",
    testCategory,
    33786,
    "Cyclone",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidCycloneParry_33786()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCycloneParry_33786",
    testCategory,
    33786,
    "Cyclone",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidCycloneMiss_33786()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCycloneMiss_33786",
    testCategory,
    33786,
    "Cyclone",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidCycloneResist_33786()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCycloneResist_33786",
    testCategory,
    33786,
    "Cyclone",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidCycloneImmune_33786()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCycloneImmune_33786",
    testCategory,
    33786,
    "Cyclone",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidCycloneReflect_33786()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCycloneReflect_33786",
    testCategory,
    33786,
    "Cyclone",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidCycloneAbsorbIgnored_33786()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidCycloneAbsorbIgnored_33786",
    testCategory,
    33786,
    "Cyclone",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidMaimDodge_22570()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMaimDodge_22570",
    testCategory,
    22570,
    "Maim",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidMaimBlock_22570()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMaimBlock_22570",
    testCategory,
    22570,
    "Maim",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidMaimParry_22570()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMaimParry_22570",
    testCategory,
    22570,
    "Maim",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidMaimMiss_22570()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMaimMiss_22570",
    testCategory,
    22570,
    "Maim",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidMaimResist_22570()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMaimResist_22570",
    testCategory,
    22570,
    "Maim",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidMaimImmune_22570()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMaimImmune_22570",
    testCategory,
    22570,
    "Maim",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidMaimReflect_22570()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMaimReflect_22570",
    testCategory,
    22570,
    "Maim",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidMaimAbsorbIgnored_22570()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidMaimAbsorbIgnored_22570",
    testCategory,
    22570,
    "Maim",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
