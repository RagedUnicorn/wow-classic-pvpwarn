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
mod.testCombatEventsSelfAvoidHunterTbc = me

me.tag = "TestCombatEventsSelfAvoidHunterTbc"

local testCategory = "hunter"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testselfavoidcombatevent hunter")
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
  for _, id in ipairs({ 25295, 27016 }) do
    local prefix = "TestCombatEventSelfAvoidSerpentSting"
    local suffix = "_" .. id
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Dodge" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Block" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Parry" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Miss" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Resist" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Immune" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Reflect" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "AbsorbIgnored" .. suffix])
  end
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidViperStingDodge_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidViperStingBlock_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidViperStingParry_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidViperStingMiss_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidViperStingResist_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidViperStingImmune_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidViperStingReflect_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidViperStingAbsorbIgnored_27018)
end

function me.TestCombatEventSelfAvoidSerpentStingDodge_25295()
  rel(
    "TestCombatEventSelfAvoidSerpentStingDodge_25295",
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end
function me.TestCombatEventSelfAvoidSerpentStingBlock_25295()
  rel(
    "TestCombatEventSelfAvoidSerpentStingBlock_25295",
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end
function me.TestCombatEventSelfAvoidSerpentStingParry_25295()
  rel(
    "TestCombatEventSelfAvoidSerpentStingParry_25295",
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end
function me.TestCombatEventSelfAvoidSerpentStingMiss_25295()
  rel(
    "TestCombatEventSelfAvoidSerpentStingMiss_25295", 25295, "Serpent Sting", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end
function me.TestCombatEventSelfAvoidSerpentStingResist_25295()
  rel(
    "TestCombatEventSelfAvoidSerpentStingResist_25295",
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end
function me.TestCombatEventSelfAvoidSerpentStingImmune_25295()
  rel(
    "TestCombatEventSelfAvoidSerpentStingImmune_25295",
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end
function me.TestCombatEventSelfAvoidSerpentStingReflect_25295()
  rel(
    "TestCombatEventSelfAvoidSerpentStingReflect_25295",
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end
function me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_25295()
  irr(
    "TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_25295",
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidSerpentStingDodge_27016()
  rel(
    "TestCombatEventSelfAvoidSerpentStingDodge_27016",
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end
function me.TestCombatEventSelfAvoidSerpentStingBlock_27016()
  rel(
    "TestCombatEventSelfAvoidSerpentStingBlock_27016",
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end
function me.TestCombatEventSelfAvoidSerpentStingParry_27016()
  rel(
    "TestCombatEventSelfAvoidSerpentStingParry_27016",
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end
function me.TestCombatEventSelfAvoidSerpentStingMiss_27016()
  rel(
    "TestCombatEventSelfAvoidSerpentStingMiss_27016", 27016, "Serpent Sting", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end
function me.TestCombatEventSelfAvoidSerpentStingResist_27016()
  rel(
    "TestCombatEventSelfAvoidSerpentStingResist_27016",
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end
function me.TestCombatEventSelfAvoidSerpentStingImmune_27016()
  rel(
    "TestCombatEventSelfAvoidSerpentStingImmune_27016",
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end
function me.TestCombatEventSelfAvoidSerpentStingReflect_27016()
  rel(
    "TestCombatEventSelfAvoidSerpentStingReflect_27016",
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end
function me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_27016()
  irr(
    "TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_27016",
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidViperStingDodge_27018()
  rel("TestCombatEventSelfAvoidViperStingDodge_27018", 27018, "Viper Sting", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventSelfAvoidViperStingBlock_27018()
  rel("TestCombatEventSelfAvoidViperStingBlock_27018", 27018, "Viper Sting", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventSelfAvoidViperStingParry_27018()
  rel("TestCombatEventSelfAvoidViperStingParry_27018", 27018, "Viper Sting", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventSelfAvoidViperStingMiss_27018()
  rel("TestCombatEventSelfAvoidViperStingMiss_27018", 27018, "Viper Sting", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventSelfAvoidViperStingResist_27018()
  rel(
    "TestCombatEventSelfAvoidViperStingResist_27018", 27018, "Viper Sting", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end
function me.TestCombatEventSelfAvoidViperStingImmune_27018()
  rel(
    "TestCombatEventSelfAvoidViperStingImmune_27018", 27018, "Viper Sting", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end
function me.TestCombatEventSelfAvoidViperStingReflect_27018()
  rel(
    "TestCombatEventSelfAvoidViperStingReflect_27018",
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end
function me.TestCombatEventSelfAvoidViperStingAbsorbIgnored_27018()
  irr(
    "TestCombatEventSelfAvoidViperStingAbsorbIgnored_27018",
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
