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
mod.testCombatEventsEnemyAvoidMageTbc = me

me.tag = "TestCombatEventsEnemyAvoidMageTbc"

local testCategory = "mage"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testenemycombatevent mage")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostNovaDodge_27088)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostNovaBlock_27088)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostNovaParry_27088)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostNovaMiss_27088)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostNovaResist_27088)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostNovaImmune_27088)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostNovaReflect_27088)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostNovaAbsorbIgnored_27088)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidConeOfColdDodge_27087)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidConeOfColdBlock_27087)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidConeOfColdParry_27087)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidConeOfColdMiss_27087)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidConeOfColdResist_27087)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidConeOfColdImmune_27087)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidConeOfColdReflect_27087)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_27087)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDragonsBreathDodge_31661)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDragonsBreathBlock_31661)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDragonsBreathParry_31661)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDragonsBreathMiss_31661)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDragonsBreathResist_31661)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDragonsBreathImmune_31661)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDragonsBreathReflect_31661)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDragonsBreathAbsorbIgnored_31661)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSpellstealDodge_30449)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSpellstealBlock_30449)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSpellstealParry_30449)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSpellstealMiss_30449)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSpellstealResist_30449)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSpellstealImmune_30449)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSpellstealReflect_30449)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSpellstealAbsorbIgnored_30449)
end

function me.TestCombatEventEnemyAvoidFrostNovaDodge_27088()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaDodge_27088",
    testCategory,
    27088,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaBlock_27088()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaBlock_27088",
    testCategory,
    27088,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaParry_27088()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaParry_27088",
    testCategory,
    27088,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaMiss_27088()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaMiss_27088",
    testCategory,
    27088,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaResist_27088()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaResist_27088",
    testCategory,
    27088,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaImmune_27088()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaImmune_27088",
    testCategory,
    27088,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaReflect_27088()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaReflect_27088",
    testCategory,
    27088,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaAbsorbIgnored_27088()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFrostNovaAbsorbIgnored_27088",
    testCategory,
    27088,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdDodge_27087()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdDodge_27087",
    testCategory,
    27087,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdBlock_27087()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdBlock_27087",
    testCategory,
    27087,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdParry_27087()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdParry_27087",
    testCategory,
    27087,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdMiss_27087()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdMiss_27087",
    testCategory,
    27087,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdResist_27087()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdResist_27087",
    testCategory,
    27087,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdImmune_27087()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdImmune_27087",
    testCategory,
    27087,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdReflect_27087()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdReflect_27087",
    testCategory,
    27087,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_27087()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_27087",
    testCategory,
    27087,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidDragonsBreathDodge_31661()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDragonsBreathDodge_31661",
    testCategory,
    31661,
    "Dragon's Breath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidDragonsBreathBlock_31661()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDragonsBreathBlock_31661",
    testCategory,
    31661,
    "Dragon's Breath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidDragonsBreathParry_31661()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDragonsBreathParry_31661",
    testCategory,
    31661,
    "Dragon's Breath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidDragonsBreathMiss_31661()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDragonsBreathMiss_31661",
    testCategory,
    31661,
    "Dragon's Breath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidDragonsBreathResist_31661()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDragonsBreathResist_31661",
    testCategory,
    31661,
    "Dragon's Breath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidDragonsBreathImmune_31661()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDragonsBreathImmune_31661",
    testCategory,
    31661,
    "Dragon's Breath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDragonsBreathReflect_31661()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDragonsBreathReflect_31661",
    testCategory,
    31661,
    "Dragon's Breath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidDragonsBreathAbsorbIgnored_31661()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidDragonsBreathAbsorbIgnored_31661",
    testCategory,
    31661,
    "Dragon's Breath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidSpellstealDodge_30449()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSpellstealDodge_30449",
    testCategory,
    30449,
    "Spellsteal",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSpellstealBlock_30449()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSpellstealBlock_30449",
    testCategory,
    30449,
    "Spellsteal",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidSpellstealParry_30449()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSpellstealParry_30449",
    testCategory,
    30449,
    "Spellsteal",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidSpellstealMiss_30449()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSpellstealMiss_30449",
    testCategory,
    30449,
    "Spellsteal",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidSpellstealResist_30449()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSpellstealResist_30449",
    testCategory,
    30449,
    "Spellsteal",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidSpellstealImmune_30449()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSpellstealImmune_30449",
    testCategory,
    30449,
    "Spellsteal",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidSpellstealReflect_30449()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSpellstealReflect_30449",
    testCategory,
    30449,
    "Spellsteal",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidSpellstealAbsorbIgnored_30449()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidSpellstealAbsorbIgnored_30449",
    testCategory,
    30449,
    "Spellsteal",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
