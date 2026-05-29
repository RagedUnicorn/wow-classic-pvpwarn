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
mod.testCombatEventsWarlockTbc = me

me.tag = "TestCombatEventsWarlockTbc"

local testCategory = "warlock"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testcombatevent warlock")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowburnSuccess_27263)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowburnSuccess_30546)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDeathCoilSuccess_27223)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowfurySuccess_30283)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowfuryStart_30283)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSummonFelguardSuccess_30146)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventUnstableAfflictionSuccess_30108)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventUnstableAfflictionStart_30108)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFelArmorApplied_28176)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFelArmorRemoved_28176)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFelArmorRefresh_28176)
end

function me.TestCombatEventShadowburnSuccess_27263()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowburnSuccess_27263",
    testCategory,
    "Shadowburn",
    27263
  )
end

function me.TestCombatEventShadowburnSuccess_30546()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowburnSuccess_30546",
    testCategory,
    "Shadowburn",
    30546
  )
end

function me.TestCombatEventDeathCoilSuccess_27223()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDeathCoilSuccess_27223",
    testCategory,
    "Death Coil",
    27223
  )
end

function me.TestCombatEventShadowfurySuccess_30283()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowfurySuccess_30283",
    testCategory,
    "Shadowfury",
    30283
  )
end

function me.TestCombatEventShadowfuryStart_30283()
  mod.testHelper.TestCombatEventStart(
    "TestCombatEventShadowfuryStart_30283",
    testCategory,
    "Shadowfury",
    30283
  )
end

function me.TestCombatEventSummonFelguardSuccess_30146()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSummonFelguardSuccess_30146",
    testCategory,
    "Summon Felguard",
    30146
  )
end

function me.TestCombatEventUnstableAfflictionSuccess_30108()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventUnstableAfflictionSuccess_30108",
    testCategory,
    "Unstable Affliction",
    30108
  )
end

function me.TestCombatEventUnstableAfflictionStart_30108()
  mod.testHelper.TestCombatEventStart(
    "TestCombatEventUnstableAfflictionStart_30108",
    testCategory,
    "Unstable Affliction",
    30108
  )
end

function me.TestCombatEventFelArmorApplied_28176()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFelArmorApplied_28176",
    testCategory,
    "Fel Armor",
    28176
  )
end

function me.TestCombatEventFelArmorRemoved_28176()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFelArmorRemoved_28176",
    testCategory,
    "Fel Armor",
    28176
  )
end

function me.TestCombatEventFelArmorRefresh_28176()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventFelArmorRefresh_28176",
    testCategory,
    "Fel Armor",
    28176
  )
end
