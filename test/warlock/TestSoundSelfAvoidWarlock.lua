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
mod.testSoundSelfAvoidWarlock = me

me.tag = "TestSoundSelfAvoidWarlock"

local testCategory = "warlock"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testselfsound warlock")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidCurseOfTongues_11719)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidCurseOfTongues_1714)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidDeathCoil_17926)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidDeathCoil_17925)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidDeathCoil_6789)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFear_6215)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFear_6213)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFear_5782)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidHowlOfTerror_17928)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidHowlOfTerror_5484)
end

function me.TestSoundSelfAvoidCurseOfTongues_11719()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidCurseOfTongues_11719",
    testCategory,
    11719
  )
end

function me.TestSoundSelfAvoidCurseOfTongues_1714()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidCurseOfTongues_1714",
    testCategory,
    1714
  )
end

function me.TestSoundSelfAvoidDeathCoil_17926()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidDeathCoil_17926",
    testCategory,
    17926
  )
end

function me.TestSoundSelfAvoidDeathCoil_17925()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidDeathCoil_17925",
    testCategory,
    17925
  )
end

function me.TestSoundSelfAvoidDeathCoil_6789()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidDeathCoil_6789",
    testCategory,
    6789
  )
end

function me.TestSoundSelfAvoidFear_6215()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFear_6215",
    testCategory,
    6215
  )
end

function me.TestSoundSelfAvoidFear_6213()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFear_6213",
    testCategory,
    6213
  )
end

function me.TestSoundSelfAvoidFear_5782()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFear_5782",
    testCategory,
    5782
  )
end

function me.TestSoundSelfAvoidHowlOfTerror_17928()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidHowlOfTerror_17928",
    testCategory,
    17928
  )
end

function me.TestSoundSelfAvoidHowlOfTerror_5484()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidHowlOfTerror_5484",
    testCategory,
    5484
  )
end
