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
mod.testSoundPriest = me

me.tag = "TestSoundPriest"

local testGroupName = "SoundPriest"
local testCategory = "priest"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowform_15473)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowform_15473)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPsychicScream_10890)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPsychicScream_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPsychicScream_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPsychicScream_10888)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSilence_15487)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPowerInfusion_10060)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownPowerInfusion_10060)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshPowerInfusion_10060)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInnerFire_10952)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInnerFire_10952)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshInnerFire_10952)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInnerFire_588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInnerFire_588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshInnerFire_588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInnerFire_7128)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInnerFire_7128)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshInnerFire_7128)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInnerFire_602)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInnerFire_602)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshInnerFire_602)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInnerFire_1006)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInnerFire_1006)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshInnerFire_1006)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInnerFire_10951)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInnerFire_10951)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshInnerFire_10951)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVampiricEmbrace_15286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshVampiricEmbrace_15286)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevouringPlague_19280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevouringPlague_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevouringPlague_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevouringPlague_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevouringPlague_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevouringPlague_19279)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTouchOfWeakness_19266)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTouchOfWeakness_19266)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshTouchOfWeakness_19266)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTouchOfWeakness_2652)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTouchOfWeakness_2652)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshTouchOfWeakness_2652)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTouchOfWeakness_19261)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTouchOfWeakness_19261)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshTouchOfWeakness_19261)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTouchOfWeakness_19262)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTouchOfWeakness_19262)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshTouchOfWeakness_19262)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTouchOfWeakness_19264)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTouchOfWeakness_19264)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshTouchOfWeakness_19264)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTouchOfWeakness_19265)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTouchOfWeakness_19265)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshTouchOfWeakness_19265)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFearWard_6346)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFearWard_6346)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshFearWard_6346)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDesperatePrayer_19243)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDesperatePrayer_13908)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDesperatePrayer_19238)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDesperatePrayer_19240)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDesperatePrayer_19241)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDesperatePrayer_19242)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHexOfWeakness_9035)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHexOfWeakness_19281)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHexOfWeakness_19282)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHexOfWeakness_19283)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHexOfWeakness_19284)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHexOfWeakness_19285)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowguard_18137)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowguard_18137)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshShadowguard_18137)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowguard_19308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowguard_19308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshShadowguard_19308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowguard_19309)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowguard_19309)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshShadowguard_19309)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowguard_19310)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowguard_19310)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshShadowguard_19310)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowguard_19311)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowguard_19311)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshShadowguard_19311)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowguard_19312)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowguard_19312)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshShadowguard_19312)

  -- start runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPenance_402174)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCircleOfHealing_401946)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowWordDeath_401955)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHomunculi_402799)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDispersion_425294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDispersion_425294)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPainSuppression_402004)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownPainSuppression_402004)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowfiend_401977)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPrayerOfMending_401859)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVoidPlague_425204)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMindSpike_431655)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEyeOfTheVoid_402789)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVoidZone_431681)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVampiricTouch_402668)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSpiritOfTheRedeemer_425284)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSpiritOfTheRedeemer_425284)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSurgeOfLight_431664)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSurgeOfLight_431664)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSerendipity_413248)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSerendipity_413248)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshSerendipity_413248)
end

function me.TestSoundShadowform_15473()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowform_15473",
    testCategory,
    15473
  )
end

function me.TestSoundDownShadowform_15473()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowform_15473",
    testCategory,
    15473
  )
end

function me.TestSoundPsychicScream_10890()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPsychicScream_10890",
    testCategory,
    10890
  )
end

function me.TestSoundPsychicScream_8122()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPsychicScream_8122",
    testCategory,
    8122
  )
end

function me.TestSoundPsychicScream_8124()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPsychicScream_8124",
    testCategory,
    8124
  )
end

function me.TestSoundPsychicScream_10888()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPsychicScream_10888",
    testCategory,
    10888
  )
end

function me.TestSoundSilence_15487()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSilence_15487",
    testCategory,
    15487
  )
end

function me.TestSoundPowerInfusion_10060()
  mod.testHelper.TestSoundApplied(
    "TestSoundPowerInfusion_10060",
    testCategory,
    10060
  )
end

function me.TestSoundDownPowerInfusion_10060()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownPowerInfusion_10060",
    testCategory,
    10060
  )
end

function me.TestSoundRefreshPowerInfusion_10060()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshPowerInfusion_10060",
    testCategory,
    10060
  )
end

function me.TestSoundInnerFire_10952()
  mod.testHelper.TestSoundApplied(
    "TestSoundInnerFire_10952",
    testCategory,
    10952
  )
end

function me.TestSoundDownInnerFire_10952()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownInnerFire_10952",
    testCategory,
    10952
  )
end

function me.TestSoundRefreshInnerFire_10952()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshInnerFire_10952",
    testCategory,
    10952
  )
end

function me.TestSoundInnerFire_588()
  mod.testHelper.TestSoundApplied(
    "TestSoundInnerFire_588",
    testCategory,
    588
  )
end

function me.TestSoundDownInnerFire_588()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownInnerFire_588",
    testCategory,
    588
  )
end

function me.TestSoundRefreshInnerFire_588()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshInnerFire_588",
    testCategory,
    588
  )
end

function me.TestSoundInnerFire_7128()
  mod.testHelper.TestSoundApplied(
    "TestSoundInnerFire_7128",
    testCategory,
    7128
  )
end

function me.TestSoundDownInnerFire_7128()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownInnerFire_7128",
    testCategory,
    7128
  )
end

function me.TestSoundRefreshInnerFire_7128()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshInnerFire_7128",
    testCategory,
    7128
  )
end

function me.TestSoundInnerFire_602()
  mod.testHelper.TestSoundApplied(
    "TestSoundInnerFire_602",
    testCategory,
    602
  )
end

function me.TestSoundDownInnerFire_602()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownInnerFire_602",
    testCategory,
    602
  )
end

function me.TestSoundRefreshInnerFire_602()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshInnerFire_602",
    testCategory,
    602
  )
end

function me.TestSoundInnerFire_1006()
  mod.testHelper.TestSoundApplied(
    "TestSoundInnerFire_1006",
    testCategory,
    1006
  )
end

function me.TestSoundDownInnerFire_1006()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownInnerFire_1006",
    testCategory,
    1006
  )
end

function me.TestSoundRefreshInnerFire_1006()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshInnerFire_1006",
    testCategory,
    1006
  )
end

function me.TestSoundInnerFire_10951()
  mod.testHelper.TestSoundApplied(
    "TestSoundInnerFire_10951",
    testCategory,
    10951
  )
end

function me.TestSoundDownInnerFire_10951()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownInnerFire_10951",
    testCategory,
    10951
  )
end

function me.TestSoundRefreshInnerFire_10951()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshInnerFire_10951",
    testCategory,
    10951
  )
end

function me.TestSoundVampiricEmbrace_15286()
  mod.testHelper.TestSoundApplied(
    "TestSoundVampiricEmbrace_15286",
    testCategory,
    15286
  )
end

function me.TestSoundRefreshVampiricEmbrace_15286()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshVampiricEmbrace_15286",
    testCategory,
    15286
  )
end

function me.TestSoundDevouringPlague_19280()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDevouringPlague_19280",
    testCategory,
    19280
  )
end

function me.TestSoundDevouringPlague_2944()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDevouringPlague_2944",
    testCategory,
    2944
  )
end

function me.TestSoundDevouringPlague_19276()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDevouringPlague_19276",
    testCategory,
    19276
  )
end

function me.TestSoundDevouringPlague_19277()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDevouringPlague_19277",
    testCategory,
    19277
  )
end

function me.TestSoundDevouringPlague_19278()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDevouringPlague_19278",
    testCategory,
    19278
  )
end

function me.TestSoundDevouringPlague_19279()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDevouringPlague_19279",
    testCategory,
    19279
  )
end

function me.TestSoundTouchOfWeakness_19266()
  mod.testHelper.TestSoundApplied(
    "TestSoundTouchOfWeakness_19266",
    testCategory,
    19266
  )
end

function me.TestSoundDownTouchOfWeakness_19266()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownTouchOfWeakness_19266",
    testCategory,
    19266
  )
end

function me.TestSoundRefreshTouchOfWeakness_19266()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshTouchOfWeakness_19266",
    testCategory,
    19266
  )
end

function me.TestSoundTouchOfWeakness_2652()
  mod.testHelper.TestSoundApplied(
    "TestSoundTouchOfWeakness_2652",
    testCategory,
    2652
  )
end

function me.TestSoundDownTouchOfWeakness_2652()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownTouchOfWeakness_2652",
    testCategory,
    2652
  )
end

function me.TestSoundRefreshTouchOfWeakness_2652()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshTouchOfWeakness_2652",
    testCategory,
    2652
  )
end

function me.TestSoundTouchOfWeakness_19261()
  mod.testHelper.TestSoundApplied(
    "TestSoundTouchOfWeakness_19261",
    testCategory,
    19261
  )
end

function me.TestSoundDownTouchOfWeakness_19261()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownTouchOfWeakness_19261",
    testCategory,
    19261
  )
end

function me.TestSoundRefreshTouchOfWeakness_19261()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshTouchOfWeakness_19261",
    testCategory,
    19261
  )
end

function me.TestSoundTouchOfWeakness_19262()
  mod.testHelper.TestSoundApplied(
    "TestSoundTouchOfWeakness_19262",
    testCategory,
    19262
  )
end

function me.TestSoundDownTouchOfWeakness_19262()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownTouchOfWeakness_19262",
    testCategory,
    19262
  )
end

function me.TestSoundRefreshTouchOfWeakness_19262()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshTouchOfWeakness_19262",
    testCategory,
    19262
  )
end

function me.TestSoundTouchOfWeakness_19264()
  mod.testHelper.TestSoundApplied(
    "TestSoundTouchOfWeakness_19264",
    testCategory,
    19264
  )
end

function me.TestSoundDownTouchOfWeakness_19264()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownTouchOfWeakness_19264",
    testCategory,
    19264
  )
end

function me.TestSoundRefreshTouchOfWeakness_19264()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshTouchOfWeakness_19264",
    testCategory,
    19264
  )
end

function me.TestSoundTouchOfWeakness_19265()
  mod.testHelper.TestSoundApplied(
    "TestSoundTouchOfWeakness_19265",
    testCategory,
    19265
  )
end

function me.TestSoundDownTouchOfWeakness_19265()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownTouchOfWeakness_19265",
    testCategory,
    19265
  )
end

function me.TestSoundRefreshTouchOfWeakness_19265()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshTouchOfWeakness_19265",
    testCategory,
    19265
  )
end

function me.TestSoundFearWard_6346()
  mod.testHelper.TestSoundApplied(
    "TestSoundFearWard_6346",
    testCategory,
    6346
  )
end

function me.TestSoundDownFearWard_6346()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFearWard_6346",
    testCategory,
    6346
  )
end

function me.TestSoundRefreshFearWard_6346()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshFearWard_6346",
    testCategory,
    6346
  )
end

function me.TestSoundDesperatePrayer_19243()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDesperatePrayer_19243",
    testCategory,
    19243
  )
end

function me.TestSoundDesperatePrayer_13908()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDesperatePrayer_13908",
    testCategory,
    13908
  )
end

function me.TestSoundDesperatePrayer_19238()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDesperatePrayer_19238",
    testCategory,
    19238
  )
end

function me.TestSoundDesperatePrayer_19240()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDesperatePrayer_19240",
    testCategory,
    19240
  )
end

function me.TestSoundDesperatePrayer_19241()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDesperatePrayer_19241",
    testCategory,
    19241
  )
end

function me.TestSoundDesperatePrayer_19242()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDesperatePrayer_19242",
    testCategory,
    19242
  )
end

function me.TestSoundHexOfWeakness_9035()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHexOfWeakness_9035",
    testCategory,
    9035
  )
end

function me.TestSoundHexOfWeakness_19281()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHexOfWeakness_19281",
    testCategory,
    19281
  )
end

function me.TestSoundHexOfWeakness_19282()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHexOfWeakness_19282",
    testCategory,
    19282
  )
end

function me.TestSoundHexOfWeakness_19283()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHexOfWeakness_19283",
    testCategory,
    19283
  )
end

function me.TestSoundHexOfWeakness_19284()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHexOfWeakness_19284",
    testCategory,
    19284
  )
end

function me.TestSoundHexOfWeakness_19285()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHexOfWeakness_19285",
    testCategory,
    19285
  )
end

function me.TestSoundShadowguard_18137()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowguard_18137",
    testCategory,
    18137
  )
end

function me.TestSoundDownShadowguard_18137()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowguard_18137",
    testCategory,
    18137
  )
end

function me.TestSoundRefreshShadowguard_18137()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshShadowguard_18137",
    testCategory,
    18137
  )
end

function me.TestSoundShadowguard_19308()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowguard_19308",
    testCategory,
    19308
  )
end

function me.TestSoundDownShadowguard_19308()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowguard_19308",
    testCategory,
    19308
  )
end

function me.TestSoundRefreshShadowguard_19308()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshShadowguard_19308",
    testCategory,
    19308
  )
end

function me.TestSoundShadowguard_19309()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowguard_19309",
    testCategory,
    19309
  )
end

function me.TestSoundDownShadowguard_19309()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowguard_19309",
    testCategory,
    19309
  )
end

function me.TestSoundRefreshShadowguard_19309()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshShadowguard_19309",
    testCategory,
    19309
  )
end

function me.TestSoundShadowguard_19310()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowguard_19310",
    testCategory,
    19310
  )
end

function me.TestSoundDownShadowguard_19310()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowguard_19310",
    testCategory,
    19310
  )
end

function me.TestSoundRefreshShadowguard_19310()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshShadowguard_19310",
    testCategory,
    19310
  )
end

function me.TestSoundShadowguard_19311()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowguard_19311",
    testCategory,
    19311
  )
end

function me.TestSoundDownShadowguard_19311()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowguard_19311",
    testCategory,
    19311
  )
end

function me.TestSoundRefreshShadowguard_19311()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshShadowguard_19311",
    testCategory,
    19311
  )
end

function me.TestSoundShadowguard_19312()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowguard_19312",
    testCategory,
    19312
  )
end

function me.TestSoundDownShadowguard_19312()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowguard_19312",
    testCategory,
    19312
  )
end

function me.TestSoundRefreshShadowguard_19312()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshShadowguard_19312",
    testCategory,
    19312
  )
end

function me.TestSoundPenance_402174()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPenance_402174",
    testCategory,
    402174
  )
end

function me.TestSoundCircleOfHealing_401946()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCircleOfHealing_401946",
    testCategory,
    401946
  )
end


function me.TestSoundShadowWordDeath_401955()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowWordDeath_401955",
    testCategory,
    401955
  )
end

function me.TestSoundHomunculi_402799()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHomunculi_402799",
    testCategory,
    402799
  )
end

function me.TestSoundDispersion_425294()
  mod.testHelper.TestSoundApplied(
    "TestSoundDispersion_425294",
    testCategory,
    425294
  )
end

function me.TestSoundDownDispersion_425294()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDispersion_425294",
    testCategory,
    425294
  )
end

function me.TestSoundPainSuppression_402004()
  mod.testHelper.TestSoundApplied(
    "TestSoundPainSuppression_402004",
    testCategory,
    402004
  )
end

function me.TestSoundDownPainSuppression_402004()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownPainSuppression_402004",
    testCategory,
    402004
  )
end

function me.TestSoundShadowfiend_401977()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowfiend_401977",
    testCategory,
    401977
  )
end

function me.TestSoundPrayerOfMending_401859()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPrayerOfMending_401859",
    testCategory,
    401859
  )
end

function me.TestSoundVoidPlague_425204()
  mod.testHelper.TestSoundSuccess(
    "TestSoundVoidPlague_425204",
    testCategory,
    425204
  )
end

function me.TestSoundMindSpike_431655()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMindSpike_431655",
    testCategory,
    431655
  )
end

function me.TestSoundEyeOfTheVoid_402789()
  mod.testHelper.TestSoundSuccess(
    "TestSoundEyeOfTheVoid_402789",
    testCategory,
    402789
  )
end

function me.TestSoundVoidZone_431681()
  mod.testHelper.TestSoundSuccess(
    "TestSoundVoidZone_431681",
    testCategory,
    431681
  )
end

function me.TestSoundVampiricTouch_402668()
  mod.testHelper.TestSoundSuccess(
    "TestSoundVampiricTouch_402668",
    testCategory,
    402668
  )
end

function me.TestSoundSpiritOfTheRedeemer_425284()
  mod.testHelper.TestSoundApplied(
    "TestSoundSpiritOfTheRedeemer_425284",
    testCategory,
    425284
  )
end

function me.TestSoundDownSpiritOfTheRedeemer_425284()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSpiritOfTheRedeemer_425284",
    testCategory,
    425284
  )
end

function me.TestSoundSurgeOfLight_431664()
  mod.testHelper.TestSoundApplied(
    "TestSoundSurgeOfLight_431664",
    testCategory,
    431664
  )
end

function me.TestSoundDownSurgeOfLight_431664()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSurgeOfLight_431664",
    testCategory,
    431664
  )
end

function me.TestSoundSerendipity_413248()
  mod.testHelper.TestSoundApplied(
    "TestSoundSerendipity_413248",
    testCategory,
    413248
  )
end

function me.TestSoundDownSerendipity_413248()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSerendipity_413248",
    testCategory,
    413248
  )
end

function me.TestSoundRefreshSerendipity_413248()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshSerendipity_413248",
    testCategory,
    413248
  )
end
