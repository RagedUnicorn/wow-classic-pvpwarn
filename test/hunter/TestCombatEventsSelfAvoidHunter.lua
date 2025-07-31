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
mod.testCombatEventsSelfAvoidHunter = me

me.tag = "TestCombatEventsSelfAvoidHunter"

local testGroupName = "CombatEventsSelfAvoidHunter"
local testCategory = "hunter"

function me.Test()
  local isUsingSessionManager = false
  
  -- Check if session manager is handling test group management
  if mod.testSessionManager and mod.testSessionManager.IsSessionActive() then
    -- Session manager is active, just collect tests without managing test group
    isUsingSessionManager = true
    me.CollectTestCases()
  else
    -- No session manager, handle test group ourselves
    mod.testReporter.StartTestGroup(testGroupName)
    me.CollectTestCases()
  end

  mod.testReporter.PlayTestQueueWithDelay(function()
    if not isUsingSessionManager then
      mod.testReporter.StopTestGroup() -- async finish of test group
    end
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConcussiveShotDodge_5116)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConcussiveShotBlock_5116)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConcussiveShotParry_5116)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConcussiveShotMiss_5116)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConcussiveShotResist_5116)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConcussiveShotImmune_5116)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConcussiveShotReflect_5116)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConcussiveShotAbsorbIgnored_5116)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidScatterShotDodge_19503)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidScatterShotBlock_19503)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidScatterShotParry_19503)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidScatterShotMiss_19503)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidScatterShotResist_19503)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidScatterShotImmune_19503)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidScatterShotReflect_19503)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidScatterShotAbsorbIgnored_19503)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingDodge_13555)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingBlock_13555)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingParry_13555)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingMiss_13555)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingResist_13555)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingImmune_13555)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingReflect_13555)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13555)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingDodge_13554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingBlock_13554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingParry_13554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingMiss_13554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingResist_13554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingImmune_13554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingReflect_13554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingDodge_13553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingBlock_13553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingParry_13553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingMiss_13553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingResist_13553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingImmune_13553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingReflect_13553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingDodge_13552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingBlock_13552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingParry_13552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingMiss_13552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingResist_13552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingImmune_13552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingReflect_13552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingDodge_13551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingBlock_13551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingParry_13551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingMiss_13551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingResist_13551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingImmune_13551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingReflect_13551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingDodge_13550)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingBlock_13550)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingParry_13550)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingMiss_13550)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingResist_13550)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingImmune_13550)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingReflect_13550)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13550)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingDodge_13549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingBlock_13549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingParry_13549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingMiss_13549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingResist_13549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingImmune_13549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingReflect_13549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingDodge_1978)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingBlock_1978)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingParry_1978)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingMiss_1978)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingResist_1978)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingImmune_1978)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingReflect_1978)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_1978)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingDodge_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingBlock_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingParry_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingMiss_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingResist_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingImmune_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingReflect_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingAbsorbIgnored_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingDodge_14279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingBlock_14279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingParry_14279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingMiss_14279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingResist_14279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingImmune_14279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingReflect_14279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingAbsorbIgnored_14279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingDodge_3034)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingBlock_3034)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingParry_3034)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingMiss_3034)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingResist_3034)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingImmune_3034)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingReflect_3034)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidViperStingAbsorbIgnored_3034)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapDodge_14308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapBlock_14308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapParry_14308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapMiss_14308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapResist_14308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapImmune_14308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapReflect_14308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapAbsorbIgnored_14308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapDodge_3355)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapBlock_3355)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapParry_3355)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapMiss_3355)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapResist_3355)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapImmune_3355)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapReflect_3355)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFreezingTrapAbsorbIgnored_3355)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipDodge_14268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipBlock_14268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipParry_14268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipMiss_14268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipResist_14268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipImmune_14268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipReflect_14268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipAbsorbIgnored_14268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipDodge_14267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipBlock_14267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipParry_14267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipMiss_14267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipResist_14267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipImmune_14267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipReflect_14267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipAbsorbIgnored_14267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipDodge_2974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipBlock_2974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipParry_2974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipMiss_2974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipResist_2974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipImmune_2974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipReflect_2974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidWingClipAbsorbIgnored_2974)
end

function me.TestCombatEventSelfAvoidConcussiveShotDodge_5116()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConcussiveShotDodge_5116",
    testCategory,
    5116,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidConcussiveShotBlock_5116()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConcussiveShotBlock_5116",
    testCategory,
    5116,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidConcussiveShotParry_5116()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConcussiveShotParry_5116",
    testCategory,
    5116,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidConcussiveShotMiss_5116()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConcussiveShotMiss_5116",
    testCategory,
    5116,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidConcussiveShotResist_5116()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConcussiveShotResist_5116",
    testCategory,
    5116,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidConcussiveShotImmune_5116()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConcussiveShotImmune_5116",
    testCategory,
    5116,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidConcussiveShotReflect_5116()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConcussiveShotReflect_5116",
    testCategory,
    5116,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidConcussiveShotAbsorbIgnored_5116()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidConcussiveShotAbsorbIgnored_5116",
    testCategory,
    5116,
    "Concussive Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidScatterShotDodge_19503()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidScatterShotDodge_19503",
    testCategory,
    19503,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidScatterShotBlock_19503()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidScatterShotBlock_19503",
    testCategory,
    19503,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidScatterShotParry_19503()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidScatterShotParry_19503",
    testCategory,
    19503,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidScatterShotMiss_19503()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidScatterShotMiss_19503",
    testCategory,
    19503,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidScatterShotResist_19503()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidScatterShotResist_19503",
    testCategory,
    19503,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidScatterShotImmune_19503()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidScatterShotImmune_19503",
    testCategory,
    19503,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidScatterShotReflect_19503()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidScatterShotReflect_19503",
    testCategory,
    19503,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidScatterShotAbsorbIgnored_19503()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidScatterShotAbsorbIgnored_19503",
    testCategory,
    19503,
    "Scatter Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidSerpentStingDodge_13555()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingDodge_13555",
    testCategory,
    13555,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingBlock_13555()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingBlock_13555",
    testCategory,
    13555,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidSerpentStingParry_13555()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingParry_13555",
    testCategory,
    13555,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidSerpentStingMiss_13555()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingMiss_13555",
    testCategory,
    13555,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSerpentStingResist_13555()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingResist_13555",
    testCategory,
    13555,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidSerpentStingImmune_13555()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingImmune_13555",
    testCategory,
    13555,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingReflect_13555()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingReflect_13555",
    testCategory,
    13555,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13555()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13555",
    testCategory,
    13555,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidSerpentStingDodge_13554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingDodge_13554",
    testCategory,
    13554,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingBlock_13554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingBlock_13554",
    testCategory,
    13554,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidSerpentStingParry_13554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingParry_13554",
    testCategory,
    13554,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidSerpentStingMiss_13554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingMiss_13554",
    testCategory,
    13554,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSerpentStingResist_13554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingResist_13554",
    testCategory,
    13554,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidSerpentStingImmune_13554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingImmune_13554",
    testCategory,
    13554,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingReflect_13554()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingReflect_13554",
    testCategory,
    13554,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13554()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13554",
    testCategory,
    13554,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidSerpentStingDodge_13553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingDodge_13553",
    testCategory,
    13553,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingBlock_13553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingBlock_13553",
    testCategory,
    13553,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidSerpentStingParry_13553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingParry_13553",
    testCategory,
    13553,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidSerpentStingMiss_13553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingMiss_13553",
    testCategory,
    13553,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSerpentStingResist_13553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingResist_13553",
    testCategory,
    13553,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidSerpentStingImmune_13553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingImmune_13553",
    testCategory,
    13553,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingReflect_13553()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingReflect_13553",
    testCategory,
    13553,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13553()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13553",
    testCategory,
    13553,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidSerpentStingDodge_13552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingDodge_13552",
    testCategory,
    13552,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingBlock_13552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingBlock_13552",
    testCategory,
    13552,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidSerpentStingParry_13552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingParry_13552",
    testCategory,
    13552,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidSerpentStingMiss_13552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingMiss_13552",
    testCategory,
    13552,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSerpentStingResist_13552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingResist_13552",
    testCategory,
    13552,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidSerpentStingImmune_13552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingImmune_13552",
    testCategory,
    13552,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingReflect_13552()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingReflect_13552",
    testCategory,
    13552,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13552()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13552",
    testCategory,
    13552,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidSerpentStingDodge_13551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingDodge_13551",
    testCategory,
    13551,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingBlock_13551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingBlock_13551",
    testCategory,
    13551,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidSerpentStingParry_13551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingParry_13551",
    testCategory,
    13551,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidSerpentStingMiss_13551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingMiss_13551",
    testCategory,
    13551,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSerpentStingResist_13551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingResist_13551",
    testCategory,
    13551,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidSerpentStingImmune_13551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingImmune_13551",
    testCategory,
    13551,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingReflect_13551()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingReflect_13551",
    testCategory,
    13551,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13551()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13551",
    testCategory,
    13551,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidSerpentStingDodge_13550()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingDodge_13550",
    testCategory,
    13550,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingBlock_13550()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingBlock_13550",
    testCategory,
    13550,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidSerpentStingParry_13550()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingParry_13550",
    testCategory,
    13550,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidSerpentStingMiss_13550()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingMiss_13550",
    testCategory,
    13550,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSerpentStingResist_13550()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingResist_13550",
    testCategory,
    13550,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidSerpentStingImmune_13550()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingImmune_13550",
    testCategory,
    13550,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingReflect_13550()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingReflect_13550",
    testCategory,
    13550,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13550()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13550",
    testCategory,
    13550,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidSerpentStingDodge_13549()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingDodge_13549",
    testCategory,
    13549,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingBlock_13549()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingBlock_13549",
    testCategory,
    13549,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidSerpentStingParry_13549()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingParry_13549",
    testCategory,
    13549,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidSerpentStingMiss_13549()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingMiss_13549",
    testCategory,
    13549,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSerpentStingResist_13549()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingResist_13549",
    testCategory,
    13549,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidSerpentStingImmune_13549()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingImmune_13549",
    testCategory,
    13549,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingReflect_13549()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingReflect_13549",
    testCategory,
    13549,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13549()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_13549",
    testCategory,
    13549,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidSerpentStingDodge_1978()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingDodge_1978",
    testCategory,
    1978,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingBlock_1978()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingBlock_1978",
    testCategory,
    1978,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidSerpentStingParry_1978()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingParry_1978",
    testCategory,
    1978,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidSerpentStingMiss_1978()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingMiss_1978",
    testCategory,
    1978,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSerpentStingResist_1978()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingResist_1978",
    testCategory,
    1978,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidSerpentStingImmune_1978()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingImmune_1978",
    testCategory,
    1978,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingReflect_1978()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingReflect_1978",
    testCategory,
    1978,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_1978()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_1978",
    testCategory,
    1978,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidViperStingDodge_14280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingDodge_14280",
    testCategory,
    14280,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidViperStingBlock_14280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingBlock_14280",
    testCategory,
    14280,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidViperStingParry_14280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingParry_14280",
    testCategory,
    14280,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidViperStingMiss_14280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingMiss_14280",
    testCategory,
    14280,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidViperStingResist_14280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingResist_14280",
    testCategory,
    14280,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidViperStingImmune_14280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingImmune_14280",
    testCategory,
    14280,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidViperStingReflect_14280()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingReflect_14280",
    testCategory,
    14280,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidViperStingAbsorbIgnored_14280()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidViperStingAbsorbIgnored_14280",
    testCategory,
    14280,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidViperStingDodge_14279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingDodge_14279",
    testCategory,
    14279,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidViperStingBlock_14279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingBlock_14279",
    testCategory,
    14279,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidViperStingParry_14279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingParry_14279",
    testCategory,
    14279,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidViperStingMiss_14279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingMiss_14279",
    testCategory,
    14279,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidViperStingResist_14279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingResist_14279",
    testCategory,
    14279,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidViperStingImmune_14279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingImmune_14279",
    testCategory,
    14279,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidViperStingReflect_14279()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingReflect_14279",
    testCategory,
    14279,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidViperStingAbsorbIgnored_14279()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidViperStingAbsorbIgnored_14279",
    testCategory,
    14279,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidViperStingDodge_3034()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingDodge_3034",
    testCategory,
    3034,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidViperStingBlock_3034()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingBlock_3034",
    testCategory,
    3034,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidViperStingParry_3034()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingParry_3034",
    testCategory,
    3034,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidViperStingMiss_3034()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingMiss_3034",
    testCategory,
    3034,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidViperStingResist_3034()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingResist_3034",
    testCategory,
    3034,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidViperStingImmune_3034()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingImmune_3034",
    testCategory,
    3034,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidViperStingReflect_3034()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingReflect_3034",
    testCategory,
    3034,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidViperStingAbsorbIgnored_3034()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidViperStingAbsorbIgnored_3034",
    testCategory,
    3034,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapDodge_14308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFreezingTrapDodge_14308",
    testCategory,
    14308,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapBlock_14308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFreezingTrapBlock_14308",
    testCategory,
    14308,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapParry_14308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFreezingTrapParry_14308",
    testCategory,
    14308,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapMiss_14308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFreezingTrapMiss_14308",
    testCategory,
    14308,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapResist_14308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFreezingTrapResist_14308",
    testCategory,
    14308,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapImmune_14308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFreezingTrapImmune_14308",
    testCategory,
    14308,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapReflect_14308()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFreezingTrapReflect_14308",
    testCategory,
    14308,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapAbsorbIgnored_14308()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFreezingTrapAbsorbIgnored_14308",
    testCategory,
    14308,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapDodge_3355()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFreezingTrapDodge_3355",
    testCategory,
    3355,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapBlock_3355()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFreezingTrapBlock_3355",
    testCategory,
    3355,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapParry_3355()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFreezingTrapParry_3355",
    testCategory,
    3355,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapMiss_3355()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFreezingTrapMiss_3355",
    testCategory,
    3355,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapResist_3355()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFreezingTrapResist_3355",
    testCategory,
    3355,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapImmune_3355()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFreezingTrapImmune_3355",
    testCategory,
    3355,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapReflect_3355()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFreezingTrapReflect_3355",
    testCategory,
    3355,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFreezingTrapAbsorbIgnored_3355()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFreezingTrapAbsorbIgnored_3355",
    testCategory,
    3355,
    "Freezing Trap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidWingClipDodge_14268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipDodge_14268",
    testCategory,
    14268,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidWingClipBlock_14268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipBlock_14268",
    testCategory,
    14268,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidWingClipParry_14268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipParry_14268",
    testCategory,
    14268,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidWingClipMiss_14268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipMiss_14268",
    testCategory,
    14268,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidWingClipResist_14268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipResist_14268",
    testCategory,
    14268,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidWingClipImmune_14268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipImmune_14268",
    testCategory,
    14268,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidWingClipReflect_14268()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipReflect_14268",
    testCategory,
    14268,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidWingClipAbsorbIgnored_14268()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidWingClipAbsorbIgnored_14268",
    testCategory,
    14268,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidWingClipDodge_14267()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipDodge_14267",
    testCategory,
    14267,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidWingClipBlock_14267()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipBlock_14267",
    testCategory,
    14267,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidWingClipParry_14267()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipParry_14267",
    testCategory,
    14267,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidWingClipMiss_14267()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipMiss_14267",
    testCategory,
    14267,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidWingClipResist_14267()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipResist_14267",
    testCategory,
    14267,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidWingClipImmune_14267()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipImmune_14267",
    testCategory,
    14267,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidWingClipReflect_14267()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipReflect_14267",
    testCategory,
    14267,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidWingClipAbsorbIgnored_14267()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidWingClipAbsorbIgnored_14267",
    testCategory,
    14267,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidWingClipDodge_2974()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipDodge_2974",
    testCategory,
    2974,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidWingClipBlock_2974()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipBlock_2974",
    testCategory,
    2974,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidWingClipParry_2974()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipParry_2974",
    testCategory,
    2974,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidWingClipMiss_2974()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipMiss_2974",
    testCategory,
    2974,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidWingClipResist_2974()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipResist_2974",
    testCategory,
    2974,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidWingClipImmune_2974()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipImmune_2974",
    testCategory,
    2974,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidWingClipReflect_2974()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidWingClipReflect_2974",
    testCategory,
    2974,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidWingClipAbsorbIgnored_2974()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidWingClipAbsorbIgnored_2974",
    testCategory,
    2974,
    "Wing Clip",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
