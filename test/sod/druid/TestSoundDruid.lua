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
mod.testSoundDruidSod = me

me.tag = "TestSoundDruidSod"

local testCategory = "druid"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound druid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSkullBash_410176)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSavageRoar_407988)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSavageRoar_407988)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLacerate_414644)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWildGrowth_408120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMangle_407995)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserk_417141)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserk_417141)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSurvivalInstincts_408024)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSurvivalInstincts_408024)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTreeOfLife_439733)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTreeOfLife_439733)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFuryOfStormrage_414799)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFuryOfStormrage_414799)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEclipseSolar_408250)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEclipseSolar_408250)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEclipseLunar_441260)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEclipseLunar_441260)
end

function me.TestSoundSkullBash_410176()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSkullBash_410176",
    testCategory,
    410176
  )
end

function me.TestSoundSavageRoar_407988()
  mod.testHelper.TestSoundApplied(
    "TestSoundSavageRoar_407988",
    testCategory,
    407988
  )
end

function me.TestSoundDownSavageRoar_407988()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSavageRoar_407988",
    testCategory,
    407988
  )
end

function me.TestSoundLacerate_414644()
  mod.testHelper.TestSoundSuccess(
    "TestSoundLacerate_414644",
    testCategory,
    414644
  )
end

function me.TestSoundWildGrowth_408120()
  mod.testHelper.TestSoundSuccess(
    "TestSoundWildGrowth_408120",
    testCategory,
    408120
  )
end

function me.TestSoundMangle_407995()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMangle_407995",
    testCategory,
    407995
  )
end

function me.TestSoundBerserk_417141()
  mod.testHelper.TestSoundApplied(
    "TestSoundBerserk_417141",
    testCategory,
    417141
  )
end

function me.TestSoundDownBerserk_417141()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBerserk_417141",
    testCategory,
    417141
  )
end

function me.TestSoundSurvivalInstincts_408024()
  mod.testHelper.TestSoundApplied(
    "TestSoundSurvivalInstincts_408024",
    testCategory,
    408024
  )
end

function me.TestSoundDownSurvivalInstincts_408024()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSurvivalInstincts_408024",
    testCategory,
    408024
  )
end

function me.TestSoundTreeOfLife_439733()
  mod.testHelper.TestSoundApplied(
    "TestSoundTreeOfLife_439733",
    testCategory,
    439733
  )
end

function me.TestSoundDownTreeOfLife_439733()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownTreeOfLife_439733",
    testCategory,
    439733
  )
end

function me.TestSoundFuryOfStormrage_414799()
  mod.testHelper.TestSoundApplied(
    "TestSoundFuryOfStormrage_414799",
    testCategory,
    414799
  )
end

function me.TestSoundDownFuryOfStormrage_414799()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFuryOfStormrage_414799",
    testCategory,
    414799
  )
end

function me.TestSoundEclipseSolar_408250()
  mod.testHelper.TestSoundApplied(
    "TestSoundEclipseSolar_408250",
    testCategory,
    408250
  )
end

function me.TestSoundDownEclipseSolar_408250()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEclipseSolar_408250",
    testCategory,
    408250
  )
end

function me.TestSoundEclipseLunar_441260()
  mod.testHelper.TestSoundApplied(
    "TestSoundEclipseLunar_441260",
    testCategory,
    441260
  )
end

function me.TestSoundDownEclipseLunar_441260()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEclipseLunar_441260",
    testCategory,
    441260
  )
end
