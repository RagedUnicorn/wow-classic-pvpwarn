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
mod.testCombatEventsSelfAvoidWarrior = me

me.tag = "TestCombatEventsSelfAvoidWarrior"

local testGroupName = "CombatEventsSelfAvoidWarrior"
local testCategory = "warrior"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidChargeStunDodge_7922)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidChargeStunBlock_7922)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidChargeStunParry_7922)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidChargeStunMiss_7922)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidChargeStunResist_7922)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidChargeStunImmune_7922)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidChargeStunReflect_7922)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidChargeStunAbsorbIgnored_7922)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunDodge_20615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunBlock_20615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunParry_20615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunMiss_20615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunResist_20615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunImmune_20615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunReflect_20615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunAbsorbIgnored_20615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunDodge_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunBlock_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunParry_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunMiss_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunResist_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunImmune_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunReflect_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunAbsorbIgnored_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunDodge_20614)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunBlock_20614)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunParry_20614)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunMiss_20614)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunResist_20614)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunImmune_20614)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunReflect_20614)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidInterceptStunAbsorbIgnored_20614)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringDodge_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringBlock_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringParry_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringMiss_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringResist_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringImmune_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringReflect_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringAbsorbIgnored_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringDodge_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringBlock_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringParry_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringMiss_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringResist_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringImmune_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringReflect_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringAbsorbIgnored_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringDodge_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringBlock_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringParry_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringMiss_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringResist_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringImmune_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringReflect_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringAbsorbIgnored_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringDodge_25212)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringBlock_25212)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringParry_25212)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringMiss_25212)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringResist_25212)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringImmune_25212)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringReflect_25212)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidHamstringAbsorbIgnored_25212)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeDodge_21553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeBlock_21553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeParry_21553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeMiss_21553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeResist_21553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeImmune_21553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeReflect_21553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_21553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeDodge_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeBlock_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeParry_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeMiss_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeResist_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeImmune_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeReflect_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeDodge_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeBlock_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeParry_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeMiss_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeResist_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeImmune_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeReflect_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeDodge_21552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeBlock_21552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeParry_21552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeMiss_21552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeResist_21552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeImmune_21552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeReflect_21552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_21552)


  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidIntimidatingShoutDodge_5246)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidIntimidatingShoutBlock_5246)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidIntimidatingShoutParry_5246)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidIntimidatingShoutMiss_5246)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidIntimidatingShoutResist_5246)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidIntimidatingShoutImmune_5246)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidIntimidatingShoutReflect_5246)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidIntimidatingShoutAbsorbIgnored_5246)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelDodge_6554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelBlock_6554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelParry_6554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelMiss_6554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelResist_6554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelImmune_6554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelReflect_6554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelAbsorbIgnored_6554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelDodge_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelBlock_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelParry_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelMiss_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelResist_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelImmune_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelReflect_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPummelAbsorbIgnored_6552)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDisarmDodge_676)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDisarmBlock_676)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDisarmParry_676)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDisarmMiss_676)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDisarmResist_676)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDisarmImmune_676)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDisarmReflect_676)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDisarmAbsorbIgnored_676)
end

function me.TestCombatEventSelfAvoidChargeStunDodge_7922()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidChargeStunDodge_7922",
    testCategory,
    7922,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidChargeStunBlock_7922()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidChargeStunBlock_7922",
    testCategory,
    7922,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidChargeStunParry_7922()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidChargeStunParry_7922",
    testCategory,
    7922,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidChargeStunMiss_7922()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidChargeStunMiss_7922",
    testCategory,
    7922,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidChargeStunResist_7922()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidChargeStunResist_7922",
    testCategory,
    7922,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidChargeStunImmune_7922()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidChargeStunImmune_7922",
    testCategory,
    7922,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidChargeStunReflect_7922()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidChargeStunReflect_7922",
    testCategory,
    7922,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidChargeStunAbsorbIgnored_7922()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidChargeStunAbsorbIgnored_7922",
    testCategory,
    7922,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidInterceptStunDodge_20615()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunDodge_20615",
    testCategory,
    20615,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidInterceptStunBlock_20615()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunBlock_20615",
    testCategory,
    20615,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidInterceptStunParry_20615()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunParry_20615",
    testCategory,
    20615,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidInterceptStunMiss_20615()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunMiss_20615",
    testCategory,
    20615,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidInterceptStunResist_20615()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunResist_20615",
    testCategory,
    20615,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidInterceptStunImmune_20615()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunImmune_20615",
    testCategory,
    20615,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidInterceptStunReflect_20615()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunReflect_20615",
    testCategory,
    20615,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidInterceptStunAbsorbIgnored_20615()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidInterceptStunAbsorbIgnored_20615",
    testCategory,
    20615,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidInterceptStunDodge_20253()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunDodge_20253",
    testCategory,
    20253,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidInterceptStunBlock_20253()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunBlock_20253",
    testCategory,
    20253,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidInterceptStunParry_20253()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunParry_20253",
    testCategory,
    20253,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidInterceptStunMiss_20253()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunMiss_20253",
    testCategory,
    20253,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidInterceptStunResist_20253()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunResist_20253",
    testCategory,
    20253,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidInterceptStunImmune_20253()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunImmune_20253",
    testCategory,
    20253,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidInterceptStunReflect_20253()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunReflect_20253",
    testCategory,
    20253,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidInterceptStunAbsorbIgnored_20253()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidInterceptStunAbsorbIgnored_20253",
    testCategory,
    20253,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidInterceptStunDodge_20614()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunDodge_20614",
    testCategory,
    20614,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidInterceptStunBlock_20614()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunBlock_20614",
    testCategory,
    20614,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidInterceptStunParry_20614()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunParry_20614",
    testCategory,
    20614,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidInterceptStunMiss_20614()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunMiss_20614",
    testCategory,
    20614,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidInterceptStunResist_20614()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunResist_20614",
    testCategory,
    20614,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidInterceptStunImmune_20614()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunImmune_20614",
    testCategory,
    20614,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidInterceptStunReflect_20614()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidInterceptStunReflect_20614",
    testCategory,
    20614,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidInterceptStunAbsorbIgnored_20614()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidInterceptStunAbsorbIgnored_20614",
    testCategory,
    20614,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidHamstringDodge_7373()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringDodge_7373",
    testCategory,
    7373,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidHamstringBlock_7373()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringBlock_7373",
    testCategory,
    7373,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidHamstringParry_7373()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringParry_7373",
    testCategory,
    7373,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidHamstringMiss_7373()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringMiss_7373",
    testCategory,
    7373,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidHamstringResist_7373()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringResist_7373",
    testCategory,
    7373,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidHamstringImmune_7373()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringImmune_7373",
    testCategory,
    7373,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidHamstringReflect_7373()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringReflect_7373",
    testCategory,
    7373,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidHamstringAbsorbIgnored_7373()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidHamstringAbsorbIgnored_7373",
    testCategory,
    7373,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidHamstringDodge_7372()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringDodge_7372",
    testCategory,
    7372,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidHamstringBlock_7372()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringBlock_7372",
    testCategory,
    7372,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidHamstringParry_7372()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringParry_7372",
    testCategory,
    7372,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidHamstringMiss_7372()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringMiss_7372",
    testCategory,
    7372,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidHamstringResist_7372()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringResist_7372",
    testCategory,
    7372,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidHamstringImmune_7372()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringImmune_7372",
    testCategory,
    7372,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidHamstringReflect_7372()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringReflect_7372",
    testCategory,
    7372,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidHamstringAbsorbIgnored_7372()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidHamstringAbsorbIgnored_7372",
    testCategory,
    7372,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidHamstringDodge_25212()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringDodge_25212",
    testCategory,
    25212,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidHamstringBlock_25212()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringBlock_25212",
    testCategory,
    25212,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidHamstringParry_25212()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringParry_25212",
    testCategory,
    25212,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidHamstringMiss_25212()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringMiss_25212",
    testCategory,
    25212,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidHamstringResist_25212()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringResist_25212",
    testCategory,
    25212,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidHamstringImmune_25212()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringImmune_25212",
    testCategory,
    25212,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidHamstringReflect_25212()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidHamstringReflect_25212",
    testCategory,
    25212,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidHamstringAbsorbIgnored_25212()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidHamstringAbsorbIgnored_25212",
    testCategory,
    25212,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeDodge_21553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeDodge_21553",
    testCategory,
    21553,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeBlock_21553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeBlock_21553",
    testCategory,
    21553,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeParry_21553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeParry_21553",
    testCategory,
    21553,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeMiss_21553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeMiss_21553",
    testCategory,
    21553,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeResist_21553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeResist_21553",
    testCategory,
    21553,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeImmune_21553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeImmune_21553",
    testCategory,
    21553,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeReflect_21553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeReflect_21553",
    testCategory,
    21553,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_21553()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_21553",
    testCategory,
    21553,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeDodge_12294()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeDodge_12294",
    testCategory,
    12294,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeBlock_12294()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeBlock_12294",
    testCategory,
    12294,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeParry_12294()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeParry_12294",
    testCategory,
    12294,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeMiss_12294()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeMiss_12294",
    testCategory,
    12294,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeResist_12294()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeResist_12294",
    testCategory,
    12294,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeImmune_12294()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeImmune_12294",
    testCategory,
    12294,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeReflect_12294()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeReflect_12294",
    testCategory,
    12294,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_12294()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_12294",
    testCategory,
    12294,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeDodge_21551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeDodge_21551",
    testCategory,
    21551,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeBlock_21551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeBlock_21551",
    testCategory,
    21551,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeParry_21551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeParry_21551",
    testCategory,
    21551,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeMiss_21551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeMiss_21551",
    testCategory,
    21551,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeResist_21551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeResist_21551",
    testCategory,
    21551,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeImmune_21551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeImmune_21551",
    testCategory,
    21551,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeReflect_21551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeReflect_21551",
    testCategory,
    21551,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_21551()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_21551",
    testCategory,
    21551,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeDodge_21552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeDodge_21552",
    testCategory,
    21552,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeBlock_21552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeBlock_21552",
    testCategory,
    21552,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeParry_21552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeParry_21552",
    testCategory,
    21552,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeMiss_21552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeMiss_21552",
    testCategory,
    21552,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeResist_21552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeResist_21552",
    testCategory,
    21552,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeImmune_21552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeImmune_21552",
    testCategory,
    21552,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeReflect_21552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeReflect_21552",
    testCategory,
    21552,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_21552()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_21552",
    testCategory,
    21552,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidIntimidatingShoutDodge_5246()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidIntimidatingShoutDodge_5246",
    testCategory,
    5246,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidIntimidatingShoutBlock_5246()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidIntimidatingShoutBlock_5246",
    testCategory,
    5246,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidIntimidatingShoutParry_5246()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidIntimidatingShoutParry_5246",
    testCategory,
    5246,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidIntimidatingShoutMiss_5246()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidIntimidatingShoutMiss_5246",
    testCategory,
    5246,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidIntimidatingShoutResist_5246()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidIntimidatingShoutResist_5246",
    testCategory,
    5246,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidIntimidatingShoutImmune_5246()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidIntimidatingShoutImmune_5246",
    testCategory,
    5246,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidIntimidatingShoutReflect_5246()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidIntimidatingShoutReflect_5246",
    testCategory,
    5246,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidIntimidatingShoutAbsorbIgnored_5246()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidIntimidatingShoutAbsorbIgnored_5246",
    testCategory,
    5246,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end


function me.TestCombatEventSelfAvoidPummelDodge_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelDodge_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidPummelBlock_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelBlock_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidPummelParry_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelParry_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidPummelMiss_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelMiss_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidPummelResist_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelResist_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidPummelImmune_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelImmune_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidPummelReflect_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelReflect_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidPummelAbsorbIgnored_6554()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidPummelAbsorbIgnored_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidPummelDodge_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelDodge_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidPummelBlock_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelBlock_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidPummelParry_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelParry_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidPummelMiss_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelMiss_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidPummelResist_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelResist_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidPummelImmune_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelImmune_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidPummelReflect_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelReflect_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidPummelAbsorbIgnored_6554()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidPummelAbsorbIgnored_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidPummelDodge_6552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelDodge_6552",
    testCategory,
    6552,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidPummelBlock_6552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelBlock_6552",
    testCategory,
    6552,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidPummelParry_6552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelParry_6552",
    testCategory,
    6552,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidPummelMiss_6552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelMiss_6552",
    testCategory,
    6552,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidPummelResist_6552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelResist_6552",
    testCategory,
    6552,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidPummelImmune_6552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelImmune_6552",
    testCategory,
    6552,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidPummelReflect_6552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPummelReflect_6552",
    testCategory,
    6552,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidPummelAbsorbIgnored_6552()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidPummelAbsorbIgnored_6552",
    testCategory,
    6552,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidDisarmDodge_676()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDisarmDodge_676",
    testCategory,
    676,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidDisarmBlock_676()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDisarmBlock_676",
    testCategory,
    676,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidDisarmParry_676()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDisarmParry_676",
    testCategory,
    676,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidDisarmMiss_676()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDisarmMiss_676",
    testCategory,
    676,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDisarmResist_676()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDisarmResist_676",
    testCategory,
    676,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDisarmImmune_676()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDisarmImmune_676",
    testCategory,
    676,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDisarmReflect_676()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDisarmReflect_676",
    testCategory,
    676,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidDisarmAbsorbIgnored_676()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidDisarmAbsorbIgnored_676",
    testCategory,
    676,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
