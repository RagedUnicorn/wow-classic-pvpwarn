--[[
  MIT License

  Copyright (c) 2021 Michael Wiesendanger

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
mod.testCombatEventsSelfAvoidMageEn = me

me.tag = "TestCombatEventsSelfAvoidMageEn"

local testGroupName = "CombatEventsSelfAvoidMageEn"
local testCategory = "mage"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCounterspellResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCounterspellImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCounterspellSilencedResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdImmune)
end

function me.TestCombatEventSelfAvoidCounterspellResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCounterspellResisted",
    testCategory,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidCounterspellImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCounterspellImmune",
    testCategory,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidCounterspellSilencedResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCounterspellSilencedResisted",
    testCategory,
    "Counterspell - Silenced",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidPolymorphResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphResisted",
    testCategory,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidPolymorphImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphImmune",
    testCategory,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFrostNovaResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaResisted",
    testCategory,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFrostNovaImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaImmune",
    testCategory,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidConeOfColdResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdResisted",
    testCategory,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidConeOfColdImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdImmune",
    testCategory,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end
