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
mod.testSoundShamanSod = me

me.tag = "TestSoundShamanSod"

local testCategory = "shaman"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound shaman")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHealingRain_415236)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAncestralGuidance_409324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAncestralGuidance_409324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEarthShield_408514)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEarthShield_408514)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWaterShield_408510)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownWaterShield_408510)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDecoyTotem_425874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemicProjection_437009)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMaelstromWeapon_408498)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownMaelstromWeapon_408498)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTidalWaves_432042)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTidalWaves_432042)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRiptide_409954)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPowerSurge_415100)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownPowerSurge_415100)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFeralSpirit_440580)
end

function me.TestSoundHealingRain_415236()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHealingRain_415236",
    testCategory,
    415236
  )
end

function me.TestSoundAncestralGuidance_409324()
  mod.testHelper.TestSoundApplied(
    "TestSoundAncestralGuidance_409324",
    testCategory,
    409324
  )
end

function me.TestSoundDownAncestralGuidance_409324()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAncestralGuidance_409324",
    testCategory,
    409324
  )
end

function me.TestSoundEarthShield_408514()
  mod.testHelper.TestSoundApplied(
    "TestSoundEarthShield_408514",
    testCategory,
    408514
  )
end

function me.TestSoundDownEarthShield_408514()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEarthShield_408514",
    testCategory,
    408514
  )
end

function me.TestSoundWaterShield_408510()
  mod.testHelper.TestSoundApplied(
    "TestSoundWaterShield_408510",
    testCategory,
    408510
  )
end

function me.TestSoundDownWaterShield_408510()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownWaterShield_408510",
    testCategory,
    408510
  )
end

function me.TestSoundDecoyTotem_425874()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDecoyTotem_425874",
    testCategory,
    425874
  )
end

function me.TestSoundTotemicProjection_437009()
  mod.testHelper.TestSoundSuccess(
    "TestSoundTotemicProjection_437009",
    testCategory,
    437009
  )
end

function me.TestSoundMaelstromWeapon_408498()
  mod.testHelper.TestSoundApplied(
    "TestSoundMaelstromWeapon_408498",
    testCategory,
    408498
  )
end

function me.TestSoundDownMaelstromWeapon_408498()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownMaelstromWeapon_408498",
    testCategory,
    408498
  )
end

function me.TestSoundTidalWaves_432042()
  mod.testHelper.TestSoundApplied(
    "TestSoundTidalWaves_432042",
    testCategory,
    432042
  )
end

function me.TestSoundDownTidalWaves_432042()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownTidalWaves_432042",
    testCategory,
    432042
  )
end

function me.TestSoundRiptide_409954()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRiptide_409954",
    testCategory,
    409954
  )
end

function me.TestSoundPowerSurge_415100()
  mod.testHelper.TestSoundApplied(
    "TestSoundPowerSurge_415100",
    testCategory,
    415100
  )
end

function me.TestSoundDownPowerSurge_415100()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownPowerSurge_415100",
    testCategory,
    415100
  )
end

function me.TestSoundFeralSpirit_440580()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFeralSpirit_440580",
    testCategory,
    440580
  )
end
