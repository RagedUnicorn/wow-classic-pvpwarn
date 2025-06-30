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

--[[
  Run all tests:
    /run rgpvpw.testAll.TestAll()
]]--

local mod = rgpvpw
local me = {}
mod.testAll = me

me.tag = "TestAll"

local testGroupName = "TestAll"

function me.TestAll()
  mod.testReporter.StartTestGroup(testGroupName)
  mod.testSound.ShouldHaveSoundTestForAllSpells()
  mod.testSound.ShouldHaveSoundDownTestForAllSpells()
  mod.testSound.ShouldHaveSoundRefreshTestForAllSpells()
  mod.testSound.ShouldHaveSoundAvoidTestForAllSpells(RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID)
  mod.testSound.ShouldHaveSoundAvoidTestForAllSpells(RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID)
  mod.testCombatEvent.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID
  )
  mod.testCombatEvent.ShouldHaveCombatEventAvoidIrrelevantTestForAllTrackedEvents(
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID
  )
  mod.testCombatEvent.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
  )
  mod.testCombatEvent.ShouldHaveCombatEventAvoidIrrelevantTestForAllTrackedEvents(
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
  )
  --[[

  me.TestAllSound()
  me.TestAllSoundSelfAvoid()
  me.TestAllSoundEnemyAvoid()

  me.TestAllCombatEvents()
  me.TestAllCombatSelfAvoidEvents()
  me.TestAllCombatEnemyAvoidEvents()
  ]]--
  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.TestAllSound()
  mod.testSoundWarrior.CollectTestCases()
  mod.testSoundPriest.CollectTestCases()
  mod.testSoundRogue.CollectTestCases()
  mod.testSoundMage.CollectTestCases()
  mod.testSoundHunter.CollectTestCases()
  mod.testSoundWarlock.CollectTestCases()
  mod.testSoundPaladin.CollectTestCases()
  mod.testSoundDruid.CollectTestCases()
  mod.testSoundShaman.CollectTestCases()
  mod.testSoundRacials.CollectTestCases()
  mod.testSoundItems.CollectTestCases()
  mod.testSoundMisc.CollectTestCases()
end

function me.TestAllSoundSelfAvoid()
  mod.testSoundSelfAvoidWarrior.CollectTestCases()
  mod.testSoundSelfAvoidPriest.CollectTestCases()
  mod.testSoundSelfAvoidRogue.CollectTestCases()
  mod.testSoundSelfAvoidMage.CollectTestCases()
  mod.testSoundSelfAvoidHunter.CollectTestCases()
  mod.testSoundSelfAvoidWarlock.CollectTestCases()
  mod.testSoundSelfAvoidPaladin.CollectTestCases()
  mod.testSoundSelfAvoidDruid.CollectTestCases()
  mod.testSoundSelfAvoidShaman.CollectTestCases()
end

function me.TestAllSoundEnemyAvoid()
  mod.testSoundEnemyAvoidWarrior.CollectTestCases()
  mod.testSoundEnemyAvoidPriest.CollectTestCases()
  mod.testSoundEnemyAvoidRogue.CollectTestCases()
  mod.testSoundEnemyAvoidMage.CollectTestCases()
  mod.testSoundEnemyAvoidHunter.CollectTestCases()
  mod.testSoundEnemyAvoidWarlock.CollectTestCases()
  mod.testSoundEnemyAvoidPaladin.CollectTestCases()
  mod.testSoundEnemyAvoidDruid.CollectTestCases()
  mod.testSoundEnemyAvoidShaman.CollectTestCases()
end

function me.TestAllCombatEvents()
  mod.testCombatEventsWarrior.CollectTestCases()
  mod.testCombatEventsPriest.CollectTestCases()
  mod.testCombatEventsRogue.CollectTestCases()
  mod.testCombatEventsMage.CollectTestCases()
  mod.testCombatEventsHunter.CollectTestCases()
  mod.testCombatEventsWarlock.CollectTestCases()
  mod.testCombatEventsPaladin.CollectTestCases()
  mod.testCombatEventsDruid.CollectTestCases()
  mod.testCombatEventsShaman.CollectTestCases()
  mod.testCombatEventsRacials.CollectTestCases()
  mod.testCombatEventsItems.CollectTestCases()
  mod.testCombatEventsMisc.CollectTestCases()
end

function me.TestAllCombatSelfAvoidEvents()
  mod.testCombatEventsSelfAvoidWarrior.CollectTestCases()
  mod.testCombatEventsSelfAvoidPriest.CollectTestCases()
  mod.testCombatEventsSelfAvoidRogue.CollectTestCases()
  mod.testCombatEventsSelfAvoidMage.CollectTestCases()
  mod.testCombatEventsSelfAvoidHunter.CollectTestCases()
  mod.testCombatEventsSelfAvoidWarlock.CollectTestCases()
  mod.testCombatEventsSelfAvoidPaladin.CollectTestCases()
  mod.testCombatEventsSelfAvoidDruid.CollectTestCases()
  mod.testCombatEventsSelfAvoidShaman.CollectTestCases()
end

function me.TestAllCombatEnemyAvoidEvents()
  mod.testCombatEventsEnemyAvoidWarrior.CollectTestCases()
  mod.testCombatEventsEnemyAvoidPriest.CollectTestCases()
  mod.testCombatEventsEnemyAvoidRogue.CollectTestCases()
  mod.testCombatEventsEnemyAvoidMage.CollectTestCases()
  mod.testCombatEventsEnemyAvoidHunter.CollectTestCases()
  mod.testCombatEventsEnemyAvoidWarlock.CollectTestCases()
  mod.testCombatEventsEnemyAvoidPaladin.CollectTestCases()
  mod.testCombatEventsEnemyAvoidDruid.CollectTestCases()
  mod.testCombatEventsEnemyAvoidShaman.CollectTestCases()
end
