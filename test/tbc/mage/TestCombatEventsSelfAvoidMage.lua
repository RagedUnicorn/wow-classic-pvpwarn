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

local function rel(name, id, spellName, mt)
  mod.testHelper.TestCombatEventSpellMissed(name, testCategory, id, spellName,
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, mt)
end
local function irr(name, id, spellName, mt)
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(name, testCategory, id, spellName,
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, mt)
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
end

function me.TestCombatEventSelfAvoidFrostNovaDodge_27088()
  rel("TestCombatEventSelfAvoidFrostNovaDodge_27088", 27088, "Frost Nova", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventSelfAvoidFrostNovaBlock_27088()
  rel("TestCombatEventSelfAvoidFrostNovaBlock_27088", 27088, "Frost Nova", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventSelfAvoidFrostNovaParry_27088()
  rel("TestCombatEventSelfAvoidFrostNovaParry_27088", 27088, "Frost Nova", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventSelfAvoidFrostNovaMiss_27088()
  rel("TestCombatEventSelfAvoidFrostNovaMiss_27088", 27088, "Frost Nova", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventSelfAvoidFrostNovaResist_27088()
  rel("TestCombatEventSelfAvoidFrostNovaResist_27088", 27088, "Frost Nova", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventSelfAvoidFrostNovaImmune_27088()
  rel("TestCombatEventSelfAvoidFrostNovaImmune_27088", 27088, "Frost Nova", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventSelfAvoidFrostNovaReflect_27088()
  rel("TestCombatEventSelfAvoidFrostNovaReflect_27088", 27088, "Frost Nova", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventSelfAvoidFrostNovaAbsorbIgnored_27088()
  irr("TestCombatEventSelfAvoidFrostNovaAbsorbIgnored_27088", 27088, "Frost Nova", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end

function me.TestCombatEventSelfAvoidConeOfColdDodge_27087()
  rel("TestCombatEventSelfAvoidConeOfColdDodge_27087", 27087, "Cone of Cold", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventSelfAvoidConeOfColdBlock_27087()
  rel("TestCombatEventSelfAvoidConeOfColdBlock_27087", 27087, "Cone of Cold", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventSelfAvoidConeOfColdParry_27087()
  rel("TestCombatEventSelfAvoidConeOfColdParry_27087", 27087, "Cone of Cold", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventSelfAvoidConeOfColdMiss_27087()
  rel("TestCombatEventSelfAvoidConeOfColdMiss_27087", 27087, "Cone of Cold", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventSelfAvoidConeOfColdResist_27087()
  rel("TestCombatEventSelfAvoidConeOfColdResist_27087", 27087, "Cone of Cold", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventSelfAvoidConeOfColdImmune_27087()
  rel("TestCombatEventSelfAvoidConeOfColdImmune_27087", 27087, "Cone of Cold", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventSelfAvoidConeOfColdReflect_27087()
  rel("TestCombatEventSelfAvoidConeOfColdReflect_27087", 27087, "Cone of Cold", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_27087()
  irr("TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_27087", 27087, "Cone of Cold", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end
