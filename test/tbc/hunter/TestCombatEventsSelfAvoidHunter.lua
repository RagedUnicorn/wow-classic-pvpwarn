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
mod.testCombatEventsSelfAvoidHunterTbc = me

me.tag = "TestCombatEventsSelfAvoidHunterTbc"

local testCategory = "hunter"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testselfavoidcombatevent hunter")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSerpentStingDodge_25295)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSerpentStingBlock_25295)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSerpentStingParry_25295)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSerpentStingMiss_25295)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSerpentStingResist_25295)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSerpentStingImmune_25295)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSerpentStingReflect_25295)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_25295)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSerpentStingDodge_27016)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSerpentStingBlock_27016)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSerpentStingParry_27016)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSerpentStingMiss_27016)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSerpentStingResist_27016)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSerpentStingImmune_27016)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSerpentStingReflect_27016)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_27016)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidViperStingDodge_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidViperStingBlock_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidViperStingParry_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidViperStingMiss_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidViperStingResist_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidViperStingImmune_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidViperStingReflect_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidViperStingAbsorbIgnored_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSilencingShotDodge_34490)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSilencingShotBlock_34490)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSilencingShotParry_34490)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSilencingShotMiss_34490)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSilencingShotResist_34490)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSilencingShotImmune_34490)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSilencingShotReflect_34490)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSelfAvoidSilencingShotAbsorbIgnored_34490)
end

function me.TestCombatEventSelfAvoidSerpentStingDodge_25295()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingDodge_25295",
    testCategory,
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingBlock_25295()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingBlock_25295",
    testCategory,
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidSerpentStingParry_25295()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingParry_25295",
    testCategory,
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidSerpentStingMiss_25295()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingMiss_25295",
    testCategory,
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSerpentStingResist_25295()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingResist_25295",
    testCategory,
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidSerpentStingImmune_25295()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingImmune_25295",
    testCategory,
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingReflect_25295()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingReflect_25295",
    testCategory,
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_25295()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_25295",
    testCategory,
    25295,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidSerpentStingDodge_27016()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingDodge_27016",
    testCategory,
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingBlock_27016()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingBlock_27016",
    testCategory,
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidSerpentStingParry_27016()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingParry_27016",
    testCategory,
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidSerpentStingMiss_27016()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingMiss_27016",
    testCategory,
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSerpentStingResist_27016()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingResist_27016",
    testCategory,
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidSerpentStingImmune_27016()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingImmune_27016",
    testCategory,
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSerpentStingReflect_27016()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSerpentStingReflect_27016",
    testCategory,
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_27016()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidSerpentStingAbsorbIgnored_27016",
    testCategory,
    27016,
    "Serpent Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidViperStingDodge_27018()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingDodge_27018",
    testCategory,
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidViperStingBlock_27018()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingBlock_27018",
    testCategory,
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidViperStingParry_27018()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingParry_27018",
    testCategory,
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidViperStingMiss_27018()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingMiss_27018",
    testCategory,
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidViperStingResist_27018()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingResist_27018",
    testCategory,
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidViperStingImmune_27018()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingImmune_27018",
    testCategory,
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidViperStingReflect_27018()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidViperStingReflect_27018",
    testCategory,
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidViperStingAbsorbIgnored_27018()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidViperStingAbsorbIgnored_27018",
    testCategory,
    27018,
    "Viper Sting",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidSilencingShotDodge_34490()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSilencingShotDodge_34490",
    testCategory,
    34490,
    "Silencing Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidSilencingShotBlock_34490()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSilencingShotBlock_34490",
    testCategory,
    34490,
    "Silencing Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidSilencingShotParry_34490()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSilencingShotParry_34490",
    testCategory,
    34490,
    "Silencing Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidSilencingShotMiss_34490()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSilencingShotMiss_34490",
    testCategory,
    34490,
    "Silencing Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSilencingShotResist_34490()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSilencingShotResist_34490",
    testCategory,
    34490,
    "Silencing Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidSilencingShotImmune_34490()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSilencingShotImmune_34490",
    testCategory,
    34490,
    "Silencing Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSilencingShotReflect_34490()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSilencingShotReflect_34490",
    testCategory,
    34490,
    "Silencing Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidSilencingShotAbsorbIgnored_34490()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidSilencingShotAbsorbIgnored_34490",
    testCategory,
    34490,
    "Silencing Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
