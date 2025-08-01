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
mod.testCombatEventsEnemyAvoidShaman = me

me.tag = "TestCombatEventsEnemyAvoidShaman"

local testCategory = "shaman"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testenemycombatevent shaman")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockDodge_10414)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockBlock_10414)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockParry_10414)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockMiss_10414)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockResist_10414)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockImmune_10414)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockReflect_10414)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_10414)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockDodge_8042)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockBlock_8042)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockParry_8042)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockMiss_8042)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockResist_8042)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockImmune_8042)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockReflect_8042)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_8042)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockDodge_8044)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockBlock_8044)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockParry_8044)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockMiss_8044)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockResist_8044)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockImmune_8044)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockReflect_8044)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_8044)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockDodge_8045)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockBlock_8045)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockParry_8045)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockMiss_8045)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockResist_8045)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockImmune_8045)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockReflect_8045)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_8045)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockDodge_8046)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockBlock_8046)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockParry_8046)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockMiss_8046)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockResist_8046)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockImmune_8046)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockReflect_8046)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_8046)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockDodge_10412)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockBlock_10412)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockParry_10412)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockMiss_10412)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockResist_10412)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockImmune_10412)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockReflect_10412)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_10412)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockDodge_10413)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockBlock_10413)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockParry_10413)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockMiss_10413)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockResist_10413)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockImmune_10413)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockReflect_10413)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_10413)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockDodge_29228)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockBlock_29228)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockParry_29228)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockMiss_29228)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockResist_29228)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockImmune_29228)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockReflect_29228)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_29228)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockDodge_8050)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockBlock_8050)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockParry_8050)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockMiss_8050)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockResist_8050)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockImmune_8050)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockReflect_8050)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_8050)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockDodge_8052)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockBlock_8052)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockParry_8052)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockMiss_8052)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockResist_8052)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockImmune_8052)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockReflect_8052)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_8052)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockDodge_8053)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockBlock_8053)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockParry_8053)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockMiss_8053)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockResist_8053)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockImmune_8053)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockReflect_8053)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_8053)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockDodge_10447)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockBlock_10447)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockParry_10447)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockMiss_10447)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockResist_10447)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockImmune_10447)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockReflect_10447)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_10447)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockDodge_10448)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockBlock_10448)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockParry_10448)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockMiss_10448)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockResist_10448)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockImmune_10448)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockReflect_10448)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_10448)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockDodge_10473)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockBlock_10473)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockParry_10473)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockMiss_10473)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockResist_10473)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockImmune_10473)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockReflect_10473)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockAbsorbIgnored_10473)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockDodge_8056)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockBlock_8056)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockParry_8056)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockMiss_8056)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockResist_8056)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockImmune_8056)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockReflect_8056)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockAbsorbIgnored_8056)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockDodge_8058)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockBlock_8058)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockParry_8058)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockMiss_8058)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockResist_8058)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockImmune_8058)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockReflect_8058)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockAbsorbIgnored_8058)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockDodge_10472)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockBlock_10472)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockParry_10472)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockMiss_10472)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockResist_10472)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockImmune_10472)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockReflect_10472)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockAbsorbIgnored_10472)
end

function me.TestCombatEventEnemyAvoidEarthShockDodge_10414()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockDodge_10414",
    testCategory,
    10414,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidEarthShockBlock_10414()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockBlock_10414",
    testCategory,
    10414,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidEarthShockParry_10414()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockParry_10414",
    testCategory,
    10414,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidEarthShockMiss_10414()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockMiss_10414",
    testCategory,
    10414,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidEarthShockResist_10414()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockResist_10414",
    testCategory,
    10414,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidEarthShockImmune_10414()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockImmune_10414",
    testCategory,
    10414,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidEarthShockReflect_10414()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockReflect_10414",
    testCategory,
    10414,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_10414()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_10414",
    testCategory,
    10414,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidEarthShockDodge_8042()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockDodge_8042",
    testCategory,
    8042,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidEarthShockBlock_8042()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockBlock_8042",
    testCategory,
    8042,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidEarthShockParry_8042()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockParry_8042",
    testCategory,
    8042,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidEarthShockMiss_8042()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockMiss_8042",
    testCategory,
    8042,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidEarthShockResist_8042()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockResist_8042",
    testCategory,
    8042,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidEarthShockImmune_8042()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockImmune_8042",
    testCategory,
    8042,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidEarthShockReflect_8042()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockReflect_8042",
    testCategory,
    8042,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_8042()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_8042",
    testCategory,
    8042,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidEarthShockDodge_8044()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockDodge_8044",
    testCategory,
    8044,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidEarthShockBlock_8044()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockBlock_8044",
    testCategory,
    8044,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidEarthShockParry_8044()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockParry_8044",
    testCategory,
    8044,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidEarthShockMiss_8044()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockMiss_8044",
    testCategory,
    8044,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidEarthShockResist_8044()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockResist_8044",
    testCategory,
    8044,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidEarthShockImmune_8044()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockImmune_8044",
    testCategory,
    8044,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidEarthShockReflect_8044()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockReflect_8044",
    testCategory,
    8044,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_8044()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_8044",
    testCategory,
    8044,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidEarthShockDodge_8045()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockDodge_8045",
    testCategory,
    8045,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidEarthShockBlock_8045()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockBlock_8045",
    testCategory,
    8045,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidEarthShockParry_8045()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockParry_8045",
    testCategory,
    8045,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidEarthShockMiss_8045()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockMiss_8045",
    testCategory,
    8045,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidEarthShockResist_8045()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockResist_8045",
    testCategory,
    8045,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidEarthShockImmune_8045()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockImmune_8045",
    testCategory,
    8045,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidEarthShockReflect_8045()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockReflect_8045",
    testCategory,
    8045,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_8045()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_8045",
    testCategory,
    8045,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidEarthShockDodge_8046()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockDodge_8046",
    testCategory,
    8046,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidEarthShockBlock_8046()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockBlock_8046",
    testCategory,
    8046,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidEarthShockParry_8046()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockParry_8046",
    testCategory,
    8046,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidEarthShockMiss_8046()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockMiss_8046",
    testCategory,
    8046,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidEarthShockResist_8046()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockResist_8046",
    testCategory,
    8046,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidEarthShockImmune_8046()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockImmune_8046",
    testCategory,
    8046,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidEarthShockReflect_8046()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockReflect_8046",
    testCategory,
    8046,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_8046()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_8046",
    testCategory,
    8046,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidEarthShockDodge_10412()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockDodge_10412",
    testCategory,
    10412,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidEarthShockBlock_10412()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockBlock_10412",
    testCategory,
    10412,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidEarthShockParry_10412()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockParry_10412",
    testCategory,
    10412,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidEarthShockMiss_10412()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockMiss_10412",
    testCategory,
    10412,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidEarthShockResist_10412()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockResist_10412",
    testCategory,
    10412,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidEarthShockImmune_10412()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockImmune_10412",
    testCategory,
    10412,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidEarthShockReflect_10412()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockReflect_10412",
    testCategory,
    10412,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_10412()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_10412",
    testCategory,
    10412,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidEarthShockDodge_10413()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockDodge_10413",
    testCategory,
    10413,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidEarthShockBlock_10413()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockBlock_10413",
    testCategory,
    10413,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidEarthShockParry_10413()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockParry_10413",
    testCategory,
    10413,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidEarthShockMiss_10413()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockMiss_10413",
    testCategory,
    10413,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidEarthShockResist_10413()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockResist_10413",
    testCategory,
    10413,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidEarthShockImmune_10413()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockImmune_10413",
    testCategory,
    10413,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidEarthShockReflect_10413()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockReflect_10413",
    testCategory,
    10413,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_10413()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_10413",
    testCategory,
    10413,
    "EarthShock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFlameShockDodge_29228()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockDodge_29228",
    testCategory,
    29228,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFlameShockBlock_29228()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockBlock_29228",
    testCategory,
    29228,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFlameShockParry_29228()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockParry_29228",
    testCategory,
    29228,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFlameShockMiss_29228()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockMiss_29228",
    testCategory,
    29228,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFlameShockResist_29228()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockResist_29228",
    testCategory,
    29228,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFlameShockImmune_29228()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockImmune_29228",
    testCategory,
    29228,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFlameShockReflect_29228()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockReflect_29228",
    testCategory,
    29228,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_29228()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_29228",
    testCategory,
    29228,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFlameShockDodge_8050()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockDodge_8050",
    testCategory,
    8050,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFlameShockBlock_8050()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockBlock_8050",
    testCategory,
    8050,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFlameShockParry_8050()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockParry_8050",
    testCategory,
    8050,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFlameShockMiss_8050()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockMiss_8050",
    testCategory,
    8050,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFlameShockResist_8050()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockResist_8050",
    testCategory,
    8050,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFlameShockImmune_8050()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockImmune_8050",
    testCategory,
    8050,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFlameShockReflect_8050()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockReflect_8050",
    testCategory,
    8050,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_8050()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_8050",
    testCategory,
    8050,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFlameShockDodge_8052()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockDodge_8052",
    testCategory,
    8052,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFlameShockBlock_8052()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockBlock_8052",
    testCategory,
    8052,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFlameShockParry_8052()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockParry_8052",
    testCategory,
    8052,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFlameShockMiss_8052()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockMiss_8052",
    testCategory,
    8052,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFlameShockResist_8052()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockResist_8052",
    testCategory,
    8052,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFlameShockImmune_8052()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockImmune_8052",
    testCategory,
    8052,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFlameShockReflect_8052()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockReflect_8052",
    testCategory,
    8052,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_8052()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_8052",
    testCategory,
    8052,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFlameShockDodge_8053()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockDodge_8053",
    testCategory,
    8053,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFlameShockBlock_8053()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockBlock_8053",
    testCategory,
    8053,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFlameShockParry_8053()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockParry_8053",
    testCategory,
    8053,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFlameShockMiss_8053()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockMiss_8053",
    testCategory,
    8053,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFlameShockResist_8053()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockResist_8053",
    testCategory,
    8053,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFlameShockImmune_8053()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockImmune_8053",
    testCategory,
    8053,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFlameShockReflect_8053()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockReflect_8053",
    testCategory,
    8053,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_8053()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_8053",
    testCategory,
    8053,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFlameShockDodge_10447()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockDodge_10447",
    testCategory,
    10447,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFlameShockBlock_10447()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockBlock_10447",
    testCategory,
    10447,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFlameShockParry_10447()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockParry_10447",
    testCategory,
    10447,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFlameShockMiss_10447()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockMiss_10447",
    testCategory,
    10447,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFlameShockResist_10447()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockResist_10447",
    testCategory,
    10447,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFlameShockImmune_10447()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockImmune_10447",
    testCategory,
    10447,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFlameShockReflect_10447()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockReflect_10447",
    testCategory,
    10447,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_10447()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_10447",
    testCategory,
    10447,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFlameShockDodge_10448()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockDodge_10448",
    testCategory,
    10448,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFlameShockBlock_10448()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockBlock_10448",
    testCategory,
    10448,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFlameShockParry_10448()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockParry_10448",
    testCategory,
    10448,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFlameShockMiss_10448()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockMiss_10448",
    testCategory,
    10448,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFlameShockResist_10448()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockResist_10448",
    testCategory,
    10448,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFlameShockImmune_10448()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockImmune_10448",
    testCategory,
    10448,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFlameShockReflect_10448()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockReflect_10448",
    testCategory,
    10448,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_10448()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_10448",
    testCategory,
    10448,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFrostShockDodge_10473()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockDodge_10473",
    testCategory,
    10473,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFrostShockBlock_10473()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockBlock_10473",
    testCategory,
    10473,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFrostShockParry_10473()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockParry_10473",
    testCategory,
    10473,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFrostShockMiss_10473()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockMiss_10473",
    testCategory,
    10473,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFrostShockResist_10473()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockResist_10473",
    testCategory,
    10473,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFrostShockImmune_10473()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockImmune_10473",
    testCategory,
    10473,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFrostShockReflect_10473()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockReflect_10473",
    testCategory,
    10473,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFrostShockAbsorbIgnored_10473()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFrostShockAbsorbIgnored_10473",
    testCategory,
    10473,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFrostShockDodge_8056()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockDodge_8056",
    testCategory,
    8056,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFrostShockBlock_8056()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockBlock_8056",
    testCategory,
    8056,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFrostShockParry_8056()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockParry_8056",
    testCategory,
    8056,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFrostShockMiss_8056()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockMiss_8056",
    testCategory,
    8056,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFrostShockResist_8056()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockResist_8056",
    testCategory,
    8056,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFrostShockImmune_8056()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockImmune_8056",
    testCategory,
    8056,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFrostShockReflect_8056()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockReflect_8056",
    testCategory,
    8056,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFrostShockAbsorbIgnored_8056()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFrostShockAbsorbIgnored_8056",
    testCategory,
    8056,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFrostShockDodge_8058()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockDodge_8058",
    testCategory,
    8058,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFrostShockBlock_8058()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockBlock_8058",
    testCategory,
    8058,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFrostShockParry_8058()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockParry_8058",
    testCategory,
    8058,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFrostShockMiss_8058()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockMiss_8058",
    testCategory,
    8058,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFrostShockResist_8058()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockResist_8058",
    testCategory,
    8058,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFrostShockImmune_8058()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockImmune_8058",
    testCategory,
    8058,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFrostShockReflect_8058()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockReflect_8058",
    testCategory,
    8058,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFrostShockAbsorbIgnored_8058()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFrostShockAbsorbIgnored_8058",
    testCategory,
    8058,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFrostShockDodge_8058()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockDodge_8058",
    testCategory,
    10472,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFrostShockDodge_10472()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockDodge_10472",
    testCategory,
    10472,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFrostShockBlock_10472()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockBlock_10472",
    testCategory,
    10472,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFrostShockParry_10472()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockParry_10472",
    testCategory,
    10472,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFrostShockMiss_10472()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockMiss_10472",
    testCategory,
    10472,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFrostShockResist_10472()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockResist_8056",
    testCategory,
    10472,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFrostShockImmune_10472()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockImmune_10472",
    testCategory,
    10472,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFrostShockReflect_10472()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockReflect_10472",
    testCategory,
    10472,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFrostShockAbsorbIgnored_10472()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFrostShockAbsorbIgnored_10472",
    testCategory,
    10472,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
