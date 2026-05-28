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
mod.testSoundWarriorTbc = me

me.tag = "TestSoundWarriorTbc"

local testCategory = "warrior"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound warrior")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntercept_25272)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntercept_25275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldSlam_25258)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldSlam_30356)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldBash_29704)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLastStand_12976)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownLastStand_12976)
end

function me.TestSoundIntercept_25272()
  mod.testHelper.TestSoundSuccess(
    "TestSoundIntercept_25272",
    testCategory,
    25272
  )
end

function me.TestSoundIntercept_25275()
  mod.testHelper.TestSoundSuccess(
    "TestSoundIntercept_25275",
    testCategory,
    25275
  )
end

function me.TestSoundShieldSlam_25258()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShieldSlam_25258",
    testCategory,
    25258
  )
end

function me.TestSoundShieldSlam_30356()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShieldSlam_30356",
    testCategory,
    30356
  )
end

function me.TestSoundShieldBash_29704()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShieldBash_29704",
    testCategory,
    29704
  )
end

function me.TestSoundLastStand_12976()
  mod.testHelper.TestSoundApplied(
    "TestSoundLastStand_12976",
    testCategory,
    12976
  )
end

function me.TestSoundDownLastStand_12976()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownLastStand_12976",
    testCategory,
    12976
  )
end
