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

local function rel(name, id, spellName, mt)
  mod.testHelper.TestCombatEventSpellMissed(name, testCategory, id, spellName,
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, mt)
end
local function irr(name, id, spellName, mt)
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(name, testCategory, id, spellName,
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, mt)
end

local entries = {
  { id = 26989, fnName = "EntanglingRoots", spellName = "Entangling Roots" },
  { id = 26993, fnName = "FaerieFire", spellName = "Faerie Fire" },
  { id = 27011, fnName = "FaerieFireFeral", spellName = "Faerie Fire (Feral)" },
}

function me.CollectTestCases()
  for _, e in ipairs(entries) do
    local prefix = "TestCombatEventEnemyAvoid" .. e.fnName
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

function me.TestCombatEventEnemyAvoidEntanglingRootsDodge_26989()
  rel(
    "TestCombatEventEnemyAvoidEntanglingRootsDodge_26989",
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end
function me.TestCombatEventEnemyAvoidEntanglingRootsBlock_26989()
  rel(
    "TestCombatEventEnemyAvoidEntanglingRootsBlock_26989",
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end
function me.TestCombatEventEnemyAvoidEntanglingRootsParry_26989()
  rel(
    "TestCombatEventEnemyAvoidEntanglingRootsParry_26989",
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end
function me.TestCombatEventEnemyAvoidEntanglingRootsMiss_26989()
  rel(
    "TestCombatEventEnemyAvoidEntanglingRootsMiss_26989",
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end
function me.TestCombatEventEnemyAvoidEntanglingRootsResist_26989()
  rel(
    "TestCombatEventEnemyAvoidEntanglingRootsResist_26989",
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end
function me.TestCombatEventEnemyAvoidEntanglingRootsImmune_26989()
  rel(
    "TestCombatEventEnemyAvoidEntanglingRootsImmune_26989",
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end
function me.TestCombatEventEnemyAvoidEntanglingRootsReflect_26989()
  rel(
    "TestCombatEventEnemyAvoidEntanglingRootsReflect_26989",
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end
function me.TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_26989()
  irr(
    "TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_26989",
    26989,
    "Entangling Roots",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireDodge_26993()
  rel(
    "TestCombatEventEnemyAvoidFaerieFireDodge_26993", 26993, "Faerie Fire", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end
function me.TestCombatEventEnemyAvoidFaerieFireBlock_26993()
  rel(
    "TestCombatEventEnemyAvoidFaerieFireBlock_26993", 26993, "Faerie Fire", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end
function me.TestCombatEventEnemyAvoidFaerieFireParry_26993()
  rel(
    "TestCombatEventEnemyAvoidFaerieFireParry_26993", 26993, "Faerie Fire", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end
function me.TestCombatEventEnemyAvoidFaerieFireMiss_26993()
  rel("TestCombatEventEnemyAvoidFaerieFireMiss_26993", 26993, "Faerie Fire", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventEnemyAvoidFaerieFireResist_26993()
  rel(
    "TestCombatEventEnemyAvoidFaerieFireResist_26993",
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end
function me.TestCombatEventEnemyAvoidFaerieFireImmune_26993()
  rel(
    "TestCombatEventEnemyAvoidFaerieFireImmune_26993",
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end
function me.TestCombatEventEnemyAvoidFaerieFireReflect_26993()
  rel(
    "TestCombatEventEnemyAvoidFaerieFireReflect_26993",
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end
function me.TestCombatEventEnemyAvoidFaerieFireAbsorbIgnored_26993()
  irr(
    "TestCombatEventEnemyAvoidFaerieFireAbsorbIgnored_26993",
    26993,
    "Faerie Fire",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralDodge_27011()
  rel(
    "TestCombatEventEnemyAvoidFaerieFireFeralDodge_27011",
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end
function me.TestCombatEventEnemyAvoidFaerieFireFeralBlock_27011()
  rel(
    "TestCombatEventEnemyAvoidFaerieFireFeralBlock_27011",
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end
function me.TestCombatEventEnemyAvoidFaerieFireFeralParry_27011()
  rel(
    "TestCombatEventEnemyAvoidFaerieFireFeralParry_27011",
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end
function me.TestCombatEventEnemyAvoidFaerieFireFeralMiss_27011()
  rel(
    "TestCombatEventEnemyAvoidFaerieFireFeralMiss_27011",
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end
function me.TestCombatEventEnemyAvoidFaerieFireFeralResist_27011()
  rel(
    "TestCombatEventEnemyAvoidFaerieFireFeralResist_27011",
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end
function me.TestCombatEventEnemyAvoidFaerieFireFeralImmune_27011()
  rel(
    "TestCombatEventEnemyAvoidFaerieFireFeralImmune_27011",
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end
function me.TestCombatEventEnemyAvoidFaerieFireFeralReflect_27011()
  rel(
    "TestCombatEventEnemyAvoidFaerieFireFeralReflect_27011",
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end
function me.TestCombatEventEnemyAvoidFaerieFireFeralAbsorbIgnored_27011()
  irr(
    "TestCombatEventEnemyAvoidFaerieFireFeralAbsorbIgnored_27011",
    27011,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
