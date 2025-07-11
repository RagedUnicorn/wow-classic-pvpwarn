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
mod.testCombatEventsEnemyAvoidPaladin = me

me.tag = "TestCombatEventsEnemyAvoidPaladin"

local testGroupName = "CombatEventsEnemyAvoidPaladin"
local testCategory = "paladin"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfWrathDodge_24239)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfWrathBlock_24239)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfWrathParry_24239)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfWrathMiss_24239)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfWrathResist_24239)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfWrathImmune_24239)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfWrathReflect_24239)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfWrathAbsorbIgnored_24239)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeDodge_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeBlock_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeParry_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeMiss_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeResist_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeImmune_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeReflect_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeAbsorbIgnored_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeDodge_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeBlock_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeParry_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeMiss_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeResist_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeImmune_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeReflect_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeAbsorbIgnored_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeDodge_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeBlock_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeParry_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeMiss_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeResist_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeImmune_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeReflect_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeAbsorbIgnored_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeDodge_5589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeBlock_5589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeParry_5589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeMiss_5589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeResist_5589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeImmune_5589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeReflect_5589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHammerOfJusticeAbsorbIgnored_5589)
end

function me.TestCombatEventEnemyAvoidHammerOfWrathDodge_24239()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfWrathDodge_24239",
    testCategory,
    24239,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidHammerOfWrathBlock_24239()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfWrathBlock_24239",
    testCategory,
    24239,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidHammerOfWrathParry_24239()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfWrathParry_24239",
    testCategory,
    24239,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidHammerOfWrathMiss_24239()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfWrathMiss_24239",
    testCategory,
    24239,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidHammerOfWrathResist_24239()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfWrathResist_24239",
    testCategory,
    24239,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidHammerOfWrathImmune_24239()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfWrathImmune_24239",
    testCategory,
    24239,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidHammerOfWrathReflect_24239()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfWrathReflect_24239",
    testCategory,
    24239,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidHammerOfWrathAbsorbIgnored_24239()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidHammerOfWrathAbsorbIgnored_24239",
    testCategory,
    24239,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeDodge_10308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeDodge_10308",
    testCategory,
    10308,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeBlock_10308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeBlock_10308",
    testCategory,
    10308,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeParry_10308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeParry_10308",
    testCategory,
    10308,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeMiss_10308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeMiss_10308",
    testCategory,
    10308,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeResist_10308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeResist_10308",
    testCategory,
    10308,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeImmune_10308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeImmune_10308",
    testCategory,
    10308,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeReflect_10308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeReflect_10308",
    testCategory,
    10308,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeAbsorbIgnored_10308()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidHammerOfJusticeAbsorbIgnored_10308",
    testCategory,
    10308,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeDodge_853()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeDodge_853",
    testCategory,
    853,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeBlock_853()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeBlock_853",
    testCategory,
    853,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeParry_853()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeParry_853",
    testCategory,
    853,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeMiss_853()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeMiss_853",
    testCategory,
    853,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeResist_853()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeResist_853",
    testCategory,
    853,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeImmune_853()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeImmune_853",
    testCategory,
    853,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeReflect_853()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeReflect_853",
    testCategory,
    853,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeAbsorbIgnored_853()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidHammerOfJusticeAbsorbIgnored_853",
    testCategory,
    853,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeDodge_5588()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeDodge_5588",
    testCategory,
    5588,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeBlock_5588()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeBlock_5588",
    testCategory,
    5588,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeParry_5588()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeParry_5588",
    testCategory,
    5588,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeMiss_5588()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeMiss_5588",
    testCategory,
    5588,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeResist_5588()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeResist_5588",
    testCategory,
    5588,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeImmune_5588()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeImmune_5588",
    testCategory,
    5588,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeReflect_5588()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeReflect_5588",
    testCategory,
    5588,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeAbsorbIgnored_5588()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidHammerOfJusticeAbsorbIgnored_5588",
    testCategory,
    5588,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeDodge_5589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeDodge_5589",
    testCategory,
    5589,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeBlock_5589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeBlock_5589",
    testCategory,
    5589,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeParry_5589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeParry_5589",
    testCategory,
    5589,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeMiss_5589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeMiss_5589",
    testCategory,
    5589,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeResist_5589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeResist_5589",
    testCategory,
    5589,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeImmune_5589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeImmune_5589",
    testCategory,
    5589,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeReflect_5589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHammerOfJusticeReflect_5589",
    testCategory,
    5589,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidHammerOfJusticeAbsorbIgnored_5589()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidHammerOfJusticeAbsorbIgnored_5589",
    testCategory,
    5589,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
