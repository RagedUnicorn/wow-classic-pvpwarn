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
mod.testCombatEventsShaman = me

me.tag = "TestCombatEventsShaman"

local testCategory = "shaman"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testcombatevent shaman")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventElementalMasteryApplied_16166)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventElementalMasteryRemoved_16166)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventNaturesSwiftnessApplied_16188)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventNaturesSwiftnessRemoved_16188)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTremorTotemSuccess_8143)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPoisonCleansingTotemSuccess_8166)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGroundingTotemSuccess_8177)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFireResistanceTotemSuccess_10538)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFireResistanceTotemSuccess_8184)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFireResistanceTotemSuccess_10537)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFrostResistanceTotemSuccess_10479)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFrostResistanceTotemSuccess_8181)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFrostResistanceTotemSuccess_10478)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventNatureResistanceTotemSuccess_10601)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventNatureResistanceTotemSuccess_10595)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventNatureResistanceTotemSuccess_10600)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFlametongueTotemSuccess_16387)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFlametongueTotemSuccess_8227)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFlametongueTotemSuccess_8249)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFlametongueTotemSuccess_10526)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGraceOfAirTotemSuccess_25359)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGraceOfAirTotemSuccess_8835)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGraceOfAirTotemSuccess_10627)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStoneskinTotemSuccess_10408)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStoneskinTotemSuccess_8071)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStoneskinTotemSuccess_8154)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStoneskinTotemSuccess_8155)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStoneskinTotemSuccess_10406)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStoneskinTotemSuccess_10407)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStrengthOfEarthTotemSuccess_25361)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStrengthOfEarthTotemSuccess_8075)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStrengthOfEarthTotemSuccess_8160)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStrengthOfEarthTotemSuccess_8161)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStrengthOfEarthTotemSuccess_10442)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWindfuryTotemSuccess_10614)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWindfuryTotemSuccess_8512)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWindfuryTotemSuccess_10613)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWindwallTotemSuccess_15112)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWindwallTotemSuccess_15107)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWindwallTotemSuccess_15111)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEarthbindTotemSuccess_2484)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFireNovaTotemSuccess_11315)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFireNovaTotemSuccess_1535)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFireNovaTotemSuccess_8498)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFireNovaTotemSuccess_8499)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFireNovaTotemSuccess_11314)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMagmaTotemSuccess_10587)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMagmaTotemSuccess_8190)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMagmaTotemSuccess_10585)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMagmaTotemSuccess_10586)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSearingTotemSuccess_10438)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSearingTotemSuccess_3599)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSearingTotemSuccess_6363)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSearingTotemSuccess_6364)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSearingTotemSuccess_6365)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSearingTotemSuccess_10437)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStoneclawTotemSuccess_10428)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStoneclawTotemSuccess_5730)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStoneclawTotemSuccess_6390)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStoneclawTotemSuccess_6391)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStoneclawTotemSuccess_6392)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventStoneclawTotemSuccess_10427)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHealingStreamTotemSuccess_10463)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHealingStreamTotemSuccess_5394)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHealingStreamTotemSuccess_6375)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHealingStreamTotemSuccess_6377)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHealingStreamTotemSuccess_10462)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDiseaseCleansingTotemSuccess_8170)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventManaSpringTotemSuccess_10497)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventManaSpringTotemSuccess_5675)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventManaSpringTotemSuccess_10495)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventManaSpringTotemSuccess_10496)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventManaTideTotemSuccess_17359)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventManaTideTotemSuccess_16190)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventManaTideTotemSuccess_17354)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTranquilAirTotemSuccess_25908)

  -- start runes
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHealingRainSuccess_415236)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAncestralGuidanceApplied_409324)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAncestralGuidanceRemoved_409324)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEarthShieldApplied_408514)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEarthShieldRemoved_408514)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWaterShieldApplied_408510)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWaterShieldRemoved_408510)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDecoyTotemSuccess_425874)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTotemicProjectionSuccess_437009)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMaelstromWeaponApplied_408498)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMaelstromWeaponRemoved_408498)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTidalWavesApplied_432042)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTidalWavesRemoved_432042)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventRiptideSuccess_409954)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPowerSurgeApplied_415100)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPowerSurgeRemoved_415100)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFeralSpiritSuccess_440580)
end

function me.TestCombatEventElementalMasteryApplied_16166()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventElementalMasteryApplied_16166",
    testCategory,
    "Elemental Mastery",
    16166
  )
end

function me.TestCombatEventElementalMasteryRemoved_16166()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventElementalMasteryRemoved_16166",
    testCategory,
    "Elemental Mastery",
    16166
  )
end

function me.TestCombatEventNaturesSwiftnessApplied_16188()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventNaturesSwiftnessApplied_16188",
    testCategory,
    "Nature's Swiftness",
    16188
  )
end

function me.TestCombatEventNaturesSwiftnessRemoved_16188()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventNaturesSwiftnessRemoved_16188",
    testCategory,
    "Nature's Swiftness",
    16188
  )
end

function me.TestCombatEventTremorTotemSuccess_8143()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventTremorTotemSuccess_8143",
    testCategory,
    "Tremor Totem",
    8143
  )
end

function me.TestCombatEventPoisonCleansingTotemSuccess_8166()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPoisonCleansingTotemSuccess_8166",
    testCategory,
    "Poison Cleansing Totem",
    8166
  )
end

function me.TestCombatEventGroundingTotemSuccess_8177()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventGroundingTotemSuccess_8177",
    testCategory,
    "Grounding Totem",
    8177
  )
end

function me.TestCombatEventFireResistanceTotemSuccess_10538()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireResistanceTotemSuccess_10538",
    testCategory,
    "Fire Resistance Totem",
    10538
  )
end

function me.TestCombatEventFireResistanceTotemSuccess_8184()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireResistanceTotemSuccess_8184",
    testCategory,
    "Fire Resistance Totem",
    8184
  )
end

function me.TestCombatEventFireResistanceTotemSuccess_10537()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireResistanceTotemSuccess_10537",
    testCategory,
    "Fire Resistance Totem",
    10537
  )
end

function me.TestCombatEventFrostResistanceTotemSuccess_10479()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostResistanceTotemSuccess_10479",
    testCategory,
    "Frost Resistance Totem",
    10479
  )
end

function me.TestCombatEventFrostResistanceTotemSuccess_8181()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostResistanceTotemSuccess_8181",
    testCategory,
    "Frost Resistance Totem",
    8181
  )
end

function me.TestCombatEventFrostResistanceTotemSuccess_10478()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostResistanceTotemSuccess_10478",
    testCategory,
    "Frost Resistance Totem",
    10478
  )
end

function me.TestCombatEventNatureResistanceTotemSuccess_10601()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventNatureResistanceTotemSuccess_10601",
    testCategory,
    "Nature Resistance Totem",
    10601
  )
end

function me.TestCombatEventNatureResistanceTotemSuccess_10595()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventNatureResistanceTotemSuccess_10595",
    testCategory,
    "Nature Resistance Totem",
    10595
  )
end

function me.TestCombatEventNatureResistanceTotemSuccess_10600()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventNatureResistanceTotemSuccess_10600",
    testCategory,
    "Nature Resistance Totem",
    10600
  )
end

function me.TestCombatEventFlametongueTotemSuccess_16387()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFlametongueTotemSuccess_16387",
    testCategory,
    "Flametongue Totem",
    16387
  )
end

function me.TestCombatEventFlametongueTotemSuccess_8227()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFlametongueTotemSuccess_8227",
    testCategory,
    "Flametongue Totem",
    8227
  )
end

function me.TestCombatEventFlametongueTotemSuccess_8249()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFlametongueTotemSuccess_8249",
    testCategory,
    "Flametongue Totem",
    8249
  )
end

function me.TestCombatEventFlametongueTotemSuccess_10526()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFlametongueTotemSuccess_10526",
    testCategory,
    "Flametongue Totem",
    10526
  )
end

function me.TestCombatEventGraceOfAirTotemSuccess_25359()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventGraceOfAirTotemSuccess_25359",
    testCategory,
    "Grace of Air Totem",
    25359
  )
end

function me.TestCombatEventGraceOfAirTotemSuccess_8835()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventGraceOfAirTotemSuccess_8835",
    testCategory,
    "Grace of Air Totem",
    8835
  )
end

function me.TestCombatEventGraceOfAirTotemSuccess_10627()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventGraceOfAirTotemSuccess_10627",
    testCategory,
    "Grace of Air Totem",
    10627
  )
end

function me.TestCombatEventStoneskinTotemSuccess_10408()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStoneskinTotemSuccess_10408",
    testCategory,
    "Stoneskin Totem",
    10408
  )
end

function me.TestCombatEventStoneskinTotemSuccess_8071()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStoneskinTotemSuccess_8071",
    testCategory,
    "Stoneskin Totem",
    8071
  )
end

function me.TestCombatEventStoneskinTotemSuccess_8154()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStoneskinTotemSuccess_8154",
    testCategory,
    "Stoneskin Totem",
    8154
  )
end

function me.TestCombatEventStoneskinTotemSuccess_8155()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStoneskinTotemSuccess_8155",
    testCategory,
    "Stoneskin Totem",
    8155
  )
end

function me.TestCombatEventStoneskinTotemSuccess_10406()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStoneskinTotemSuccess_10406",
    testCategory,
    "Stoneskin Totem",
    10406
  )
end

function me.TestCombatEventStoneskinTotemSuccess_10407()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStoneskinTotemSuccess_10407",
    testCategory,
    "Stoneskin Totem",
    10407
  )
end

function me.TestCombatEventStrengthOfEarthTotemSuccess_25361()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStrengthOfEarthTotemSuccess_25361",
    testCategory,
    "Strength of Earth Totem",
    25361
  )
end

function me.TestCombatEventStrengthOfEarthTotemSuccess_8075()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStrengthOfEarthTotemSuccess_8075",
    testCategory,
    "Strength of Earth Totem",
    8075
  )
end

function me.TestCombatEventStrengthOfEarthTotemSuccess_8160()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStrengthOfEarthTotemSuccess_8160",
    testCategory,
    "Strength of Earth Totem",
    8160
  )
end

function me.TestCombatEventStrengthOfEarthTotemSuccess_8161()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStrengthOfEarthTotemSuccess_8161",
    testCategory,
    "Strength of Earth Totem",
    8161
  )
end

function me.TestCombatEventStrengthOfEarthTotemSuccess_10442()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStrengthOfEarthTotemSuccess_10442",
    testCategory,
    "Strength of Earth Totem",
    10442
  )
end

function me.TestCombatEventWindfuryTotemSuccess_10614()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventWindfuryTotemSuccess_10614",
    testCategory,
    "Windfury Totem",
    10614
  )
end

function me.TestCombatEventWindfuryTotemSuccess_8512()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventWindfuryTotemSuccess_8512",
    testCategory,
    "Windfury Totem",
    8512
  )
end

function me.TestCombatEventWindfuryTotemSuccess_10613()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventWindfuryTotemSuccess_10613",
    testCategory,
    "Windfury Totem",
    10613
  )
end

function me.TestCombatEventWindwallTotemSuccess_15112()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventWindwallTotemSuccess_15112",
    testCategory,
    "Windwall Totem",
    15112
  )
end

function me.TestCombatEventWindwallTotemSuccess_15107()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventWindwallTotemSuccess_15107",
    testCategory,
    "Windwall Totem",
    15107
  )
end

function me.TestCombatEventWindwallTotemSuccess_15111()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventWindwallTotemSuccess_15111",
    testCategory,
    "Windwall Totem",
    15111
  )
end

function me.TestCombatEventEarthbindTotemSuccess_2484()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventEarthbindTotemSuccess_2484",
    testCategory,
    "Earthbind Totem",
    2484
  )
end

function me.TestCombatEventFireNovaTotemSuccess_11315()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireNovaTotemSuccess_11315",
    testCategory,
    "Fire Nova Totem",
    11315
  )
end

function me.TestCombatEventFireNovaTotemSuccess_1535()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireNovaTotemSuccess_1535",
    testCategory,
    "Fire Nova Totem",
    1535
  )
end

function me.TestCombatEventFireNovaTotemSuccess_8498()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireNovaTotemSuccess_8498",
    testCategory,
    "Fire Nova Totem",
    8498
  )
end

function me.TestCombatEventFireNovaTotemSuccess_8499()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireNovaTotemSuccess_8499",
    testCategory,
    "Fire Nova Totem",
    8499
  )
end

function me.TestCombatEventFireNovaTotemSuccess_11314()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireNovaTotemSuccess_11314",
    testCategory,
    "Fire Nova Totem",
    11314
  )
end

function me.TestCombatEventMagmaTotemSuccess_10587()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMagmaTotemSuccess_10587",
    testCategory,
    "Magma Totem",
    10587
  )
end

function me.TestCombatEventMagmaTotemSuccess_8190()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMagmaTotemSuccess_8190",
    testCategory,
    "Magma Totem",
    8190
  )
end

function me.TestCombatEventMagmaTotemSuccess_10585()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMagmaTotemSuccess_10585",
    testCategory,
    "Magma Totem",
    10585
  )
end

function me.TestCombatEventMagmaTotemSuccess_10586()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMagmaTotemSuccess_10586",
    testCategory,
    "Magma Totem",
    10586
  )
end

function me.TestCombatEventSearingTotemSuccess_10438()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSearingTotemSuccess_10438",
    testCategory,
    "Searing Totem",
    10438
  )
end

function me.TestCombatEventSearingTotemSuccess_3599()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSearingTotemSuccess_3599",
    testCategory,
    "Searing Totem",
    3599
  )
end

function me.TestCombatEventSearingTotemSuccess_6363()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSearingTotemSuccess_6363",
    testCategory,
    "Searing Totem",
    6363
  )
end

function me.TestCombatEventSearingTotemSuccess_6364()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSearingTotemSuccess_6364",
    testCategory,
    "Searing Totem",
    6364
  )
end

function me.TestCombatEventSearingTotemSuccess_6365()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSearingTotemSuccess_6365",
    testCategory,
    "Searing Totem",
    6365
  )
end

function me.TestCombatEventSearingTotemSuccess_10437()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSearingTotemSuccess_10437",
    testCategory,
    "Searing Totem",
    10437
  )
end

function me.TestCombatEventStoneclawTotemSuccess_10428()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStoneclawTotemSuccess_10428",
    testCategory,
    "Stoneclaw Totem",
    10428
  )
end

function me.TestCombatEventStoneclawTotemSuccess_5730()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStoneclawTotemSuccess_5730",
    testCategory,
    "Stoneclaw Totem",
    5730
  )
end

function me.TestCombatEventStoneclawTotemSuccess_6390()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStoneclawTotemSuccess_6390",
    testCategory,
    "Stoneclaw Totem",
    6390
  )
end

function me.TestCombatEventStoneclawTotemSuccess_6391()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStoneclawTotemSuccess_6391",
    testCategory,
    "Stoneclaw Totem",
    6391
  )
end

function me.TestCombatEventStoneclawTotemSuccess_6392()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStoneclawTotemSuccess_6392",
    testCategory,
    "Stoneclaw Totem",
    6392
  )
end

function me.TestCombatEventStoneclawTotemSuccess_10427()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStoneclawTotemSuccess_10427",
    testCategory,
    "Stoneclaw Totem",
    10427
  )
end

function me.TestCombatEventHealingStreamTotemSuccess_10463()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHealingStreamTotemSuccess_10463",
    testCategory,
    "Healing Stream Totem",
    10463
  )
end

function me.TestCombatEventHealingStreamTotemSuccess_5394()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHealingStreamTotemSuccess_5394",
    testCategory,
    "Healing Stream Totem",
    5394
  )
end

function me.TestCombatEventHealingStreamTotemSuccess_6375()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHealingStreamTotemSuccess_6375",
    testCategory,
    "Healing Stream Totem",
    6375
  )
end

function me.TestCombatEventHealingStreamTotemSuccess_6377()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHealingStreamTotemSuccess_6377",
    testCategory,
    "Healing Stream Totem",
    6377
  )
end

function me.TestCombatEventHealingStreamTotemSuccess_10462()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHealingStreamTotemSuccess_10462",
    testCategory,
    "Healing Stream Totem",
    10462
  )
end

function me.TestCombatEventDiseaseCleansingTotemSuccess_8170()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDiseaseCleansingTotemSuccess_8170",
    testCategory,
    "Disease Cleansing Totem",
    8170
  )
end

function me.TestCombatEventManaSpringTotemSuccess_10497()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventManaSpringTotemSuccess_10497",
    testCategory,
    "Mana Spring Totem",
    10497
  )
end

function me.TestCombatEventManaSpringTotemSuccess_5675()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventManaSpringTotemSuccess_5675",
    testCategory,
    "Mana Spring Totem",
    5675
  )
end

function me.TestCombatEventManaSpringTotemSuccess_10495()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventManaSpringTotemSuccess_10495",
    testCategory,
    "Mana Spring Totem",
    10495
  )
end

function me.TestCombatEventManaSpringTotemSuccess_10496()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventManaSpringTotemSuccess_10496",
    testCategory,
    "Mana Spring Totem",
    10496
  )
end

function me.TestCombatEventManaTideTotemSuccess_17359()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventManaTideTotemSuccess_17359",
    testCategory,
    "Mana Tide Totem",
    17359
  )
end

function me.TestCombatEventManaTideTotemSuccess_16190()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventManaTideTotemSuccess_16190",
    testCategory,
    "Mana Tide Totem",
    16190
  )
end

function me.TestCombatEventManaTideTotemSuccess_17354()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventManaTideTotemSuccess_17354",
    testCategory,
    "Mana Tide Totem",
    17354
  )
end

function me.TestCombatEventTranquilAirTotemSuccess_25908()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventTranquilAirTotemSuccess_25908",
    testCategory,
    "Tranquil Air Totem",
    25908
  )
end

function me.TestCombatEventHealingRainSuccess_415236()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHealingRainSuccess_415236",
    testCategory,
    "Healing Rain",
    415236
  )
end

function me.TestCombatEventAncestralGuidanceApplied_409324()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAncestralGuidanceApplied_409324",
    testCategory,
    "Ancestral Guidance",
    409324
  )
end

function me.TestCombatEventAncestralGuidanceRemoved_409324()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAncestralGuidanceRemoved_409324",
    testCategory,
    "Ancestral Guidance",
    409324
  )
end

function me.TestCombatEventEarthShieldApplied_408514()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventEarthShieldApplied_408514",
    testCategory,
    "Earth Shield",
    408514
  )
end

function me.TestCombatEventEarthShieldRemoved_408514()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventEarthShieldRemoved_408514",
    testCategory,
    "Earth Shield",
    408514
  )
end

function me.TestCombatEventWaterShieldApplied_408510()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventWaterShieldApplied_408510",
    testCategory,
    "Water Shield",
    408510
  )
end

function me.TestCombatEventWaterShieldRemoved_408510()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventWaterShieldRemoved_408510",
    testCategory,
    "Water Shield",
    408510
  )
end

function me.TestCombatEventDecoyTotemSuccess_425874()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDecoyTotemSuccess_425874",
    testCategory,
    "Decoy Totem",
    425874
  )
end

function me.TestCombatEventTotemicProjectionSuccess_437009()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventTotemicProjectionSuccess_437009",
    testCategory,
    "Totemic Projection",
    437009
  )
end

function me.TestCombatEventMaelstromWeaponApplied_408498()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventMaelstromWeaponApplied_408498",
    testCategory,
    "Maelstrom Weapon",
    408498
  )
end

function me.TestCombatEventMaelstromWeaponRemoved_408498()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventMaelstromWeaponRemoved_408498",
    testCategory,
    "Maelstrom Weapon",
    408498
  )
end

function me.TestCombatEventTidalWavesApplied_432042()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventTidalWavesApplied_432042",
    testCategory,
    "Tidal Waves",
    432042
  )
end

function me.TestCombatEventTidalWavesRemoved_432042()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventTidalWavesRemoved_432042",
    testCategory,
    "Tidal Waves",
    432042
  )
end

function me.TestCombatEventRiptideSuccess_409954()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRiptideSuccess_409954",
    testCategory,
    "Riptide",
    409954
  )
end

function me.TestCombatEventPowerSurgeApplied_415100()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventPowerSurgeApplied_415100",
    testCategory,
    "Power Surge",
    415100
  )
end

function me.TestCombatEventPowerSurgeRemoved_415100()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventPowerSurgeRemoved_415100",
    testCategory,
    "Power Surge",
    415100
  )
end

function me.TestCombatEventFeralSpiritSuccess_440580()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFeralSpiritSuccess_440580",
    testCategory,
    "Feral Spirit",
    440580
  )
end
