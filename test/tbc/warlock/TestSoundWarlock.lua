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
mod.testSoundWarlockTbc = me

me.tag = "TestSoundWarlockTbc"

local testCategory = "warlock"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound warlock")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowburn_27263)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowburn_30546)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDeathCoil_27223)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowfury_30283)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSummonFelguard_30146)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundUnstableAffliction_30108)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFelArmor_28176)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFelArmor_28176)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshFelArmor_28176)
end

function me.TestSoundShadowburn_27263()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowburn_27263",
    testCategory,
    27263
  )
end

function me.TestSoundShadowburn_30546()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowburn_30546",
    testCategory,
    30546
  )
end

function me.TestSoundDeathCoil_27223()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDeathCoil_27223",
    testCategory,
    27223
  )
end

function me.TestSoundShadowfury_30283()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowfury_30283",
    testCategory,
    30283
  )
end

function me.TestSoundSummonFelguard_30146()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSummonFelguard_30146",
    testCategory,
    30146
  )
end

function me.TestSoundUnstableAffliction_30108()
  mod.testHelper.TestSoundSuccess(
    "TestSoundUnstableAffliction_30108",
    testCategory,
    30108
  )
end

function me.TestSoundFelArmor_28176()
  mod.testHelper.TestSoundApplied(
    "TestSoundFelArmor_28176",
    testCategory,
    28176
  )
end

function me.TestSoundDownFelArmor_28176()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFelArmor_28176",
    testCategory,
    28176
  )
end

function me.TestSoundRefreshFelArmor_28176()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshFelArmor_28176",
    testCategory,
    28176
  )
end
