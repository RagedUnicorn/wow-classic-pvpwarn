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
mod.testCombatEventsEnemyAvoidHunterTbc = me

me.tag = "TestCombatEventsEnemyAvoidHunterTbc"

local testCategory = "hunter"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testenemycombatevent hunter")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSerpentStingDodge_25295)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSerpentStingBlock_25295)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSerpentStingParry_25295)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSerpentStingMiss_25295)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSerpentStingResist_25295)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSerpentStingImmune_25295)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSerpentStingReflect_25295)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_25295)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSerpentStingDodge_27016)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSerpentStingBlock_27016)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSerpentStingParry_27016)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSerpentStingMiss_27016)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSerpentStingResist_27016)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSerpentStingImmune_27016)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSerpentStingReflect_27016)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_27016)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidViperStingDodge_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidViperStingBlock_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidViperStingParry_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidViperStingMiss_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidViperStingResist_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidViperStingImmune_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidViperStingReflect_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidViperStingAbsorbIgnored_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSilencingShotDodge_34490)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSilencingShotBlock_34490)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSilencingShotParry_34490)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSilencingShotMiss_34490)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSilencingShotResist_34490)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSilencingShotImmune_34490)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSilencingShotReflect_34490)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnemyAvoidSilencingShotAbsorbIgnored_34490)
end

function me.TestCombatEventEnemyAvoidSerpentStingDodge_25295()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingDodge_25295",
    testCategory,
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingBlock_25295()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingBlock_25295",
    testCategory,
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingParry_25295()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingParry_25295",
    testCategory,
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingMiss_25295()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingMiss_25295",
    testCategory,
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingResist_25295()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingResist_25295",
    testCategory,
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingImmune_25295()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingImmune_25295",
    testCategory,
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingReflect_25295()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingReflect_25295",
    testCategory,
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_25295()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_25295",
    testCategory,
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingDodge_27016()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingDodge_27016",
    testCategory,
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingBlock_27016()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingBlock_27016",
    testCategory,
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingParry_27016()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingParry_27016",
    testCategory,
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingMiss_27016()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingMiss_27016",
    testCategory,
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingResist_27016()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingResist_27016",
    testCategory,
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingImmune_27016()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingImmune_27016",
    testCategory,
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingReflect_27016()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSerpentStingReflect_27016",
    testCategory,
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_27016()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidSerpentStingAbsorbIgnored_27016",
    testCategory,
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidViperStingDodge_27018()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingDodge_27018",
    testCategory,
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidViperStingBlock_27018()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingBlock_27018",
    testCategory,
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidViperStingParry_27018()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingParry_27018",
    testCategory,
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidViperStingMiss_27018()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingMiss_27018",
    testCategory,
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidViperStingResist_27018()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingResist_27018",
    testCategory,
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidViperStingImmune_27018()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingImmune_27018",
    testCategory,
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidViperStingReflect_27018()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidViperStingReflect_27018",
    testCategory,
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidViperStingAbsorbIgnored_27018()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidViperStingAbsorbIgnored_27018",
    testCategory,
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidSilencingShotDodge_34490()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSilencingShotDodge_34490",
    testCategory,
    34490,
    "Silencing Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSilencingShotBlock_34490()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSilencingShotBlock_34490",
    testCategory,
    34490,
    "Silencing Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidSilencingShotParry_34490()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSilencingShotParry_34490",
    testCategory,
    34490,
    "Silencing Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidSilencingShotMiss_34490()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSilencingShotMiss_34490",
    testCategory,
    34490,
    "Silencing Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidSilencingShotResist_34490()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSilencingShotResist_34490",
    testCategory,
    34490,
    "Silencing Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidSilencingShotImmune_34490()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSilencingShotImmune_34490",
    testCategory,
    34490,
    "Silencing Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidSilencingShotReflect_34490()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSilencingShotReflect_34490",
    testCategory,
    34490,
    "Silencing Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidSilencingShotAbsorbIgnored_34490()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidSilencingShotAbsorbIgnored_34490",
    testCategory,
    34490,
    "Silencing Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
