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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidChastiseDodge_44041)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidChastiseBlock_44041)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidChastiseParry_44041)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidChastiseMiss_44041)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidChastiseResist_44041)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidChastiseImmune_44041)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidChastiseReflect_44041)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidChastiseAbsorbIgnored_44041)
end

function me.TestCombatEventEnemyAvoidDevouringPlagueDodge_25467()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueDodge_25467",
    testCategory,
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueBlock_25467()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueBlock_25467",
    testCategory,
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueParry_25467()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueParry_25467",
    testCategory,
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueMiss_25467()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueMiss_25467",
    testCategory,
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueResist_25467()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueResist_25467",
    testCategory,
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueImmune_25467()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueImmune_25467",
    testCategory,
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueReflect_25467()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDevouringPlagueReflect_25467",
    testCategory,
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_25467()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidDevouringPlagueAbsorbIgnored_25467",
    testCategory,
    25467,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidManaBurnDodge_25379()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnDodge_25379",
    testCategory,
    25379,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidManaBurnBlock_25379()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnBlock_25379",
    testCategory,
    25379,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidManaBurnParry_25379()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnParry_25379",
    testCategory,
    25379,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidManaBurnMiss_25379()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnMiss_25379",
    testCategory,
    25379,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidManaBurnResist_25379()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnResist_25379",
    testCategory,
    25379,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidManaBurnImmune_25379()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnImmune_25379",
    testCategory,
    25379,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidManaBurnReflect_25379()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnReflect_25379",
    testCategory,
    25379,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_25379()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_25379",
    testCategory,
    25379,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidManaBurnDodge_25380()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnDodge_25380",
    testCategory,
    25380,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidManaBurnBlock_25380()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnBlock_25380",
    testCategory,
    25380,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidManaBurnParry_25380()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnParry_25380",
    testCategory,
    25380,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidManaBurnMiss_25380()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnMiss_25380",
    testCategory,
    25380,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidManaBurnResist_25380()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnResist_25380",
    testCategory,
    25380,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidManaBurnImmune_25380()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnImmune_25380",
    testCategory,
    25380,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidManaBurnReflect_25380()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidManaBurnReflect_25380",
    testCategory,
    25380,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_25380()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidManaBurnAbsorbIgnored_25380",
    testCategory,
    25380,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainDodge_25367()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainDodge_25367",
    testCategory,
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainBlock_25367()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainBlock_25367",
    testCategory,
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainParry_25367()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainParry_25367",
    testCategory,
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainMiss_25367()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainMiss_25367",
    testCategory,
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainResist_25367()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainResist_25367",
    testCategory,
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainImmune_25367()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainImmune_25367",
    testCategory,
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainReflect_25367()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainReflect_25367",
    testCategory,
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_25367()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_25367",
    testCategory,
    25367,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainDodge_25368()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainDodge_25368",
    testCategory,
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainBlock_25368()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainBlock_25368",
    testCategory,
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainParry_25368()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainParry_25368",
    testCategory,
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainMiss_25368()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainMiss_25368",
    testCategory,
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainResist_25368()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainResist_25368",
    testCategory,
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainImmune_25368()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainImmune_25368",
    testCategory,
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainReflect_25368()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidShadowWordPainReflect_25368",
    testCategory,
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_25368()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidShadowWordPainAbsorbIgnored_25368",
    testCategory,
    25368,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidChastiseDodge_44041()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidChastiseDodge_44041",
    testCategory,
    44041,
    "Chastise",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidChastiseBlock_44041()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidChastiseBlock_44041",
    testCategory,
    44041,
    "Chastise",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidChastiseParry_44041()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidChastiseParry_44041",
    testCategory,
    44041,
    "Chastise",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidChastiseMiss_44041()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidChastiseMiss_44041",
    testCategory,
    44041,
    "Chastise",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidChastiseResist_44041()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidChastiseResist_44041",
    testCategory,
    44041,
    "Chastise",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidChastiseImmune_44041()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidChastiseImmune_44041",
    testCategory,
    44041,
    "Chastise",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidChastiseReflect_44041()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidChastiseReflect_44041",
    testCategory,
    44041,
    "Chastise",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidChastiseAbsorbIgnored_44041()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidChastiseAbsorbIgnored_44041",
    testCategory,
    44041,
    "Chastise",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
