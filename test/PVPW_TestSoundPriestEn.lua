--[[
  MIT License

  Copyright (c) 2022 Michael Wiesendanger

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
mod.testSoundPriestEn = me

me.tag = "TestSoundPriestEn"

local testGroupName = "SoundPriestEn"
local testCategory = "priest"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPsychicScream)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSilence)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPowerInfusion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownPowerInfusion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInnerFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInnerFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVampiricEmbrace)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevouringPlague)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTouchOfWeakness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTouchOfWeakness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFearWard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFearWard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDesperatePrayer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHexOfWeakness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowguard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowguard)
end

function me.TestSoundPsychicScream()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPsychicScream",
    testCategory,
    "Psychic Scream"
  )
end

function me.TestSoundSilence()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSilence",
    testCategory,
    "Silence"
  )
end

function me.TestSoundPowerInfusion()
  mod.testHelper.TestSoundApplied(
    "TestSoundPowerInfusion",
    testCategory,
    "Power Infusion"
  )
end

function me.TestSoundDownPowerInfusion()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownPowerInfusion",
    testCategory,
    "Power Infusion"
  )
end

function me.TestSoundInnerFire()
  mod.testHelper.TestSoundApplied(
    "TestSoundInnerFire",
    testCategory,
    "Inner Fire"
  )
end

function me.TestSoundDownInnerFire()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownInnerFire",
    testCategory,
    "Inner Fire"
  )
end

function me.TestSoundVampiricEmbrace()
  mod.testHelper.TestSoundApplied(
    "TestSoundVampiricEmbrace",
    testCategory,
    "Vampiric Embrace"
  )
end

function me.TestSoundDevouringPlague()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDevouringPlague",
    testCategory,
    "Devouring Plague"
  )
end

function me.TestSoundTouchOfWeakness()
  mod.testHelper.TestSoundApplied(
    "TestSoundTouchOfWeakness",
    testCategory,
    "Touch of Weakness"
  )
end

function me.TestSoundDownTouchOfWeakness()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownTouchOfWeakness",
    testCategory,
    "Touch of Weakness"
  )
end

function me.TestSoundFearWard()
  mod.testHelper.TestSoundApplied(
    "TestSoundFearWard",
    testCategory,
    "Fear Ward"
  )
end

function me.TestSoundDownFearWard()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFearWard",
    testCategory,
    "Fear Ward"
  )
end

function me.TestSoundDesperatePrayer()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDesperatePrayer",
    testCategory,
    "Desperate Prayer"
  )
end

function me.TestSoundHexOfWeakness()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHexOfWeakness",
    testCategory,
    "Hex of Weakness"
  )
end

function me.TestSoundShadowguard()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowguard",
    testCategory,
    "Shadowguard"
  )
end

function me.TestSoundDownShadowguard()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowguard",
    testCategory,
    "Shadowguard"
  )
end
