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
mod.testCombatEventsDruidSod = me

me.tag = "TestCombatEventsDruidSod"

local testCategory = "druid"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testcombatevent druid")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSkullBashSuccess_410176)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSavageRoarApplied_407988)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSavageRoarRemoved_407988)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventLacerateSuccess_414644)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWildGrowthSuccess_408120)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMangleSuccess_407995)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBerserkApplied_417141)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBerserkRemoved_417141)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSurvivalInstinctsApplied_408024)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSurvivalInstinctsRemoved_408024)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTreeOfLifeApplied_439733)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTreeOfLifeRemoved_439733)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFuryOfStormrageApplied_414799)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFuryOfStormrageRemoved_414799)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEclipseSolarApplied_408250)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEclipseSolarRemoved_408250)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEclipseLunarApplied_441260)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEclipseLunarRemoved_441260)
end

function me.TestCombatEventSkullBashSuccess_410176()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSkullBashSuccess_410176",
    testCategory,
    "Skull Bash",
    410176
  )
end

function me.TestCombatEventSavageRoarApplied_407988()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSavageRoarApplied_407988",
    testCategory,
    "Savage Roar",
    407988
  )
end

function me.TestCombatEventSavageRoarRemoved_407988()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSavageRoarRemoved_407988",
    testCategory,
    "Savage Roar",
    407988
  )
end

function me.TestCombatEventLacerateSuccess_414644()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventLacerateSuccess_414644",
    testCategory,
    "Lacerate",
    414644
  )
end

function me.TestCombatEventWildGrowthSuccess_408120()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventWildGrowthSuccess_408120",
    testCategory,
    "Wild Growth",
    408120
  )
end

function me.TestCombatEventMangleSuccess_407995()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMangleSuccess_407995",
    testCategory,
    "Mangle",
    407995
  )
end

function me.TestCombatEventBerserkApplied_417141()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBerserkApplied_417141",
    testCategory,
    "Berserk",
    417141
  )
end

function me.TestCombatEventBerserkRemoved_417141()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBerserkRemoved_417141",
    testCategory,
    "Berserk",
    417141
  )
end

function me.TestCombatEventSurvivalInstinctsApplied_408024()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSurvivalInstinctsApplied_408024",
    testCategory,
    "Survival Instincts",
    408024
  )
end

function me.TestCombatEventSurvivalInstinctsRemoved_408024()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSurvivalInstinctsRemoved_408024",
    testCategory,
    "Survival Instincts",
    408024
  )
end

function me.TestCombatEventTreeOfLifeApplied_439733()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventTreeOfLifeApplied_439733",
    testCategory,
    "Tree of Life",
    439733
  )
end

function me.TestCombatEventTreeOfLifeRemoved_439733()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventTreeOfLifeRemoved_439733",
    testCategory,
    "Tree of Life",
    439733
  )
end

function me.TestCombatEventFuryOfStormrageApplied_414799()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFuryOfStormrageApplied_414799",
    testCategory,
    "Fury of Stormrage",
    414799
  )
end

function me.TestCombatEventFuryOfStormrageRemoved_414799()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFuryOfStormrageRemoved_414799",
    testCategory,
    "Fury of Stormrage",
    414799
  )
end

function me.TestCombatEventEclipseSolarApplied_408250()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventEclipseSolarApplied_408250",
    testCategory,
    "Eclipse: Solar",
    408250
  )
end

function me.TestCombatEventEclipseSolarRemoved_408250()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventEclipseSolarRemoved_408250",
    testCategory,
    "Eclipse: Solar",
    408250
  )
end

function me.TestCombatEventEclipseLunarApplied_441260()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventEclipseLunarApplied_441260",
    testCategory,
    "Eclipse: Lunar",
    441260
  )
end

function me.TestCombatEventEclipseLunarRemoved_441260()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventEclipseLunarRemoved_441260",
    testCategory,
    "Eclipse: Lunar",
    441260
  )
end
