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
mod.testCombatEventsPriestSod = me

me.tag = "TestCombatEventsPriestSod"

local testCategory = "priest"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testcombatevent priest")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPenanceSuccess_402289)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPenanceSuccess_402284)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventCircleOfHealingSuccess_401946)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowWordDeathSuccess_401955)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHomunculiSuccess_402799)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowfiendSuccess_401977)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPrayerOfMendingSuccess_401859)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventVoidPlagueSuccess_425204)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMindSpikeSuccess_431655)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEyeOfTheVoidSuccess_402789)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventVoidZoneSuccess_431681)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventVampiricTouchSuccess_402668)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSpiritOfTheRedeemerApplied_425284)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSpiritOfTheRedeemerRemoved_425284)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSurgeOfLightApplied_431664)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSurgeOfLightRemoved_431664)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSerendipityApplied_413248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSerendipityRemoved_413248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSerendipityRefresh_413248)
end

function me.TestCombatEventPenanceSuccess_402289()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPenanceSuccess_402289",
    testCategory,
    "Penance",
    402289
  )
end

function me.TestCombatEventPenanceSuccess_402284()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPenanceSuccess_402284",
    testCategory,
    "Penance",
    402284
  )
end

function me.TestCombatEventCircleOfHealingSuccess_401946()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventCircleOfHealingSuccess_401946",
    testCategory,
    "Circle of Healing",
    401946
  )
end

function me.TestCombatEventShadowWordDeathSuccess_401955()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowWordDeathSuccess_401955",
    testCategory,
    "Shadow Word: Death",
    401955
  )
end

function me.TestCombatEventHomunculiSuccess_402799()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHomunculiSuccess_402799",
    testCategory,
    "Homunculi",
    402799
  )
end

function me.TestCombatEventShadowfiendSuccess_401977()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowfiendSuccess_401977",
    testCategory,
    "Shadowfiend",
    401977
  )
end

function me.TestCombatEventPrayerOfMendingSuccess_401859()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPrayerOfMendingSuccess_401859",
    testCategory,
    "Prayer of Mending",
    401859
  )
end

function me.TestCombatEventVoidPlagueSuccess_425204()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventVoidPlagueSuccess_425204",
    testCategory,
    "Void Plague",
    425204
  )
end

function me.TestCombatEventMindSpikeSuccess_431655()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMindSpikeSuccess_431655",
    testCategory,
    "Mind Spike",
    431655
  )
end

function me.TestCombatEventEyeOfTheVoidSuccess_402789()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventEyeOfTheVoidSuccess_402789",
    testCategory,
    "Eye of the Void",
    402789
  )
end

function me.TestCombatEventVoidZoneSuccess_431681()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventVoidZoneSuccess_431681",
    testCategory,
    "Void Zone",
    431681
  )
end

function me.TestCombatEventVampiricTouchSuccess_402668()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventVampiricTouchSuccess_402668",
    testCategory,
    "Vampiric Touch",
    402668
  )
end

function me.TestCombatEventSpiritOfTheRedeemerApplied_425284()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSpiritOfTheRedeemerApplied_425284",
    testCategory,
    "Spirit of the Redeemer",
    425284
  )
end

function me.TestCombatEventSpiritOfTheRedeemerRemoved_425284()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSpiritOfTheRedeemerRemoved_425284",
    testCategory,
    "Spirit of the Redeemer",
    425284
  )
end

function me.TestCombatEventSurgeOfLightApplied_431664()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSurgeOfLightApplied_431664",
    testCategory,
    "Surge of Light",
    431664
  )
end

function me.TestCombatEventSurgeOfLightRemoved_431664()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSurgeOfLightRemoved_431664",
    testCategory,
    "Surge of Light",
    431664
  )
end

function me.TestCombatEventSerendipityApplied_413248()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSerendipityApplied_413248",
    testCategory,
    "Serendipity",
    413248
  )
end

function me.TestCombatEventSerendipityRemoved_413248()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSerendipityRemoved_413248",
    testCategory,
    "Serendipity",
    413248
  )
end

function me.TestCombatEventSerendipityRefresh_413248()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventSerendipityRefresh_413248",
    testCategory,
    "Serendipity",
    413248
  )
end
