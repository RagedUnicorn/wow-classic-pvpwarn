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
mod.testCombatEventsRacials = me

me.tag = "TestCombatEventsRacials"

local testCategory = "racials"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testcombatevent racials")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPerceptionApplied_20600)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPerceptionRemoved_20600)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventWillOfTheForsakenApplied_7744)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventWillOfTheForsakenRemoved_7744)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventStoneformApplied_20594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventStoneformRemoved_20594)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEscapeArtistSuccess_20589)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventWarStompSuccess_20549)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkingApplied_20554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkingRemoved_20554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkingApplied_26297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkingRemoved_26297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkingApplied_26296)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkingRemoved_26296)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowmeldSuccess_20580)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBloodFurySuccess_20572)
end

function me.TestCombatEventPerceptionApplied_20600()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventPerceptionApplied_20600",
    testCategory,
    "Perception",
    20600
  )
end

function me.TestCombatEventPerceptionRemoved_20600()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventPerceptionRemoved_20600",
    testCategory,
    "Perception",
    20600
  )
end

function me.TestCombatEventWillOfTheForsakenApplied_7744()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventWillOfTheForsakenApplied_7744",
    testCategory,
    "Will of the Forsaken",
    7744
  )
end

function me.TestCombatEventWillOfTheForsakenRemoved_7744()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventWillOfTheForsakenRemoved_7744",
    testCategory,
    "Will of the Forsaken",
    7744
  )
end

function me.TestCombatEventStoneformApplied_20594()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventStoneformApplied_20594",
    testCategory,
    "Stoneform",
    20594
  )
end

function me.TestCombatEventStoneformRemoved_20594()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventStoneformRemoved_20594",
    testCategory,
    "Stoneform",
    20594
  )
end

function me.TestCombatEventEscapeArtistSuccess_20589()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventEscapeArtistSuccess_20589",
    testCategory,
    "Escape Artist",
    20589
  )
end

function me.TestCombatEventWarStompSuccess_20549()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventWarStompSuccess_20549",
    testCategory,
    "War Stomp",
    20549
  )
end

function me.TestCombatEventBerserkingApplied_20554()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBerserkingApplied_20554",
    testCategory,
    "Berserking",
    20554
  )
end

function me.TestCombatEventBerserkingRemoved_20554()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBerserkingRemoved_20554",
    testCategory,
    "Berserking",
    20554
  )
end

function me.TestCombatEventBerserkingApplied_26297()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBerserkingApplied_26297",
    testCategory,
    "Berserking",
    26297
  )
end

function me.TestCombatEventBerserkingRemoved_26297()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBerserkingRemoved_26297",
    testCategory,
    "Berserking",
    26297
  )
end

function me.TestCombatEventBerserkingApplied_26296()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBerserkingApplied_26296",
    testCategory,
    "Berserking",
    26296
  )
end

function me.TestCombatEventBerserkingRemoved_26296()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBerserkingRemoved_26296",
    testCategory,
    "Berserking",
    26296
  )
end

function me.TestCombatEventShadowmeldSuccess_20580()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowmeldSuccess_20580",
    testCategory,
    "Shadowmeld",
    20580
  )
end

function me.TestCombatEventBloodFurySuccess_20572()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBloodFurySuccess_20572",
    testCategory,
    "Blood Fury",
    20572
  )
end
