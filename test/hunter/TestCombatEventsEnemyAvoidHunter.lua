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
mod.testCombatEventsEnemyAvoidHunter = me

me.tag = "TestCombatEventsEnemyAvoidHunter"

local testGroupName = "CombatEventsEnemyAvoidHunter"
local testCategory = "hunter"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end


function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConcussiveShotDodge_5116)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConcussiveShotBlock_5116)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConcussiveShotParry_5116)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConcussiveShotMiss_5116)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConcussiveShotResist_5116)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConcussiveShotImmune_5116)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConcussiveShotReflect_5116)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConcussiveShotAbsorbIgnored_5116)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidScatterShotDodge_19503)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidScatterShotBlock_19503)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidScatterShotParry_19503)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidScatterShotMiss_19503)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidScatterShotResist_19503)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidScatterShotImmune_19503)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidScatterShotReflect_19503)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidScatterShotAbsorbIgnored_19503)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingDodge_13555)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingBlock_13555)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingParry_13555)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingMiss_13555)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingResist_13555)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingImmune_13555)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingReflect_13555)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13555)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingDodge_13554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingBlock_13554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingParry_13554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingMiss_13554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingResist_13554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingImmune_13554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingReflect_13554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingDodge_13553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingBlock_13553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingParry_13553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingMiss_13553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingResist_13553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingImmune_13553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingReflect_13553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingDodge_13552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingBlock_13552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingParry_13552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingMiss_13552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingResist_13552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingImmune_13552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingReflect_13552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingDodge_13551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingBlock_13551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingParry_13551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingMiss_13551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingResist_13551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingImmune_13551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingReflect_13551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingDodge_13550)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingBlock_13550)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingParry_13550)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingMiss_13550)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingResist_13550)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingImmune_13550)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingReflect_13550)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13550)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingDodge_13549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingBlock_13549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingParry_13549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingMiss_13549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingResist_13549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingImmune_13549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingReflect_13549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingDodge_1978)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingBlock_1978)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingParry_1978)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingMiss_1978)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingResist_1978)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingImmune_1978)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingReflect_1978)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_1978)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingDodge_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingBlock_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingParry_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingMiss_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingResist_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingImmune_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingReflect_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingAbsorbIgnored_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingDodge_14279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingBlock_14279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingParry_14279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingMiss_14279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingResist_14279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingImmune_14279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingReflect_14279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingAbsorbIgnored_14279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingDodge_3034)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingBlock_3034)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingParry_3034)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingMiss_3034)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingResist_3034)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingImmune_3034)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingReflect_3034)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidViperStingAbsorbIgnored_3034)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFreezingTrapDodge_14308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFreezingTrapBlock_14308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFreezingTrapParry_14308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFreezingTrapMiss_14308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFreezingTrapResist_14308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFreezingTrapImmune_14308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFreezingTrapReflect_14308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFreezingTrapAbsorbIgnored_14308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFreezingTrapDodge_3355)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFreezingTrapBlock_3355)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFreezingTrapParry_3355)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFreezingTrapMiss_3355)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFreezingTrapResist_3355)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFreezingTrapImmune_3355)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFreezingTrapReflect_3355)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFreezingTrapAbsorbIgnored_3355)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipDodge_14268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipBlock_14268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipParry_14268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipMiss_14268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipResist_14268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipImmune_14268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipReflect_14268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipAbsorbIgnored_14268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipDodge_14267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipBlock_14267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipParry_14267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipMiss_14267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipResist_14267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipImmune_14267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipReflect_14267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipAbsorbIgnored_14267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipDodge_2974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipBlock_2974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipParry_2974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipMiss_2974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipResist_2974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipImmune_2974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipReflect_2974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidWingClipAbsorbIgnored_2974)
end

function me.TestCombatEventEnemyAvoidConcussiveShotDodge_5116()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConcussiveShotDodge_5116",
    testCategory,
    5116,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidConcussiveShotBlock_5116()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConcussiveShotBlock_5116",
    testCategory,
    5116,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidConcussiveShotParry_5116()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConcussiveShotParry_5116",
    testCategory,
    5116,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidConcussiveShotMiss_5116()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConcussiveShotMiss_5116",
    testCategory,
    5116,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidConcussiveShotResist_5116()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConcussiveShotResist_5116",
    testCategory,
    5116,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidConcussiveShotImmune_5116()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConcussiveShotImmune_5116",
    testCategory,
    5116,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidConcussiveShotReflect_5116()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConcussiveShotReflect_5116",
    testCategory,
    5116,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidConcussiveShotAbsorbIgnored_5116()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidConcussiveShotAbsorbIgnored_5116",
    testCategory,
    5116,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidScatterShotDodge_19503()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidScatterShotDodge_19503",
    testCategory,
    19503,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidScatterShotBlock_19503()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidScatterShotBlock_19503",
    testCategory,
    19503,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidScatterShotParry_19503()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidScatterShotParry_19503",
    testCategory,
    19503,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidScatterShotMiss_19503()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidScatterShotMiss_19503",
    testCategory,
    19503,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidScatterShotResist_19503()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidScatterShotResist_19503",
    testCategory,
    19503,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidScatterShotImmune_19503()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidScatterShotImmune_19503",
    testCategory,
    19503,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidScatterShotReflect_19503()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidScatterShotReflect_19503",
    testCategory,
    19503,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidScatterShotAbsorbIgnored_19503()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidScatterShotAbsorbIgnored_19503",
    testCategory,
    19503,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingDodge_13555()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingDodge_13555",
    testCategory,
    13555,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingBlock_13555()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingBlock_13555",
    testCategory,
    13555,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingParry_13555()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingParry_13555",
    testCategory,
    13555,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingMiss_13555()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingMiss_13555",
    testCategory,
    13555,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingResist_13555()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingResist_13555",
    testCategory,
    13555,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingImmune_13555()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingImmune_13555",
    testCategory,
    13555,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingReflect_13555()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingReflect_13555",
    testCategory,
    13555,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13555()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13555",
    testCategory,
    13555,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingDodge_13554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingDodge_13554",
    testCategory,
    13554,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingBlock_13554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingBlock_13554",
    testCategory,
    13554,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingParry_13554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingParry_13554",
    testCategory,
    13554,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingMiss_13554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingMiss_13554",
    testCategory,
    13554,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingResist_13554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingResist_13554",
    testCategory,
    13554,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingImmune_13554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingImmune_13554",
    testCategory,
    13554,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingReflect_13554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingReflect_13554",
    testCategory,
    13554,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13554()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13554",
    testCategory,
    13554,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingDodge_13553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingDodge_13553",
    testCategory,
    13553,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingBlock_13553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingBlock_13553",
    testCategory,
    13553,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingParry_13553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingParry_13553",
    testCategory,
    13553,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingMiss_13553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingMiss_13553",
    testCategory,
    13553,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingResist_13553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingResist_13553",
    testCategory,
    13553,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingImmune_13553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingImmune_13553",
    testCategory,
    13553,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingReflect_13553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingReflect_13553",
    testCategory,
    13553,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13553()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13553",
    testCategory,
    13553,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingDodge_13552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingDodge_13552",
    testCategory,
    13552,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingBlock_13552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingBlock_13552",
    testCategory,
    13552,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingParry_13552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingParry_13552",
    testCategory,
    13552,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingMiss_13552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingMiss_13552",
    testCategory,
    13552,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingResist_13552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingResist_13552",
    testCategory,
    13552,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingImmune_13552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingImmune_13552",
    testCategory,
    13552,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingReflect_13552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingReflect_13552",
    testCategory,
    13552,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13552()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13552",
    testCategory,
    13552,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingDodge_13551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingDodge_13551",
    testCategory,
    13551,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingBlock_13551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingBlock_13551",
    testCategory,
    13551,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingParry_13551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingParry_13551",
    testCategory,
    13551,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingMiss_13551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingMiss_13551",
    testCategory,
    13551,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingResist_13551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingResist_13551",
    testCategory,
    13551,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingImmune_13551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingImmune_13551",
    testCategory,
    13551,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingReflect_13551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingReflect_13551",
    testCategory,
    13551,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13551()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13551",
    testCategory,
    13551,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingDodge_13550()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingDodge_13550",
    testCategory,
    13550,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingBlock_13550()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingBlock_13550",
    testCategory,
    13550,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingParry_13550()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingParry_13550",
    testCategory,
    13550,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingMiss_13550()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingMiss_13550",
    testCategory,
    13550,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingResist_13550()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingResist_13550",
    testCategory,
    13550,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingImmune_13550()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingImmune_13550",
    testCategory,
    13550,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingReflect_13550()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingReflect_13550",
    testCategory,
    13550,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13550()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13550",
    testCategory,
    13550,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingDodge_13549()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingDodge_13549",
    testCategory,
    13549,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingBlock_13549()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingBlock_13549",
    testCategory,
    13549,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingParry_13549()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingParry_13549",
    testCategory,
    13549,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingMiss_13549()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingMiss_13549",
    testCategory,
    13549,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingResist_13549()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingResist_13549",
    testCategory,
    13549,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingImmune_13549()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingImmune_13549",
    testCategory,
    13549,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingReflect_13549()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingReflect_13549",
    testCategory,
    13549,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13549()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_13549",
    testCategory,
    13549,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingDodge_1978()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingDodge_1978",
    testCategory,
    1978,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingBlock_1978()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingBlock_1978",
    testCategory,
    1978,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingParry_1978()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingParry_1978",
    testCategory,
    1978,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingMiss_1978()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingMiss_1978",
    testCategory,
    1978,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingResist_1978()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingResist_1978",
    testCategory,
    1978,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingImmune_1978()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingImmune_1978",
    testCategory,
    1978,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingReflect_1978()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingReflect_1978",
    testCategory,
    1978,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_1978()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_1978",
    testCategory,
    1978,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidViperStingDodge_14280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingDodge_14280",
    testCategory,
    14280,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidViperStingBlock_14280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingBlock_14280",
    testCategory,
    14280,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidViperStingParry_14280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingParry_14280",
    testCategory,
    14280,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidViperStingMiss_14280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingMiss_14280",
    testCategory,
    14280,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidViperStingResist_14280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingResist_14280",
    testCategory,
    14280,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidViperStingImmune_14280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingImmune_14280",
    testCategory,
    14280,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidViperStingReflect_14280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingReflect_14280",
    testCategory,
    14280,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidViperStingAbsorbIgnored_14280()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidViperStingAbsorbIgnored_14280",
    testCategory,
    14280,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidViperStingDodge_14279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingDodge_14279",
    testCategory,
    14279,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidViperStingBlock_14279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingBlock_14279",
    testCategory,
    14279,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidViperStingParry_14279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingParry_14279",
    testCategory,
    14279,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidViperStingMiss_14279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingMiss_14279",
    testCategory,
    14279,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidViperStingResist_14279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingResist_14279",
    testCategory,
    14279,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidViperStingImmune_14279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingImmune_14279",
    testCategory,
    14279,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidViperStingReflect_14279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingReflect_14279",
    testCategory,
    14279,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidViperStingAbsorbIgnored_14279()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidViperStingAbsorbIgnored_14279",
    testCategory,
    14279,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidViperStingDodge_3034()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingDodge_3034",
    testCategory,
    3034,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidViperStingBlock_3034()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingBlock_3034",
    testCategory,
    3034,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidViperStingParry_3034()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingParry_3034",
    testCategory,
    3034,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidViperStingMiss_3034()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingMiss_3034",
    testCategory,
    3034,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidViperStingResist_3034()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingResist_3034",
    testCategory,
    3034,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidViperStingImmune_3034()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingImmune_3034",
    testCategory,
    3034,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidViperStingReflect_3034()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingReflect_3034",
    testCategory,
    3034,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidViperStingAbsorbIgnored_3034()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidViperStingAbsorbIgnored_3034",
    testCategory,
    3034,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFreezingTrapDodge_14308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFreezingTrapDodge_14308",
    testCategory,
    14308,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFreezingTrapBlock_14308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFreezingTrapBlock_14308",
    testCategory,
    14308,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFreezingTrapParry_14308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFreezingTrapParry_14308",
    testCategory,
    14308,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFreezingTrapMiss_14308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFreezingTrapMiss_14308",
    testCategory,
    14308,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFreezingTrapResist_14308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFreezingTrapResist_14308",
    testCategory,
    14308,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFreezingTrapImmune_14308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFreezingTrapImmune_14308",
    testCategory,
    14308,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFreezingTrapReflect_14308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFreezingTrapReflect_14308",
    testCategory,
    14308,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFreezingTrapAbsorbIgnored_14308()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFreezingTrapAbsorbIgnored_14308",
    testCategory,
    14308,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFreezingTrapDodge_3355()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFreezingTrapDodge_3355",
    testCategory,
    3355,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFreezingTrapBlock_3355()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFreezingTrapBlock_3355",
    testCategory,
    3355,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFreezingTrapParry_3355()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFreezingTrapParry_3355",
    testCategory,
    3355,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFreezingTrapMiss_3355()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFreezingTrapMiss_3355",
    testCategory,
    3355,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFreezingTrapResist_3355()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFreezingTrapResist_3355",
    testCategory,
    3355,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFreezingTrapImmune_3355()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFreezingTrapImmune_3355",
    testCategory,
    3355,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFreezingTrapReflect_3355()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFreezingTrapReflect_3355",
    testCategory,
    3355,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFreezingTrapAbsorbIgnored_3355()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFreezingTrapAbsorbIgnored_3355",
    testCategory,
    3355,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidWingClipDodge_14268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipDodge_14268",
    testCategory,
    14268,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidWingClipBlock_14268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipBlock_14268",
    testCategory,
    14268,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidWingClipParry_14268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipParry_14268",
    testCategory,
    14268,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidWingClipMiss_14268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipMiss_14268",
    testCategory,
    14268,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidWingClipResist_14268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipResist_14268",
    testCategory,
    14268,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidWingClipImmune_14268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipImmune_14268",
    testCategory,
    14268,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidWingClipReflect_14268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipReflect_14268",
    testCategory,
    14268,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidWingClipAbsorbIgnored_14268()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidWingClipAbsorbIgnored_14268",
    testCategory,
    14268,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidWingClipDodge_14267()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipDodge_14267",
    testCategory,
    14267,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidWingClipBlock_14267()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipBlock_14267",
    testCategory,
    14267,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidWingClipParry_14267()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipParry_14267",
    testCategory,
    14267,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidWingClipMiss_14267()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipMiss_14267",
    testCategory,
    14267,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidWingClipResist_14267()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipResist_14267",
    testCategory,
    14267,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidWingClipImmune_14267()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipImmune_14267",
    testCategory,
    14267,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidWingClipReflect_14267()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipReflect_14267",
    testCategory,
    14267,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidWingClipAbsorbIgnored_14267()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidWingClipAbsorbIgnored_14267",
    testCategory,
    14267,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidWingClipDodge_2974()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipDodge_2974",
    testCategory,
    2974,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidWingClipBlock_2974()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipBlock_2974",
    testCategory,
    2974,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidWingClipParry_2974()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipParry_2974",
    testCategory,
    2974,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidWingClipMiss_2974()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipMiss_2974",
    testCategory,
    2974,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidWingClipResist_2974()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipResist_2974",
    testCategory,
    2974,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidWingClipImmune_2974()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipImmune_2974",
    testCategory,
    2974,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidWingClipReflect_2974()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidWingClipReflect_2974",
    testCategory,
    2974,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidWingClipAbsorbIgnored_2974()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidWingClipAbsorbIgnored_2974",
    testCategory,
    2974,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
