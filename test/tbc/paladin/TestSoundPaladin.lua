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
mod.testSoundPaladinTbc = me

me.tag = "TestSoundPaladinTbc"

local testCategory = "paladin"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound paladin")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevotionAura_27149)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRetributionAura_27150)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowResistanceAura_27151)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostResistanceAura_27152)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireResistanceAura_27153)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlessingOfSacrifice_27147)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlessingOfSacrifice_27147)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlessingOfSacrifice_27148)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlessingOfSacrifice_27148)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLayOnHands_27154)
end

function me.TestSoundDevotionAura_27149()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDevotionAura_27149",
    testCategory,
    27149
  )
end

function me.TestSoundRetributionAura_27150()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRetributionAura_27150",
    testCategory,
    27150
  )
end

function me.TestSoundShadowResistanceAura_27151()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowResistanceAura_27151",
    testCategory,
    27151
  )
end

function me.TestSoundFrostResistanceAura_27152()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostResistanceAura_27152",
    testCategory,
    27152
  )
end

function me.TestSoundFireResistanceAura_27153()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFireResistanceAura_27153",
    testCategory,
    27153
  )
end

function me.TestSoundBlessingOfSacrifice_27147()
  mod.testHelper.TestSoundApplied(
    "TestSoundBlessingOfSacrifice_27147",
    testCategory,
    27147
  )
end

function me.TestSoundDownBlessingOfSacrifice_27147()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBlessingOfSacrifice_27147",
    testCategory,
    27147
  )
end

function me.TestSoundBlessingOfSacrifice_27148()
  mod.testHelper.TestSoundApplied(
    "TestSoundBlessingOfSacrifice_27148",
    testCategory,
    27148
  )
end

function me.TestSoundDownBlessingOfSacrifice_27148()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBlessingOfSacrifice_27148",
    testCategory,
    27148
  )
end

function me.TestSoundLayOnHands_27154()
  mod.testHelper.TestSoundSuccess(
    "TestSoundLayOnHands_27154",
    testCategory,
    27154
  )
end
