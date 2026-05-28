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
mod.testCombatEventsSelfAvoidShamanTbc = me

me.tag = "TestCombatEventsSelfAvoidShamanTbc"

local testCategory = "shaman"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testselfavoidcombatevent shaman")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidEarthShockDodge_25454)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidEarthShockBlock_25454)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidEarthShockParry_25454)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidEarthShockMiss_25454)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidEarthShockResist_25454)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidEarthShockImmune_25454)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidEarthShockReflect_25454)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidEarthShockAbsorbIgnored_25454)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFlameShockDodge_25457)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFlameShockBlock_25457)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFlameShockParry_25457)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFlameShockMiss_25457)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFlameShockResist_25457)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFlameShockImmune_25457)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFlameShockReflect_25457)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFlameShockAbsorbIgnored_25457)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFrostShockDodge_25464)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFrostShockBlock_25464)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFrostShockParry_25464)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFrostShockMiss_25464)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFrostShockResist_25464)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFrostShockImmune_25464)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFrostShockReflect_25464)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidFrostShockAbsorbIgnored_25464)
end

function me.TestCombatEventSelfAvoidEarthShockDodge_25454()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockDodge_25454",
    testCategory,
    25454,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidEarthShockBlock_25454()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockBlock_25454",
    testCategory,
    25454,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidEarthShockParry_25454()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockParry_25454",
    testCategory,
    25454,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidEarthShockMiss_25454()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockMiss_25454",
    testCategory,
    25454,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidEarthShockResist_25454()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockResist_25454",
    testCategory,
    25454,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidEarthShockImmune_25454()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockImmune_25454",
    testCategory,
    25454,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidEarthShockReflect_25454()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidEarthShockReflect_25454",
    testCategory,
    25454,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidEarthShockAbsorbIgnored_25454()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidEarthShockAbsorbIgnored_25454",
    testCategory,
    25454,
    "Earth Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFlameShockDodge_25457()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockDodge_25457",
    testCategory,
    25457,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFlameShockBlock_25457()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockBlock_25457",
    testCategory,
    25457,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFlameShockParry_25457()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockParry_25457",
    testCategory,
    25457,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFlameShockMiss_25457()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockMiss_25457",
    testCategory,
    25457,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFlameShockResist_25457()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockResist_25457",
    testCategory,
    25457,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFlameShockImmune_25457()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockImmune_25457",
    testCategory,
    25457,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFlameShockReflect_25457()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFlameShockReflect_25457",
    testCategory,
    25457,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFlameShockAbsorbIgnored_25457()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFlameShockAbsorbIgnored_25457",
    testCategory,
    25457,
    "Flame Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFrostShockDodge_25464()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockDodge_25464",
    testCategory,
    25464,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFrostShockBlock_25464()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockBlock_25464",
    testCategory,
    25464,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFrostShockParry_25464()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockParry_25464",
    testCategory,
    25464,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFrostShockMiss_25464()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockMiss_25464",
    testCategory,
    25464,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFrostShockResist_25464()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockResist_25464",
    testCategory,
    25464,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFrostShockImmune_25464()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockImmune_25464",
    testCategory,
    25464,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFrostShockReflect_25464()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostShockReflect_25464",
    testCategory,
    25464,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFrostShockAbsorbIgnored_25464()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFrostShockAbsorbIgnored_25464",
    testCategory,
    25464,
    "Frost Shock",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
