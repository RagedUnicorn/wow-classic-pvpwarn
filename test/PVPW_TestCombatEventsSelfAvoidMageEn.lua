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

-- luacheck: ignore _

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
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCounterspellMisse)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCounterspellMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCounterspellSilencedMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdMissed)
end

function me.TestCombatEventSelfAvoidCounterspellMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCounterspellMissed",
    testCategory,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF
  )
end

function me.TestCombatEventSelfAvoidCounterspellSilencedMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCounterspellSilencedMissed",
    testCategory,
    "Counterspell - Silenced",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF
  )
end

function me.TestCombatEventSelfAvoidPolymorphMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphMissed",
    testCategory,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF
  )
end

function me.TestCombatEventSelfAvoidFrostNovaMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaMissed",
    testCategory,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF
  )
end

function me.TestCombatEventSelfAvoidConeOfColdMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdMissed",
    testCategory,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF
  )
end
