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
mod.testCombatEventsSelfAvoidMageTbc = me

me.tag = "TestCombatEventsSelfAvoidMageTbc"

local testCategory = "mage"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testselfavoidcombatevent mage")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFrostNovaDodge_27088)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFrostNovaBlock_27088)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFrostNovaParry_27088)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFrostNovaMiss_27088)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFrostNovaResist_27088)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFrostNovaImmune_27088)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFrostNovaReflect_27088)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFrostNovaAbsorbIgnored_27088)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidConeOfColdDodge_27087)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidConeOfColdBlock_27087)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidConeOfColdParry_27087)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidConeOfColdMiss_27087)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidConeOfColdResist_27087)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidConeOfColdImmune_27087)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidConeOfColdReflect_27087)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_27087)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDragonsBreathDodge_31661)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDragonsBreathBlock_31661)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDragonsBreathParry_31661)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDragonsBreathMiss_31661)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDragonsBreathResist_31661)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDragonsBreathImmune_31661)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDragonsBreathReflect_31661)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDragonsBreathAbsorbIgnored_31661)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSpellstealDodge_30449)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSpellstealBlock_30449)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSpellstealParry_30449)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSpellstealMiss_30449)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSpellstealResist_30449)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSpellstealImmune_30449)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSpellstealReflect_30449)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSpellstealAbsorbIgnored_30449)
end

function me.TestCombatEventSelfAvoidFrostNovaDodge_27088()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaDodge_27088",
    testCategory,
    27088,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFrostNovaBlock_27088()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaBlock_27088",
    testCategory,
    27088,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFrostNovaParry_27088()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaParry_27088",
    testCategory,
    27088,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFrostNovaMiss_27088()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaMiss_27088",
    testCategory,
    27088,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFrostNovaResist_27088()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaResist_27088",
    testCategory,
    27088,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFrostNovaImmune_27088()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaImmune_27088",
    testCategory,
    27088,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFrostNovaReflect_27088()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaReflect_27088",
    testCategory,
    27088,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFrostNovaAbsorbIgnored_27088()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFrostNovaAbsorbIgnored_27088",
    testCategory,
    27088,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidConeOfColdDodge_27087()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdDodge_27087",
    testCategory,
    27087,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidConeOfColdBlock_27087()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdBlock_27087",
    testCategory,
    27087,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidConeOfColdParry_27087()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdParry_27087",
    testCategory,
    27087,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidConeOfColdMiss_27087()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdMiss_27087",
    testCategory,
    27087,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidConeOfColdResist_27087()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdResist_27087",
    testCategory,
    27087,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidConeOfColdImmune_27087()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdImmune_27087",
    testCategory,
    27087,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidConeOfColdReflect_27087()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdReflect_27087",
    testCategory,
    27087,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_27087()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_27087",
    testCategory,
    27087,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidDragonsBreathDodge_31661()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDragonsBreathDodge_31661",
    testCategory,
    31661,
    "Dragon's Breath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidDragonsBreathBlock_31661()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDragonsBreathBlock_31661",
    testCategory,
    31661,
    "Dragon's Breath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidDragonsBreathParry_31661()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDragonsBreathParry_31661",
    testCategory,
    31661,
    "Dragon's Breath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidDragonsBreathMiss_31661()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDragonsBreathMiss_31661",
    testCategory,
    31661,
    "Dragon's Breath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDragonsBreathResist_31661()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDragonsBreathResist_31661",
    testCategory,
    31661,
    "Dragon's Breath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDragonsBreathImmune_31661()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDragonsBreathImmune_31661",
    testCategory,
    31661,
    "Dragon's Breath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDragonsBreathReflect_31661()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDragonsBreathReflect_31661",
    testCategory,
    31661,
    "Dragon's Breath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidDragonsBreathAbsorbIgnored_31661()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidDragonsBreathAbsorbIgnored_31661",
    testCategory,
    31661,
    "Dragon's Breath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidSpellstealDodge_30449()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSpellstealDodge_30449",
    testCategory,
    30449,
    "Spellsteal",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidSpellstealBlock_30449()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSpellstealBlock_30449",
    testCategory,
    30449,
    "Spellsteal",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidSpellstealParry_30449()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSpellstealParry_30449",
    testCategory,
    30449,
    "Spellsteal",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidSpellstealMiss_30449()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSpellstealMiss_30449",
    testCategory,
    30449,
    "Spellsteal",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSpellstealResist_30449()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSpellstealResist_30449",
    testCategory,
    30449,
    "Spellsteal",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidSpellstealImmune_30449()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSpellstealImmune_30449",
    testCategory,
    30449,
    "Spellsteal",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSpellstealReflect_30449()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSpellstealReflect_30449",
    testCategory,
    30449,
    "Spellsteal",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidSpellstealAbsorbIgnored_30449()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidSpellstealAbsorbIgnored_30449",
    testCategory,
    30449,
    "Spellsteal",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
