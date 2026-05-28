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
mod.testSoundSelfAvoidShamanTbc = me

me.tag = "TestSoundSelfAvoidShamanTbc"

local testCategory = "shaman"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testselfsound shaman")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidEarthShock_25454)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFlameShock_25457)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFrostShock_25464)
end

function me.TestSoundSelfAvoidEarthShock_25454()
  mod.testHelper.TestSoundSpellMissedSelf("TestSoundSelfAvoidEarthShock_25454", testCategory, 25454)
end
function me.TestSoundSelfAvoidFlameShock_25457()
  mod.testHelper.TestSoundSpellMissedSelf("TestSoundSelfAvoidFlameShock_25457", testCategory, 25457)
end
function me.TestSoundSelfAvoidFrostShock_25464()
  mod.testHelper.TestSoundSpellMissedSelf("TestSoundSelfAvoidFrostShock_25464", testCategory, 25464)
end
