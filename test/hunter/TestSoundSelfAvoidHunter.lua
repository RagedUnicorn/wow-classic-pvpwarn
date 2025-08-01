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
mod.testSoundSelfAvoidHunter = me

me.tag = "TestSoundSelfAvoidHunter"

local testCategory = "hunter"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testselfsound hunter")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidConcussiveShot_5116)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidScatterShot_19503)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSerpentSting_13555)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSerpentSting_13554)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSerpentSting_13553)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSerpentSting_13552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSerpentSting_13551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSerpentSting_13550)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSerpentSting_13549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSerpentSting_1978)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidViperSting_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidViperSting_3034)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidViperSting_14279)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFreezingTrap_14308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFreezingTrap_3355)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidWingClip_14268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidWingClip_2974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidWingClip_14267)
end

function me.TestSoundSelfAvoidConcussiveShot_5116()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidConcussiveShot_5116",
    testCategory,
    5116
  )
end

function me.TestSoundSelfAvoidScatterShot_19503()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidScatterShot_19503",
    testCategory,
    19503
  )
end

function me.TestSoundSelfAvoidSerpentSting_13555()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidSerpentSting_13555",
    testCategory,
    13555
  )
end

function me.TestSoundSelfAvoidSerpentSting_13553()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidSerpentSting_13553",
    testCategory,
    13553
  )
end

function me.TestSoundSelfAvoidSerpentSting_13552()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidSerpentSting_13552",
    testCategory,
    13552
  )
end

function me.TestSoundSelfAvoidSerpentSting_13551()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidSerpentSting_13551",
    testCategory,
    13551
  )
end

function me.TestSoundSelfAvoidSerpentSting_13550()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidSerpentSting_13550",
    testCategory,
    13550
  )
end

function me.TestSoundSelfAvoidSerpentSting_13549()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidSerpentSting_13549",
    testCategory,
    13549
  )
end

function me.TestSoundSelfAvoidSerpentSting_1978()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidSerpentSting_1978",
    testCategory,
    1978
  )
end

function me.TestSoundSelfAvoidSerpentSting_13554()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidSerpentSting_13554",
    testCategory,
    13554
  )
end

function me.TestSoundSelfAvoidViperSting_14280()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidViperSting_14280",
    testCategory,
    14280
  )
end

function me.TestSoundSelfAvoidViperSting_3034()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidViperSting_3034",
    testCategory,
    3034
  )
end

function me.TestSoundSelfAvoidViperSting_14279()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidViperSting_14279",
    testCategory,
    14279
  )
end

function me.TestSoundSelfAvoidFreezingTrap_14308()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFreezingTrap_14308",
    testCategory,
    14308
  )
end

function me.TestSoundSelfAvoidFreezingTrap_3355()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFreezingTrap_3355",
    testCategory,
    3355
  )
end

function me.TestSoundSelfAvoidWingClip_14268()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidWingClip_14268",
    testCategory,
    14268
  )
end

function me.TestSoundSelfAvoidWingClip_2974()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidWingClip_2974",
    testCategory,
    2974
  )
end

function me.TestSoundSelfAvoidWingClip_14267()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidWingClip_14267",
    testCategory,
    14267
  )
end
