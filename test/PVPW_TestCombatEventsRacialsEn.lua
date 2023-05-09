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

-- luacheck: ignore _

local mod = rgpvpw
local me = {}
mod.testCombatEventsRacialsEn = me

me.tag = "TestCombatEventsRacialsEn"

local testGroupName = "CombatEventsRacialsEn"
local testCategory = "racials"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPerceptionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPerceptionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventWillOfTheForsakenApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventWillOfTheForsakenRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventStoneformApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventStoneformRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEscapeArtistSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventWarStompSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkingApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkingRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowmeldSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBloodFurySuccess)
end

function me.TestCombatEventPerceptionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventPerceptionApplied",
    testCategory,
    "Perception"
  )
end

function me.TestCombatEventPerceptionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventPerceptionRemoved",
    testCategory,
    "Perception"
  )
end

function me.TestCombatEventWillOfTheForsakenApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventWillOfTheForsakenApplied",
    testCategory,
    "Will of the Forsaken"
  )
end

function me.TestCombatEventWillOfTheForsakenRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventWillOfTheForsakenRemoved",
    testCategory,
    "Will of the Forsaken"
  )
end

function me.TestCombatEventStoneformApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventStoneformApplied",
    testCategory,
    "Stoneform"
  )
end

function me.TestCombatEventStoneformRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventStoneformRemoved",
    testCategory,
    "Stoneform"
  )
end

function me.TestCombatEventEscapeArtistSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventEscapeArtistSuccess",
    testCategory,
    "Escape Artist"
  )
end

function me.TestCombatEventWarStompSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventWarStompSuccess",
    testCategory,
    "War Stomp"
  )
end

function me.TestCombatEventBerserkingApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBerserkingApplied",
    testCategory,
    "Berserking"
  )
end

function me.TestCombatEventBerserkingRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBerserkingRemoved",
    testCategory,
    "Berserking"
  )
end

function me.TestCombatEventShadowmeldSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowmeldSuccess",
    testCategory,
    "Shadowmeld"
  )
end

function me.TestCombatEventBloodFurySuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBloodFurySuccess",
    testCategory,
    "Blood Fury"
  )
end
