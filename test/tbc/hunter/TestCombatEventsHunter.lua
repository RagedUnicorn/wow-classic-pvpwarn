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
mod.testCombatEventsHunterTbc = me

me.tag = "TestCombatEventsHunterTbc"

local testCategory = "hunter"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testcombatevent hunter")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheHawkApplied_27044)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheHawkRemoved_27044)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheWildApplied_27045)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheWildRemoved_27045)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventExplosiveTrapSuccess_27025)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventImmolationTrapSuccess_27023)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventViperStingSuccess_27018)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheViperApplied_34074)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAspectOfTheViperRemoved_34074)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSilencingShotSuccess_34490)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTheBeastWithinApplied_34471)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTheBeastWithinRemoved_34471)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSnakeTrapSuccess_34600)
end

function me.TestCombatEventAspectOfTheHawkApplied_27044()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfTheHawkApplied_27044",
    testCategory,
    "Aspect of the Hawk",
    27044
  )
end

function me.TestCombatEventAspectOfTheHawkRemoved_27044()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfTheHawkRemoved_27044",
    testCategory,
    "Aspect of the Hawk",
    27044
  )
end

function me.TestCombatEventAspectOfTheWildApplied_27045()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfTheWildApplied_27045",
    testCategory,
    "Aspect of the Wild",
    27045
  )
end

function me.TestCombatEventAspectOfTheWildRemoved_27045()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfTheWildRemoved_27045",
    testCategory,
    "Aspect of the Wild",
    27045
  )
end

function me.TestCombatEventExplosiveTrapSuccess_27025()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventExplosiveTrapSuccess_27025",
    testCategory,
    "Explosive Trap",
    27025
  )
end

function me.TestCombatEventImmolationTrapSuccess_27023()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventImmolationTrapSuccess_27023",
    testCategory,
    "Immolation Trap",
    27023
  )
end

function me.TestCombatEventViperStingSuccess_27018()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventViperStingSuccess_27018",
    testCategory,
    "Viper Sting",
    27018
  )
end

function me.TestCombatEventAspectOfTheViperApplied_34074()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAspectOfTheViperApplied_34074",
    testCategory,
    "Aspect of the Viper",
    34074
  )
end

function me.TestCombatEventAspectOfTheViperRemoved_34074()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAspectOfTheViperRemoved_34074",
    testCategory,
    "Aspect of the Viper",
    34074
  )
end

function me.TestCombatEventSilencingShotSuccess_34490()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSilencingShotSuccess_34490",
    testCategory,
    "Silencing Shot",
    34490
  )
end

function me.TestCombatEventTheBeastWithinApplied_34471()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventTheBeastWithinApplied_34471",
    testCategory,
    "The Beast Within",
    34471
  )
end

function me.TestCombatEventTheBeastWithinRemoved_34471()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventTheBeastWithinRemoved_34471",
    testCategory,
    "The Beast Within",
    34471
  )
end

function me.TestCombatEventSnakeTrapSuccess_34600()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSnakeTrapSuccess_34600",
    testCategory,
    "Snake Trap",
    34600
  )
end
