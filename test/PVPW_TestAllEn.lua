--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

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
  mod.testReporter.StartTestGroup(testGroupName)

  me.TestAllCombatEventsEn()
  me.TestAllSoundEn()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.TestAllSoundEn()
  mod.testSoundDruidEn.CollectTestCases()
  mod.testSoundHunterEn.CollectTestCases()
  mod.testSoundItemsEn.CollectTestCases()
  mod.testSoundMageEn.CollectTestCases()
  mod.testSoundMiscEn.CollectTestCases()
  mod.testSoundPaladinEn.CollectTestCases()
  mod.testSoundPriestEn.CollectTestCases()
  mod.testSoundRacialsEn.CollectTestCases()
  mod.testSoundRogueEn.CollectTestCases()
  mod.testSoundShamanEn.CollectTestCases()
  mod.testSoundWarlockEn.CollectTestCases()
  mod.testSoundWarriorEn.CollectTestCases()
end

function me.TestAllCombatEventsEn()
  mod.testCombatEventsHunterEn.CollectTestCases()
  mod.testCombatEventsDruidEn.CollectTestCases()
  mod.testCombatEventsItemsEn.CollectTestCases()
  mod.testCombatEventsMageEn.CollectTestCases()
  mod.testCombatEventsMiscEn.CollectTestCases()
  mod.testCombatEventsPaladinEn.CollectTestCases()
  mod.testCombatEventsPriestEn.CollectTestCases()
  mod.testCombatEventsRacialsEn.CollectTestCases()
  mod.testCombatEventsRogueEn.CollectTestCases()
  mod.testCombatEventsShamanEn.CollectTestCases()
  mod.testCombatEventsWarlockEn.CollectTestCases()
  mod.testCombatEventsWarriorEn.CollectTestCases()
end
