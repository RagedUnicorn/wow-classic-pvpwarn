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
mod.testCombatEventsRogueClassic = me

me.tag = "TestCombatEventsRogueClassic"

local testCategory = "rogue"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testcombatevent rogue")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlindApplied_2094)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlindRefresh_2094)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventKickSuccess_1769)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventKickSuccess_1766)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventKickSuccess_1767)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventKickSuccess_1768)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSprintApplied_11305)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSprintRemoved_11305)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSprintApplied_2983)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSprintRemoved_2983)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSprintApplied_8696)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSprintRemoved_8696)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEvasionApplied_5277)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEvasionRemoved_5277)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventKidneyShotSuccess_8643)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventKidneyShotSuccess_408)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventCheapShotSuccess_1833)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAdrenalineRushApplied_13750)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAdrenalineRushRemoved_13750)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBladeFlurryApplied_13877)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBladeFlurryRemoved_13877)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventColdBloodApplied_14177)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventColdBloodRemoved_14177)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPreparationSuccess_14185)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventVanishSuccess_1856)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventVanishSuccess_1857)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStealthSuccess_1784)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStealthSuccess_1785)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStealthSuccess_1786)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStealthSuccess_1787)
end

function me.TestCombatEventBlindApplied_2094()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBlindApplied_2094",
    testCategory,
    "Blind",
    2094
  )
end

function me.TestCombatEventBlindRefresh_2094()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventBlindRefresh_2094",
    testCategory,
    "Blind",
    2094
  )
end

function me.TestCombatEventKickSuccess_1769()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventKickSuccess_1769",
    testCategory,
    "Kick",
    1769
  )
end

function me.TestCombatEventKickSuccess_1766()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventKickSuccess_1766",
    testCategory,
    "Kick",
    1766
  )
end

function me.TestCombatEventKickSuccess_1767()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventKickSuccess_1767",
    testCategory,
    "Kick",
    1767
  )
end

function me.TestCombatEventKickSuccess_1768()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventKickSuccess_1768",
    testCategory,
    "Kick",
    1768
  )
end

function me.TestCombatEventSprintApplied_11305()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSprintApplied_11305",
    testCategory,
    "Sprint",
    11305
  )
end

function me.TestCombatEventSprintRemoved_11305()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSprintRemoved_11305",
    testCategory,
    "Sprint",
    11305
  )
end

function me.TestCombatEventSprintApplied_2983()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSprintApplied_2983",
    testCategory,
    "Sprint",
    2983
  )
end

function me.TestCombatEventSprintRemoved_2983()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSprintRemoved_2983",
    testCategory,
    "Sprint",
    2983
  )
end

function me.TestCombatEventSprintApplied_8696()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSprintApplied_8696",
    testCategory,
    "Sprint",
    8696
  )
end

function me.TestCombatEventSprintRemoved_8696()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSprintRemoved_8696",
    testCategory,
    "Sprint",
    8696
  )
end

function me.TestCombatEventEvasionApplied_5277()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventEvasionApplied_5277",
    testCategory,
    "Evasion",
    5277
  )
end

function me.TestCombatEventEvasionRemoved_5277()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventEvasionRemoved_5277",
    testCategory,
    "Evasion",
    5277
  )
end

function me.TestCombatEventKidneyShotSuccess_8643()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventKidneyShotSuccess_8643",
    testCategory,
    "Kidney Shot",
    8643
  )
end

function me.TestCombatEventKidneyShotSuccess_408()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventKidneyShotSuccess_408",
    testCategory,
    "Kidney Shot",
    408
  )
end

function me.TestCombatEventCheapShotSuccess_1833()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventCheapShotSuccess_1833",
    testCategory,
    "Cheap Shot",
    1833
  )
end

function me.TestCombatEventAdrenalineRushApplied_13750()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAdrenalineRushApplied_13750",
    testCategory,
    "Adrenaline Rush",
    13750
  )
end

function me.TestCombatEventAdrenalineRushRemoved_13750()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAdrenalineRushRemoved_13750",
    testCategory,
    "Adrenaline Rush",
    13750
  )
end

function me.TestCombatEventBladeFlurryApplied_13877()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBladeFlurryApplied_13877",
    testCategory,
    "Blade Flurry",
    13877
  )
end

function me.TestCombatEventBladeFlurryRemoved_13877()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBladeFlurryRemoved_13877",
    testCategory,
    "Blade Flurry",
    13877
  )
end

function me.TestCombatEventColdBloodApplied_14177()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventColdBloodApplied_14177",
    testCategory,
    "Cold Blood",
    14177
  )
end

function me.TestCombatEventColdBloodRemoved_14177()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventColdBloodRemoved_14177",
    testCategory,
    "Cold Blood",
    14177
  )
end

function me.TestCombatEventPreparationSuccess_14185()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPreparationSuccess_14185",
    testCategory,
    "Preparation",
    14185
  )
end

function me.TestCombatEventVanishSuccess_1856()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventVanishSuccess_1856",
    testCategory,
    "Vanish",
    1856
  )
end

function me.TestCombatEventVanishSuccess_1857()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventVanishSuccess_1857",
    testCategory,
    "Vanish",
    1857
  )
end

function me.TestCombatEventStealthSuccess_1784()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStealthSuccess_1784",
    testCategory,
    "Stealth",
    1784
  )
end

function me.TestCombatEventStealthSuccess_1785()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStealthSuccess_1785",
    testCategory,
    "Stealth",
    1785
  )
end

function me.TestCombatEventStealthSuccess_1786()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStealthSuccess_1786",
    testCategory,
    "Stealth",
    1786
  )
end

function me.TestCombatEventStealthSuccess_1787()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStealthSuccess_1787",
    testCategory,
    "Stealth",
    1787
  )
end
