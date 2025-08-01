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
mod.testSoundSelfAvoidShaman = me

me.tag = "TestSoundSelfAvoidShaman"

local testGroupName = "SoundSelfAvoidShaman"
local testCategory = "shaman"

function me.Test()
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testselfsound shaman")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEarthShock_8042)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEarthShock_8044)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEarthShock_8045)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEarthShock_8046)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEarthShock_10412)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEarthShock_10413)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEarthShock_10414)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFlameShock_8050)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFlameShock_8052)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFlameShock_8053)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFlameShock_10447)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFlameShock_10448)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFlameShock_29228)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFrostShock_8056)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFrostShock_8058)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFrostShock_10472)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFrostShock_10473)
end

function me.TestSoundSelfAvoidEarthShock_8042()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidEarthShock_8042",
    testCategory,
    8042
  )
end

function me.TestSoundSelfAvoidEarthShock_8044()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidEarthShock_8044",
    testCategory,
    8044
  )
end

function me.TestSoundSelfAvoidEarthShock_8045()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidEarthShock_8045",
    testCategory,
    8045
  )
end

function me.TestSoundSelfAvoidEarthShock_8046()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidEarthShock_8046",
    testCategory,
    8046
  )
end

function me.TestSoundSelfAvoidEarthShock_10412()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidEarthShock_10412",
    testCategory,
    10412
  )
end

function me.TestSoundSelfAvoidEarthShock_10413()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidEarthShock_10413",
    testCategory,
    10413
  )
end

function me.TestSoundSelfAvoidEarthShock_10414()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidEarthShock_10414",
    testCategory,
    10414
  )
end

function me.TestSoundSelfAvoidFlameShock_8050()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFlameShock_8050",
    testCategory,
    8050
  )
end

function me.TestSoundSelfAvoidFlameShock_8052()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFlameShock_8052",
    testCategory,
    8052
  )
end

function me.TestSoundSelfAvoidFlameShock_8053()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFlameShock_8053",
    testCategory,
    8053
  )
end

function me.TestSoundSelfAvoidFlameShock_10447()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFlameShock_10447",
    testCategory,
    10447
  )
end

function me.TestSoundSelfAvoidFlameShock_10448()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFlameShock_10448",
    testCategory,
    10448
  )
end

function me.TestSoundSelfAvoidFlameShock_29228()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFlameShock_29228",
    testCategory,
    29228
  )
end

function me.TestSoundSelfAvoidFrostShock_8056()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFrostShock_8056",
    testCategory,
    8056
  )
end

function me.TestSoundSelfAvoidFrostShock_8058()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFrostShock_8058",
    testCategory,
    8058
  )
end

function me.TestSoundSelfAvoidFrostShock_10472()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFrostShock_10472",
    testCategory,
    10472
  )
end

function me.TestSoundSelfAvoidFrostShock_10473()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFrostShock_10473",
    testCategory,
    10473
  )
end
