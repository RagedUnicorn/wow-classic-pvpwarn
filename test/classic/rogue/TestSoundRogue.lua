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
mod.testSoundRogueClassic = me

me.tag = "TestSoundRogueClassic"

local testCategory = "rogue"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound rogue")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlind_2094)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshBlind_2094)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKick_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKick_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKick_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKick_1768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSprint_11305)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSprint_11305)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSprint_2983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSprint_2983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSprint_8696)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSprint_8696)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEvasion_5277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEvasion_5277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKidneyShot_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKidneyShot_408)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCheapShot_1833)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAdrenalineRush_13750)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAdrenalineRush_13750)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBladeFlurry_13877)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBladeFlurry_13877)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundColdBlood_14177)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownColdBlood_14177)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPreparation_14185)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVanish_1857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVanish_1856)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStealth_1787)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStealth_1784)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStealth_1785)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStealth_1786)
end

function me.TestSoundBlind_2094()
  mod.testHelper.TestSoundApplied(
    "TestSoundBlind_2094",
    testCategory,
    2094
  )
end

function me.TestSoundRefreshBlind_2094()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshBlind_2094",
    testCategory,
    2094
  )
end

function me.TestSoundKick_1769()
  mod.testHelper.TestSoundSuccess(
    "TestSoundKick_1769",
    testCategory,
    1769
  )
end

function me.TestSoundKick_1766()
  mod.testHelper.TestSoundSuccess(
    "TestSoundKick_1766",
    testCategory,
    1766
  )
end

function me.TestSoundKick_1767()
  mod.testHelper.TestSoundSuccess(
    "TestSoundKick_1767",
    testCategory,
    1767
  )
end

function me.TestSoundKick_1768()
  mod.testHelper.TestSoundSuccess(
    "TestSoundKick_1768",
    testCategory,
    1768
  )
end

function me.TestSoundSprint_11305()
  mod.testHelper.TestSoundApplied(
    "TestSoundSprint_11305",
    testCategory,
    11305
  )
end

function me.TestSoundDownSprint_11305()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSprint_11305",
    testCategory,
    11305
  )
end

function me.TestSoundSprint_2983()
  mod.testHelper.TestSoundApplied(
    "TestSoundSprint_2983",
    testCategory,
    2983
  )
end

function me.TestSoundDownSprint_2983()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSprint_2983",
    testCategory,
    2983
  )
end

function me.TestSoundSprint_8696()
  mod.testHelper.TestSoundApplied(
    "TestSoundSprint_8696",
    testCategory,
    8696
  )
end

function me.TestSoundDownSprint_8696()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSprint_8696",
    testCategory,
    8696
  )
end

function me.TestSoundEvasion_5277()
  mod.testHelper.TestSoundApplied(
    "TestSoundEvasion_5277",
    testCategory,
    5277
  )
end

function me.TestSoundDownEvasion_5277()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEvasion_5277",
    testCategory,
    5277
  )
end

function me.TestSoundKidneyShot_8643()
  mod.testHelper.TestSoundSuccess(
    "TestSoundKidneyShot_8643",
    testCategory,
    8643
  )
end

function me.TestSoundKidneyShot_408()
  mod.testHelper.TestSoundSuccess(
    "TestSoundKidneyShot_408",
    testCategory,
    408
  )
end

function me.TestSoundCheapShot_1833()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCheapShot_1833",
    testCategory,
    1833
  )
end

function me.TestSoundAdrenalineRush_13750()
  mod.testHelper.TestSoundApplied(
    "TestSoundAdrenalineRush_13750",
    testCategory,
    13750
  )
end

function me.TestSoundDownAdrenalineRush_13750()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAdrenalineRush_13750",
    testCategory,
    13750
  )
end

function me.TestSoundBladeFlurry_13877()
  mod.testHelper.TestSoundApplied(
    "TestSoundBladeFlurry_13877",
    testCategory,
    13877
  )
end

function me.TestSoundDownBladeFlurry_13877()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBladeFlurry_13877",
    testCategory,
    13877
  )
end

function me.TestSoundColdBlood_14177()
  mod.testHelper.TestSoundApplied(
    "TestSoundColdBlood_14177",
    testCategory,
    14177
  )
end

function me.TestSoundDownColdBlood_14177()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownColdBlood_14177",
    testCategory,
    14177
  )
end

function me.TestSoundPreparation_14185()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPreparation_14185",
    testCategory,
    14185
  )
end

function me.TestSoundVanish_1857()
  mod.testHelper.TestSoundSuccess(
    "TestSoundVanish_1857",
    testCategory,
    1857
  )
end

function me.TestSoundVanish_1856()
  mod.testHelper.TestSoundSuccess(
    "TestSoundVanish_1856",
    testCategory,
    1856
  )
end

function me.TestSoundStealth_1787()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStealth_1787",
    testCategory,
    1787
  )
end

function me.TestSoundStealth_1784()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStealth_1784",
    testCategory,
    1784
  )
end

function me.TestSoundStealth_1785()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStealth_1785",
    testCategory,
    1785
  )
end

function me.TestSoundStealth_1786()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStealth_1786",
    testCategory,
    1786
  )
end
