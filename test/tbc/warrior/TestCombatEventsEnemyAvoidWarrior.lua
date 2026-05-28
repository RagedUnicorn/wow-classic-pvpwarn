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
mod.testCombatEventsEnemyAvoidWarriorTbc = me

me.tag = "TestCombatEventsEnemyAvoidWarriorTbc"

local testCategory = "warrior"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testenemycombatevent warrior")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMortalStrikeDodge_25248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMortalStrikeBlock_25248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMortalStrikeParry_25248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMortalStrikeMiss_25248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMortalStrikeResist_25248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMortalStrikeImmune_25248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMortalStrikeReflect_25248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_25248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMortalStrikeDodge_30330)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMortalStrikeBlock_30330)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMortalStrikeParry_30330)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMortalStrikeMiss_30330)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMortalStrikeResist_30330)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMortalStrikeImmune_30330)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMortalStrikeReflect_30330)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_30330)
end

function me.TestCombatEventEnemyAvoidMortalStrikeDodge_25248()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeDodge_25248", testCategory, 25248, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeBlock_25248()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeBlock_25248", testCategory, 25248, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeParry_25248()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeParry_25248", testCategory, 25248, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeMiss_25248()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeMiss_25248", testCategory, 25248, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeResist_25248()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeResist_25248", testCategory, 25248, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeImmune_25248()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeImmune_25248", testCategory, 25248, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeReflect_25248()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeReflect_25248", testCategory, 25248, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_25248()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_25248", testCategory, 25248, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeDodge_30330()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeDodge_30330", testCategory, 30330, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeBlock_30330()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeBlock_30330", testCategory, 30330, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeParry_30330()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeParry_30330", testCategory, 30330, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeMiss_30330()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeMiss_30330", testCategory, 30330, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeResist_30330()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeResist_30330", testCategory, 30330, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeImmune_30330()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeImmune_30330", testCategory, 30330, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeReflect_30330()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidMortalStrikeReflect_30330", testCategory, 30330, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_30330()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidMortalStrikeAbsorbIgnored_30330", testCategory, 30330, "Mortal Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
