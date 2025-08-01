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
mod.testCombatEventsEnemyAvoidWarrior = me

me.tag = "TestCombatEventsEnemyAvoidWarrior"

local testGroupName = "CombatEventsEnemyAvoidWarrior"
local testCategory = "warrior"

function me.Test()
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testenemycombatevent warrior")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidChargeStunDodge_7922)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidChargeStunBlock_7922)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidChargeStunParry_7922)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidChargeStunMiss_7922)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidChargeStunResist_7922)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidChargeStunImmune_7922)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidChargeStunReflect_7922)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidChargeStunAbsorbIgnored_7922)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunDodge_20615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunBlock_20615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunParry_20615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunMiss_20615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunResist_20615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunImmune_20615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunReflect_20615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunAbsorbIgnored_20615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunDodge_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunBlock_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunParry_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunMiss_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunResist_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunImmune_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunReflect_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunAbsorbIgnored_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunDodge_20614)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunBlock_20614)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunParry_20614)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunMiss_20614)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunResist_20614)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunImmune_20614)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunReflect_20614)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidInterceptStunAbsorbIgnored_20614)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringDodge_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringBlock_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringParry_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringMiss_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringResist_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringImmune_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringReflect_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringAbsorbIgnored_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringDodge_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringBlock_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringParry_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringMiss_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringResist_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringImmune_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringReflect_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringAbsorbIgnored_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringDodge_25212)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringBlock_25212)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringParry_25212)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringMiss_25212)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringResist_25212)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringImmune_25212)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringReflect_25212)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidHamstringAbsorbIgnored_25212)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeDodge_21553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeBlock_21553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeParry_21553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeMiss_21553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeResist_21553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeImmune_21553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeReflect_21553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_21553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeDodge_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeBlock_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeParry_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeMiss_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeResist_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeImmune_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeReflect_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeDodge_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeBlock_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeParry_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeMiss_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeResist_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeImmune_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeReflect_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeDodge_21552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeBlock_21552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeParry_21552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeMiss_21552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeResist_21552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeImmune_21552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeReflect_21552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_21552)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidIntimidatingShoutDodge_5246)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidIntimidatingShoutBlock_5246)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidIntimidatingShoutParry_5246)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidIntimidatingShoutMiss_5246)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidIntimidatingShoutResist_5246)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidIntimidatingShoutImmune_5246)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidIntimidatingShoutReflect_5246)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidIntimidatingShoutAbsorbIgnored_5246)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelDodge_6554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelBlock_6554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelParry_6554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelMiss_6554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelResist_6554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelImmune_6554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelReflect_6554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelAbsorbIgnored_6554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelDodge_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelBlock_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelParry_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelMiss_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelResist_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelImmune_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelReflect_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPummelAbsorbIgnored_6552)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDisarmDodge_676)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDisarmBlock_676)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDisarmParry_676)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDisarmMiss_676)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDisarmResist_676)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDisarmImmune_676)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDisarmReflect_676)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDisarmAbsorbIgnored_676)
end

function me.TestCombatEventEnemyAvoidChargeStunDodge_7922()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidChargeStunDodge_7922",
    testCategory,
    7922,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidChargeStunBlock_7922()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidChargeStunBlock_7922",
    testCategory,
    7922,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidChargeStunParry_7922()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidChargeStunParry_7922",
    testCategory,
    7922,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidChargeStunMiss_7922()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidChargeStunMiss_7922",
    testCategory,
    7922,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidChargeStunResist_7922()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidChargeStunResist_7922",
    testCategory,
    7922,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidChargeStunImmune_7922()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidChargeStunImmune_7922",
    testCategory,
    7922,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidChargeStunReflect_7922()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidChargeStunReflect_7922",
    testCategory,
    7922,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidChargeStunAbsorbIgnored_7922()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidChargeStunAbsorbIgnored_7922",
    testCategory,
    7922,
    "Charge Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunDodge_20615()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunDodge_20615",
    testCategory,
    20615,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunBlock_20615()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunBlock_20615",
    testCategory,
    20615,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunParry_20615()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunParry_20615",
    testCategory,
    20615,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunMiss_20615()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunMiss_20615",
    testCategory,
    20615,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunResist_20615()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunResist_20615",
    testCategory,
    20615,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunImmune_20615()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunImmune_20615",
    testCategory,
    20615,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunReflect_20615()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunReflect_20615",
    testCategory,
    20615,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunAbsorbIgnored_20615()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidInterceptStunAbsorbIgnored_20615",
    testCategory,
    20615,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunDodge_20253()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunDodge_20253",
    testCategory,
    20253,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunBlock_20253()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunBlock_20253",
    testCategory,
    20253,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunParry_20253()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunParry_20253",
    testCategory,
    20253,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunMiss_20253()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunMiss_20253",
    testCategory,
    20253,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunResist_20253()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunResist_20253",
    testCategory,
    20253,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunImmune_20253()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunImmune_20253",
    testCategory,
    20253,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunReflect_20253()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunReflect_20253",
    testCategory,
    20253,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunAbsorbIgnored_20253()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidInterceptStunAbsorbIgnored_20253",
    testCategory,
    20253,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunDodge_20614()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunDodge_20614",
    testCategory,
    20614,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunBlock_20614()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunBlock_20614",
    testCategory,
    20614,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunParry_20614()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunParry_20614",
    testCategory,
    20614,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunMiss_20614()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunMiss_20614",
    testCategory,
    20614,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunResist_20614()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunResist_20614",
    testCategory,
    20614,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunImmune_20614()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunImmune_20614",
    testCategory,
    20614,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunReflect_20614()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidInterceptStunReflect_20614",
    testCategory,
    20614,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidInterceptStunAbsorbIgnored_20614()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidInterceptStunAbsorbIgnored_20614",
    testCategory,
    20614,
    "Intercept Stun",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidHamstringDodge_7373()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringDodge_7373",
    testCategory,
    7373,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidHamstringBlock_7373()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringBlock_7373",
    testCategory,
    7373,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidHamstringParry_7373()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringParry_7373",
    testCategory,
    7373,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidHamstringMiss_7373()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringMiss_7373",
    testCategory,
    7373,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidHamstringResist_7373()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringResist_7373",
    testCategory,
    7373,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidHamstringImmune_7373()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringImmune_7373",
    testCategory,
    7373,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidHamstringReflect_7373()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringReflect_7373",
    testCategory,
    7373,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidHamstringAbsorbIgnored_7373()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidHamstringAbsorbIgnored_7373",
    testCategory,
    7373,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidHamstringDodge_7372()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringDodge_7372",
    testCategory,
    7372,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidHamstringBlock_7372()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringBlock_7372",
    testCategory,
    7372,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidHamstringParry_7372()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringParry_7372",
    testCategory,
    7372,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidHamstringMiss_7372()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringMiss_7372",
    testCategory,
    7372,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidHamstringResist_7372()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringResist_7372",
    testCategory,
    7372,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidHamstringImmune_7372()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringImmune_7372",
    testCategory,
    7372,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidHamstringReflect_7372()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringReflect_7372",
    testCategory,
    7372,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidHamstringAbsorbIgnored_7372()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidHamstringAbsorbIgnored_7372",
    testCategory,
    7372,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidHamstringDodge_25212()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringDodge_25212",
    testCategory,
    25212,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidHamstringBlock_25212()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringBlock_25212",
    testCategory,
    25212,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidHamstringParry_25212()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringParry_25212",
    testCategory,
    25212,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidHamstringMiss_25212()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringMiss_25212",
    testCategory,
    25212,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidHamstringResist_25212()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringResist_25212",
    testCategory,
    25212,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidHamstringImmune_25212()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringImmune_25212",
    testCategory,
    25212,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidHamstringReflect_25212()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidHamstringReflect_25212",
    testCategory,
    25212,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidHamstringAbsorbIgnored_25212()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidHamstringAbsorbIgnored_25212",
    testCategory,
    25212,
    "Hamstring",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeDodge_21553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeDodge_21553",
    testCategory,
    21553,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeBlock_21553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeBlock_21553",
    testCategory,
    21553,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeParry_21553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeParry_21553",
    testCategory,
    21553,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeMiss_21553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeMiss_21553",
    testCategory,
    21553,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeResist_21553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeResist_21553",
    testCategory,
    21553,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeImmune_21553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeImmune_21553",
    testCategory,
    21553,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeReflect_21553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeReflect_21553",
    testCategory,
    21553,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_21553()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_21553",
    testCategory,
    21553,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeDodge_12294()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeDodge_12294",
    testCategory,
    12294,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeBlock_12294()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeBlock_12294",
    testCategory,
    12294,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeParry_12294()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeParry_12294",
    testCategory,
    12294,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeMiss_12294()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeMiss_12294",
    testCategory,
    12294,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeResist_12294()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeResist_12294",
    testCategory,
    12294,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeImmune_12294()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeImmune_12294",
    testCategory,
    12294,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeReflect_12294()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeReflect_12294",
    testCategory,
    12294,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_12294()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_12294",
    testCategory,
    12294,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeDodge_21551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeDodge_21551",
    testCategory,
    21551,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeBlock_21551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeBlock_21551",
    testCategory,
    21551,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeParry_21551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeParry_21551",
    testCategory,
    21551,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeMiss_21551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeMiss_21551",
    testCategory,
    21551,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeResist_21551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeResist_21551",
    testCategory,
    21551,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeImmune_21551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeImmune_21551",
    testCategory,
    21551,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeReflect_21551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeReflect_21551",
    testCategory,
    21551,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_21551()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_21551",
    testCategory,
    21551,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeDodge_21552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeDodge_21552",
    testCategory,
    21552,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeBlock_21552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeBlock_21552",
    testCategory,
    21552,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeParry_21552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeParry_21552",
    testCategory,
    21552,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeMiss_21552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeMiss_21552",
    testCategory,
    21552,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeResist_21552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeResist_21552",
    testCategory,
    21552,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeImmune_21552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeImmune_21552",
    testCategory,
    21552,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeReflect_21552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeReflect_21552",
    testCategory,
    21552,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_21552()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_21552",
    testCategory,
    21552,
    "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end


function me.TestCombatEventEnemyAvoidIntimidatingShoutDodge_5246()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidIntimidatingShoutDodge_5246",
    testCategory,
    5246,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidIntimidatingShoutBlock_5246()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidIntimidatingShoutBlock_5246",
    testCategory,
    5246,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidIntimidatingShoutParry_5246()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidIntimidatingShoutParry_5246",
    testCategory,
    5246,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidIntimidatingShoutMiss_5246()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidIntimidatingShoutMiss_5246",
    testCategory,
    5246,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidIntimidatingShoutResist_5246()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidIntimidatingShoutResist_5246",
    testCategory,
    5246,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidIntimidatingShoutImmune_5246()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidIntimidatingShoutImmune_5246",
    testCategory,
    5246,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidIntimidatingShoutReflect_5246()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidIntimidatingShoutReflect_5246",
    testCategory,
    5246,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidIntimidatingShoutAbsorbIgnored_5246()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidIntimidatingShoutAbsorbIgnored_5246",
    testCategory,
    5246,
    "Intimidating Shout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidPummelDodge_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelDodge_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidPummelBlock_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelBlock_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidPummelParry_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelParry_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidPummelMiss_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelMiss_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidPummelResist_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelResist_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidPummelImmune_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelImmune_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidPummelReflect_6554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelReflect_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidPummelAbsorbIgnored_6554()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidPummelAbsorbIgnored_6554",
    testCategory,
    6554,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidPummelDodge_6552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelDodge_6552",
    testCategory,
    6552,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidPummelBlock_6552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelBlock_6552",
    testCategory,
    6552,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidPummelParry_6552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelParry_6552",
    testCategory,
    6552,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidPummelMiss_6552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelMiss_6552",
    testCategory,
    6552,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidPummelResist_6552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelResist_6552",
    testCategory,
    6552,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidPummelImmune_6552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelImmune_6552",
    testCategory,
    6552,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidPummelReflect_6552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPummelReflect_6552",
    testCategory,
    6552,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidPummelAbsorbIgnored_6552()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidPummelAbsorbIgnored_6552",
    testCategory,
    6552,
    "Pummel",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end


function me.TestCombatEventEnemyAvoidDisarmDodge_676()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDisarmDodge_676",
    testCategory,
    676,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidDisarmBlock_676()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDisarmBlock_676",
    testCategory,
    676,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidDisarmParry_676()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDisarmParry_676",
    testCategory,
    676,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidDisarmMiss_676()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDisarmMiss_676",
    testCategory,
    676,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidDisarmResist_676()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDisarmResist_676",
    testCategory,
    676,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidDisarmImmune_676()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDisarmImmune_676",
    testCategory,
    676,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDisarmReflect_676()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDisarmReflect_676",
    testCategory,
    676,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidDisarmAbsorbIgnored_676()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidDisarmAbsorbIgnored_676",
    testCategory,
    676,
    "Disarm",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
