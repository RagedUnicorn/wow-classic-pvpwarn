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
mod.testCombatEventsEnemyAvoidHunterTbc = me

me.tag = "TestCombatEventsEnemyAvoidHunterTbc"

local testCategory = "hunter"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testenemycombatevent hunter")
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
  for _, id in ipairs({ 25295, 27016 }) do
    local prefix = "TestCombatEventEnemyAvoidSerpentSting"
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidViperStingDodge_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidViperStingBlock_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidViperStingParry_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidViperStingMiss_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidViperStingResist_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidViperStingImmune_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidViperStingReflect_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidViperStingAbsorbIgnored_27018)
end

function me.TestCombatEventEnemyAvoidSerpentStingDodge_25295()
  rel(
    "TestCombatEventEnemyAvoidSerpentStingDodge_25295",
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end
function me.TestCombatEventEnemyAvoidSerpentStingBlock_25295()
  rel(
    "TestCombatEventEnemyAvoidSerpentStingBlock_25295",
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end
function me.TestCombatEventEnemyAvoidSerpentStingParry_25295()
  rel(
    "TestCombatEventEnemyAvoidSerpentStingParry_25295",
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end
function me.TestCombatEventEnemyAvoidSerpentStingMiss_25295()
  rel(
    "TestCombatEventEnemyAvoidSerpentStingMiss_25295",
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end
function me.TestCombatEventEnemyAvoidSerpentStingResist_25295()
  rel(
    "TestCombatEventEnemyAvoidSerpentStingResist_25295",
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end
function me.TestCombatEventEnemyAvoidSerpentStingImmune_25295()
  rel(
    "TestCombatEventEnemyAvoidSerpentStingImmune_25295",
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end
function me.TestCombatEventEnemyAvoidSerpentStingReflect_25295()
  rel(
    "TestCombatEventEnemyAvoidSerpentStingReflect_25295",
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end
function me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_25295()
  irr(
    "TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_25295",
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingDodge_27016()
  rel(
    "TestCombatEventEnemyAvoidSerpentStingDodge_27016",
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end
function me.TestCombatEventEnemyAvoidSerpentStingBlock_27016()
  rel(
    "TestCombatEventEnemyAvoidSerpentStingBlock_27016",
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end
function me.TestCombatEventEnemyAvoidSerpentStingParry_27016()
  rel(
    "TestCombatEventEnemyAvoidSerpentStingParry_27016",
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end
function me.TestCombatEventEnemyAvoidSerpentStingMiss_27016()
  rel(
    "TestCombatEventEnemyAvoidSerpentStingMiss_27016",
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end
function me.TestCombatEventEnemyAvoidSerpentStingResist_27016()
  rel(
    "TestCombatEventEnemyAvoidSerpentStingResist_27016",
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end
function me.TestCombatEventEnemyAvoidSerpentStingImmune_27016()
  rel(
    "TestCombatEventEnemyAvoidSerpentStingImmune_27016",
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end
function me.TestCombatEventEnemyAvoidSerpentStingReflect_27016()
  rel(
    "TestCombatEventEnemyAvoidSerpentStingReflect_27016",
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end
function me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_27016()
  irr(
    "TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_27016",
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidViperStingDodge_27018()
  rel(
    "TestCombatEventEnemyAvoidViperStingDodge_27018", 27018, "Viper Sting", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end
function me.TestCombatEventEnemyAvoidViperStingBlock_27018()
  rel(
    "TestCombatEventEnemyAvoidViperStingBlock_27018", 27018, "Viper Sting", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end
function me.TestCombatEventEnemyAvoidViperStingParry_27018()
  rel(
    "TestCombatEventEnemyAvoidViperStingParry_27018", 27018, "Viper Sting", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end
function me.TestCombatEventEnemyAvoidViperStingMiss_27018()
  rel("TestCombatEventEnemyAvoidViperStingMiss_27018", 27018, "Viper Sting", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventEnemyAvoidViperStingResist_27018()
  rel(
    "TestCombatEventEnemyAvoidViperStingResist_27018",
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end
function me.TestCombatEventEnemyAvoidViperStingImmune_27018()
  rel(
    "TestCombatEventEnemyAvoidViperStingImmune_27018",
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end
function me.TestCombatEventEnemyAvoidViperStingReflect_27018()
  rel(
    "TestCombatEventEnemyAvoidViperStingReflect_27018",
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end
function me.TestCombatEventEnemyAvoidViperStingAbsorbIgnored_27018()
  irr(
    "TestCombatEventEnemyAvoidViperStingAbsorbIgnored_27018",
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
