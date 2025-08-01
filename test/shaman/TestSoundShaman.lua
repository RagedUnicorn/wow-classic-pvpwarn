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
mod.testSoundShaman = me

me.tag = "TestSoundShaman"

local testGroupName = "SoundShaman"
local testCategory = "shaman"

function me.Test()
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound shaman")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundElementalMastery_16166)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownElementalMastery_16166)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNaturesSwiftness_16188)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNaturesSwiftness_16188)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTremorTotem_8143)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPoisonCleansingTotem_8166)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGroundingTotem_8177)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireResistanceTotem_8184)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireResistanceTotem_10537)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireResistanceTotem_10538)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostResistanceTotem_8181)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostResistanceTotem_10478)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostResistanceTotem_10479)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNatureResistanceTotem_10595)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNatureResistanceTotem_10600)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNatureResistanceTotem_10601)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFlametongueTotem_8227)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFlametongueTotem_8249)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFlametongueTotem_10526)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFlametongueTotem_16387)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGraceOfAirTotem_8835)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGraceOfAirTotem_10627)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGraceOfAirTotem_25359)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneskinTotem_8071)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneskinTotem_8154)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneskinTotem_8155)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneskinTotem_10406)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneskinTotem_10407)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneskinTotem_10408)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStrengthOfEarthTotem_8075)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStrengthOfEarthTotem_8160)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStrengthOfEarthTotem_8161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStrengthOfEarthTotem_10442)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStrengthOfEarthTotem_25361)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWindfuryTotem_8512)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWindfuryTotem_10613)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWindfuryTotem_10614)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWindwallTotem_15107)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWindwallTotem_15111)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWindwallTotem_15112)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEarthbindTotem_2484)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireNovaTotem_1535)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireNovaTotem_8498)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireNovaTotem_8499)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireNovaTotem_11314)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireNovaTotem_11315)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMagmaTotem_8190)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMagmaTotem_10585)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMagmaTotem_10586)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMagmaTotem_10587)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSearingTotem_3599)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSearingTotem_6363)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSearingTotem_6364)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSearingTotem_6365)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSearingTotem_10437)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSearingTotem_10438)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneclawTotem_5730)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneclawTotem_6390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneclawTotem_6391)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneclawTotem_6392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneclawTotem_10427)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneclawTotem_10428)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHealingStreamTotem_5394)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHealingStreamTotem_6375)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHealingStreamTotem_6377)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHealingStreamTotem_10462)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHealingStreamTotem_10463)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDiseaseCleansingTotem_8170)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaSpringTotem_10497)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaSpringTotem_5675)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaSpringTotem_10495)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaSpringTotem_10496)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaTideTotem_17359)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaTideTotem_16190)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaTideTotem_17354)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTranquilAirTotem_25908)

  -- start runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHealingRain_415236)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAncestralGuidance_409324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAncestralGuidance_409324)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEarthShield_408514)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEarthShield_408514)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWaterShield_408510)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownWaterShield_408510)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDecoyTotem_425874)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemicProjection_437009)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMaelstromWeapon_408498)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownMaelstromWeapon_408498)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTidalWaves_432042)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTidalWaves_432042)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRiptide_409954)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPowerSurge_415100)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownPowerSurge_415100)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFeralSpirit_440580)
end

function me.TestSoundElementalMastery_16166()
  mod.testHelper.TestSoundApplied(
    "TestSoundElementalMastery_16166",
    testCategory,
    16166
  )
end

function me.TestSoundDownElementalMastery_16166()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownElementalMastery_16166",
    testCategory,
    16166
  )
end

function me.TestSoundNaturesSwiftness_16188()
  mod.testHelper.TestSoundApplied(
    "TestSoundNaturesSwiftness_16188",
    testCategory,
    16188
  )
end

function me.TestSoundDownNaturesSwiftness_16188()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownNaturesSwiftness_16188",
    testCategory,
    16188
  )
end

function me.TestSoundTremorTotem_8143()
  mod.testHelper.TestSoundSuccess(
    "TestSoundTremorTotem_8143",
    testCategory,
    8143
  )
end

function me.TestSoundPoisonCleansingTotem_8166()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPoisonCleansingTotem_8166",
    testCategory,
    8166
  )
end

function me.TestSoundGroundingTotem_8177()
  mod.testHelper.TestSoundSuccess(
    "TestSoundGroundingTotem_8177",
    testCategory,
    8177
  )
end

function me.TestSoundFireResistanceTotem_8184()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFireResistanceTotem_8184",
    testCategory,
    8184
  )
end

function me.TestSoundFireResistanceTotem_10537()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFireResistanceTotem_10537",
    testCategory,
    10537
  )
end

function me.TestSoundFireResistanceTotem_10538()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFireResistanceTotem_10538",
    testCategory,
    10538
  )
end

function me.TestSoundFrostResistanceTotem_8181()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostResistanceTotem_8181",
    testCategory,
    8181
  )
end

function me.TestSoundFrostResistanceTotem_10478()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostResistanceTotem_10478",
    testCategory,
    10478
  )
end

function me.TestSoundFrostResistanceTotem_10479()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostResistanceTotem_10479",
    testCategory,
    10479
  )
end

function me.TestSoundNatureResistanceTotem_10595()
  mod.testHelper.TestSoundSuccess(
    "TestSoundNatureResistanceTotem_10595",
    testCategory,
    10595
  )
end

function me.TestSoundNatureResistanceTotem_10600()
  mod.testHelper.TestSoundSuccess(
    "TestSoundNatureResistanceTotem_10600",
    testCategory,
    10600
  )
end

function me.TestSoundNatureResistanceTotem_10601()
  mod.testHelper.TestSoundSuccess(
    "TestSoundNatureResistanceTotem_10601",
    testCategory,
    10601
  )
end

function me.TestSoundFlametongueTotem_8227()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFlametongueTotem_8227",
    testCategory,
    8227
  )
end

function me.TestSoundFlametongueTotem_8249()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFlametongueTotem_8249",
    testCategory,
    8249
  )
end

function me.TestSoundFlametongueTotem_10526()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFlametongueTotem_10526",
    testCategory,
    10526
  )
end

function me.TestSoundFlametongueTotem_16387()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFlametongueTotem_16387",
    testCategory,
    16387
  )
end

function me.TestSoundGraceOfAirTotem_8835()
  mod.testHelper.TestSoundSuccess(
    "TestSoundGraceOfAirTotem_8835",
    testCategory,
    8835
  )
end

function me.TestSoundGraceOfAirTotem_10627()
  mod.testHelper.TestSoundSuccess(
    "TestSoundGraceOfAirTotem_10627",
    testCategory,
    10627
  )
end

function me.TestSoundGraceOfAirTotem_25359()
  mod.testHelper.TestSoundSuccess(
    "TestSoundGraceOfAirTotem_25359",
    testCategory,
    25359
  )
end

function me.TestSoundStoneskinTotem_8071()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStoneskinTotem_8071",
    testCategory,
    8071
  )
end

function me.TestSoundStoneskinTotem_8154()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStoneskinTotem_8154",
    testCategory,
    8154
  )
end

function me.TestSoundStoneskinTotem_8155()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStoneskinTotem_8155",
    testCategory,
    8155
  )
end

function me.TestSoundStoneskinTotem_10406()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStoneskinTotem_10406",
    testCategory,
    10406
  )
end

function me.TestSoundStoneskinTotem_10407()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStoneskinTotem_10407",
    testCategory,
    10407
  )
end

function me.TestSoundStoneskinTotem_10408()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStoneskinTotem_10408",
    testCategory,
    10408
  )
end

function me.TestSoundStrengthOfEarthTotem_8075()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStrengthOfEarthTotem_8075",
    testCategory,
    8075
  )
end

function me.TestSoundStrengthOfEarthTotem_8160()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStrengthOfEarthTotem_8160",
    testCategory,
    8160
  )
end

function me.TestSoundStrengthOfEarthTotem_8161()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStrengthOfEarthTotem_8161",
    testCategory,
    8161
  )
end

function me.TestSoundStrengthOfEarthTotem_10442()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStrengthOfEarthTotem_10442",
    testCategory,
    10442
  )
end

function me.TestSoundStrengthOfEarthTotem_25361()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStrengthOfEarthTotem_25361",
    testCategory,
    25361
  )
end

function me.TestSoundWindfuryTotem_8512()
  mod.testHelper.TestSoundSuccess(
    "TestSoundWindfuryTotem_8512",
    testCategory,
    8512
  )
end

function me.TestSoundWindfuryTotem_10613()
  mod.testHelper.TestSoundSuccess(
    "TestSoundWindfuryTotem_10613",
    testCategory,
    10613
  )
end

function me.TestSoundWindfuryTotem_10614()
  mod.testHelper.TestSoundSuccess(
    "TestSoundWindfuryTotem_10614",
    testCategory,
    10614
  )
end

function me.TestSoundWindwallTotem_15107()
  mod.testHelper.TestSoundSuccess(
    "TestSoundWindwallTotem_15107",
    testCategory,
    15107
  )
end

function me.TestSoundWindwallTotem_15111()
  mod.testHelper.TestSoundSuccess(
    "TestSoundWindwallTotem_15111",
    testCategory,
    15111
  )
end

function me.TestSoundWindwallTotem_15112()
  mod.testHelper.TestSoundSuccess(
    "TestSoundWindwallTotem_15112",
    testCategory,
    15112
  )
end

function me.TestSoundEarthbindTotem_2484()
  mod.testHelper.TestSoundSuccess(
    "TestSoundEarthbindTotem_2484",
    testCategory,
    2484
  )
end

function me.TestSoundFireNovaTotem_1535()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFireNovaTotem_1535",
    testCategory,
    1535
  )
end

function me.TestSoundFireNovaTotem_8498()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFireNovaTotem_8498",
    testCategory,
    8498
  )
end

function me.TestSoundFireNovaTotem_8499()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFireNovaTotem_8499",
    testCategory,
    8499
  )
end

function me.TestSoundFireNovaTotem_11314()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFireNovaTotem_11314",
    testCategory,
    11314
  )
end

function me.TestSoundFireNovaTotem_11315()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFireNovaTotem_11315",
    testCategory,
    11315
  )
end

function me.TestSoundMagmaTotem_8190()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMagmaTotem_8190",
    testCategory,
    8190
  )
end

function me.TestSoundMagmaTotem_10585()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMagmaTotem_10585",
    testCategory,
    10585
  )
end

function me.TestSoundMagmaTotem_10586()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMagmaTotem_10586",
    testCategory,
    10586
  )
end

function me.TestSoundMagmaTotem_10587()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMagmaTotem_10587",
    testCategory,
    10587
  )
end

function me.TestSoundSearingTotem_3599()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSearingTotem_3599",
    testCategory,
    3599
  )
end

function me.TestSoundSearingTotem_6363()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSearingTotem_6363",
    testCategory,
    6363
  )
end

function me.TestSoundSearingTotem_6364()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSearingTotem_6364",
    testCategory,
    6364
  )
end

function me.TestSoundSearingTotem_6365()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSearingTotem_6365",
    testCategory,
    6365
  )
end

function me.TestSoundSearingTotem_10437()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSearingTotem_10437",
    testCategory,
    10437
  )
end

function me.TestSoundSearingTotem_10438()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSearingTotem_10438",
    testCategory,
    10438
  )
end

function me.TestSoundStoneclawTotem_5730()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStoneclawTotem_5730",
    testCategory,
    5730
  )
end

function me.TestSoundStoneclawTotem_6390()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStoneclawTotem_6390",
    testCategory,
    6390
  )
end

function me.TestSoundStoneclawTotem_6391()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStoneclawTotem_6391",
    testCategory,
    6391
  )
end

function me.TestSoundStoneclawTotem_6392()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStoneclawTotem_6392",
    testCategory,
    6392
  )
end

function me.TestSoundStoneclawTotem_10427()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStoneclawTotem_10427",
    testCategory,
    10427
  )
end

function me.TestSoundStoneclawTotem_10428()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStoneclawTotem_10428",
    testCategory,
    10428
  )
end

function me.TestSoundHealingStreamTotem_5394()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHealingStreamTotem_5394",
    testCategory,
    5394
  )
end

function me.TestSoundHealingStreamTotem_6375()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHealingStreamTotem_6375",
    testCategory,
    6375
  )
end

function me.TestSoundHealingStreamTotem_6377()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHealingStreamTotem_6377",
    testCategory,
    6377
  )
end

function me.TestSoundHealingStreamTotem_10462()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHealingStreamTotem_10462",
    testCategory,
    10462
  )
end

function me.TestSoundHealingStreamTotem_10463()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHealingStreamTotem_10463",
    testCategory,
    10463
  )
end

function me.TestSoundDiseaseCleansingTotem_8170()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDiseaseCleansingTotem_8170",
    testCategory,
    8170
  )
end

function me.TestSoundManaSpringTotem_10497()
  mod.testHelper.TestSoundSuccess(
    "TestSoundManaSpringTotem_10497",
    testCategory,
    10497
  )
end

function me.TestSoundManaSpringTotem_5675()
  mod.testHelper.TestSoundSuccess(
    "TestSoundManaSpringTotem_5675",
    testCategory,
    5675
  )
end

function me.TestSoundManaSpringTotem_10495()
  mod.testHelper.TestSoundSuccess(
    "TestSoundManaSpringTotem_10495",
    testCategory,
    10495
  )
end

function me.TestSoundManaSpringTotem_10496()
  mod.testHelper.TestSoundSuccess(
    "TestSoundManaSpringTotem_10496",
    testCategory,
    10496
  )
end

function me.TestSoundManaTideTotem_17359()
  mod.testHelper.TestSoundSuccess(
    "TestSoundManaTideTotem_17359",
    testCategory,
    17359
  )
end

function me.TestSoundManaTideTotem_16190()
  mod.testHelper.TestSoundSuccess(
    "TestSoundManaTideTotem_16190",
    testCategory,
    16190
  )
end

function me.TestSoundManaTideTotem_17354()
  mod.testHelper.TestSoundSuccess(
    "TestSoundManaTideTotem_17354",
    testCategory,
    17354
  )
end

function me.TestSoundTranquilAirTotem_25908()
  mod.testHelper.TestSoundSuccess(
    "TestSoundTranquilAirTotem_25908",
    testCategory,
    25908
  )
end

function me.TestSoundHealingRain_415236()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHealingRain_415236",
    testCategory,
    415236
  )
end

function me.TestSoundAncestralGuidance_409324()
  mod.testHelper.TestSoundApplied(
    "TestSoundAncestralGuidance_409324",
    testCategory,
    409324
  )
end

function me.TestSoundDownAncestralGuidance_409324()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAncestralGuidance_409324",
    testCategory,
    409324
  )
end

function me.TestSoundEarthShield_408514()
  mod.testHelper.TestSoundApplied(
    "TestSoundEarthShield_408514",
    testCategory,
    408514
  )
end

function me.TestSoundDownEarthShield_408514()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEarthShield_408514",
    testCategory,
    408514
  )
end

function me.TestSoundWaterShield_408510()
  mod.testHelper.TestSoundApplied(
    "TestSoundWaterShield_408510",
    testCategory,
    408510
  )
end

function me.TestSoundDownWaterShield_408510()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownWaterShield_408510",
    testCategory,
    408510
  )
end

function me.TestSoundDecoyTotem_425874()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDecoyTotem_425874",
    testCategory,
    425874
  )
end

function me.TestSoundTotemicProjection_437009()
  mod.testHelper.TestSoundSuccess(
    "TestSoundTotemicProjection_437009",
    testCategory,
    437009
  )
end

function me.TestSoundMaelstromWeapon_408498()
  mod.testHelper.TestSoundApplied(
    "TestSoundMaelstromWeapon_408498",
    testCategory,
    408498
  )
end

function me.TestSoundDownMaelstromWeapon_408498()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownMaelstromWeapon_408498",
    testCategory,
    408498
  )
end

function me.TestSoundTidalWaves_432042()
  mod.testHelper.TestSoundApplied(
    "TestSoundTidalWaves_432042",
    testCategory,
    432042
  )
end

function me.TestSoundDownTidalWaves_432042()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownTidalWaves_432042",
    testCategory,
    432042
  )
end

function me.TestSoundRiptide_409954()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRiptide_409954",
    testCategory,
    409954
  )
end

function me.TestSoundPowerSurge_415100()
  mod.testHelper.TestSoundApplied(
    "TestSoundPowerSurge_415100",
    testCategory,
    415100
  )
end

function me.TestSoundDownPowerSurge_415100()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownPowerSurge_415100",
    testCategory,
    415100
  )
end

function me.TestSoundFeralSpirit_440580()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFeralSpirit_440580",
    testCategory,
    440580
  )
end
