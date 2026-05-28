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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidChastiseDodge_44041)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidChastiseBlock_44041)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidChastiseParry_44041)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidChastiseMiss_44041)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidChastiseResist_44041)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidChastiseImmune_44041)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidChastiseReflect_44041)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidChastiseAbsorbIgnored_44041)
end

function me.TestCombatEventSelfAvoidDevouringPlagueDodge_25467()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueDodge_25467",
    testCategory,
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueBlock_25467()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueBlock_25467",
    testCategory,
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueParry_25467()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueParry_25467",
    testCategory,
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueMiss_25467()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueMiss_25467",
    testCategory,
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueResist_25467()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueResist_25467",
    testCategory,
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueImmune_25467()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueImmune_25467",
    testCategory,
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueReflect_25467()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueReflect_25467",
    testCategory,
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_25467()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidDevouringPlagueAbsorbIgnored_25467",
    testCategory,
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidManaBurnDodge_25379()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnDodge_25379",
    testCategory,
    25379,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidManaBurnBlock_25379()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnBlock_25379",
    testCategory,
    25379,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidManaBurnParry_25379()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnParry_25379",
    testCategory,
    25379,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidManaBurnMiss_25379()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnMiss_25379",
    testCategory,
    25379,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidManaBurnResist_25379()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnResist_25379",
    testCategory,
    25379,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidManaBurnImmune_25379()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnImmune_25379",
    testCategory,
    25379,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidManaBurnReflect_25379()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnReflect_25379",
    testCategory,
    25379,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidManaBurnAbsorbIgnored_25379()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidManaBurnAbsorbIgnored_25379",
    testCategory,
    25379,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidManaBurnDodge_25380()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnDodge_25380",
    testCategory,
    25380,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidManaBurnBlock_25380()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnBlock_25380",
    testCategory,
    25380,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidManaBurnParry_25380()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnParry_25380",
    testCategory,
    25380,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidManaBurnMiss_25380()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnMiss_25380",
    testCategory,
    25380,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidManaBurnResist_25380()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnResist_25380",
    testCategory,
    25380,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidManaBurnImmune_25380()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnImmune_25380",
    testCategory,
    25380,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidManaBurnReflect_25380()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnReflect_25380",
    testCategory,
    25380,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidManaBurnAbsorbIgnored_25380()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidManaBurnAbsorbIgnored_25380",
    testCategory,
    25380,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainDodge_25367()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainDodge_25367",
    testCategory,
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainBlock_25367()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainBlock_25367",
    testCategory,
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainParry_25367()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainParry_25367",
    testCategory,
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainMiss_25367()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainMiss_25367",
    testCategory,
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainResist_25367()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainResist_25367",
    testCategory,
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainImmune_25367()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainImmune_25367",
    testCategory,
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainReflect_25367()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainReflect_25367",
    testCategory,
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_25367()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_25367",
    testCategory,
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainDodge_25368()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainDodge_25368",
    testCategory,
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainBlock_25368()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainBlock_25368",
    testCategory,
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainParry_25368()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainParry_25368",
    testCategory,
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainMiss_25368()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainMiss_25368",
    testCategory,
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainResist_25368()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainResist_25368",
    testCategory,
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainImmune_25368()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainImmune_25368",
    testCategory,
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainReflect_25368()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainReflect_25368",
    testCategory,
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_25368()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidShadowWordPainAbsorbIgnored_25368",
    testCategory,
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidChastiseDodge_44041()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidChastiseDodge_44041",
    testCategory,
    44041,
    "Chastise",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidChastiseBlock_44041()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidChastiseBlock_44041",
    testCategory,
    44041,
    "Chastise",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidChastiseParry_44041()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidChastiseParry_44041",
    testCategory,
    44041,
    "Chastise",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidChastiseMiss_44041()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidChastiseMiss_44041",
    testCategory,
    44041,
    "Chastise",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidChastiseResist_44041()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidChastiseResist_44041",
    testCategory,
    44041,
    "Chastise",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidChastiseImmune_44041()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidChastiseImmune_44041",
    testCategory,
    44041,
    "Chastise",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidChastiseReflect_44041()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidChastiseReflect_44041",
    testCategory,
    44041,
    "Chastise",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidChastiseAbsorbIgnored_44041()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidChastiseAbsorbIgnored_44041",
    testCategory,
    44041,
    "Chastise",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
