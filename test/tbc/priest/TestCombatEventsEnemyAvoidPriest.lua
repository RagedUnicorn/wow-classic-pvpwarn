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
mod.testCombatEventsEnemyAvoidPriestTbc = me

me.tag = "TestCombatEventsEnemyAvoidPriestTbc"

local testCategory = "priest"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testenemycombatevent priest")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDevouringPlagueDodge_25467)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDevouringPlagueBlock_25467)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDevouringPlagueParry_25467)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDevouringPlagueMiss_25467)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDevouringPlagueResist_25467)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDevouringPlagueImmune_25467)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDevouringPlagueReflect_25467)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_25467)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidManaBurnDodge_25379)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidManaBurnBlock_25379)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidManaBurnParry_25379)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidManaBurnMiss_25379)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidManaBurnResist_25379)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidManaBurnImmune_25379)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidManaBurnReflect_25379)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_25379)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidManaBurnDodge_25380)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidManaBurnBlock_25380)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidManaBurnParry_25380)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidManaBurnMiss_25380)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidManaBurnResist_25380)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidManaBurnImmune_25380)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidManaBurnReflect_25380)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_25380)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidShadowWordPainDodge_25367)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidShadowWordPainBlock_25367)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidShadowWordPainParry_25367)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidShadowWordPainMiss_25367)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidShadowWordPainResist_25367)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidShadowWordPainImmune_25367)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidShadowWordPainReflect_25367)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_25367)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidShadowWordPainDodge_25368)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidShadowWordPainBlock_25368)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidShadowWordPainParry_25368)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidShadowWordPainMiss_25368)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidShadowWordPainResist_25368)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidShadowWordPainImmune_25368)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidShadowWordPainReflect_25368)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_25368)
end

local function relevantEnemy(testName, spellId, spellName, missType)
  mod.testHelper.TestCombatEventSpellMissed(
    testName, testCategory, spellId, spellName,
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, missType
  )
end

local function irrelevantEnemy(testName, spellId, spellName, missType)
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    testName, testCategory, spellId, spellName,
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, missType
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueDodge_25467()
  relevantEnemy("TestCombatEventEnemyAvoidDevouringPlagueDodge_25467", 25467, "Devouring Plague", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventEnemyAvoidDevouringPlagueBlock_25467()
  relevantEnemy("TestCombatEventEnemyAvoidDevouringPlagueBlock_25467", 25467, "Devouring Plague", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventEnemyAvoidDevouringPlagueParry_25467()
  relevantEnemy("TestCombatEventEnemyAvoidDevouringPlagueParry_25467", 25467, "Devouring Plague", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventEnemyAvoidDevouringPlagueMiss_25467()
  relevantEnemy("TestCombatEventEnemyAvoidDevouringPlagueMiss_25467", 25467, "Devouring Plague", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventEnemyAvoidDevouringPlagueResist_25467()
  relevantEnemy("TestCombatEventEnemyAvoidDevouringPlagueResist_25467", 25467, "Devouring Plague", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventEnemyAvoidDevouringPlagueImmune_25467()
  relevantEnemy("TestCombatEventEnemyAvoidDevouringPlagueImmune_25467", 25467, "Devouring Plague", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventEnemyAvoidDevouringPlagueReflect_25467()
  relevantEnemy("TestCombatEventEnemyAvoidDevouringPlagueReflect_25467", 25467, "Devouring Plague", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_25467()
  irrelevantEnemy("TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_25467", 25467, "Devouring Plague", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end

function me.TestCombatEventEnemyAvoidManaBurnDodge_25379()
  relevantEnemy("TestCombatEventEnemyAvoidManaBurnDodge_25379", 25379, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventEnemyAvoidManaBurnBlock_25379()
  relevantEnemy("TestCombatEventEnemyAvoidManaBurnBlock_25379", 25379, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventEnemyAvoidManaBurnParry_25379()
  relevantEnemy("TestCombatEventEnemyAvoidManaBurnParry_25379", 25379, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventEnemyAvoidManaBurnMiss_25379()
  relevantEnemy("TestCombatEventEnemyAvoidManaBurnMiss_25379", 25379, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventEnemyAvoidManaBurnResist_25379()
  relevantEnemy("TestCombatEventEnemyAvoidManaBurnResist_25379", 25379, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventEnemyAvoidManaBurnImmune_25379()
  relevantEnemy("TestCombatEventEnemyAvoidManaBurnImmune_25379", 25379, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventEnemyAvoidManaBurnReflect_25379()
  relevantEnemy("TestCombatEventEnemyAvoidManaBurnReflect_25379", 25379, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_25379()
  irrelevantEnemy("TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_25379", 25379, "Mana Burn", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end

function me.TestCombatEventEnemyAvoidManaBurnDodge_25380()
  relevantEnemy("TestCombatEventEnemyAvoidManaBurnDodge_25380", 25380, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventEnemyAvoidManaBurnBlock_25380()
  relevantEnemy("TestCombatEventEnemyAvoidManaBurnBlock_25380", 25380, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventEnemyAvoidManaBurnParry_25380()
  relevantEnemy("TestCombatEventEnemyAvoidManaBurnParry_25380", 25380, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventEnemyAvoidManaBurnMiss_25380()
  relevantEnemy("TestCombatEventEnemyAvoidManaBurnMiss_25380", 25380, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventEnemyAvoidManaBurnResist_25380()
  relevantEnemy("TestCombatEventEnemyAvoidManaBurnResist_25380", 25380, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventEnemyAvoidManaBurnImmune_25380()
  relevantEnemy("TestCombatEventEnemyAvoidManaBurnImmune_25380", 25380, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventEnemyAvoidManaBurnReflect_25380()
  relevantEnemy("TestCombatEventEnemyAvoidManaBurnReflect_25380", 25380, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_25380()
  irrelevantEnemy("TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_25380", 25380, "Mana Burn", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end

function me.TestCombatEventEnemyAvoidShadowWordPainDodge_25367()
  relevantEnemy("TestCombatEventEnemyAvoidShadowWordPainDodge_25367", 25367, "Shadow Word: Pain", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventEnemyAvoidShadowWordPainBlock_25367()
  relevantEnemy("TestCombatEventEnemyAvoidShadowWordPainBlock_25367", 25367, "Shadow Word: Pain", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventEnemyAvoidShadowWordPainParry_25367()
  relevantEnemy("TestCombatEventEnemyAvoidShadowWordPainParry_25367", 25367, "Shadow Word: Pain", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventEnemyAvoidShadowWordPainMiss_25367()
  relevantEnemy("TestCombatEventEnemyAvoidShadowWordPainMiss_25367", 25367, "Shadow Word: Pain", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventEnemyAvoidShadowWordPainResist_25367()
  relevantEnemy("TestCombatEventEnemyAvoidShadowWordPainResist_25367", 25367, "Shadow Word: Pain", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventEnemyAvoidShadowWordPainImmune_25367()
  relevantEnemy("TestCombatEventEnemyAvoidShadowWordPainImmune_25367", 25367, "Shadow Word: Pain", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventEnemyAvoidShadowWordPainReflect_25367()
  relevantEnemy("TestCombatEventEnemyAvoidShadowWordPainReflect_25367", 25367, "Shadow Word: Pain", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_25367()
  irrelevantEnemy("TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_25367", 25367, "Shadow Word: Pain", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end

function me.TestCombatEventEnemyAvoidShadowWordPainDodge_25368()
  relevantEnemy("TestCombatEventEnemyAvoidShadowWordPainDodge_25368", 25368, "Shadow Word: Pain", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventEnemyAvoidShadowWordPainBlock_25368()
  relevantEnemy("TestCombatEventEnemyAvoidShadowWordPainBlock_25368", 25368, "Shadow Word: Pain", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventEnemyAvoidShadowWordPainParry_25368()
  relevantEnemy("TestCombatEventEnemyAvoidShadowWordPainParry_25368", 25368, "Shadow Word: Pain", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventEnemyAvoidShadowWordPainMiss_25368()
  relevantEnemy("TestCombatEventEnemyAvoidShadowWordPainMiss_25368", 25368, "Shadow Word: Pain", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventEnemyAvoidShadowWordPainResist_25368()
  relevantEnemy("TestCombatEventEnemyAvoidShadowWordPainResist_25368", 25368, "Shadow Word: Pain", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventEnemyAvoidShadowWordPainImmune_25368()
  relevantEnemy("TestCombatEventEnemyAvoidShadowWordPainImmune_25368", 25368, "Shadow Word: Pain", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventEnemyAvoidShadowWordPainReflect_25368()
  relevantEnemy("TestCombatEventEnemyAvoidShadowWordPainReflect_25368", 25368, "Shadow Word: Pain", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_25368()
  irrelevantEnemy("TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_25368", 25368, "Shadow Word: Pain", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end
