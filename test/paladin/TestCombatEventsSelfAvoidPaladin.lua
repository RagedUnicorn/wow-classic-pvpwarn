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
mod.testCombatEventsSelfAvoidPaladin = me

me.tag = "TestCombatEventsSelfAvoidPaladin"

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

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfWrathDodge_24239)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfWrathBlock_24239)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfWrathParry_24239)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfWrathMiss_24239)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfWrathResist_24239)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfWrathImmune_24239)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfWrathReflect_24239)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfWrathAbsorbIgnored_24239)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeDodge_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeBlock_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeParry_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeMiss_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeResist_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeImmune_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeReflect_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeAbsorbIgnored_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeDodge_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeBlock_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeParry_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeMiss_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeResist_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeImmune_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeReflect_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeAbsorbIgnored_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeDodge_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeBlock_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeParry_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeMiss_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeResist_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeImmune_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeReflect_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeAbsorbIgnored_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeDodge_5589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeBlock_5589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeParry_5589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeMiss_5589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeResist_5589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeImmune_5589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeReflect_5589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHammerOfJusticeAbsorbIgnored_5589)
end

function me.TestCombatEventSelfAvoidHammerOfWrathDodge_24239()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfWrathDodge_24239",
    testCategory,
    24239,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidHammerOfWrathBlock_24239()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfWrathBlock_24239",
    testCategory,
    24239,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidHammerOfWrathParry_24239()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfWrathParry_24239",
    testCategory,
    24239,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidHammerOfWrathMiss_24239()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfWrathMiss_24239",
    testCategory,
    24239,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidHammerOfWrathResist_24239()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfWrathResist_24239",
    testCategory,
    24239,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidHammerOfWrathImmune_24239()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfWrathImmune_24239",
    testCategory,
    24239,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidHammerOfWrathReflect_24239()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfWrathReflect_24239",
    testCategory,
    24239,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidHammerOfWrathAbsorbIgnored_24239()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidHammerOfWrathAbsorbIgnored_24239",
    testCategory,
    24239,
    "Hammer of Wrath",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeDodge_10308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeDodge_10308",
    testCategory,
    10308,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeBlock_10308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeBlock_10308",
    testCategory,
    10308,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeParry_10308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeParry_10308",
    testCategory,
    10308,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeMiss_10308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeMiss_10308",
    testCategory,
    10308,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeResist_10308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeResist_10308",
    testCategory,
    10308,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeImmune_10308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeImmune_10308",
    testCategory,
    10308,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeReflect_10308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeReflect_10308",
    testCategory,
    10308,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeAbsorbIgnored_10308()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidHammerOfJusticeAbsorbIgnored_10308",
    testCategory,
    10308,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeDodge_853()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeDodge_853",
    testCategory,
    853,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeBlock_853()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeBlock_853",
    testCategory,
    853,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeParry_853()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeParry_853",
    testCategory,
    853,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeMiss_853()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeMiss_853",
    testCategory,
    853,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeResist_853()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeResist_853",
    testCategory,
    853,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeImmune_853()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeImmune_853",
    testCategory,
    853,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeReflect_853()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeReflect_853",
    testCategory,
    853,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeAbsorbIgnored_853()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidHammerOfJusticeAbsorbIgnored_853",
    testCategory,
    853,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeDodge_5588()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeDodge_5588",
    testCategory,
    5588,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeBlock_5588()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeBlock_5588",
    testCategory,
    5588,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeParry_5588()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeParry_5588",
    testCategory,
    5588,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeMiss_5588()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeMiss_5588",
    testCategory,
    5588,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeResist_5588()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeResist_5588",
    testCategory,
    5588,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeImmune_5588()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeImmune_5588",
    testCategory,
    5588,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeReflect_5588()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeReflect_5588",
    testCategory,
    5588,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeAbsorbIgnored_5588()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidHammerOfJusticeAbsorbIgnored_5588",
    testCategory,
    5588,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeDodge_5589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeDodge_5589",
    testCategory,
    5589,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeBlock_5589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeBlock_5589",
    testCategory,
    5589,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeParry_5589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeParry_5589",
    testCategory,
    5589,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeMiss_5589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeMiss_5589",
    testCategory,
    5589,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeResist_5589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeResist_5589",
    testCategory,
    5589,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeImmune_5589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeImmune_5589",
    testCategory,
    5589,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeReflect_5589()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHammerOfJusticeReflect_5589",
    testCategory,
    5589,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidHammerOfJusticeAbsorbIgnored_5589()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidHammerOfJusticeAbsorbIgnored_5589",
    testCategory,
    5589,
    "Hammer of Justice",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
