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
mod.testCombatEventsShamanTbc = me

me.tag = "TestCombatEventsShamanTbc"

local testCategory = "shaman"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testcombatevent shaman")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFireResistanceTotemSuccess_25563)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFrostResistanceTotemSuccess_25560)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventNatureResistanceTotemSuccess_25574)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFlametongueTotemSuccess_25557)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStoneskinTotemSuccess_25508)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStoneskinTotemSuccess_25509)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStrengthOfEarthTotemSuccess_25528)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWindfuryTotemSuccess_25585)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWindfuryTotemSuccess_25587)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWindwallTotemSuccess_25577)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFireNovaTotemSuccess_25546)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFireNovaTotemSuccess_25547)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMagmaTotemSuccess_25552)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSearingTotemSuccess_25533)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStoneclawTotemSuccess_25525)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHealingStreamTotemSuccess_25567)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventManaSpringTotemSuccess_25570)
end

function me.TestCombatEventFireResistanceTotemSuccess_25563()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireResistanceTotemSuccess_25563", testCategory, "Fire Resistance Totem", 25563
  )
end

function me.TestCombatEventFrostResistanceTotemSuccess_25560()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostResistanceTotemSuccess_25560", testCategory, "Frost Resistance Totem", 25560
  )
end

function me.TestCombatEventNatureResistanceTotemSuccess_25574()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventNatureResistanceTotemSuccess_25574", testCategory, "Nature Resistance Totem", 25574
  )
end

function me.TestCombatEventFlametongueTotemSuccess_25557()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFlametongueTotemSuccess_25557", testCategory, "Flametongue Totem", 25557
  )
end

function me.TestCombatEventStoneskinTotemSuccess_25508()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStoneskinTotemSuccess_25508", testCategory, "Stoneskin Totem", 25508
  )
end

function me.TestCombatEventStoneskinTotemSuccess_25509()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStoneskinTotemSuccess_25509", testCategory, "Stoneskin Totem", 25509
  )
end

function me.TestCombatEventStrengthOfEarthTotemSuccess_25528()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStrengthOfEarthTotemSuccess_25528", testCategory, "Strength of Earth Totem", 25528
  )
end

function me.TestCombatEventWindfuryTotemSuccess_25585()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventWindfuryTotemSuccess_25585", testCategory, "Windfury Totem", 25585
  )
end

function me.TestCombatEventWindfuryTotemSuccess_25587()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventWindfuryTotemSuccess_25587", testCategory, "Windfury Totem", 25587
  )
end

function me.TestCombatEventWindwallTotemSuccess_25577()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventWindwallTotemSuccess_25577", testCategory, "Windwall Totem", 25577
  )
end

function me.TestCombatEventFireNovaTotemSuccess_25546()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireNovaTotemSuccess_25546", testCategory, "Fire Nova Totem", 25546
  )
end

function me.TestCombatEventFireNovaTotemSuccess_25547()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireNovaTotemSuccess_25547", testCategory, "Fire Nova Totem", 25547
  )
end

function me.TestCombatEventMagmaTotemSuccess_25552()
  mod.testHelper.TestCombatEventSuccess("TestCombatEventMagmaTotemSuccess_25552", testCategory, "Magma Totem", 25552)
end

function me.TestCombatEventSearingTotemSuccess_25533()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSearingTotemSuccess_25533", testCategory, "Searing Totem", 25533
  )
end

function me.TestCombatEventStoneclawTotemSuccess_25525()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStoneclawTotemSuccess_25525", testCategory, "Stoneclaw Totem", 25525
  )
end

function me.TestCombatEventHealingStreamTotemSuccess_25567()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHealingStreamTotemSuccess_25567", testCategory, "Healing Stream Totem", 25567
  )
end

function me.TestCombatEventManaSpringTotemSuccess_25570()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventManaSpringTotemSuccess_25570", testCategory, "Mana Spring Totem", 25570
  )
end
