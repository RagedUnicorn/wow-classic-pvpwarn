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
mod.testCombatEventsSelfAvoidPriestTbc = me

me.tag = "TestCombatEventsSelfAvoidPriestTbc"

local testCategory = "priest"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testselfavoidcombatevent priest")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDevouringPlagueDodge_25467)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDevouringPlagueBlock_25467)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDevouringPlagueParry_25467)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDevouringPlagueMiss_25467)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDevouringPlagueResist_25467)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDevouringPlagueImmune_25467)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDevouringPlagueReflect_25467)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_25467)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidManaBurnDodge_25379)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidManaBurnBlock_25379)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidManaBurnParry_25379)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidManaBurnMiss_25379)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidManaBurnResist_25379)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidManaBurnImmune_25379)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidManaBurnReflect_25379)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidManaBurnAbsorbIgnored_25379)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidManaBurnDodge_25380)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidManaBurnBlock_25380)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidManaBurnParry_25380)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidManaBurnMiss_25380)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidManaBurnResist_25380)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidManaBurnImmune_25380)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidManaBurnReflect_25380)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidManaBurnAbsorbIgnored_25380)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidShadowWordPainDodge_25367)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidShadowWordPainBlock_25367)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidShadowWordPainParry_25367)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidShadowWordPainMiss_25367)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidShadowWordPainResist_25367)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidShadowWordPainImmune_25367)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidShadowWordPainReflect_25367)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_25367)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidShadowWordPainDodge_25368)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidShadowWordPainBlock_25368)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidShadowWordPainParry_25368)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidShadowWordPainMiss_25368)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidShadowWordPainResist_25368)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidShadowWordPainImmune_25368)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidShadowWordPainReflect_25368)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_25368)
end

local function relevantSelf(testName, spellId, spellName, missType)
  mod.testHelper.TestCombatEventSpellMissed(
    testName, testCategory, spellId, spellName,
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, missType
  )
end

local function irrelevantSelf(testName, spellId, spellName, missType)
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    testName, testCategory, spellId, spellName,
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, missType
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueDodge_25467()
  relevantSelf(
    "TestCombatEventSelfAvoidDevouringPlagueDodge_25467",
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueBlock_25467()
  relevantSelf(
    "TestCombatEventSelfAvoidDevouringPlagueBlock_25467",
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueParry_25467()
  relevantSelf(
    "TestCombatEventSelfAvoidDevouringPlagueParry_25467",
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueMiss_25467()
  relevantSelf(
    "TestCombatEventSelfAvoidDevouringPlagueMiss_25467",
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueResist_25467()
  relevantSelf(
    "TestCombatEventSelfAvoidDevouringPlagueResist_25467",
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueImmune_25467()
  relevantSelf(
    "TestCombatEventSelfAvoidDevouringPlagueImmune_25467",
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueReflect_25467()
  relevantSelf(
    "TestCombatEventSelfAvoidDevouringPlagueReflect_25467",
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_25467()
  irrelevantSelf(
    "TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_25467",
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidManaBurnDodge_25379()
  relevantSelf(
    "TestCombatEventSelfAvoidManaBurnDodge_25379", 25379, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidManaBurnBlock_25379()
  relevantSelf(
    "TestCombatEventSelfAvoidManaBurnBlock_25379", 25379, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidManaBurnParry_25379()
  relevantSelf(
    "TestCombatEventSelfAvoidManaBurnParry_25379", 25379, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidManaBurnMiss_25379()
  relevantSelf(
    "TestCombatEventSelfAvoidManaBurnMiss_25379", 25379, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidManaBurnResist_25379()
  relevantSelf(
    "TestCombatEventSelfAvoidManaBurnResist_25379", 25379, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidManaBurnImmune_25379()
  relevantSelf(
    "TestCombatEventSelfAvoidManaBurnImmune_25379", 25379, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidManaBurnReflect_25379()
  relevantSelf(
    "TestCombatEventSelfAvoidManaBurnReflect_25379", 25379, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidManaBurnAbsorbIgnored_25379()
  irrelevantSelf(
    "TestCombatEventSelfAvoidManaBurnAbsorbIgnored_25379",
    25379,
    "Mana Burn",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidManaBurnDodge_25380()
  relevantSelf(
    "TestCombatEventSelfAvoidManaBurnDodge_25380", 25380, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidManaBurnBlock_25380()
  relevantSelf(
    "TestCombatEventSelfAvoidManaBurnBlock_25380", 25380, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidManaBurnParry_25380()
  relevantSelf(
    "TestCombatEventSelfAvoidManaBurnParry_25380", 25380, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidManaBurnMiss_25380()
  relevantSelf(
    "TestCombatEventSelfAvoidManaBurnMiss_25380", 25380, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidManaBurnResist_25380()
  relevantSelf(
    "TestCombatEventSelfAvoidManaBurnResist_25380", 25380, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidManaBurnImmune_25380()
  relevantSelf(
    "TestCombatEventSelfAvoidManaBurnImmune_25380", 25380, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidManaBurnReflect_25380()
  relevantSelf(
    "TestCombatEventSelfAvoidManaBurnReflect_25380", 25380, "Mana Burn", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidManaBurnAbsorbIgnored_25380()
  irrelevantSelf(
    "TestCombatEventSelfAvoidManaBurnAbsorbIgnored_25380",
    25380,
    "Mana Burn",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainDodge_25367()
  relevantSelf(
    "TestCombatEventSelfAvoidShadowWordPainDodge_25367",
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainBlock_25367()
  relevantSelf(
    "TestCombatEventSelfAvoidShadowWordPainBlock_25367",
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainParry_25367()
  relevantSelf(
    "TestCombatEventSelfAvoidShadowWordPainParry_25367",
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainMiss_25367()
  relevantSelf(
    "TestCombatEventSelfAvoidShadowWordPainMiss_25367",
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainResist_25367()
  relevantSelf(
    "TestCombatEventSelfAvoidShadowWordPainResist_25367",
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainImmune_25367()
  relevantSelf(
    "TestCombatEventSelfAvoidShadowWordPainImmune_25367",
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainReflect_25367()
  relevantSelf(
    "TestCombatEventSelfAvoidShadowWordPainReflect_25367",
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_25367()
  irrelevantSelf(
    "TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_25367",
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainDodge_25368()
  relevantSelf(
    "TestCombatEventSelfAvoidShadowWordPainDodge_25368",
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainBlock_25368()
  relevantSelf(
    "TestCombatEventSelfAvoidShadowWordPainBlock_25368",
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainParry_25368()
  relevantSelf(
    "TestCombatEventSelfAvoidShadowWordPainParry_25368",
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainMiss_25368()
  relevantSelf(
    "TestCombatEventSelfAvoidShadowWordPainMiss_25368",
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainResist_25368()
  relevantSelf(
    "TestCombatEventSelfAvoidShadowWordPainResist_25368",
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainImmune_25368()
  relevantSelf(
    "TestCombatEventSelfAvoidShadowWordPainImmune_25368",
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainReflect_25368()
  relevantSelf(
    "TestCombatEventSelfAvoidShadowWordPainReflect_25368",
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_25368()
  irrelevantSelf(
    "TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_25368",
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
