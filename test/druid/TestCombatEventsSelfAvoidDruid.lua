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
mod.testCombatEventsSelfAvoidDruid = me

me.tag = "TestCombatEventsSelfAvoidDruid"

local testGroupName = "CombatEventsSelfAvoidDruid"
local testCategory = "druid"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsDodge_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsBlock_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsParry_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsMiss_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsResist_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsImmune_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsReflect_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsDodge_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsBlock_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsParry_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsMiss_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsResist_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsImmune_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsReflect_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsDodge_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsBlock_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsParry_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsMiss_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsResist_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsImmune_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsReflect_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsDodge_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsBlock_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsParry_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsMiss_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsResist_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsImmune_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsReflect_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsDodge_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsBlock_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsParry_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsMiss_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsResist_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsImmune_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsReflect_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsDodge_9852)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsBlock_9852)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsParry_9852)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsMiss_9852)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsResist_9852)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsImmune_9852)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsReflect_9852)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_9852)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireDodge_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireBlock_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireParry_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireMiss_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireResist_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireImmune_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireReflect_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireAbsorbIgnored_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireDodge_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireBlock_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireParry_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireMiss_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireResist_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireImmune_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireReflect_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireAbsorbIgnored_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireDodge_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireBlock_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireParry_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireMiss_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireResist_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireImmune_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireReflect_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireAbsorbIgnored_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireDodge_9749)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireBlock_9749)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireParry_9749)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireMiss_9749)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireResist_9749)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireImmune_9749)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireReflect_9749)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireAbsorbIgnored_9749)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralDodge_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralBlock_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralParry_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralMiss_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralResist_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralImmune_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralReflect_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralAbsorbIgnored_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralDodge_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralBlock_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralParry_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralMiss_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralResist_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralImmune_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralReflect_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralAbsorbIgnored_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralDodge_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralBlock_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralParry_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralMiss_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralResist_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralImmune_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralReflect_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralAbsorbIgnored_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralDodge_17391)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralBlock_17391)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralParry_17391)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralMiss_17391)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralResist_17391)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralImmune_17391)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralReflect_17391)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFaerieFireFeralAbsorbIgnored_17391)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashDodge_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashBlock_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashParry_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashMiss_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashResist_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashImmune_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashReflect_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashAbsorbIgnored_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashDodge_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashBlock_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashParry_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashMiss_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashResist_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashImmune_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashReflect_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashAbsorbIgnored_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashDodge_6798)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashBlock_6798)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashParry_6798)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashMiss_6798)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashResist_6798)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashImmune_6798)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashReflect_6798)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBashAbsorbIgnored_6798)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFeralChargeEffectDodge_19675)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFeralChargeEffectBlock_19675)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFeralChargeEffectParry_19675)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFeralChargeEffectMiss_19675)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFeralChargeEffectResist_19675)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFeralChargeEffectImmune_19675)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFeralChargeEffectReflect_19675)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFeralChargeEffectAbsorbIgnored_19675)
end

function me.TestCombatEventSelfAvoidEntanglingRootsDodge_19970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsDodge_19970",
    testCategory,
    19970,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsBlock_19970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsBlock_19970",
    testCategory,
    19970,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsParry_19970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsParry_19970",
    testCategory,
    19970,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsMiss_19970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsMiss_19970",
    testCategory,
    19970,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsResist_19970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsResist_19970",
    testCategory,
    19970,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsImmune_19970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsImmune_19970",
    testCategory,
    19970,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsReflect_19970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsReflect_19970",
    testCategory,
    19970,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_19970()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_19970",
    testCategory,
    19970,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsDodge_339()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsDodge_339",
    testCategory,
    339,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsBlock_339()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsBlock_339",
    testCategory,
    339,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsParry_339()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsParry_339",
    testCategory,
    339,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsMiss_339()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsMiss_339",
    testCategory,
    339,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsResist_339()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsResist_339",
    testCategory,
    339,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsImmune_339()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsImmune_339",
    testCategory,
    339,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsReflect_339()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsReflect_339",
    testCategory,
    339,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_339()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_339",
    testCategory,
    339,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsDodge_1062()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsDodge_1062",
    testCategory,
    1062,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsBlock_1062()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsBlock_1062",
    testCategory,
    1062,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsParry_1062()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsParry_1062",
    testCategory,
    1062,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsMiss_1062()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsMiss_1062",
    testCategory,
    1062,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsResist_1062()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsResist_1062",
    testCategory,
    1062,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsImmune_1062()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsImmune_1062",
    testCategory,
    1062,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsReflect_1062()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsReflect_1062",
    testCategory,
    1062,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_1062()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_1062",
    testCategory,
    1062,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsDodge_5195()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsDodge_5195",
    testCategory,
    5195,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsBlock_5195()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsBlock_5195",
    testCategory,
    5195,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsParry_5195()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsParry_5195",
    testCategory,
    5195,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsMiss_5195()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsMiss_5195",
    testCategory,
    5195,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsResist_5195()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsResist_5195",
    testCategory,
    5195,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsImmune_5195()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsImmune_5195",
    testCategory,
    5195,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsReflect_5195()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsReflect_5195",
    testCategory,
    5195,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_5195()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_5195",
    testCategory,
    5195,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsDodge_5196()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsDodge_5196",
    testCategory,
    5196,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsBlock_5196()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsBlock_5196",
    testCategory,
    5196,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsParry_5196()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsParry_5196",
    testCategory,
    5196,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsMiss_5196()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsMiss_5196",
    testCategory,
    5196,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsResist_5196()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsResist_5196",
    testCategory,
    5196,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsImmune_5196()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsImmune_5196",
    testCategory,
    5196,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsReflect_5196()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsReflect_5196",
    testCategory,
    5196,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_5196()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_5196",
    testCategory,
    5196,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsDodge_9852()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsDodge_9852",
    testCategory,
    9852,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsBlock_9852()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsBlock_9852",
    testCategory,
    9852,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsParry_9852()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsParry_9852",
    testCategory,
    9852,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsMiss_9852()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsMiss_9852",
    testCategory,
    9852,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsResist_9852()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsResist_9852",
    testCategory,
    9852,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsImmune_9852()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsImmune_9852",
    testCategory,
    9852,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsReflect_9852()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEntanglingRootsReflect_9852",
    testCategory,
    9852,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_9852()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidEntanglingRootsAbsorbIgnored_9852",
    testCategory,
    9852,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFaerieFireDodge_9907()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireDodge_9907",
    testCategory,
    9907,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireBlock_9907()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireBlock_9907",
    testCategory,
    9907,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFaerieFireParry_9907()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireParry_9907",
    testCategory,
    9907,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFaerieFireMiss_9907()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireMiss_9907",
    testCategory,
    9907,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFaerieFireResist_9907()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireResist_9907",
    testCategory,
    9907,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFaerieFireImmune_9907()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireImmune_9907",
    testCategory,
    9907,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireReflect_9907()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireReflect_9907",
    testCategory,
    9907,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFaerieFireAbsorbIgnored_9907()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFaerieFireAbsorbIgnored_9907",
    testCategory,
    9907,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFaerieFireDodge_770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireDodge_770",
    testCategory,
    770,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireBlock_770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireBlock_770",
    testCategory,
    770,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFaerieFireParry_770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireParry_770",
    testCategory,
    770,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFaerieFireMiss_770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireMiss_770",
    testCategory,
    770,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFaerieFireResist_770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireResist_770",
    testCategory,
    770,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFaerieFireImmune_770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireImmune_770",
    testCategory,
    770,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireReflect_770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireReflect_770",
    testCategory,
    770,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFaerieFireAbsorbIgnored_770()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFaerieFireAbsorbIgnored_770",
    testCategory,
    770,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFaerieFireDodge_778()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireDodge_778",
    testCategory,
    778,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireBlock_778()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireBlock_778",
    testCategory,
    778,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFaerieFireParry_778()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireParry_778",
    testCategory,
    778,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFaerieFireMiss_778()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireMiss_778",
    testCategory,
    778,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFaerieFireResist_778()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireResist_778",
    testCategory,
    778,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFaerieFireImmune_778()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireImmune_778",
    testCategory,
    778,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireReflect_778()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireReflect_778",
    testCategory,
    778,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFaerieFireAbsorbIgnored_778()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFaerieFireAbsorbIgnored_778",
    testCategory,
    778,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFaerieFireDodge_9749()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireDodge_9749",
    testCategory,
    9749,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireBlock_9749()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireBlock_9749",
    testCategory,
    9749,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFaerieFireParry_9749()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireParry_9749",
    testCategory,
    9749,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFaerieFireMiss_9749()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireMiss_9749",
    testCategory,
    9749,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFaerieFireResist_9749()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireResist_9749",
    testCategory,
    9749,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFaerieFireImmune_9749()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireImmune_9749",
    testCategory,
    9749,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireReflect_9749()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireReflect_9749",
    testCategory,
    9749,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFaerieFireAbsorbIgnored_9749()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFaerieFireAbsorbIgnored_9749",
    testCategory,
    9749,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralDodge_17392()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralDodge_17392",
    testCategory,
    17392,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralBlock_17392()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralBlock_17392",
    testCategory,
    17392,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralParry_17392()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralParry_17392",
    testCategory,
    17392,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralMiss_17392()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralMiss_17392",
    testCategory,
    17392,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralResist_17392()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralResist_17392",
    testCategory,
    17392,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralImmune_17392()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralImmune_17392",
    testCategory,
    17392,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralReflect_17392()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralReflect_17392",
    testCategory,
    17392,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralAbsorbIgnored_17392()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFaerieFireFeralAbsorbIgnored_17392",
    testCategory,
    17392,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralDodge_16857()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralDodge_16857",
    testCategory,
    16857,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralBlock_16857()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralBlock_16857",
    testCategory,
    16857,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralParry_16857()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralParry_16857",
    testCategory,
    16857,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralMiss_16857()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralMiss_16857",
    testCategory,
    16857,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralResist_16857()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralResist_16857",
    testCategory,
    16857,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralImmune_16857()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralImmune_16857",
    testCategory,
    16857,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralReflect_16857()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralReflect_16857",
    testCategory,
    16857,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralAbsorbIgnored_16857()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFaerieFireFeralAbsorbIgnored_16857",
    testCategory,
    16857,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralDodge_17390()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralDodge_17390",
    testCategory,
    17390,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralBlock_17390()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralBlock_17390",
    testCategory,
    17390,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralParry_17390()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralParry_17390",
    testCategory,
    17390,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralMiss_17390()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralMiss_17390",
    testCategory,
    17390,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralResist_17390()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralResist_17390",
    testCategory,
    17390,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralImmune_17390()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralImmune_17390",
    testCategory,
    17390,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralReflect_17390()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralReflect_17390",
    testCategory,
    17390,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralAbsorbIgnored_17390()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFaerieFireFeralAbsorbIgnored_17390",
    testCategory,
    17390,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralDodge_17391()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralDodge_17391",
    testCategory,
    17391,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralBlock_17391()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralBlock_17391",
    testCategory,
    17391,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralParry_17391()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralParry_17391",
    testCategory,
    17391,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralMiss_17391()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralMiss_17391",
    testCategory,
    17391,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralResist_17391()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralResist_17391",
    testCategory,
    17391,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralImmune_17391()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralImmune_17391",
    testCategory,
    17391,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralReflect_17391()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFaerieFireFeralReflect_17391",
    testCategory,
    17391,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFaerieFireFeralAbsorbIgnored_17391()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFaerieFireFeralAbsorbIgnored_17391",
    testCategory,
    17391,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidBashDodge_8983()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashDodge_8983",
    testCategory,
    8983,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidBashBlock_8983()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashBlock_8983",
    testCategory,
    8983,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidBashParry_8983()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashParry_8983",
    testCategory,
    8983,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidBashMiss_8983()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashMiss_8983",
    testCategory,
    8983,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidBashResist_8983()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashResist_8983",
    testCategory,
    8983,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidBashImmune_8983()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashImmune_8983",
    testCategory,
    8983,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidBashReflect_8983()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashReflect_8983",
    testCategory,
    8983,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidBashAbsorbIgnored_8983()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidBashAbsorbIgnored_8983",
    testCategory,
    8983,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidBashDodge_5211()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashDodge_5211",
    testCategory,
    5211,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidBashBlock_5211()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashBlock_5211",
    testCategory,
    5211,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidBashParry_5211()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashParry_5211",
    testCategory,
    5211,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidBashMiss_5211()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashMiss_5211",
    testCategory,
    5211,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidBashResist_5211()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashResist_5211",
    testCategory,
    5211,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidBashImmune_5211()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashImmune_5211",
    testCategory,
    5211,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidBashReflect_5211()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashReflect_5211",
    testCategory,
    5211,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidBashAbsorbIgnored_5211()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidBashAbsorbIgnored_5211",
    testCategory,
    5211,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidBashDodge_6798()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashDodge_6798",
    testCategory,
    6798,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidBashBlock_6798()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashBlock_6798",
    testCategory,
    6798,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidBashParry_6798()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashParry_6798",
    testCategory,
    6798,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidBashMiss_6798()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashMiss_6798",
    testCategory,
    6798,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidBashResist_6798()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashResist_6798",
    testCategory,
    6798,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidBashImmune_6798()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashImmune_6798",
    testCategory,
    6798,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidBashReflect_6798()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBashReflect_6798",
    testCategory,
    6798,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidBashAbsorbIgnored_6798()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidBashAbsorbIgnored_6798",
    testCategory,
    6798,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFeralChargeEffectDodge_19675()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFeralChargeEffectDodge_19675",
    testCategory,
    19675,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFeralChargeEffectBlock_19675()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFeralChargeEffectBlock_19675",
    testCategory,
    19675,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFeralChargeEffectParry_19675()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFeralChargeEffectParry_19675",
    testCategory,
    19675,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFeralChargeEffectMiss_19675()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFeralChargeEffectMiss_19675",
    testCategory,
    19675,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFeralChargeEffectResist_19675()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFeralChargeEffectResist_19675",
    testCategory,
    19675,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFeralChargeEffectImmune_19675()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFeralChargeEffectImmune_19675",
    testCategory,
    19675,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFeralChargeEffectReflect_19675()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFeralChargeEffectReflect_19675",
    testCategory,
    19675,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFeralChargeEffectAbsorbIgnored_19675()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFeralChargeEffectAbsorbIgnored_19675",
    testCategory,
    19675,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
