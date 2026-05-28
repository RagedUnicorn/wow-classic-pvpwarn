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
mod.testCombatEventsEnemyAvoidRogueTbc = me

me.tag = "TestCombatEventsEnemyAvoidRogueTbc"

local testCategory = "rogue"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testenemycombatevent rogue")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidKickDodge_38768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidKickBlock_38768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidKickParry_38768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidKickMiss_38768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidKickResist_38768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidKickImmune_38768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidKickReflect_38768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidKickAbsorbIgnored_38768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGougeDodge_38764)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGougeBlock_38764)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGougeParry_38764)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGougeMiss_38764)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGougeResist_38764)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGougeImmune_38764)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGougeReflect_38764)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGougeAbsorbIgnored_38764)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidExposeArmorDodge_26866)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidExposeArmorBlock_26866)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidExposeArmorParry_26866)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidExposeArmorMiss_26866)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidExposeArmorResist_26866)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidExposeArmorImmune_26866)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidExposeArmorReflect_26866)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_26866)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGarroteDodge_26839)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGarroteBlock_26839)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGarroteParry_26839)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGarroteMiss_26839)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGarroteResist_26839)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGarroteImmune_26839)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGarroteReflect_26839)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_26839)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGarroteDodge_26884)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGarroteBlock_26884)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGarroteParry_26884)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGarroteMiss_26884)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGarroteResist_26884)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGarroteImmune_26884)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGarroteReflect_26884)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_26884)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidRuptureDodge_26867)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidRuptureBlock_26867)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidRuptureParry_26867)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidRuptureMiss_26867)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidRuptureResist_26867)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidRuptureImmune_26867)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidRuptureReflect_26867)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidRuptureAbsorbIgnored_26867)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeadlyThrowDodge_26679)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeadlyThrowBlock_26679)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeadlyThrowParry_26679)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeadlyThrowMiss_26679)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeadlyThrowResist_26679)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeadlyThrowImmune_26679)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeadlyThrowReflect_26679)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidDeadlyThrowAbsorbIgnored_26679)
end

function me.TestCombatEventEnemyAvoidKickDodge_38768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickDodge_38768",
    testCategory,
    38768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidKickBlock_38768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickBlock_38768",
    testCategory,
    38768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidKickParry_38768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickParry_38768",
    testCategory,
    38768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidKickMiss_38768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickMiss_38768",
    testCategory,
    38768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidKickResist_38768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickResist_38768",
    testCategory,
    38768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidKickImmune_38768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickImmune_38768",
    testCategory,
    38768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidKickReflect_38768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickReflect_38768",
    testCategory,
    38768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidKickAbsorbIgnored_38768()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidKickAbsorbIgnored_38768",
    testCategory,
    38768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidGougeDodge_38764()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeDodge_38764",
    testCategory,
    38764,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidGougeBlock_38764()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeBlock_38764",
    testCategory,
    38764,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidGougeParry_38764()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeParry_38764",
    testCategory,
    38764,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidGougeMiss_38764()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeMiss_38764",
    testCategory,
    38764,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGougeResist_38764()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeResist_38764",
    testCategory,
    38764,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidGougeImmune_38764()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeImmune_38764",
    testCategory,
    38764,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidGougeReflect_38764()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeReflect_38764",
    testCategory,
    38764,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidGougeAbsorbIgnored_38764()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidGougeAbsorbIgnored_38764",
    testCategory,
    38764,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorDodge_26866()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorDodge_26866",
    testCategory,
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorBlock_26866()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorBlock_26866",
    testCategory,
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorParry_26866()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorParry_26866",
    testCategory,
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorMiss_26866()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorMiss_26866",
    testCategory,
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorResist_26866()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorResist_26866",
    testCategory,
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorImmune_26866()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorImmune_26866",
    testCategory,
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorReflect_26866()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorReflect_26866",
    testCategory,
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_26866()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_26866",
    testCategory,
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidGarroteDodge_26839()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteDodge_26839",
    testCategory,
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidGarroteBlock_26839()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteBlock_26839",
    testCategory,
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidGarroteParry_26839()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteParry_26839",
    testCategory,
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidGarroteMiss_26839()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteMiss_26839",
    testCategory,
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGarroteResist_26839()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteResist_26839",
    testCategory,
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidGarroteImmune_26839()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteImmune_26839",
    testCategory,
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidGarroteReflect_26839()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteReflect_26839",
    testCategory,
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_26839()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidGarroteAbsorbIgnored_26839",
    testCategory,
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidGarroteDodge_26884()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteDodge_26884",
    testCategory,
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidGarroteBlock_26884()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteBlock_26884",
    testCategory,
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidGarroteParry_26884()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteParry_26884",
    testCategory,
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidGarroteMiss_26884()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteMiss_26884",
    testCategory,
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGarroteResist_26884()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteResist_26884",
    testCategory,
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidGarroteImmune_26884()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteImmune_26884",
    testCategory,
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidGarroteReflect_26884()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteReflect_26884",
    testCategory,
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_26884()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidGarroteAbsorbIgnored_26884",
    testCategory,
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidRuptureDodge_26867()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureDodge_26867",
    testCategory,
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidRuptureBlock_26867()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureBlock_26867",
    testCategory,
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidRuptureParry_26867()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureParry_26867",
    testCategory,
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidRuptureMiss_26867()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureMiss_26867",
    testCategory,
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidRuptureResist_26867()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureResist_26867",
    testCategory,
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidRuptureImmune_26867()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureImmune_26867",
    testCategory,
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidRuptureReflect_26867()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureReflect_26867",
    testCategory,
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidRuptureAbsorbIgnored_26867()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidRuptureAbsorbIgnored_26867",
    testCategory,
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidDeadlyThrowDodge_26679()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeadlyThrowDodge_26679",
    testCategory,
    26679,
    "Deadly Throw",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidDeadlyThrowBlock_26679()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeadlyThrowBlock_26679",
    testCategory,
    26679,
    "Deadly Throw",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidDeadlyThrowParry_26679()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeadlyThrowParry_26679",
    testCategory,
    26679,
    "Deadly Throw",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidDeadlyThrowMiss_26679()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeadlyThrowMiss_26679",
    testCategory,
    26679,
    "Deadly Throw",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidDeadlyThrowResist_26679()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeadlyThrowResist_26679",
    testCategory,
    26679,
    "Deadly Throw",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidDeadlyThrowImmune_26679()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeadlyThrowImmune_26679",
    testCategory,
    26679,
    "Deadly Throw",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDeadlyThrowReflect_26679()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDeadlyThrowReflect_26679",
    testCategory,
    26679,
    "Deadly Throw",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidDeadlyThrowAbsorbIgnored_26679()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidDeadlyThrowAbsorbIgnored_26679",
    testCategory,
    26679,
    "Deadly Throw",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
