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
mod.testSoundSelfAvoidRogueTbc = me

me.tag = "TestSoundSelfAvoidRogueTbc"

local testCategory = "rogue"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testselfsound rogue")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidKick_38768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidGouge_38764)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidExposeArmor_26866)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidGarrote_26839)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidGarrote_26884)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidRupture_26867)
end

function me.TestSoundSelfAvoidKick_38768()
  mod.testHelper.TestSoundSpellMissedSelf("TestSoundSelfAvoidKick_38768", testCategory, 38768)
end
function me.TestSoundSelfAvoidGouge_38764()
  mod.testHelper.TestSoundSpellMissedSelf("TestSoundSelfAvoidGouge_38764", testCategory, 38764)
end
function me.TestSoundSelfAvoidExposeArmor_26866()
  mod.testHelper.TestSoundSpellMissedSelf("TestSoundSelfAvoidExposeArmor_26866", testCategory, 26866)
end
function me.TestSoundSelfAvoidGarrote_26839()
  mod.testHelper.TestSoundSpellMissedSelf("TestSoundSelfAvoidGarrote_26839", testCategory, 26839)
end
function me.TestSoundSelfAvoidGarrote_26884()
  mod.testHelper.TestSoundSpellMissedSelf("TestSoundSelfAvoidGarrote_26884", testCategory, 26884)
end
function me.TestSoundSelfAvoidRupture_26867()
  mod.testHelper.TestSoundSpellMissedSelf("TestSoundSelfAvoidRupture_26867", testCategory, 26867)
end
