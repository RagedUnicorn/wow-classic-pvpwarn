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
mod.testSoundMage = me

me.tag = "TestSoundMage"

local testCategory = "mage"

function me.Test()
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound mage")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIceBlock_11958)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIceBlock_11958)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPolymorph_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStartPolymorph_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPolymorph_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStartPolymorph_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPolymorph_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStartPolymorph_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPolymorph_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStartPolymorph_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPolymorph_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStartPolymorph_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPolymorph_28272)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStartPolymorph_28272)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlink_1953)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireWard_10225)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFireWard_10225)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireWard_543)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFireWard_543)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireWard_8457)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFireWard_8457)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireWard_8458)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFireWard_8458)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireWard_10223)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFireWard_10223)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostWard_28609)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostWard_28609)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostWard_6143)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostWard_6143)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostWard_8461)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostWard_8461)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostWard_8462)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostWard_8462)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostWard_10177)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostWard_10177)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCounterspell_2139)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaShield_10193)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownManaShield_10193)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshManaShield_10193)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaShield_1463)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownManaShield_1463)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshManaShield_1463)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaShield_8494)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownManaShield_8494)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshManaShield_8494)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaShield_8495)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownManaShield_8495)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshManaShield_8495)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaShield_10191)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownManaShield_10191)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshManaShield_10191)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaShield_10192)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownManaShield_10192)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshManaShield_10192)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIceBarrier_13033)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIceBarrier_13033)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshIceBarrier_13033)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIceBarrier_11426)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIceBarrier_11426)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshIceBarrier_11426)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIceBarrier_13031)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIceBarrier_13031)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshIceBarrier_13031)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIceBarrier_13032)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIceBarrier_13032)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshIceBarrier_13032)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostNova_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostNova_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostNova_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostNova_6131)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundArcanePower_12042)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownArcanePower_12042)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEvocation_12051)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPresenceOfMind_12043)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownPresenceOfMind_12043)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCombustion_11129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownCombustion_11129)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlastWave_13021)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlastWave_11113)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlastWave_13018)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlastWave_13019)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlastWave_13020)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundColdSnap_12472)

  -- start runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFingersOfFrost_400647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFingersOfFrost_400647)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIcyVeins_425121)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIcyVeins_425121)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundArcaneSurge_425124)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLivingBomb_400613)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundChronostaticPreservation_436516)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownChronostaticPreservation_436516)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLivingFlame_401556)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIceLance_400640)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDeepFreeze_428739)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostfireBolt_401502)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSpellfrostBolt_412532)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBalefireBolt_428878)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHotStreak_400624)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownHotStreak_400624)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBrainFreeze_400731)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBrainFreeze_400731)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrozenOrb_440802)
end

function me.TestSoundIceBlock_11958()
  mod.testHelper.TestSoundApplied(
    "TestSoundIceBlock_11958",
    testCategory,
    11958
  )
end

function me.TestSoundDownIceBlock_11958()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownIceBlock_11958",
    testCategory,
    11958
  )
end

function me.TestSoundPolymorph_12826()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPolymorph_12826",
    testCategory,
    12826
  )
end

function me.TestSoundStartPolymorph_12826()
  mod.testHelper.TestSoundStart(
    "TestSoundStartPolymorph_12826",
    testCategory,
    12826
  )
end

function me.TestSoundPolymorph_118()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPolymorph_118",
    testCategory,
    118
  )
end

function me.TestSoundStartPolymorph_118()
  mod.testHelper.TestSoundStart(
    "TestSoundStartPolymorph_118",
    testCategory,
    118
  )
end

function me.TestSoundPolymorph_12824()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPolymorph_12824",
    testCategory,
    12824
  )
end

function me.TestSoundStartPolymorph_12824()
  mod.testHelper.TestSoundStart(
    "TestSoundStartPolymorph_12824",
    testCategory,
    12824
  )
end

function me.TestSoundPolymorph_12825()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPolymorph_12825",
    testCategory,
    12825
  )
end

function me.TestSoundStartPolymorph_12825()
  mod.testHelper.TestSoundStart(
    "TestSoundStartPolymorph_12825",
    testCategory,
    12825
  )
end

function me.TestSoundPolymorph_28271()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPolymorph_28271",
    testCategory,
    28271
  )
end

function me.TestSoundStartPolymorph_28271()
  mod.testHelper.TestSoundStart(
    "TestSoundStartPolymorph_28271",
    testCategory,
    28271
  )
end

function me.TestSoundPolymorph_28272()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPolymorph_28272",
    testCategory,
    28272
  )
end

function me.TestSoundStartPolymorph_28272()
  mod.testHelper.TestSoundStart(
    "TestSoundStartPolymorph_28272",
    testCategory,
    28272
  )
end

function me.TestSoundBlink_1953()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBlink_1953",
    testCategory,
    1953
  )
end

function me.TestSoundFireWard_10225()
  mod.testHelper.TestSoundApplied(
    "TestSoundFireWard_10225",
    testCategory,
    10225
  )
end

function me.TestSoundDownFireWard_10225()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFireWard_10225",
    testCategory,
    10225
  )
end

function me.TestSoundFireWard_543()
  mod.testHelper.TestSoundApplied(
    "TestSoundFireWard_543",
    testCategory,
    543
  )
end

function me.TestSoundDownFireWard_543()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFireWard_543",
    testCategory,
    543
  )
end

function me.TestSoundFireWard_8457()
  mod.testHelper.TestSoundApplied(
    "TestSoundFireWard_8457",
    testCategory,
    8457
  )
end

function me.TestSoundDownFireWard_8457()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFireWard_8457",
    testCategory,
    8457
  )
end

function me.TestSoundFireWard_8458()
  mod.testHelper.TestSoundApplied(
    "TestSoundFireWard_8458",
    testCategory,
    8458
  )
end

function me.TestSoundDownFireWard_8458()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFireWard_8458",
    testCategory,
    8458
  )
end

function me.TestSoundFireWard_10223()
  mod.testHelper.TestSoundApplied(
    "TestSoundFireWard_10223",
    testCategory,
    10223
  )
end

function me.TestSoundDownFireWard_10223()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFireWard_10223",
    testCategory,
    10223
  )
end

function me.TestSoundFrostWard_28609()
  mod.testHelper.TestSoundApplied(
    "TestSoundFrostWard_28609",
    testCategory,
    28609
  )
end

function me.TestSoundDownFrostWard_28609()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFrostWard_28609",
    testCategory,
    28609
  )
end

function me.TestSoundFrostWard_6143()
  mod.testHelper.TestSoundApplied(
    "TestSoundFrostWard_6143",
    testCategory,
    6143
  )
end

function me.TestSoundDownFrostWard_6143()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFrostWard_6143",
    testCategory,
    6143
  )
end

function me.TestSoundFrostWard_8461()
  mod.testHelper.TestSoundApplied(
    "TestSoundFrostWard_8461",
    testCategory,
    8461
  )
end

function me.TestSoundDownFrostWard_8461()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFrostWard_8461",
    testCategory,
    8461
  )
end

function me.TestSoundFrostWard_8462()
  mod.testHelper.TestSoundApplied(
    "TestSoundFrostWard_8462",
    testCategory,
    8462
  )
end

function me.TestSoundDownFrostWard_8462()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFrostWard_8462",
    testCategory,
    8462
  )
end

function me.TestSoundFrostWard_10177()
  mod.testHelper.TestSoundApplied(
    "TestSoundFrostWard_10177",
    testCategory,
    10177
  )
end

function me.TestSoundDownFrostWard_10177()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFrostWard_10177",
    testCategory,
    10177
  )
end

function me.TestSoundCounterspell_2139()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCounterspell_2139",
    testCategory,
    2139
  )
end

function me.TestSoundManaShield_10193()
  mod.testHelper.TestSoundApplied(
    "TestSoundManaShield_10193",
    testCategory,
    10193
  )
end

function me.TestSoundDownManaShield_10193()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownManaShield_10193",
    testCategory,
    10193
  )
end

function me.TestSoundRefreshManaShield_10193()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshManaShield_10193",
    testCategory,
    10193
  )
end

function me.TestSoundManaShield_1463()
  mod.testHelper.TestSoundApplied(
    "TestSoundManaShield_1463",
    testCategory,
    1463
  )
end

function me.TestSoundDownManaShield_1463()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownManaShield_1463",
    testCategory,
    1463
  )
end

function me.TestSoundRefreshManaShield_1463()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshManaShield_1463",
    testCategory,
    1463
  )
end

function me.TestSoundManaShield_8494()
  mod.testHelper.TestSoundApplied(
    "TestSoundManaShield_8494",
    testCategory,
    8494
  )
end

function me.TestSoundDownManaShield_8494()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownManaShield_8494",
    testCategory,
    8494
  )
end

function me.TestSoundRefreshManaShield_8494()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshManaShield_8494",
    testCategory,
    8494
  )
end

function me.TestSoundManaShield_8495()
  mod.testHelper.TestSoundApplied(
    "TestSoundManaShield_8495",
    testCategory,
    8495
  )
end

function me.TestSoundDownManaShield_8495()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownManaShield_8495",
    testCategory,
    8495
  )
end

function me.TestSoundRefreshManaShield_8495()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshManaShield_8495",
    testCategory,
    8495
  )
end

function me.TestSoundManaShield_10191()
  mod.testHelper.TestSoundApplied(
    "TestSoundManaShield_10191",
    testCategory,
    10191
  )
end

function me.TestSoundDownManaShield_10191()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownManaShield_10191",
    testCategory,
    10191
  )
end

function me.TestSoundRefreshManaShield_10191()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshManaShield_10191",
    testCategory,
    10191
  )
end

function me.TestSoundManaShield_10192()
  mod.testHelper.TestSoundApplied(
    "TestSoundManaShield_10192",
    testCategory,
    10192
  )
end

function me.TestSoundDownManaShield_10192()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownManaShield_10192",
    testCategory,
    10192
  )
end

function me.TestSoundRefreshManaShield_10192()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshManaShield_10192",
    testCategory,
    10192
  )
end

function me.TestSoundIceBarrier_13033()
  mod.testHelper.TestSoundApplied(
    "TestSoundIceBarrier_13033",
    testCategory,
    13033
  )
end

function me.TestSoundDownIceBarrier_13033()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownIceBarrier_13033",
    testCategory,
    13033
  )
end

function me.TestSoundRefreshIceBarrier_13033()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshIceBarrier_13033",
    testCategory,
    13033
  )
end

function me.TestSoundIceBarrier_11426()
  mod.testHelper.TestSoundApplied(
    "TestSoundIceBarrier_11426",
    testCategory,
    11426
  )
end

function me.TestSoundDownIceBarrier_11426()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownIceBarrier_11426",
    testCategory,
    11426
  )
end

function me.TestSoundRefreshIceBarrier_11426()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshIceBarrier_11426",
    testCategory,
    11426
  )
end

function me.TestSoundIceBarrier_13031()
  mod.testHelper.TestSoundApplied(
    "TestSoundIceBarrier_13031",
    testCategory,
    13031
  )
end

function me.TestSoundDownIceBarrier_13031()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownIceBarrier_13031",
    testCategory,
    13031
  )
end

function me.TestSoundRefreshIceBarrier_13031()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshIceBarrier_13031",
    testCategory,
    13031
  )
end

function me.TestSoundIceBarrier_13032()
  mod.testHelper.TestSoundApplied(
    "TestSoundIceBarrier_13032",
    testCategory,
    13032
  )
end

function me.TestSoundDownIceBarrier_13032()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownIceBarrier_13032",
    testCategory,
    13032
  )
end

function me.TestSoundRefreshIceBarrier_13032()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshIceBarrier_13032",
    testCategory,
    13032
  )
end

function me.TestSoundFrostNova_10230()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostNova_10230",
    testCategory,
    10230
  )
end

function me.TestSoundFrostNova_122()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostNova_122",
    testCategory,
    122
  )
end

function me.TestSoundFrostNova_865()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostNova_865",
    testCategory,
    865
  )
end

function me.TestSoundFrostNova_6131()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostNova_6131",
    testCategory,
    6131
  )
end

function me.TestSoundArcanePower_12042()
  mod.testHelper.TestSoundApplied(
    "TestSoundArcanePower_12042",
    testCategory,
    12042
  )
end

function me.TestSoundDownArcanePower_12042()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownArcanePower_12042",
    testCategory,
    12042
  )
end

function me.TestSoundEvocation_12051()
  mod.testHelper.TestSoundSuccess(
    "TestSoundEvocation_12051",
    testCategory,
    12051
  )
end

function me.TestSoundPresenceOfMind_12043()
  mod.testHelper.TestSoundApplied(
    "TestSoundPresenceOfMind_12043",
    testCategory,
    12043
  )
end

function me.TestSoundDownPresenceOfMind_12043()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownPresenceOfMind_12043",
    testCategory,
    12043
  )
end

function me.TestSoundCombustion_11129()
  mod.testHelper.TestSoundApplied(
    "TestSoundCombustion_11129",
    testCategory,
    11129
  )
end

function me.TestSoundDownCombustion_11129()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownCombustion_11129",
    testCategory,
    11129
  )
end

function me.TestSoundBlastWave_13021()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBlastWave_13021",
    testCategory,
    13021
  )
end

function me.TestSoundBlastWave_11113()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBlastWave_11113",
    testCategory,
    11113
  )
end

function me.TestSoundBlastWave_13018()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBlastWave_13018",
    testCategory,
    13018
  )
end

function me.TestSoundBlastWave_13019()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBlastWave_13019",
    testCategory,
    13019
  )
end

function me.TestSoundBlastWave_13020()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBlastWave_13020",
    testCategory,
    13020
  )
end

function me.TestSoundColdSnap_12472()
  mod.testHelper.TestSoundSuccess(
    "TestSoundColdSnap_12472",
    testCategory,
    12472
  )
end

function me.TestSoundFingersOfFrost_400647()
  mod.testHelper.TestSoundApplied(
    "TestSoundFingersOfFrost_400647",
    testCategory,
    400647
  )
end

function me.TestSoundDownFingersOfFrost_400647()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFingersOfFrost_400647",
    testCategory,
    400647
  )
end

function me.TestSoundIcyVeins_425121()
  mod.testHelper.TestSoundApplied(
    "TestSoundIcyVeins_425121",
    testCategory,
    425121
  )
end

function me.TestSoundDownIcyVeins_425121()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownIcyVeins_425121",
    testCategory,
    425121
  )
end

function me.TestSoundArcaneSurge_425124()
  mod.testHelper.TestSoundSuccess(
    "TestSoundArcaneSurge_425124",
    testCategory,
    425124
  )
end

function me.TestSoundLivingBomb_400613()
  mod.testHelper.TestSoundSuccess(
    "TestSoundLivingBomb_400613",
    testCategory,
    400613
  )
end

function me.TestSoundChronostaticPreservation_436516()
  mod.testHelper.TestSoundApplied(
    "TestSoundChronostaticPreservation_436516",
    testCategory,
    436516
  )
end

function me.TestSoundDownChronostaticPreservation_436516()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownChronostaticPreservation_436516",
    testCategory,
    436516
  )
end

function me.TestSoundLivingFlame_401556()
  mod.testHelper.TestSoundSuccess(
    "TestSoundLivingFlame_401556",
    testCategory,
    401556
  )
end

function me.TestSoundIceLance_400640()
  mod.testHelper.TestSoundSuccess(
    "TestSoundIceLance_400640",
    testCategory,
    400640
  )
end

function me.TestSoundDeepFreeze_428739()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDeepFreeze_428739",
    testCategory,
    428739
  )
end

function me.TestSoundFrostfireBolt_401502()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostfireBolt_401502",
    testCategory,
    401502
  )
end

function me.TestSoundSpellfrostBolt_412532()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSpellfrostBolt_412532",
    testCategory,
    412532
  )
end

function me.TestSoundBalefireBolt_428878()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBalefireBolt_428878",
    testCategory,
    428878
  )
end

function me.TestSoundHotStreak_400624()
  mod.testHelper.TestSoundApplied(
    "TestSoundHotStreak_400624",
    testCategory,
    400624
  )
end

function me.TestSoundDownHotStreak_400624()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownHotStreak_400624",
    testCategory,
    400624
  )
end

function me.TestSoundBrainFreeze_400731()
  mod.testHelper.TestSoundApplied(
    "TestSoundBrainFreeze_400731",
    testCategory,
    400731
  )
end

function me.TestSoundDownBrainFreeze_400731()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBrainFreeze_400731",
    testCategory,
    400731
  )
end

function me.TestSoundFrozenOrb_440802()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrozenOrb_440802",
    testCategory,
    440802
  )
end
