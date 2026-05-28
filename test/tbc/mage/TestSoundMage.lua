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
mod.testSoundMageTbc = me

me.tag = "TestSoundMageTbc"

local testCategory = "mage"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound mage")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireWard_27128)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFireWard_27128)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostWard_32796)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostWard_32796)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaShield_27131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownManaShield_27131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshManaShield_27131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIceBarrier_27134)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIceBarrier_27134)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshIceBarrier_27134)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIceBarrier_33405)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIceBarrier_33405)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshIceBarrier_33405)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostNova_27088)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlastWave_27133)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlastWave_33933)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundColdSnap_11958)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIcyVeins_12472)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIcyVeins_12472)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIceBlock_45438)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIceBlock_45438)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDragonsBreath_31661)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSlow_31589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSummonWaterElemental_31687)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInvisibility_66)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSpellsteal_30449)
end

function me.TestSoundFireWard_27128()
  mod.testHelper.TestSoundApplied(
    "TestSoundFireWard_27128",
    testCategory,
    27128
  )
end

function me.TestSoundDownFireWard_27128()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFireWard_27128",
    testCategory,
    27128
  )
end

function me.TestSoundFrostWard_32796()
  mod.testHelper.TestSoundApplied(
    "TestSoundFrostWard_32796",
    testCategory,
    32796
  )
end

function me.TestSoundDownFrostWard_32796()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFrostWard_32796",
    testCategory,
    32796
  )
end

function me.TestSoundManaShield_27131()
  mod.testHelper.TestSoundApplied(
    "TestSoundManaShield_27131",
    testCategory,
    27131
  )
end

function me.TestSoundDownManaShield_27131()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownManaShield_27131",
    testCategory,
    27131
  )
end

function me.TestSoundRefreshManaShield_27131()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshManaShield_27131",
    testCategory,
    27131
  )
end

function me.TestSoundIceBarrier_27134()
  mod.testHelper.TestSoundApplied(
    "TestSoundIceBarrier_27134",
    testCategory,
    27134
  )
end

function me.TestSoundDownIceBarrier_27134()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownIceBarrier_27134",
    testCategory,
    27134
  )
end

function me.TestSoundRefreshIceBarrier_27134()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshIceBarrier_27134",
    testCategory,
    27134
  )
end

function me.TestSoundIceBarrier_33405()
  mod.testHelper.TestSoundApplied(
    "TestSoundIceBarrier_33405",
    testCategory,
    33405
  )
end

function me.TestSoundDownIceBarrier_33405()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownIceBarrier_33405",
    testCategory,
    33405
  )
end

function me.TestSoundRefreshIceBarrier_33405()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshIceBarrier_33405",
    testCategory,
    33405
  )
end

function me.TestSoundFrostNova_27088()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostNova_27088",
    testCategory,
    27088
  )
end

function me.TestSoundBlastWave_27133()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBlastWave_27133",
    testCategory,
    27133
  )
end

function me.TestSoundBlastWave_33933()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBlastWave_33933",
    testCategory,
    33933
  )
end

function me.TestSoundColdSnap_11958()
  mod.testHelper.TestSoundSuccess(
    "TestSoundColdSnap_11958",
    testCategory,
    11958
  )
end

function me.TestSoundIcyVeins_12472()
  mod.testHelper.TestSoundApplied(
    "TestSoundIcyVeins_12472",
    testCategory,
    12472
  )
end

function me.TestSoundDownIcyVeins_12472()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownIcyVeins_12472",
    testCategory,
    12472
  )
end

function me.TestSoundIceBlock_45438()
  mod.testHelper.TestSoundApplied(
    "TestSoundIceBlock_45438",
    testCategory,
    45438
  )
end

function me.TestSoundDownIceBlock_45438()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownIceBlock_45438",
    testCategory,
    45438
  )
end

function me.TestSoundDragonsBreath_31661()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDragonsBreath_31661",
    testCategory,
    31661
  )
end

function me.TestSoundSlow_31589()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSlow_31589",
    testCategory,
    31589
  )
end

function me.TestSoundSummonWaterElemental_31687()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSummonWaterElemental_31687",
    testCategory,
    31687
  )
end

function me.TestSoundInvisibility_66()
  mod.testHelper.TestSoundSuccess(
    "TestSoundInvisibility_66",
    testCategory,
    66
  )
end

function me.TestSoundSpellsteal_30449()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSpellsteal_30449",
    testCategory,
    30449
  )
end
