--[[
  MIT License

  Copyright (c) 2023 Michael Wiesendanger

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

--[[
  Run all tests:
    /run rgpvpw.testAllEn.TestAllEn()
]]--

local mod = rgpvpw
local me = {}
mod.testAllEn = me

me.tag = "TestAllEn"

local testGroupName = "TestAllEn"

function me.TestAllEn()
  local language = mod.testHelper.GetLanguage("enUS")

  mod.testReporter.StartTestGroup(testGroupName)

  mod.testSound.ShouldHaveSoundTestForAllSpells(language)
  mod.testSound.ShouldHaveSoundDownTestForAllSpells(language)
  mod.testCombatEvent.ShouldHaveCombatEventTestForAllTrackedEvents(language)
  mod.testCombatEvent.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
    language, RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID)
  mod.testCombatEvent.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
    language, RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID)

  me.TestAllCombatEventsEn()
  me.TestAllCombatSelfAvoidEventsEn()
  me.TestAllCombatEnemyAvoidEventsEn()

  me.TestAllSoundEn()
  me.TestAllSoundSelfAvoidEn()
  me.TestAllSoundEnemyAvoidEn()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.TestAllSoundEn()
  mod.testSoundWarriorEn.CollectTestCases()
  mod.testSoundPriestEn.CollectTestCases()
  mod.testSoundRogueEn.CollectTestCases()
  mod.testSoundMageEn.CollectTestCases()
  mod.testSoundHunterEn.CollectTestCases()
  mod.testSoundWarlockEn.CollectTestCases()
  mod.testSoundPaladinEn.CollectTestCases()
  mod.testSoundDruidEn.CollectTestCases()
  mod.testSoundShamanEn.CollectTestCases()
  mod.testSoundRacialsEn.CollectTestCases()
  mod.testSoundItemsEn.CollectTestCases()
  mod.testSoundMiscEn.CollectTestCases()
end

function me.TestAllSoundSelfAvoidEn()
  mod.testSoundSelfAvoidWarriorEn.CollectTestCases()
  mod.testSoundSelfAvoidPriestEn.CollectTestCases()
  mod.testSoundSelfAvoidRogueEn.CollectTestCases()
  mod.testSoundSelfAvoidMageEn.CollectTestCases()
  mod.testSoundSelfAvoidHunterEn.CollectTestCases()
  mod.testSoundSelfAvoidWarlockEn.CollectTestCases()
  mod.testSoundSelfAvoidPaladinEn.CollectTestCases()
  mod.testSoundSelfAvoidDruidEn.CollectTestCases()
  mod.testSoundSelfAvoidShamanEn.CollectTestCases()
end

function me.TestAllSoundEnemyAvoidEn()
  mod.testSoundEnemyAvoidWarriorEn.CollectTestCases()
  mod.testSoundEnemyAvoidPriestEn.CollectTestCases()
  mod.testSoundEnemyAvoidRogueEn.CollectTestCases()
  mod.testSoundEnemyAvoidMageEn.CollectTestCases()
  mod.testSoundEnemyAvoidHunterEn.CollectTestCases()
  mod.testSoundEnemyAvoidWarlockEn.CollectTestCases()
  mod.testSoundEnemyAvoidPaladinEn.CollectTestCases()
  mod.testSoundEnemyAvoidDruidEn.CollectTestCases()
  mod.testSoundEnemyAvoidShamanEn.CollectTestCases()
end

function me.TestAllCombatEventsEn()
  mod.testCombatEventsWarriorEn.CollectTestCases()
  mod.testCombatEventsPriestEn.CollectTestCases()
  mod.testCombatEventsRogueEn.CollectTestCases()
  mod.testCombatEventsMageEn.CollectTestCases()
  mod.testCombatEventsHunterEn.CollectTestCases()
  mod.testCombatEventsWarlockEn.CollectTestCases()
  mod.testCombatEventsPaladinEn.CollectTestCases()
  mod.testCombatEventsDruidEn.CollectTestCases()
  mod.testCombatEventsShamanEn.CollectTestCases()
  mod.testCombatEventsRacialsEn.CollectTestCases()
  mod.testCombatEventsItemsEn.CollectTestCases()
  mod.testCombatEventsMiscEn.CollectTestCases()
end

function me.TestAllCombatSelfAvoidEventsEn()
  mod.testCombatEventsSelfAvoidWarriorEn.CollectTestCases()
  mod.testCombatEventsSelfAvoidPriestEn.CollectTestCases()
  mod.testCombatEventsSelfAvoidRogueEn.CollectTestCases()
  mod.testCombatEventsSelfAvoidMageEn.CollectTestCases()
  mod.testCombatEventsSelfAvoidHunterEn.CollectTestCases()
  mod.testCombatEventsSelfAvoidWarlockEn.CollectTestCases()
  mod.testCombatEventsSelfAvoidPaladinEn.CollectTestCases()
  mod.testCombatEventsSelfAvoidDruidEn.CollectTestCases()
  mod.testCombatEventsSelfAvoidShamanEn.CollectTestCases()
end

function me.TestAllCombatEnemyAvoidEventsEn()
  mod.testCombatEventsEnemyAvoidWarriorEn.CollectTestCases()
  mod.testCombatEventsEnemyAvoidPriestEn.CollectTestCases()
  mod.testCombatEventsEnemyAvoidRogueEn.CollectTestCases()
  mod.testCombatEventsEnemyAvoidMageEn.CollectTestCases()
  mod.testCombatEventsEnemyAvoidHunterEn.CollectTestCases()
  mod.testCombatEventsEnemyAvoidWarlockEn.CollectTestCases()
  mod.testCombatEventsEnemyAvoidPaladinEn.CollectTestCases()
  mod.testCombatEventsEnemyAvoidDruidEn.CollectTestCases()
  mod.testCombatEventsEnemyAvoidShamanEn.CollectTestCases()
end
