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

local function rel(name, id, spellName, mt)
  mod.testHelper.TestCombatEventSpellMissed(name, testCategory, id, spellName,
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, mt)
end
local function irr(name, id, spellName, mt)
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(name, testCategory, id, spellName,
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, mt)
end

local entries = {
  { id = 26989, fnName = "EntanglingRoots", spellName = "Entangling Roots" },
  { id = 26993, fnName = "FaerieFire", spellName = "Faerie Fire" },
  { id = 27011, fnName = "FaerieFireFeral", spellName = "Faerie Fire (Feral)" },
}

function me.CollectTestCases()
  for _, e in ipairs(entries) do
    local prefix = "TestCombatEventSelfAvoid" .. e.fnName
    local suffix = "_" .. e.id
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Dodge" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Block" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Parry" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Miss" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Resist" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Immune" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Reflect" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "AbsorbIgnored" .. suffix])
  end
end

function me.TestCombatEventSelfAvoidEntanglingRootsDodge_26989()
  rel("TestCombatEventSelfAvoidEntanglingRootsDodge_26989", 26989, "Entangling Roots", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventSelfAvoidEntanglingRootsBlock_26989()
  rel("TestCombatEventSelfAvoidEntanglingRootsBlock_26989", 26989, "Entangling Roots", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventSelfAvoidEntanglingRootsParry_26989()
  rel("TestCombatEventSelfAvoidEntanglingRootsParry_26989", 26989, "Entangling Roots", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventSelfAvoidEntanglingRootsMiss_26989()
  rel("TestCombatEventSelfAvoidEntanglingRootsMiss_26989", 26989, "Entangling Roots", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventSelfAvoidEntanglingRootsResist_26989()
  rel("TestCombatEventSelfAvoidEntanglingRootsResist_26989", 26989, "Entangling Roots", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventSelfAvoidEntanglingRootsImmune_26989()
  rel("TestCombatEventSelfAvoidEntanglingRootsImmune_26989", 26989, "Entangling Roots", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventSelfAvoidEntanglingRootsReflect_26989()
  rel("TestCombatEventSelfAvoidEntanglingRootsReflect_26989", 26989, "Entangling Roots", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_26989()
  irr("TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_26989", 26989, "Entangling Roots", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end

function me.TestCombatEventSelfAvoidFaerieFireDodge_26993()
  rel("TestCombatEventSelfAvoidFaerieFireDodge_26993", 26993, "Faerie Fire", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventSelfAvoidFaerieFireBlock_26993()
  rel("TestCombatEventSelfAvoidFaerieFireBlock_26993", 26993, "Faerie Fire", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventSelfAvoidFaerieFireParry_26993()
  rel("TestCombatEventSelfAvoidFaerieFireParry_26993", 26993, "Faerie Fire", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventSelfAvoidFaerieFireMiss_26993()
  rel("TestCombatEventSelfAvoidFaerieFireMiss_26993", 26993, "Faerie Fire", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventSelfAvoidFaerieFireResist_26993()
  rel("TestCombatEventSelfAvoidFaerieFireResist_26993", 26993, "Faerie Fire", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventSelfAvoidFaerieFireImmune_26993()
  rel("TestCombatEventSelfAvoidFaerieFireImmune_26993", 26993, "Faerie Fire", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventSelfAvoidFaerieFireReflect_26993()
  rel("TestCombatEventSelfAvoidFaerieFireReflect_26993", 26993, "Faerie Fire", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventSelfAvoidFaerieFireAbsorbIgnored_26993()
  irr("TestCombatEventSelfAvoidFaerieFireAbsorbIgnored_26993", 26993, "Faerie Fire", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end

function me.TestCombatEventSelfAvoidFaerieFireFeralDodge_27011()
  rel("TestCombatEventSelfAvoidFaerieFireFeralDodge_27011", 27011, "Faerie Fire (Feral)", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventSelfAvoidFaerieFireFeralBlock_27011()
  rel("TestCombatEventSelfAvoidFaerieFireFeralBlock_27011", 27011, "Faerie Fire (Feral)", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventSelfAvoidFaerieFireFeralParry_27011()
  rel("TestCombatEventSelfAvoidFaerieFireFeralParry_27011", 27011, "Faerie Fire (Feral)", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventSelfAvoidFaerieFireFeralMiss_27011()
  rel("TestCombatEventSelfAvoidFaerieFireFeralMiss_27011", 27011, "Faerie Fire (Feral)", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventSelfAvoidFaerieFireFeralResist_27011()
  rel("TestCombatEventSelfAvoidFaerieFireFeralResist_27011", 27011, "Faerie Fire (Feral)", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventSelfAvoidFaerieFireFeralImmune_27011()
  rel("TestCombatEventSelfAvoidFaerieFireFeralImmune_27011", 27011, "Faerie Fire (Feral)", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventSelfAvoidFaerieFireFeralReflect_27011()
  rel("TestCombatEventSelfAvoidFaerieFireFeralReflect_27011", 27011, "Faerie Fire (Feral)", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventSelfAvoidFaerieFireFeralAbsorbIgnored_27011()
  irr("TestCombatEventSelfAvoidFaerieFireFeralAbsorbIgnored_27011", 27011, "Faerie Fire (Feral)", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end
