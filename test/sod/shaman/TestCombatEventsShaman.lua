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
mod.testCombatEventsShamanSod = me

me.tag = "TestCombatEventsShamanSod"

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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHealingRainSuccess_415236)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAncestralGuidanceApplied_409324)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAncestralGuidanceRemoved_409324)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEarthShieldApplied_408514)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEarthShieldRemoved_408514)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWaterShieldApplied_408510)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWaterShieldRemoved_408510)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDecoyTotemSuccess_425874)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTotemicProjectionSuccess_437009)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMaelstromWeaponApplied_408498)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMaelstromWeaponRemoved_408498)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTidalWavesApplied_432042)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTidalWavesRemoved_432042)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventRiptideSuccess_409954)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPowerSurgeApplied_415100)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPowerSurgeRemoved_415100)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFeralSpiritSuccess_440580)
end

function me.TestCombatEventHealingRainSuccess_415236()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHealingRainSuccess_415236",
    testCategory,
    "Healing Rain",
    415236
  )
end

function me.TestCombatEventAncestralGuidanceApplied_409324()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAncestralGuidanceApplied_409324",
    testCategory,
    "Ancestral Guidance",
    409324
  )
end

function me.TestCombatEventAncestralGuidanceRemoved_409324()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAncestralGuidanceRemoved_409324",
    testCategory,
    "Ancestral Guidance",
    409324
  )
end

function me.TestCombatEventEarthShieldApplied_408514()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventEarthShieldApplied_408514",
    testCategory,
    "Earth Shield",
    408514
  )
end

function me.TestCombatEventEarthShieldRemoved_408514()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventEarthShieldRemoved_408514",
    testCategory,
    "Earth Shield",
    408514
  )
end

function me.TestCombatEventWaterShieldApplied_408510()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventWaterShieldApplied_408510",
    testCategory,
    "Water Shield",
    408510
  )
end

function me.TestCombatEventWaterShieldRemoved_408510()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventWaterShieldRemoved_408510",
    testCategory,
    "Water Shield",
    408510
  )
end

function me.TestCombatEventDecoyTotemSuccess_425874()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDecoyTotemSuccess_425874",
    testCategory,
    "Decoy Totem",
    425874
  )
end

function me.TestCombatEventTotemicProjectionSuccess_437009()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventTotemicProjectionSuccess_437009",
    testCategory,
    "Totemic Projection",
    437009
  )
end

function me.TestCombatEventMaelstromWeaponApplied_408498()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventMaelstromWeaponApplied_408498",
    testCategory,
    "Maelstrom Weapon",
    408498
  )
end

function me.TestCombatEventMaelstromWeaponRemoved_408498()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventMaelstromWeaponRemoved_408498",
    testCategory,
    "Maelstrom Weapon",
    408498
  )
end

function me.TestCombatEventTidalWavesApplied_432042()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventTidalWavesApplied_432042",
    testCategory,
    "Tidal Waves",
    432042
  )
end

function me.TestCombatEventTidalWavesRemoved_432042()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventTidalWavesRemoved_432042",
    testCategory,
    "Tidal Waves",
    432042
  )
end

function me.TestCombatEventRiptideSuccess_409954()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRiptideSuccess_409954",
    testCategory,
    "Riptide",
    409954
  )
end

function me.TestCombatEventPowerSurgeApplied_415100()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventPowerSurgeApplied_415100",
    testCategory,
    "Power Surge",
    415100
  )
end

function me.TestCombatEventPowerSurgeRemoved_415100()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventPowerSurgeRemoved_415100",
    testCategory,
    "Power Surge",
    415100
  )
end

function me.TestCombatEventFeralSpiritSuccess_440580()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFeralSpiritSuccess_440580",
    testCategory,
    "Feral Spirit",
    440580
  )
end
