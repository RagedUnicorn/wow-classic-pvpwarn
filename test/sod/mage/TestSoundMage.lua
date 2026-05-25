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
mod.testSoundMageSod = me

me.tag = "TestSoundMageSod"

local testCategory = "mage"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound mage")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFingersOfFrost_400647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFingersOfFrost_400647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIcyVeins_425121)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIcyVeins_425121)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundArcaneSurge_425124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLivingBomb_400613)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundChronostaticPreservation_436516)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownChronostaticPreservation_436516)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLivingFlame_401556)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIceLance_400640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDeepFreeze_428739)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostfireBolt_401502)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSpellfrostBolt_412532)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBalefireBolt_428878)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHotStreak_400624)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownHotStreak_400624)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBrainFreeze_400731)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBrainFreeze_400731)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrozenOrb_440802)
end

function me.TestSoundFingersOfFrost_400647()
  mod.testHelper.TestSoundApplied(
    "TestSoundFingersOfFrost_400647",
    testCategory,
    400647
  )
end

function me.TestSoundDownFingersOfFrost_400647()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFingersOfFrost_400647",
    testCategory,
    400647
  )
end

function me.TestSoundIcyVeins_425121()
  mod.testHelper.TestSoundApplied(
    "TestSoundIcyVeins_425121",
    testCategory,
    425121
  )
end

function me.TestSoundDownIcyVeins_425121()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownIcyVeins_425121",
    testCategory,
    425121
  )
end

function me.TestSoundArcaneSurge_425124()
  mod.testHelper.TestSoundSuccess(
    "TestSoundArcaneSurge_425124",
    testCategory,
    425124
  )
end

function me.TestSoundLivingBomb_400613()
  mod.testHelper.TestSoundSuccess(
    "TestSoundLivingBomb_400613",
    testCategory,
    400613
  )
end

function me.TestSoundChronostaticPreservation_436516()
  mod.testHelper.TestSoundApplied(
    "TestSoundChronostaticPreservation_436516",
    testCategory,
    436516
  )
end

function me.TestSoundDownChronostaticPreservation_436516()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownChronostaticPreservation_436516",
    testCategory,
    436516
  )
end

function me.TestSoundLivingFlame_401556()
  mod.testHelper.TestSoundSuccess(
    "TestSoundLivingFlame_401556",
    testCategory,
    401556
  )
end

function me.TestSoundIceLance_400640()
  mod.testHelper.TestSoundSuccess(
    "TestSoundIceLance_400640",
    testCategory,
    400640
  )
end

function me.TestSoundDeepFreeze_428739()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDeepFreeze_428739",
    testCategory,
    428739
  )
end

function me.TestSoundFrostfireBolt_401502()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostfireBolt_401502",
    testCategory,
    401502
  )
end

function me.TestSoundSpellfrostBolt_412532()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSpellfrostBolt_412532",
    testCategory,
    412532
  )
end

function me.TestSoundBalefireBolt_428878()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBalefireBolt_428878",
    testCategory,
    428878
  )
end

function me.TestSoundHotStreak_400624()
  mod.testHelper.TestSoundApplied(
    "TestSoundHotStreak_400624",
    testCategory,
    400624
  )
end

function me.TestSoundDownHotStreak_400624()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownHotStreak_400624",
    testCategory,
    400624
  )
end

function me.TestSoundBrainFreeze_400731()
  mod.testHelper.TestSoundApplied(
    "TestSoundBrainFreeze_400731",
    testCategory,
    400731
  )
end

function me.TestSoundDownBrainFreeze_400731()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBrainFreeze_400731",
    testCategory,
    400731
  )
end

function me.TestSoundFrozenOrb_440802()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrozenOrb_440802",
    testCategory,
    440802
  )
end
