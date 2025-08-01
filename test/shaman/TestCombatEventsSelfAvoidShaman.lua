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
mod.testCombatEventsSelfAvoidShaman = me

me.tag = "TestCombatEventsSelfAvoidShaman"

local testGroupName = "CombatEventsSelfAvoidShaman"
local testCategory = "shaman"

function me.Test()
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testselfavoidcombatevent shaman")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockDodge_10414)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockBlock_10414)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockParry_10414)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockMiss_10414)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockResist_10414)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockImmune_10414)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockReflect_10414)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockAbsorbIgnored_10414)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockDodge_8042)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockBlock_8042)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockParry_8042)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockMiss_8042)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockResist_8042)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockImmune_8042)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockReflect_8042)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockAbsorbIgnored_8042)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockDodge_8044)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockBlock_8044)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockParry_8044)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockMiss_8044)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockResist_8044)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockImmune_8044)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockReflect_8044)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockAbsorbIgnored_8044)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockDodge_8045)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockBlock_8045)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockParry_8045)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockMiss_8045)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockResist_8045)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockImmune_8045)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockReflect_8045)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockAbsorbIgnored_8045)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockDodge_8046)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockBlock_8046)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockParry_8046)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockMiss_8046)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockResist_8046)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockImmune_8046)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockReflect_8046)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockAbsorbIgnored_8046)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockDodge_10412)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockBlock_10412)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockParry_10412)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockMiss_10412)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockResist_10412)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockImmune_10412)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockReflect_10412)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockAbsorbIgnored_10412)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockDodge_10413)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockBlock_10413)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockParry_10413)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockMiss_10413)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockResist_10413)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockImmune_10413)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockReflect_10413)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidEarthShockAbsorbIgnored_10413)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockDodge_29228)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockBlock_29228)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockParry_29228)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockMiss_29228)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockResist_29228)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockImmune_29228)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockReflect_29228)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockAbsorbIgnored_29228)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockDodge_8050)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockBlock_8050)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockParry_8050)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockMiss_8050)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockResist_8050)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockImmune_8050)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockReflect_8050)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockAbsorbIgnored_8050)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockDodge_8052)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockBlock_8052)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockParry_8052)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockMiss_8052)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockResist_8052)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockImmune_8052)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockReflect_8052)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockAbsorbIgnored_8052)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockDodge_8053)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockBlock_8053)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockParry_8053)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockMiss_8053)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockResist_8053)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockImmune_8053)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockReflect_8053)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockAbsorbIgnored_8053)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockDodge_10447)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockBlock_10447)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockParry_10447)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockMiss_10447)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockResist_10447)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockImmune_10447)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockReflect_10447)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockAbsorbIgnored_10447)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockDodge_10448)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockBlock_10448)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockParry_10448)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockMiss_10448)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockResist_10448)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockImmune_10448)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockReflect_10448)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFlameShockAbsorbIgnored_10448)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockDodge_10473)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockBlock_10473)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockParry_10473)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockMiss_10473)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockResist_10473)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockImmune_10473)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockReflect_10473)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockAbsorbIgnored_10473)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockDodge_8056)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockBlock_8056)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockParry_8056)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockMiss_8056)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockResist_8056)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockImmune_8056)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockReflect_8056)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockAbsorbIgnored_8056)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockDodge_8058)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockBlock_8058)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockParry_8058)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockMiss_8058)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockResist_8058)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockImmune_8058)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockReflect_8058)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockAbsorbIgnored_8058)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockDodge_10472)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockBlock_10472)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockParry_10472)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockMiss_10472)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockResist_10472)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockImmune_10472)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockReflect_10472)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostShockAbsorbIgnored_10472)
end

function me.TestCombatEventSelfAvoidEarthShockDodge_10414()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockDodge_10414",
    testCategory,
    10414,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidEarthShockBlock_10414()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockBlock_10414",
    testCategory,
    10414,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidEarthShockParry_10414()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockParry_10414",
    testCategory,
    10414,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidEarthShockMiss_10414()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockMiss_10414",
    testCategory,
    10414,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidEarthShockResist_10414()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockResist_10414",
    testCategory,
    10414,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidEarthShockImmune_10414()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockImmune_10414",
    testCategory,
    10414,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidEarthShockReflect_10414()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockReflect_10414",
    testCategory,
    10414,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidEarthShockAbsorbIgnored_10414()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidEarthShockAbsorbIgnored_10414",
    testCategory,
    10414,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidEarthShockDodge_8042()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockDodge_8042",
    testCategory,
    8042,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidEarthShockBlock_8042()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockBlock_8042",
    testCategory,
    8042,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidEarthShockParry_8042()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockParry_8042",
    testCategory,
    8042,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidEarthShockMiss_8042()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockMiss_8042",
    testCategory,
    8042,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidEarthShockResist_8042()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockResist_8042",
    testCategory,
    8042,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidEarthShockImmune_8042()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockImmune_8042",
    testCategory,
    8042,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidEarthShockReflect_8042()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockReflect_8042",
    testCategory,
    8042,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidEarthShockAbsorbIgnored_8042()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidEarthShockAbsorbIgnored_8042",
    testCategory,
    8042,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidEarthShockDodge_8044()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockDodge_8044",
    testCategory,
    8044,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidEarthShockBlock_8044()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockBlock_8044",
    testCategory,
    8044,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidEarthShockParry_8044()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockParry_8044",
    testCategory,
    8044,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidEarthShockMiss_8044()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockMiss_8044",
    testCategory,
    8044,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidEarthShockResist_8044()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockResist_8044",
    testCategory,
    8044,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidEarthShockImmune_8044()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockImmune_8044",
    testCategory,
    8044,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidEarthShockReflect_8044()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockReflect_8044",
    testCategory,
    8044,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidEarthShockAbsorbIgnored_8044()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidEarthShockAbsorbIgnored_8044",
    testCategory,
    8044,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidEarthShockDodge_8045()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockDodge_8045",
    testCategory,
    8045,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidEarthShockBlock_8045()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockBlock_8045",
    testCategory,
    8045,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidEarthShockParry_8045()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockParry_8045",
    testCategory,
    8045,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidEarthShockMiss_8045()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockMiss_8045",
    testCategory,
    8045,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidEarthShockResist_8045()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockResist_8045",
    testCategory,
    8045,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidEarthShockImmune_8045()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockImmune_8045",
    testCategory,
    8045,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidEarthShockReflect_8045()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockReflect_8045",
    testCategory,
    8045,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidEarthShockAbsorbIgnored_8045()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidEarthShockAbsorbIgnored_8045",
    testCategory,
    8045,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidEarthShockDodge_8046()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockDodge_8046",
    testCategory,
    8046,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidEarthShockBlock_8046()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockBlock_8046",
    testCategory,
    8046,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidEarthShockParry_8046()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockParry_8046",
    testCategory,
    8046,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidEarthShockMiss_8046()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockMiss_8046",
    testCategory,
    8046,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidEarthShockResist_8046()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockResist_8046",
    testCategory,
    8046,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidEarthShockImmune_8046()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockImmune_8046",
    testCategory,
    8046,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidEarthShockReflect_8046()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockReflect_8046",
    testCategory,
    8046,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidEarthShockAbsorbIgnored_8046()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidEarthShockAbsorbIgnored_8046",
    testCategory,
    8046,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidEarthShockDodge_10412()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockDodge_10412",
    testCategory,
    10412,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidEarthShockBlock_10412()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockBlock_10412",
    testCategory,
    10412,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidEarthShockParry_10412()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockParry_10412",
    testCategory,
    10412,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidEarthShockMiss_10412()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockMiss_10412",
    testCategory,
    10412,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidEarthShockResist_10412()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockResist_10412",
    testCategory,
    10412,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidEarthShockImmune_10412()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockImmune_10412",
    testCategory,
    10412,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidEarthShockReflect_10412()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockReflect_10412",
    testCategory,
    10412,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidEarthShockAbsorbIgnored_10412()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidEarthShockAbsorbIgnored_10412",
    testCategory,
    10412,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidEarthShockDodge_10413()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockDodge_10413",
    testCategory,
    10413,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidEarthShockBlock_10413()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockBlock_10413",
    testCategory,
    10413,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidEarthShockParry_10413()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockParry_10413",
    testCategory,
    10413,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidEarthShockMiss_10413()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockMiss_10413",
    testCategory,
    10413,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidEarthShockResist_10413()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockResist_10413",
    testCategory,
    10413,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidEarthShockImmune_10413()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockImmune_10413",
    testCategory,
    10413,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidEarthShockReflect_10413()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockReflect_10413",
    testCategory,
    10413,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidEarthShockAbsorbIgnored_10413()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidEarthShockAbsorbIgnored_10413",
    testCategory,
    10413,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFlameShockDodge_29228()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockDodge_29228",
    testCategory,
    29228,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFlameShockBlock_29228()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockBlock_29228",
    testCategory,
    29228,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFlameShockParry_29228()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockParry_29228",
    testCategory,
    29228,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFlameShockMiss_29228()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockMiss_29228",
    testCategory,
    29228,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFlameShockResist_29228()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockResist_29228",
    testCategory,
    29228,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFlameShockImmune_29228()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockImmune_29228",
    testCategory,
    29228,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFlameShockReflect_29228()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockReflect_29228",
    testCategory,
    29228,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFlameShockAbsorbIgnored_29228()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFlameShockAbsorbIgnored_29228",
    testCategory,
    29228,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFlameShockDodge_8050()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockDodge_8050",
    testCategory,
    8050,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFlameShockBlock_8050()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockBlock_8050",
    testCategory,
    8050,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFlameShockParry_8050()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockParry_8050",
    testCategory,
    8050,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFlameShockMiss_8050()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockMiss_8050",
    testCategory,
    8050,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFlameShockResist_8050()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockResist_8050",
    testCategory,
    8050,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFlameShockImmune_8050()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockImmune_8050",
    testCategory,
    8050,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFlameShockReflect_8050()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockReflect_8050",
    testCategory,
    8050,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFlameShockAbsorbIgnored_8050()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFlameShockAbsorbIgnored_8050",
    testCategory,
    8050,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFlameShockDodge_8052()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockDodge_8052",
    testCategory,
    8052,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFlameShockBlock_8052()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockBlock_8052",
    testCategory,
    8052,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFlameShockParry_8052()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockParry_8052",
    testCategory,
    8052,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFlameShockMiss_8052()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockMiss_8052",
    testCategory,
    8052,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFlameShockResist_8052()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockResist_8052",
    testCategory,
    8052,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFlameShockImmune_8052()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockImmune_8052",
    testCategory,
    8052,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFlameShockReflect_8052()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockReflect_8052",
    testCategory,
    8052,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFlameShockAbsorbIgnored_8052()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFlameShockAbsorbIgnored_8052",
    testCategory,
    8052,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFlameShockDodge_8053()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockDodge_8053",
    testCategory,
    8053,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFlameShockBlock_8053()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockBlock_8053",
    testCategory,
    8053,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFlameShockParry_8053()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockParry_8053",
    testCategory,
    8053,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFlameShockMiss_8053()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockMiss_8053",
    testCategory,
    8053,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFlameShockResist_8053()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockResist_8053",
    testCategory,
    8053,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFlameShockImmune_8053()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockImmune_8053",
    testCategory,
    8053,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFlameShockReflect_8053()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockReflect_8053",
    testCategory,
    8053,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFlameShockAbsorbIgnored_8053()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFlameShockAbsorbIgnored_8053",
    testCategory,
    8053,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFlameShockDodge_10447()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockDodge_10447",
    testCategory,
    10447,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFlameShockBlock_10447()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockBlock_10447",
    testCategory,
    10447,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFlameShockParry_10447()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockParry_10447",
    testCategory,
    10447,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFlameShockMiss_10447()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockMiss_10447",
    testCategory,
    10447,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFlameShockResist_10447()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockResist_10447",
    testCategory,
    10447,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFlameShockImmune_10447()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockImmune_10447",
    testCategory,
    10447,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFlameShockReflect_10447()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockReflect_10447",
    testCategory,
    10447,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFlameShockAbsorbIgnored_10447()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFlameShockAbsorbIgnored_10447",
    testCategory,
    10447,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFlameShockDodge_10448()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockDodge_10448",
    testCategory,
    10448,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFlameShockBlock_10448()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockBlock_10448",
    testCategory,
    10448,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFlameShockParry_10448()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockParry_10448",
    testCategory,
    10448,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFlameShockMiss_10448()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockMiss_10448",
    testCategory,
    10448,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFlameShockResist_10448()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockResist_10448",
    testCategory,
    10448,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFlameShockImmune_10448()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockImmune_10448",
    testCategory,
    10448,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFlameShockReflect_10448()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockReflect_10448",
    testCategory,
    10448,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFlameShockAbsorbIgnored_10448()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFlameShockAbsorbIgnored_10448",
    testCategory,
    10448,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFrostShockDodge_10473()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockDodge_10473",
    testCategory,
    10473,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFrostShockBlock_10473()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockBlock_10473",
    testCategory,
    10473,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFrostShockParry_10473()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockParry_10473",
    testCategory,
    10473,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFrostShockMiss_10473()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockMiss_10473",
    testCategory,
    10473,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFrostShockResist_10473()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockResist_10473",
    testCategory,
    10473,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFrostShockImmune_10473()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockImmune_10473",
    testCategory,
    10473,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFrostShockReflect_10473()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockReflect_10473",
    testCategory,
    10473,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFrostShockAbsorbIgnored_10473()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFrostShockAbsorbIgnored_10473",
    testCategory,
    10473,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFrostShockDodge_8056()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockDodge_8056",
    testCategory,
    8056,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFrostShockBlock_8056()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockBlock_8056",
    testCategory,
    8056,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFrostShockParry_8056()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockParry_8056",
    testCategory,
    8056,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFrostShockMiss_8056()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockMiss_8056",
    testCategory,
    8056,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFrostShockResist_8056()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockResist_8056",
    testCategory,
    8056,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFrostShockImmune_8056()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockImmune_8056",
    testCategory,
    8056,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFrostShockReflect_8056()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockReflect_8056",
    testCategory,
    8056,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFrostShockAbsorbIgnored_8056()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFrostShockAbsorbIgnored_8056",
    testCategory,
    8056,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFrostShockDodge_8058()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockDodge_8058",
    testCategory,
    8058,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFrostShockBlock_8058()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockBlock_8058",
    testCategory,
    8058,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFrostShockParry_8058()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockParry_8058",
    testCategory,
    8058,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFrostShockMiss_8058()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockMiss_8058",
    testCategory,
    8058,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFrostShockResist_8058()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockResist_8058",
    testCategory,
    8058,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFrostShockImmune_8058()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockImmune_8058",
    testCategory,
    8058,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFrostShockReflect_8058()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockReflect_8058",
    testCategory,
    8058,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFrostShockAbsorbIgnored_8058()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFrostShockAbsorbIgnored_8058",
    testCategory,
    8058,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFrostShockDodge_10472()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockDodge_10472",
    testCategory,
    10472,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFrostShockBlock_10472()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockBlock_10472",
    testCategory,
    10472,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFrostShockParry_10472()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockParry_10472",
    testCategory,
    10472,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFrostShockMiss_10472()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockMiss_10472",
    testCategory,
    10472,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFrostShockResist_10472()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockResist_8056",
    testCategory,
    10472,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFrostShockImmune_10472()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockImmune_10472",
    testCategory,
    10472,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFrostShockReflect_10472()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockReflect_10472",
    testCategory,
    10472,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFrostShockAbsorbIgnored_10472()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFrostShockAbsorbIgnored_10472",
    testCategory,
    10472,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
