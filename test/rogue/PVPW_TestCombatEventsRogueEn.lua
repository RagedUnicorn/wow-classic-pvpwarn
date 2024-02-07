--[[
  MIT License

  Copyright (c) 2024 Michael Wiesendanger

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
mod.testCombatEventsRogueEn = me

me.tag = "TestCombatEventsRogueEn"

local testGroupName = "CombatEventsRogueEn"
local testCategory = "rogue"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlindApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlindRefresh)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventKickSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSprintApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSprintRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEvasionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEvasionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventKidneyShotSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCheapShotSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAdrenalineRushApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAdrenalineRushRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBladeFlurryApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBladeFlurryRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventColdBloodApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventColdBloodRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPreparationSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventVanishSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventStealthSuccess)
  -- runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventQuickDrawSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBetweenTheEyesSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBladeDanceApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBladeDanceRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMutilateSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowstrikeSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSaberSlashSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShivSuccess)
end

function me.TestCombatEventBlindApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBlindApplied",
    testCategory,
    "Blind"
  )
end

function me.TestCombatEventBlindRefresh()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventBlindRefresh",
    testCategory,
    "Blind"
  )
end

function me.TestCombatEventKickSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventKickSuccess",
    testCategory,
    "Kick"
  )
end

function me.TestCombatEventSprintApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSprintApplied",
    testCategory,
    "Sprint"
  )
end

function me.TestCombatEventSprintRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSprintRemoved",
    testCategory,
    "Sprint"
  )
end

function me.TestCombatEventEvasionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventEvasionApplied",
    testCategory,
    "Evasion"
  )
end

function me.TestCombatEventEvasionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventEvasionRemoved",
    testCategory,
    "Evasion"
  )
end

function me.TestCombatEventKidneyShotSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventKidneyShotSuccess",
    testCategory,
    "Kidney Shot"
  )
end

function me.TestCombatEventCheapShotSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventCheapShotSuccess",
    testCategory,
    "Cheap Shot"
  )
end

function me.TestCombatEventAdrenalineRushApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAdrenalineRushApplied",
    testCategory,
    "Adrenaline Rush"
  )
end

function me.TestCombatEventAdrenalineRushRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAdrenalineRushRemoved",
    testCategory,
    "Adrenaline Rush"
  )
end

function me.TestCombatEventBladeFlurryApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBladeFlurryApplied",
    testCategory,
    "Blade Flurry"
  )
end

function me.TestCombatEventBladeFlurryRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBladeFlurryRemoved",
    testCategory,
    "Blade Flurry"
  )
end

function me.TestCombatEventColdBloodApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventColdBloodApplied",
    testCategory,
    "Cold Blood"
  )
end

function me.TestCombatEventColdBloodRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventColdBloodRemoved",
    testCategory,
    "Cold Blood"
  )
end

function me.TestCombatEventPreparationSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPreparationSuccess",
    testCategory,
    "Preparation"
  )
end

function me.TestCombatEventVanishSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventVanishSuccess",
    testCategory,
    "Vanish"
  )
end

function me.TestCombatEventStealthSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStealthSuccess",
    testCategory,
    "Stealth"
  )
end

function me.TestCombatEventQuickDrawSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventQuickDrawSuccess",
    testCategory,
    "Quick Draw"
  )
end

function me.TestCombatEventBetweenTheEyesSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBetweenTheEyesSuccess",
    testCategory,
    "Between the Eyes"
  )
end

function me.TestCombatEventBladeDanceApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBladeDanceApplied",
    testCategory,
    "Blade Dance"
  )
end

function me.TestCombatEventBladeDanceRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBladeDanceRemoved",
    testCategory,
    "Blade Dance"
  )
end

function me.TestCombatEventMutilateSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMutilateSuccess",
    testCategory,
    "Mutilate"
  )
end

function me.TestCombatEventShadowstrikeSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowstrikeSuccess",
    testCategory,
    "Shadowstrike"
  )
end

function me.TestCombatEventSaberSlashSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSaberSlashSuccess",
    testCategory,
    "Saber Slash"
  )
end

function me.TestCombatEventShivSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShivSuccess",
    testCategory,
    "Shiv"
  )
end
