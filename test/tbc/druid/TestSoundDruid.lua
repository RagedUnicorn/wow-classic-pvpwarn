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
mod.testSoundDruidTbc = me

me.tag = "TestSoundDruidTbc"

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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNaturesGrasp_27009)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNaturesGrasp_27009)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrenziedRegeneration_26999)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrenziedRegeneration_26999)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFaerieFire_26993)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFaerieFireFeral_27011)
end

function me.TestSoundNaturesGrasp_27009()
  mod.testHelper.TestSoundApplied(
    "TestSoundNaturesGrasp_27009",
    testCategory,
    27009
  )
end

function me.TestSoundDownNaturesGrasp_27009()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownNaturesGrasp_27009",
    testCategory,
    27009
  )
end

function me.TestSoundFrenziedRegeneration_26999()
  mod.testHelper.TestSoundApplied(
    "TestSoundFrenziedRegeneration_26999",
    testCategory,
    26999
  )
end

function me.TestSoundDownFrenziedRegeneration_26999()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFrenziedRegeneration_26999",
    testCategory,
    26999
  )
end

function me.TestSoundFaerieFire_26993()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFaerieFire_26993",
    testCategory,
    26993
  )
end

function me.TestSoundFaerieFireFeral_27011()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFaerieFireFeral_27011",
    testCategory,
    27011
  )
end
