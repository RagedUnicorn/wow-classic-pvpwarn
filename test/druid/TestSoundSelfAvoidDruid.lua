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
mod.testSoundSelfAvoidDruid = me

me.tag = "TestSoundSelfAvoidDruid"

local testCategory = "druid"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testselfsound druid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEntanglingRoots_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEntanglingRoots_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEntanglingRoots_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEntanglingRoots_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEntanglingRoots_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEntanglingRoots_9852)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFaerieFire_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFaerieFire_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFaerieFire_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFaerieFire_9749)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFaerieFireFeral_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFaerieFireFeral_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFaerieFireFeral_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFaerieFireFeral_17391)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidBash_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidBash_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidBash_6798)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFeralChargeEffect_19675)
end

function me.TestSoundSelfAvoidEntanglingRoots_19970()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidEntanglingRoots_19970",
    testCategory,
    19970
  )
end

function me.TestSoundSelfAvoidEntanglingRoots_339()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidEntanglingRoots_339",
    testCategory,
    339
  )
end

function me.TestSoundSelfAvoidEntanglingRoots_1062()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidEntanglingRoots_1062",
    testCategory,
    1062
  )
end

function me.TestSoundSelfAvoidEntanglingRoots_5195()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidEntanglingRoots_5195",
    testCategory,
    5195
  )
end

function me.TestSoundSelfAvoidEntanglingRoots_5196()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidEntanglingRoots_5196",
    testCategory,
    5196
  )
end

function me.TestSoundSelfAvoidEntanglingRoots_9852()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidEntanglingRoots_9852",
    testCategory,
    9852
  )
end

function me.TestSoundSelfAvoidFaerieFire_9907()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFaerieFire_9907",
    testCategory,
    9907
  )
end

function me.TestSoundSelfAvoidFaerieFire_770()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFaerieFire_770",
    testCategory,
    770
  )
end

function me.TestSoundSelfAvoidFaerieFire_778()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFaerieFire_778",
    testCategory,
    778
  )
end

function me.TestSoundSelfAvoidFaerieFire_9749()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFaerieFire_9749",
    testCategory,
    9749
  )
end

function me.TestSoundSelfAvoidFaerieFireFeral_17392()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFaerieFireFeral_17392",
    testCategory,
    17392
  )
end

function me.TestSoundSelfAvoidFaerieFireFeral_16857()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFaerieFireFeral_16857",
    testCategory,
    16857
  )
end

function me.TestSoundSelfAvoidFaerieFireFeral_17390()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFaerieFireFeral_17390",
    testCategory,
    17390
  )
end

function me.TestSoundSelfAvoidFaerieFireFeral_17391()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFaerieFireFeral_17391",
    testCategory,
    17391
  )
end

function me.TestSoundSelfAvoidBash_8983()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidBash_8983",
    testCategory,
    8983
  )
end

function me.TestSoundSelfAvoidBash_5211()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidBash_5211",
    testCategory,
    5211
  )
end

function me.TestSoundSelfAvoidBash_6798()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidBash_6798",
    testCategory,
    6798
  )
end

function me.TestSoundSelfAvoidFeralChargeEffect_19675()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFeralChargeEffect_19675",
    testCategory,
    19675
  )
end
