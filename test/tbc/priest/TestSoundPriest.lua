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
mod.testSoundPriestTbc = me

me.tag = "TestSoundPriestTbc"

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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInnerFire_25431)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInnerFire_25431)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshInnerFire_25431)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevouringPlague_25467)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTouchOfWeakness_25460)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTouchOfWeakness_25460)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshTouchOfWeakness_25460)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDesperatePrayer_25437)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHexOfWeakness_25470)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowguard_25477)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowguard_25477)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshShadowguard_25477)
end

function me.TestSoundInnerFire_25431()
  mod.testHelper.TestSoundApplied(
    "TestSoundInnerFire_25431",
    testCategory,
    25431
  )
end

function me.TestSoundDownInnerFire_25431()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownInnerFire_25431",
    testCategory,
    25431
  )
end

function me.TestSoundRefreshInnerFire_25431()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshInnerFire_25431",
    testCategory,
    25431
  )
end

function me.TestSoundDevouringPlague_25467()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDevouringPlague_25467",
    testCategory,
    25467
  )
end

function me.TestSoundTouchOfWeakness_25460()
  mod.testHelper.TestSoundApplied(
    "TestSoundTouchOfWeakness_25460",
    testCategory,
    25460
  )
end

function me.TestSoundDownTouchOfWeakness_25460()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownTouchOfWeakness_25460",
    testCategory,
    25460
  )
end

function me.TestSoundRefreshTouchOfWeakness_25460()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshTouchOfWeakness_25460",
    testCategory,
    25460
  )
end

function me.TestSoundDesperatePrayer_25437()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDesperatePrayer_25437",
    testCategory,
    25437
  )
end

function me.TestSoundHexOfWeakness_25470()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHexOfWeakness_25470",
    testCategory,
    25470
  )
end

function me.TestSoundShadowguard_25477()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowguard_25477",
    testCategory,
    25477
  )
end

function me.TestSoundDownShadowguard_25477()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowguard_25477",
    testCategory,
    25477
  )
end

function me.TestSoundRefreshShadowguard_25477()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshShadowguard_25477",
    testCategory,
    25477
  )
end
