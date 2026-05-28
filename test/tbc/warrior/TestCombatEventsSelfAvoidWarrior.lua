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
mod.testCombatEventsSelfAvoidWarriorTbc = me

me.tag = "TestCombatEventsSelfAvoidWarriorTbc"

local testCategory = "warrior"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testselfavoidcombatevent warrior")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidMortalStrikeDodge_25248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidMortalStrikeBlock_25248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidMortalStrikeParry_25248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidMortalStrikeMiss_25248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidMortalStrikeResist_25248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidMortalStrikeImmune_25248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidMortalStrikeReflect_25248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_25248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidMortalStrikeDodge_30330)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidMortalStrikeBlock_30330)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidMortalStrikeParry_30330)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidMortalStrikeMiss_30330)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidMortalStrikeResist_30330)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidMortalStrikeImmune_30330)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidMortalStrikeReflect_30330)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_30330)
end

function me.TestCombatEventSelfAvoidMortalStrikeDodge_25248()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeDodge_25248", testCategory, 25248, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeBlock_25248()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeBlock_25248", testCategory, 25248, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeParry_25248()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeParry_25248", testCategory, 25248, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeMiss_25248()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeMiss_25248", testCategory, 25248, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeResist_25248()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeResist_25248", testCategory, 25248, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeImmune_25248()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeImmune_25248", testCategory, 25248, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeReflect_25248()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeReflect_25248", testCategory, 25248, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_25248()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_25248", testCategory, 25248, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeDodge_30330()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeDodge_30330", testCategory, 30330, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeBlock_30330()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeBlock_30330", testCategory, 30330, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeParry_30330()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeParry_30330", testCategory, 30330, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeMiss_30330()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeMiss_30330", testCategory, 30330, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeResist_30330()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeResist_30330", testCategory, 30330, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeImmune_30330()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeImmune_30330", testCategory, 30330, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeReflect_30330()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMortalStrikeReflect_30330", testCategory, 30330, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_30330()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidMortalStrikeAbsorbIgnored_30330", testCategory, 30330, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
