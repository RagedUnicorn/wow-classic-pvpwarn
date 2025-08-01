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
mod.testCombatEventsEnemyAvoidDruid = me

me.tag = "TestCombatEventsEnemyAvoidDruid"

local testGroupName = "CombatEventsEnemyAvoidDruid"
local testCategory = "druid"

function me.Test()
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testenemycombatevent druid")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsDodge_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsBlock_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsParry_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsMiss_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsResist_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsImmune_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsReflect_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsDodge_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsBlock_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsParry_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsMiss_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsResist_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsImmune_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsReflect_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsDodge_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsBlock_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsParry_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsMiss_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsResist_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsImmune_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsReflect_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsDodge_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsBlock_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsParry_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsMiss_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsResist_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsImmune_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsReflect_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsDodge_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsBlock_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsParry_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsMiss_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsResist_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsImmune_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsReflect_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsDodge_9852)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsBlock_9852)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsParry_9852)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsMiss_9852)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsResist_9852)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsImmune_9852)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsReflect_9852)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_9852)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireDodge_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireBlock_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireParry_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireMiss_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireResist_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireImmune_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireReflect_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireAbsorbIgnored_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireDodge_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireBlock_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireParry_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireMiss_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireResist_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireImmune_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireReflect_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireAbsorbIgnored_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireDodge_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireBlock_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireParry_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireMiss_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireResist_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireImmune_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireReflect_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireAbsorbIgnored_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireDodge_9749)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireBlock_9749)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireParry_9749)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireMiss_9749)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireResist_9749)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireImmune_9749)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireReflect_9749)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireAbsorbIgnored_9749)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralDodge_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralBlock_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralParry_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralMiss_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralResist_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralImmune_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralReflect_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralAbsorbIgnored_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralDodge_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralBlock_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralParry_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralMiss_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralResist_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralImmune_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralReflect_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralAbsorbIgnored_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralDodge_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralBlock_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralParry_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralMiss_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralResist_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralImmune_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralReflect_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralAbsorbIgnored_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralDodge_17391)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralBlock_17391)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralParry_17391)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralMiss_17391)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralResist_17391)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralImmune_17391)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralReflect_17391)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFaerieFireFeralAbsorbIgnored_17391)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashDodge_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashBlock_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashParry_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashMiss_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashResist_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashImmune_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashReflect_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashAbsorbIgnored_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashDodge_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashBlock_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashParry_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashMiss_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashResist_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashImmune_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashReflect_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashAbsorbIgnored_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashDodge_6798)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashBlock_6798)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashParry_6798)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashMiss_6798)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashResist_6798)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashImmune_6798)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashReflect_6798)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBashAbsorbIgnored_6798)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFeralChargeEffectDodge_19675)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFeralChargeEffectBlock_19675)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFeralChargeEffectParry_19675)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFeralChargeEffectMiss_19675)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFeralChargeEffectResist_19675)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFeralChargeEffectImmune_19675)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFeralChargeEffectReflect_19675)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFeralChargeEffectAbsorbIgnored_19675)
end

function me.TestCombatEventEnemyAvoidEntanglingRootsDodge_19970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsDodge_19970",
    testCategory,
    19970,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsBlock_19970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsBlock_19970",
    testCategory,
    19970,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsParry_19970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsParry_19970",
    testCategory,
    19970,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsMiss_19970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsMiss_19970",
    testCategory,
    19970,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsResist_19970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsResist_19970",
    testCategory,
    19970,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsImmune_19970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsImmune_19970",
    testCategory,
    19970,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsReflect_19970()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsReflect_19970",
    testCategory,
    19970,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_19970()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_19970",
    testCategory,
    19970,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsDodge_339()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsDodge_339",
    testCategory,
    339,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsBlock_339()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsBlock_339",
    testCategory,
    339,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsParry_339()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsParry_339",
    testCategory,
    339,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsMiss_339()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsMiss_339",
    testCategory,
    339,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsResist_339()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsResist_339",
    testCategory,
    339,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsImmune_339()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsImmune_339",
    testCategory,
    339,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsReflect_339()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsReflect_339",
    testCategory,
    339,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_339()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_339",
    testCategory,
    339,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsDodge_1062()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsDodge_1062",
    testCategory,
    1062,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsBlock_1062()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsBlock_1062",
    testCategory,
    1062,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsParry_1062()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsParry_1062",
    testCategory,
    1062,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsMiss_1062()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsMiss_1062",
    testCategory,
    1062,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsResist_1062()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsResist_1062",
    testCategory,
    1062,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsImmune_1062()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsImmune_1062",
    testCategory,
    1062,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsReflect_1062()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsReflect_1062",
    testCategory,
    1062,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_1062()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_1062",
    testCategory,
    1062,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsDodge_5195()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsDodge_5195",
    testCategory,
    5195,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsBlock_5195()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsBlock_5195",
    testCategory,
    5195,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsParry_5195()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsParry_5195",
    testCategory,
    5195,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsMiss_5195()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsMiss_5195",
    testCategory,
    5195,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsResist_5195()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsResist_5195",
    testCategory,
    5195,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsImmune_5195()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsImmune_5195",
    testCategory,
    5195,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsReflect_5195()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsReflect_5195",
    testCategory,
    5195,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_5195()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_5195",
    testCategory,
    5195,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsDodge_5196()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsDodge_5196",
    testCategory,
    5196,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsBlock_5196()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsBlock_5196",
    testCategory,
    5196,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsParry_5196()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsParry_5196",
    testCategory,
    5196,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsMiss_5196()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsMiss_5196",
    testCategory,
    5196,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsResist_5196()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsResist_5196",
    testCategory,
    5196,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsImmune_5196()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsImmune_5196",
    testCategory,
    5196,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsReflect_5196()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsReflect_5196",
    testCategory,
    5196,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_5196()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_5196",
    testCategory,
    5196,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsDodge_9852()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsDodge_9852",
    testCategory,
    9852,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsBlock_9852()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsBlock_9852",
    testCategory,
    9852,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsParry_9852()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsParry_9852",
    testCategory,
    9852,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsMiss_9852()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsMiss_9852",
    testCategory,
    9852,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsResist_9852()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsResist_9852",
    testCategory,
    9852,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsImmune_9852()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsImmune_9852",
    testCategory,
    9852,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsReflect_9852()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEntanglingRootsReflect_9852",
    testCategory,
    9852,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_9852()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidEntanglingRootsAbsorbIgnored_9852",
    testCategory,
    9852,
    "Entangling Roots",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireDodge_9907()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireDodge_9907",
    testCategory,
    9907,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireBlock_9907()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireBlock_9907",
    testCategory,
    9907,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireParry_9907()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireParry_9907",
    testCategory,
    9907,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireMiss_9907()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireMiss_9907",
    testCategory,
    9907,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireResist_9907()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireResist_9907",
    testCategory,
    9907,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireImmune_9907()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireImmune_9907",
    testCategory,
    9907,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireReflect_9907()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireReflect_9907",
    testCategory,
    9907,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireAbsorbIgnored_9907()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFaerieFireAbsorbIgnored_9907",
    testCategory,
    9907,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireDodge_770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireDodge_770",
    testCategory,
    770,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireBlock_770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireBlock_770",
    testCategory,
    770,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireParry_770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireParry_770",
    testCategory,
    770,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireMiss_770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireMiss_770",
    testCategory,
    770,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireResist_770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireResist_770",
    testCategory,
    770,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireImmune_770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireImmune_770",
    testCategory,
    770,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireReflect_770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireReflect_770",
    testCategory,
    770,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireAbsorbIgnored_770()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFaerieFireAbsorbIgnored_770",
    testCategory,
    770,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireDodge_778()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireDodge_778",
    testCategory,
    778,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireBlock_778()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireBlock_778",
    testCategory,
    778,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireParry_778()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireParry_778",
    testCategory,
    778,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireMiss_778()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireMiss_778",
    testCategory,
    778,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireResist_778()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireResist_778",
    testCategory,
    778,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireImmune_778()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireImmune_778",
    testCategory,
    778,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireReflect_778()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireReflect_778",
    testCategory,
    778,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireAbsorbIgnored_778()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFaerieFireAbsorbIgnored_778",
    testCategory,
    778,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireDodge_9749()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireDodge_9749",
    testCategory,
    9749,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireBlock_9749()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireBlock_9749",
    testCategory,
    9749,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireParry_9749()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireParry_9749",
    testCategory,
    9749,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireMiss_9749()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireMiss_9749",
    testCategory,
    9749,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireResist_9749()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireResist_9749",
    testCategory,
    9749,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireImmune_9749()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireImmune_9749",
    testCategory,
    9749,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireReflect_9749()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireReflect_9749",
    testCategory,
    9749,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireAbsorbIgnored_9749()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFaerieFireAbsorbIgnored_9749",
    testCategory,
    9749,
    "Faerie Fire",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralDodge_17392()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralDodge_17392",
    testCategory,
    17392,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralBlock_17392()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralBlock_17392",
    testCategory,
    17392,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralParry_17392()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralParry_17392",
    testCategory,
    17392,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralMiss_17392()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralMiss_17392",
    testCategory,
    17392,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralResist_17392()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralResist_17392",
    testCategory,
    17392,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralImmune_17392()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralImmune_17392",
    testCategory,
    17392,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralReflect_17392()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralReflect_17392",
    testCategory,
    17392,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralAbsorbIgnored_17392()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFaerieFireFeralAbsorbIgnored_17392",
    testCategory,
    17392,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralDodge_16857()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralDodge_16857",
    testCategory,
    16857,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralBlock_16857()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralBlock_16857",
    testCategory,
    16857,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralParry_16857()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralParry_16857",
    testCategory,
    16857,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralMiss_16857()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralMiss_16857",
    testCategory,
    16857,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralResist_16857()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralResist_16857",
    testCategory,
    16857,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralImmune_16857()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralImmune_16857",
    testCategory,
    16857,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralReflect_16857()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralReflect_16857",
    testCategory,
    16857,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralAbsorbIgnored_16857()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFaerieFireFeralAbsorbIgnored_16857",
    testCategory,
    16857,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralDodge_17390()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralDodge_17390",
    testCategory,
    17390,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralBlock_17390()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralBlock_17390",
    testCategory,
    17390,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralParry_17390()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralParry_17390",
    testCategory,
    17390,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralMiss_17390()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralMiss_17390",
    testCategory,
    17390,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralResist_17390()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralResist_17390",
    testCategory,
    17390,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralImmune_17390()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralImmune_17390",
    testCategory,
    17390,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralReflect_17390()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralReflect_17390",
    testCategory,
    17390,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralAbsorbIgnored_17390()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFaerieFireFeralAbsorbIgnored_17390",
    testCategory,
    17390,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralDodge_17391()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralDodge_17391",
    testCategory,
    17391,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralBlock_17391()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralBlock_17391",
    testCategory,
    17391,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralParry_17391()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralParry_17391",
    testCategory,
    17391,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralMiss_17391()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralMiss_17391",
    testCategory,
    17391,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralResist_17391()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralResist_17391",
    testCategory,
    17391,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralImmune_17391()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralImmune_17391",
    testCategory,
    17391,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralReflect_17391()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFaerieFireFeralReflect_17391",
    testCategory,
    17391,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFaerieFireFeralAbsorbIgnored_17391()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFaerieFireFeralAbsorbIgnored_17391",
    testCategory,
    17391,
    "Faerie Fire (Feral)",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidBashDodge_8983()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashDodge_8983",
    testCategory,
    8983,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidBashBlock_8983()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashBlock_8983",
    testCategory,
    8983,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidBashParry_8983()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashParry_8983",
    testCategory,
    8983,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidBashMiss_8983()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashMiss_8983",
    testCategory,
    8983,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidBashResist_8983()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashResist_8983",
    testCategory,
    8983,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidBashImmune_8983()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashImmune_8983",
    testCategory,
    8983,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidBashReflect_8983()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashReflect_8983",
    testCategory,
    8983,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidBashAbsorbIgnored_8983()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidBashAbsorbIgnored_8983",
    testCategory,
    8983,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidBashDodge_5211()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashDodge_5211",
    testCategory,
    5211,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidBashBlock_5211()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashBlock_5211",
    testCategory,
    5211,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidBashParry_5211()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashParry_5211",
    testCategory,
    5211,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidBashMiss_5211()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashMiss_5211",
    testCategory,
    5211,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidBashResist_5211()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashResist_5211",
    testCategory,
    5211,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidBashImmune_5211()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashImmune_5211",
    testCategory,
    5211,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidBashReflect_5211()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashReflect_5211",
    testCategory,
    5211,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidBashAbsorbIgnored_5211()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidBashAbsorbIgnored_5211",
    testCategory,
    5211,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidBashDodge_6798()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashDodge_6798",
    testCategory,
    6798,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidBashBlock_6798()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashBlock_6798",
    testCategory,
    6798,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidBashParry_6798()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashParry_6798",
    testCategory,
    6798,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidBashMiss_6798()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashMiss_6798",
    testCategory,
    6798,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidBashResist_6798()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashResist_6798",
    testCategory,
    6798,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidBashImmune_6798()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashImmune_6798",
    testCategory,
    6798,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidBashReflect_6798()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBashReflect_6798",
    testCategory,
    6798,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidBashAbsorbIgnored_6798()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidBashAbsorbIgnored_6798",
    testCategory,
    6798,
    "Bash",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFeralChargeEffectDodge_19675()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFeralChargeEffectDodge_19675",
    testCategory,
    19675,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFeralChargeEffectBlock_19675()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFeralChargeEffectBlock_19675",
    testCategory,
    19675,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFeralChargeEffectParry_19675()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFeralChargeEffectParry_19675",
    testCategory,
    19675,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFeralChargeEffectMiss_19675()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFeralChargeEffectMiss_19675",
    testCategory,
    19675,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFeralChargeEffectResist_19675()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFeralChargeEffectResist_19675",
    testCategory,
    19675,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFeralChargeEffectImmune_19675()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFeralChargeEffectImmune_19675",
    testCategory,
    19675,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFeralChargeEffectReflect_19675()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFeralChargeEffectReflect_19675",
    testCategory,
    19675,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFeralChargeEffectAbsorbIgnored_19675()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFeralChargeEffectAbsorbIgnored_19675",
    testCategory,
    19675,
    "Feral Charge Effect",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
