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

local mod = rgpvpw
local me = {}
mod.testCombatEventsHunterEn = me

me.tag = "TestCombatEventsHunterEn"

local testGroupName = "CombatEventsHunterEn"
local testCategory = "hunter"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventConcussiveShotSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAspectOfTheMonkeySuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAspectOfTheHawkSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRapidFireApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRapidFireRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventExplosiveTrapSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFreezingTrapSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventImmolationTrapSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostTrapSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventViperStingSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventScatterShotSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFlareSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInitmidationApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInitmidationRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBestialWrathApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBestialWrathRemoved)


  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.TestCombatEventConcussiveShotSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventConcussiveShotSuccess",
    testCategory,
    "Concussive Shot"
  )
end

function me.TestCombatEventAspectOfTheMonkeySuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventAspectOfTheMonkeySuccess",
    testCategory,
    "Aspect of the Monkey"
  )
end

function me.TestCombatEventAspectOfTheHawkSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventAspectOfTheHawkSuccess",
    testCategory,
    "Aspect of the Hawk"
  )
end

function me.TestCombatEventRapidFireApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventRapidFireApplied",
    testCategory,
    "Rapid Fire"
  )
end

function me.TestCombatEventRapidFireRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventRapidFireRemoved",
    testCategory,
    "Rapid Fire"
  )
end

function me.TestCombatEventExplosiveTrapSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventExplosiveTrapSuccess",
    testCategory,
    "Explosive Trap"
  )
end

function me.TestCombatEventFreezingTrapSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFreezingTrapSuccess",
    testCategory,
    "Freezing Trap"
  )
end

function me.TestCombatEventImmolationTrapSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventImmolationTrapSuccess",
    testCategory,
    "Immolation Trap"
  )
end

function me.TestCombatEventFrostTrapSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostTrapSuccess",
    testCategory,
    "Frost Trap"
  )
end

function me.TestCombatEventViperStingSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventViperStingSuccess",
    testCategory,
    "Viper Sting"
  )
end

function me.TestCombatEventScatterShotSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventScatterShotSuccess",
    testCategory,
    "Scatter Shot"
  )
end

function me.TestCombatEventFlareSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFlareSuccess",
    testCategory,
    "Flare"
  )
end

function me.TestCombatEventInitmidationApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventInitmidationApplied",
    testCategory,
    "Intimidation"
  )
end

function me.TestCombatEventInitmidationRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventInitmidationRemoved",
    testCategory,
    "Intimidation"
  )
end

function me.TestCombatEventBestialWrathApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBestialWrathApplied",
    testCategory,
    "Bestial Wrath"
  )
end

function me.TestCombatEventBestialWrathRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBestialWrathRemoved",
    testCategory,
    "Bestial Wrath"
  )
end
