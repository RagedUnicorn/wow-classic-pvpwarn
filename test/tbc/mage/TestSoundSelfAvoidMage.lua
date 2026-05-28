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
mod.testSoundSelfAvoidMageTbc = me

me.tag = "TestSoundSelfAvoidMageTbc"

local testCategory = "mage"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testselfsound mage")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFrostNova_27088)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidConeOfCold_27087)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidDragonsBreath_31661)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSpellsteal_30449)
end

function me.TestSoundSelfAvoidFrostNova_27088()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFrostNova_27088",
    testCategory,
    27088
  )
end

function me.TestSoundSelfAvoidConeOfCold_27087()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidConeOfCold_27087",
    testCategory,
    27087
  )
end

function me.TestSoundSelfAvoidDragonsBreath_31661()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidDragonsBreath_31661",
    testCategory,
    31661
  )
end

function me.TestSoundSelfAvoidSpellsteal_30449()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidSpellsteal_30449",
    testCategory,
    30449
  )
end
