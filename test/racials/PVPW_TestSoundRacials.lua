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
mod.testSoundRacials = me

me.tag = "TestSoundRacials"

local testGroupName = "SoundRacials"
local testCategory = "racials"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPerception_20600)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownPerception_20600)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWillOfTheForsaken_7744)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownWillOfTheForsaken_7744)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneform_20594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownStoneform_20594)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEscapeArtist_20589)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWarStomp_20549)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserking_20554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserking_20554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserking_26297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserking_26297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserking_26296)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserking_26296)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowmeld_20580)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBloodFury_20572)
end

function me.TestSoundPerception_20600()
  mod.testHelper.TestSoundApplied(
    "TestSoundPerception_20600",
    testCategory,
    20600
  )
end

function me.TestSoundDownPerception_20600()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownPerception_20600",
    testCategory,
    20600
  )
end

function me.TestSoundWillOfTheForsaken_7744()
  mod.testHelper.TestSoundApplied(
    "TestSoundWillOfTheForsaken_7744",
    testCategory,
    7744
  )
end

function me.TestSoundDownWillOfTheForsaken_7744()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownWillOfTheForsaken_7744",
    testCategory,
    7744
  )
end

function me.TestSoundStoneform_20594()
  mod.testHelper.TestSoundApplied(
    "TestSoundStoneform_20594",
    testCategory,
    20594
  )
end

function me.TestSoundDownStoneform_20594()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownStoneform_20594",
    testCategory,
    20594
  )
end

function me.TestSoundEscapeArtist_20589()
  mod.testHelper.TestSoundSuccess(
    "TestSoundEscapeArtist_20589",
    testCategory,
    20589
  )
end

function me.TestSoundWarStomp_20549()
  mod.testHelper.TestSoundSuccess(
    "TestSoundWarStomp_20549",
    testCategory,
    20549
  )
end

function me.TestSoundBerserking_20554()
  mod.testHelper.TestSoundApplied(
    "TestSoundBerserking_20554",
    testCategory,
    20554
  )
end

function me.TestSoundDownBerserking_20554()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBerserking_20554",
    testCategory,
    20554
  )
end

function me.TestSoundBerserking_26297()
  mod.testHelper.TestSoundApplied(
    "TestSoundBerserking_26297",
    testCategory,
    26297
  )
end

function me.TestSoundDownBerserking_26297()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBerserking_26297",
    testCategory,
    26297
  )
end

function me.TestSoundBerserking_26296()
  mod.testHelper.TestSoundApplied(
    "TestSoundBerserking_26296",
    testCategory,
    26296
  )
end

function me.TestSoundDownBerserking_26296()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBerserking_26296",
    testCategory,
    26296
  )
end

function me.TestSoundShadowmeld_20580()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowmeld_20580",
    testCategory,
    20580
  )
end

function me.TestSoundBloodFury_20572()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBloodFury_20572",
    testCategory,
    20572
  )
end
