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

local function rel(name, id, spellName, mt)
  mod.testHelper.TestCombatEventSpellMissed(name, testCategory, id, spellName,
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, mt)
end
local function irr(name, id, spellName, mt)
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(name, testCategory, id, spellName,
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, mt)
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
end

function me.TestCombatEventEnemyAvoidFrostNovaDodge_27088()
  rel("TestCombatEventEnemyAvoidFrostNovaDodge_27088", 27088, "Frost Nova", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventEnemyAvoidFrostNovaBlock_27088()
  rel("TestCombatEventEnemyAvoidFrostNovaBlock_27088", 27088, "Frost Nova", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventEnemyAvoidFrostNovaParry_27088()
  rel("TestCombatEventEnemyAvoidFrostNovaParry_27088", 27088, "Frost Nova", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventEnemyAvoidFrostNovaMiss_27088()
  rel("TestCombatEventEnemyAvoidFrostNovaMiss_27088", 27088, "Frost Nova", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventEnemyAvoidFrostNovaResist_27088()
  rel("TestCombatEventEnemyAvoidFrostNovaResist_27088", 27088, "Frost Nova", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventEnemyAvoidFrostNovaImmune_27088()
  rel("TestCombatEventEnemyAvoidFrostNovaImmune_27088", 27088, "Frost Nova", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventEnemyAvoidFrostNovaReflect_27088()
  rel("TestCombatEventEnemyAvoidFrostNovaReflect_27088", 27088, "Frost Nova", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventEnemyAvoidFrostNovaAbsorbIgnored_27088()
  irr("TestCombatEventEnemyAvoidFrostNovaAbsorbIgnored_27088", 27088, "Frost Nova", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end

function me.TestCombatEventEnemyAvoidConeOfColdDodge_27087()
  rel("TestCombatEventEnemyAvoidConeOfColdDodge_27087", 27087, "Cone of Cold", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventEnemyAvoidConeOfColdBlock_27087()
  rel("TestCombatEventEnemyAvoidConeOfColdBlock_27087", 27087, "Cone of Cold", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventEnemyAvoidConeOfColdParry_27087()
  rel("TestCombatEventEnemyAvoidConeOfColdParry_27087", 27087, "Cone of Cold", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventEnemyAvoidConeOfColdMiss_27087()
  rel("TestCombatEventEnemyAvoidConeOfColdMiss_27087", 27087, "Cone of Cold", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventEnemyAvoidConeOfColdResist_27087()
  rel("TestCombatEventEnemyAvoidConeOfColdResist_27087", 27087, "Cone of Cold", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventEnemyAvoidConeOfColdImmune_27087()
  rel("TestCombatEventEnemyAvoidConeOfColdImmune_27087", 27087, "Cone of Cold", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventEnemyAvoidConeOfColdReflect_27087()
  rel("TestCombatEventEnemyAvoidConeOfColdReflect_27087", 27087, "Cone of Cold", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_27087()
  irr("TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_27087", 27087, "Cone of Cold", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end
