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
mod.testCombatEventsSelfAvoidPriestEn = me

me.tag = "TestCombatEventsSelfAvoidPriestEn"

local testGroupName = "CombatEventsSelfAvoidPriestEn"
local testCategory = "priest"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDevouringPlagueImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlackoutImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidManaBurnImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidMindControlImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPsychicScreamImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidShadowWordPainImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSilenceResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSilenceImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidVampiricEmbraceResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidVampiricEmbraceImmune)
end

function me.TestCombatEventSelfAvoidDevouringPlagueResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueResisted",
    testCategory,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDevouringPlagueImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDevouringPlagueImmune",
    testCategory,
    "Devouring Plague",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end
function me.TestCombatEventSelfAvoidBlackoutResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutResisted",
    testCategory,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidBlackoutImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlackoutImmune",
    testCategory,
    "Blackout",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidManaBurnResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnResisted",
    testCategory,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidManaBurnImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidManaBurnImmune",
    testCategory,
    "Mana Burn",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidMindControlResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlResisted",
    testCategory,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidMindControlImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidMindControlImmune",
    testCategory,
    "Mind Control",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamResisted",
    testCategory,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidPsychicScreamImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPsychicScreamImmune",
    testCategory,
    "Psychic Scream",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainResisted",
    testCategory,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidShadowWordPainImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidShadowWordPainImmune",
    testCategory,
    "Shadow Word: Pain",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSilenceResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSilenceResisted",
    testCategory,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidSilenceImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSilenceImmune",
    testCategory,
    "Silence",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidVampiricEmbraceResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidVampiricEmbraceResisted",
    testCategory,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidVampiricEmbraceImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidVampiricEmbraceImmune",
    testCategory,
    "Vampiric Embrace",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end
