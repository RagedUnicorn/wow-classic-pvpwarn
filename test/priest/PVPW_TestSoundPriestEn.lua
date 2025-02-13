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
mod.testSoundPriestEn = me

me.tag = "TestSoundPriestEn"

local testGroupName = "SoundPriestEn"
local testCategory = "priest"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
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
  -- runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPenance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCircleOfHealing)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowWordDeath)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHomunculi)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDispersion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDispersion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPainSuppression)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowfiend)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPrayerOfMending)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVoidPlague)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMindSpike)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEyeOfTheVoid)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVoidZone)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVampiricTouch)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSpiritOfTheRedeemer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSpiritOfTheRedeemer)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSurgeOfLight)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSurgeOfLight)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSerendipity)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSerendipity)
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

function me.TestSoundPenance()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPenance",
    testCategory,
    "Penance"
  )
end

function me.TestSoundCircleOfHealing()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCircleOfHealing",
    testCategory,
    "Circle of Healing"
  )
end

function me.TestSoundShadowWordDeath()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowWordDeath",
    testCategory,
    "Shadow Word: Death"
  )
end

function me.TestSoundHomunculi()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHomunculi",
    testCategory,
    "Homunculi"
  )
end

function me.TestSoundDispersion()
  mod.testHelper.TestSoundApplied(
    "TestSoundDispersion",
    testCategory,
    "Dispersion"
  )
end

function me.TestSoundDownDispersion()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDispersion",
    testCategory,
    "Dispersion"
  )
end

function me.TestSoundPainSuppression()
  mod.testHelper.TestSoundApplied(
    "TestSoundPainSuppression",
    testCategory,
    "Pain Suppression"
  )
end

function me.TestSoundDownPainSuppression()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownPainSuppression",
    testCategory,
    "Pain Suppression"
  )
end

function me.TestSoundShadowfiend()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowfiend",
    testCategory,
    "Shadowfiend"
  )
end

function me.TestSoundPrayerOfMending()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPrayerOfMending",
    testCategory,
    "Prayer of Mending"
  )
end

function me.TestSoundVoidPlague()
  mod.testHelper.TestSoundSuccess(
    "TestSoundVoidPlague",
    testCategory,
    "Void Plague"
  )
end

function me.TestSoundMindSpike()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMindSpike",
    testCategory,
    "Mind Spike"
  )
end

function me.TestSoundEyeOfTheVoid()
  mod.testHelper.TestSoundSuccess(
    "TestSoundEyeOfTheVoid",
    testCategory,
    "Eye of the Void"
  )
end

function me.TestSoundVoidZone()
  mod.testHelper.TestSoundSuccess(
    "TestSoundVoidZone",
    testCategory,
    "Void Zone"
  )
end

function me.TestSoundVampiricTouch()
  mod.testHelper.TestSoundSuccess(
    "TestSoundVampiricTouch",
    testCategory,
    "Vampiric Touch"
  )
end

function me.TestSoundSpiritOfTheRedeemer()
  mod.testHelper.TestSoundApplied(
    "TestSoundSpiritOfTheRedeemer",
    testCategory,
    "Spirit of the Redeemer"
  )
end

function me.TestSoundDownSpiritOfTheRedeemer()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSpiritOfTheRedeemer",
    testCategory,
    "Spirit of the Redeemer"
  )
end

function me.TestSoundSurgeOfLight()
  mod.testHelper.TestSoundApplied(
    "TestSoundSurgeOfLight",
    testCategory,
    "Surge of Light"
  )
end

function me.TestSoundDownSurgeOfLight()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSurgeOfLight",
    testCategory,
    "Surge of Light"
  )
end

function me.TestSoundSerendipity()
  mod.testHelper.TestSoundApplied(
    "TestSoundSerendipity",
    testCategory,
    "Serendipity"
  )
end

function me.TestSoundDownSerendipity()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSerendipity",
    testCategory,
    "Serendipity"
  )
end
