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
mod.testSoundPriestSod = me

me.tag = "TestSoundPriestSod"

local testCategory = "priest"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound priest")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPenance_402289)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPenance_402284)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCircleOfHealing_401946)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowWordDeath_401955)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHomunculi_402799)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowfiend_401977)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPrayerOfMending_401859)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVoidPlague_425204)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMindSpike_431655)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEyeOfTheVoid_402789)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVoidZone_431681)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVampiricTouch_402668)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSpiritOfTheRedeemer_425284)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSpiritOfTheRedeemer_425284)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSurgeOfLight_431664)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSurgeOfLight_431664)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSerendipity_413248)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSerendipity_413248)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshSerendipity_413248)
end

function me.TestSoundPenance_402289()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPenance_402289",
    testCategory,
    402289
  )
end

function me.TestSoundPenance_402284()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPenance_402284",
    testCategory,
    402284
  )
end

function me.TestSoundCircleOfHealing_401946()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCircleOfHealing_401946",
    testCategory,
    401946
  )
end

function me.TestSoundShadowWordDeath_401955()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowWordDeath_401955",
    testCategory,
    401955
  )
end

function me.TestSoundHomunculi_402799()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHomunculi_402799",
    testCategory,
    402799
  )
end

function me.TestSoundShadowfiend_401977()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowfiend_401977",
    testCategory,
    401977
  )
end

function me.TestSoundPrayerOfMending_401859()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPrayerOfMending_401859",
    testCategory,
    401859
  )
end

function me.TestSoundVoidPlague_425204()
  mod.testHelper.TestSoundSuccess(
    "TestSoundVoidPlague_425204",
    testCategory,
    425204
  )
end

function me.TestSoundMindSpike_431655()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMindSpike_431655",
    testCategory,
    431655
  )
end

function me.TestSoundEyeOfTheVoid_402789()
  mod.testHelper.TestSoundSuccess(
    "TestSoundEyeOfTheVoid_402789",
    testCategory,
    402789
  )
end

function me.TestSoundVoidZone_431681()
  mod.testHelper.TestSoundSuccess(
    "TestSoundVoidZone_431681",
    testCategory,
    431681
  )
end

function me.TestSoundVampiricTouch_402668()
  mod.testHelper.TestSoundSuccess(
    "TestSoundVampiricTouch_402668",
    testCategory,
    402668
  )
end

function me.TestSoundSpiritOfTheRedeemer_425284()
  mod.testHelper.TestSoundApplied(
    "TestSoundSpiritOfTheRedeemer_425284",
    testCategory,
    425284
  )
end

function me.TestSoundDownSpiritOfTheRedeemer_425284()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSpiritOfTheRedeemer_425284",
    testCategory,
    425284
  )
end

function me.TestSoundSurgeOfLight_431664()
  mod.testHelper.TestSoundApplied(
    "TestSoundSurgeOfLight_431664",
    testCategory,
    431664
  )
end

function me.TestSoundDownSurgeOfLight_431664()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSurgeOfLight_431664",
    testCategory,
    431664
  )
end

function me.TestSoundSerendipity_413248()
  mod.testHelper.TestSoundApplied(
    "TestSoundSerendipity_413248",
    testCategory,
    413248
  )
end

function me.TestSoundDownSerendipity_413248()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSerendipity_413248",
    testCategory,
    413248
  )
end

function me.TestSoundRefreshSerendipity_413248()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshSerendipity_413248",
    testCategory,
    413248
  )
end
