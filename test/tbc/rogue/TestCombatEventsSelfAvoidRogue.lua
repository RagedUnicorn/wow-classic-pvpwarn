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
mod.testCombatEventsSelfAvoidRogueTbc = me

me.tag = "TestCombatEventsSelfAvoidRogueTbc"

local testCategory = "rogue"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testselfcombatevent rogue")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidKickDodge_38768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidKickBlock_38768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidKickParry_38768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidKickMiss_38768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidKickResist_38768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidKickImmune_38768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidKickReflect_38768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidKickAbsorbIgnored_38768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGougeDodge_38764)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGougeBlock_38764)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGougeParry_38764)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGougeMiss_38764)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGougeResist_38764)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGougeImmune_38764)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGougeReflect_38764)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGougeAbsorbIgnored_38764)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidExposeArmorDodge_26866)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidExposeArmorBlock_26866)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidExposeArmorParry_26866)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidExposeArmorMiss_26866)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidExposeArmorResist_26866)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidExposeArmorImmune_26866)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidExposeArmorReflect_26866)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_26866)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGarroteDodge_26839)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGarroteBlock_26839)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGarroteParry_26839)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGarroteMiss_26839)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGarroteResist_26839)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGarroteImmune_26839)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGarroteReflect_26839)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_26839)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGarroteDodge_26884)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGarroteBlock_26884)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGarroteParry_26884)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGarroteMiss_26884)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGarroteResist_26884)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGarroteImmune_26884)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGarroteReflect_26884)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_26884)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidRuptureDodge_26867)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidRuptureBlock_26867)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidRuptureParry_26867)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidRuptureMiss_26867)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidRuptureResist_26867)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidRuptureImmune_26867)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidRuptureReflect_26867)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidRuptureAbsorbIgnored_26867)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDeadlyThrowDodge_26679)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDeadlyThrowBlock_26679)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDeadlyThrowParry_26679)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDeadlyThrowMiss_26679)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDeadlyThrowResist_26679)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDeadlyThrowImmune_26679)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDeadlyThrowReflect_26679)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidDeadlyThrowAbsorbIgnored_26679)
end

function me.TestCombatEventSelfAvoidKickDodge_38768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickDodge_38768",
    testCategory,
    38768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidKickBlock_38768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickBlock_38768",
    testCategory,
    38768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidKickParry_38768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickParry_38768",
    testCategory,
    38768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidKickMiss_38768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickMiss_38768",
    testCategory,
    38768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidKickResist_38768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickResist_38768",
    testCategory,
    38768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidKickImmune_38768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickImmune_38768",
    testCategory,
    38768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidKickReflect_38768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickReflect_38768",
    testCategory,
    38768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidKickAbsorbIgnored_38768()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidKickAbsorbIgnored_38768",
    testCategory,
    38768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidGougeDodge_38764()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeDodge_38764",
    testCategory,
    38764,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidGougeBlock_38764()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeBlock_38764",
    testCategory,
    38764,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidGougeParry_38764()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeParry_38764",
    testCategory,
    38764,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidGougeMiss_38764()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeMiss_38764",
    testCategory,
    38764,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGougeResist_38764()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeResist_38764",
    testCategory,
    38764,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidGougeImmune_38764()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeImmune_38764",
    testCategory,
    38764,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidGougeReflect_38764()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeReflect_38764",
    testCategory,
    38764,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidGougeAbsorbIgnored_38764()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidGougeAbsorbIgnored_38764",
    testCategory,
    38764,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidExposeArmorDodge_26866()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorDodge_26866",
    testCategory,
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidExposeArmorBlock_26866()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorBlock_26866",
    testCategory,
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidExposeArmorParry_26866()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorParry_26866",
    testCategory,
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidExposeArmorMiss_26866()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorMiss_26866",
    testCategory,
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidExposeArmorResist_26866()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorResist_26866",
    testCategory,
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidExposeArmorImmune_26866()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorImmune_26866",
    testCategory,
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidExposeArmorReflect_26866()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorReflect_26866",
    testCategory,
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_26866()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_26866",
    testCategory,
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidGarroteDodge_26839()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteDodge_26839",
    testCategory,
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidGarroteBlock_26839()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteBlock_26839",
    testCategory,
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidGarroteParry_26839()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteParry_26839",
    testCategory,
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidGarroteMiss_26839()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteMiss_26839",
    testCategory,
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGarroteResist_26839()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteResist_26839",
    testCategory,
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidGarroteImmune_26839()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteImmune_26839",
    testCategory,
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidGarroteReflect_26839()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteReflect_26839",
    testCategory,
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_26839()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidGarroteAbsorbIgnored_26839",
    testCategory,
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidGarroteDodge_26884()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteDodge_26884",
    testCategory,
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidGarroteBlock_26884()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteBlock_26884",
    testCategory,
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidGarroteParry_26884()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteParry_26884",
    testCategory,
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidGarroteMiss_26884()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteMiss_26884",
    testCategory,
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGarroteResist_26884()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteResist_26884",
    testCategory,
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidGarroteImmune_26884()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteImmune_26884",
    testCategory,
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidGarroteReflect_26884()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteReflect_26884",
    testCategory,
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_26884()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidGarroteAbsorbIgnored_26884",
    testCategory,
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidRuptureDodge_26867()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureDodge_26867",
    testCategory,
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidRuptureBlock_26867()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureBlock_26867",
    testCategory,
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidRuptureParry_26867()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureParry_26867",
    testCategory,
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidRuptureMiss_26867()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureMiss_26867",
    testCategory,
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidRuptureResist_26867()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureResist_26867",
    testCategory,
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidRuptureImmune_26867()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureImmune_26867",
    testCategory,
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidRuptureReflect_26867()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureReflect_26867",
    testCategory,
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidRuptureAbsorbIgnored_26867()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidRuptureAbsorbIgnored_26867",
    testCategory,
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidDeadlyThrowDodge_26679()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeadlyThrowDodge_26679",
    testCategory,
    26679,
    "Deadly Throw",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidDeadlyThrowBlock_26679()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeadlyThrowBlock_26679",
    testCategory,
    26679,
    "Deadly Throw",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidDeadlyThrowParry_26679()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeadlyThrowParry_26679",
    testCategory,
    26679,
    "Deadly Throw",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidDeadlyThrowMiss_26679()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeadlyThrowMiss_26679",
    testCategory,
    26679,
    "Deadly Throw",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDeadlyThrowResist_26679()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeadlyThrowResist_26679",
    testCategory,
    26679,
    "Deadly Throw",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDeadlyThrowImmune_26679()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeadlyThrowImmune_26679",
    testCategory,
    26679,
    "Deadly Throw",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDeadlyThrowReflect_26679()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDeadlyThrowReflect_26679",
    testCategory,
    26679,
    "Deadly Throw",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidDeadlyThrowAbsorbIgnored_26679()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidDeadlyThrowAbsorbIgnored_26679",
    testCategory,
    26679,
    "Deadly Throw",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
