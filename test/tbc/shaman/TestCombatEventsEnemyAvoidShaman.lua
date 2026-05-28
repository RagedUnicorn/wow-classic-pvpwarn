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
mod.testCombatEventsEnemyAvoidShamanTbc = me

me.tag = "TestCombatEventsEnemyAvoidShamanTbc"

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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockDodge_25454)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockBlock_25454)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockParry_25454)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockMiss_25454)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockResist_25454)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockImmune_25454)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockReflect_25454)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_25454)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockDodge_25457)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockBlock_25457)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockParry_25457)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockMiss_25457)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockResist_25457)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockImmune_25457)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockReflect_25457)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_25457)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockDodge_25464)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockBlock_25464)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockParry_25464)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockMiss_25464)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockResist_25464)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockImmune_25464)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockReflect_25464)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidFrostShockAbsorbIgnored_25464)
end

function me.TestCombatEventEnemyAvoidEarthShockDodge_25454()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockDodge_25454",
    testCategory,
    25454,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidEarthShockBlock_25454()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockBlock_25454",
    testCategory,
    25454,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidEarthShockParry_25454()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockParry_25454",
    testCategory,
    25454,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidEarthShockMiss_25454()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockMiss_25454",
    testCategory,
    25454,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidEarthShockResist_25454()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockResist_25454",
    testCategory,
    25454,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidEarthShockImmune_25454()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockImmune_25454",
    testCategory,
    25454,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidEarthShockReflect_25454()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidEarthShockReflect_25454",
    testCategory,
    25454,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_25454()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_25454",
    testCategory,
    25454,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFlameShockDodge_25457()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockDodge_25457",
    testCategory,
    25457,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFlameShockBlock_25457()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockBlock_25457",
    testCategory,
    25457,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFlameShockParry_25457()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockParry_25457",
    testCategory,
    25457,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFlameShockMiss_25457()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockMiss_25457",
    testCategory,
    25457,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFlameShockResist_25457()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockResist_25457",
    testCategory,
    25457,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFlameShockImmune_25457()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockImmune_25457",
    testCategory,
    25457,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFlameShockReflect_25457()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFlameShockReflect_25457",
    testCategory,
    25457,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_25457()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_25457",
    testCategory,
    25457,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFrostShockDodge_25464()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockDodge_25464",
    testCategory,
    25464,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFrostShockBlock_25464()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockBlock_25464",
    testCategory,
    25464,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFrostShockParry_25464()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockParry_25464",
    testCategory,
    25464,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFrostShockMiss_25464()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockMiss_25464",
    testCategory,
    25464,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFrostShockResist_25464()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockResist_25464",
    testCategory,
    25464,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFrostShockImmune_25464()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockImmune_25464",
    testCategory,
    25464,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFrostShockReflect_25464()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostShockReflect_25464",
    testCategory,
    25464,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFrostShockAbsorbIgnored_25464()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFrostShockAbsorbIgnored_25464",
    testCategory,
    25464,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
