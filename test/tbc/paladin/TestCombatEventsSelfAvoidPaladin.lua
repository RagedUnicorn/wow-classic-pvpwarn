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
mod.testCombatEventsSelfAvoidPaladinTbc = me

me.tag = "TestCombatEventsSelfAvoidPaladinTbc"

local testCategory = "paladin"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testselfavoidcombatevent paladin")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidHammerOfWrathDodge_27180)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidHammerOfWrathBlock_27180)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidHammerOfWrathParry_27180)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidHammerOfWrathMiss_27180)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidHammerOfWrathResist_27180)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidHammerOfWrathImmune_27180)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidHammerOfWrathReflect_27180)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidHammerOfWrathAbsorbIgnored_27180)
end

function me.TestCombatEventSelfAvoidHammerOfWrathDodge_27180()
  rel("TestCombatEventSelfAvoidHammerOfWrathDodge_27180", 27180, "Hammer of Wrath", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventSelfAvoidHammerOfWrathBlock_27180()
  rel("TestCombatEventSelfAvoidHammerOfWrathBlock_27180", 27180, "Hammer of Wrath", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventSelfAvoidHammerOfWrathParry_27180()
  rel("TestCombatEventSelfAvoidHammerOfWrathParry_27180", 27180, "Hammer of Wrath", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventSelfAvoidHammerOfWrathMiss_27180()
  rel("TestCombatEventSelfAvoidHammerOfWrathMiss_27180", 27180, "Hammer of Wrath", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventSelfAvoidHammerOfWrathResist_27180()
  rel("TestCombatEventSelfAvoidHammerOfWrathResist_27180", 27180, "Hammer of Wrath", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventSelfAvoidHammerOfWrathImmune_27180()
  rel("TestCombatEventSelfAvoidHammerOfWrathImmune_27180", 27180, "Hammer of Wrath", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventSelfAvoidHammerOfWrathReflect_27180()
  rel("TestCombatEventSelfAvoidHammerOfWrathReflect_27180", 27180, "Hammer of Wrath", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventSelfAvoidHammerOfWrathAbsorbIgnored_27180()
  irr("TestCombatEventSelfAvoidHammerOfWrathAbsorbIgnored_27180", 27180, "Hammer of Wrath", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end
