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
mod.testSoundItems = me

me.tag = "TestSoundItems"

local testCategory = "items"

function me.Test()
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound items")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEphemeralPower_23271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEphemeralPower_23271)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireReflector_23097)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFireReflector_23097)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostReflector_23131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostReflector_23131)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowReflector_23132)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowReflector_23132)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSkullOfImpendingDoom_5024)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSkullOfImpendingDoom_5024)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSpiderBelt_9774)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSpiderBelt_9774)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGoblinRocketHelmet_22641)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNetOMatic_13120)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTidalCharm_835)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGnomishMindControlCap_13180)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGnomishRocketBoots_13141)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGnomishRocketBoots_13141)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGoblinRocketBoots_8892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGoblinRocketBoots_8892)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSpeed_14530)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSpeed_14530)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMithrilMechanicalDragonling_23075)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInsigniaWarriorHunterShaman_5579)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInsigniaWarlockRogue_23273)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInsigniaMage_23274)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInsigniaPriestPaladin_23276)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInsigniaDruid_23277)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundArenaGrandMaster_23506)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownArenaGrandMaster_23506)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSmolderwebsEye_17330)

  -- start sod items
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGreaterInsigniaOfTheHorde_438273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGreaterInsigniaOfTheAlliance_438273)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBloodCakedInsignia_474386)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVoidTouchedLeatherGauntletsGloves_429868)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownVoidTouchedLeatherGauntletsGloves_429868)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundExtraplanarSpidersilkBoots_428489)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownExtraplanarSpidersilkBoots_428489)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGneuroLinkedArcanoFilamentMonocle_437327)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGneuroLinkedArcanoFilamentMonocle_437327)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGlowingGneuroLinkedCowl_437349)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGlowingGneuroLinkedCowl_437349)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTemperedInterferenceNegatingHelmet_437377)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTemperedInterferenceNegatingHelmet_437377)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGneuroConductiveChannelersHood_437357)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGneuroConductiveChannelersHood_437357)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundReflectiveTruesilverBraincage_437382)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownReflectiveTruesilverBraincage_437382)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGlowingHyperconductiveScaleCoif_437362)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGlowingHyperconductiveScaleCoif_437362)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHyperconductiveGoldwrap_437699)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownHyperconductiveGoldwrap_437699)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHyperconductiveGoldwrap_437698)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownHyperconductiveGoldwrap_437698)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCatnip_13494)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownCatnip_13494)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDomesticatedAttackChicken_436069)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGniodinePillBottle_435895)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGniodinePillBottle_435895)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWirdalsHardenedCore_435359)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownWirdalsHardenedCore_435359)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMiniaturizedFireExtinguisher_461231)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWoodcarvedMoonstalker_461235)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownWoodcarvedMoonstalker_461235)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGerminatingPoisonseed_461227)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGerminatingPoisonseed_461227)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAccursedChalice_461224)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAccursedChalice_461224)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMarlisEye_467720)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowflameSword_461253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowflameSword_461253)
end

function me.TestSoundEphemeralPower_23271()
  mod.testHelper.TestSoundApplied(
    "TestSoundEphemeralPower_23271",
    testCategory,
    23271
  )
end

function me.TestSoundDownEphemeralPower_23271()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEphemeralPower_23271",
    testCategory,
    23271
  )
end

function me.TestSoundFireReflector_23097()
  mod.testHelper.TestSoundApplied(
    "TestSoundFireReflector_23097",
    testCategory,
    23097
  )
end

function me.TestSoundDownFireReflector_23097()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFireReflector_23097",
    testCategory,
    23097
  )
end

function me.TestSoundFrostReflector_23131()
  mod.testHelper.TestSoundApplied(
    "TestSoundFrostReflector_23131",
    testCategory,
    23131
  )
end

function me.TestSoundDownFrostReflector_23131()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFrostReflector_23131",
    testCategory,
    23131
  )
end

function me.TestSoundShadowReflector_23132()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowReflector_23132",
    testCategory,
    23132
  )
end

function me.TestSoundDownShadowReflector_23132()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowReflector_23132",
    testCategory,
    23132
  )
end

function me.TestSoundSkullOfImpendingDoom_5024()
  mod.testHelper.TestSoundApplied(
    "TestSoundSkullOfImpendingDoom_5024",
    testCategory,
    5024
  )
end

function me.TestSoundDownSkullOfImpendingDoom_5024()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSkullOfImpendingDoom_5024",
    testCategory,
    5024
  )
end

function me.TestSoundSpiderBelt_9774()
  mod.testHelper.TestSoundApplied(
    "TestSoundSpiderBelt_9774",
    testCategory,
    9774
  )
end

function me.TestSoundDownSpiderBelt_9774()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSpiderBelt_9774",
    testCategory,
    9774
  )
end

function me.TestSoundGoblinRocketHelmet_22641()
  mod.testHelper.TestSoundSuccess(
    "TestSoundGoblinRocketHelmet_22641",
    testCategory,
    22641
  )
end

function me.TestSoundNetOMatic_13120()
  mod.testHelper.TestSoundSuccess(
    "TestSoundNetOMatic_13120",
    testCategory,
    13120
  )
end

function me.TestSoundTidalCharm_835()
  mod.testHelper.TestSoundSuccess(
    "TestSoundTidalCharm_835",
    testCategory,
    835
  )
end

function me.TestSoundGnomishMindControlCap_13180()
  mod.testHelper.TestSoundSuccess(
    "TestSoundGnomishMindControlCap_13180",
    testCategory,
    13180
  )
end

function me.TestSoundGnomishRocketBoots_13141()
  mod.testHelper.TestSoundApplied(
    "TestSoundGnomishRocketBoots_13141",
    testCategory,
    13141
  )
end

function me.TestSoundDownGnomishRocketBoots_13141()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGnomishRocketBoots_13141",
    testCategory,
    13141
  )
end

function me.TestSoundGoblinRocketBoots_8892()
  mod.testHelper.TestSoundApplied(
    "TestSoundGoblinRocketBoots_8892",
    testCategory,
    8892
  )
end

function me.TestSoundDownGoblinRocketBoots_8892()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGoblinRocketBoots_8892",
    testCategory,
    8892
  )
end

function me.TestSoundSpeed_14530()
  mod.testHelper.TestSoundApplied(
    "TestSoundSpeed_14530",
    testCategory,
    14530
  )
end

function me.TestSoundDownSpeed_14530()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSpeed_14530",
    testCategory,
    14530
  )
end

function me.TestSoundMithrilMechanicalDragonling_23075()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMithrilMechanicalDragonling_23075",
    testCategory,
    23075
  )
end

function me.TestSoundInsigniaWarriorHunterShaman_5579()
  mod.testHelper.TestSoundSuccess(
    "TestSoundInsigniaWarriorHunterShaman_5579",
    testCategory,
    5579
  )
end

function me.TestSoundInsigniaWarlockRogue_23273()
  mod.testHelper.TestSoundSuccess(
    "TestSoundInsigniaWarlockRogue_23273",
    testCategory,
    23273
  )
end

function me.TestSoundInsigniaMage_23274()
  mod.testHelper.TestSoundSuccess(
    "TestSoundInsigniaMage_23274",
    testCategory,
    23274
  )
end

function me.TestSoundInsigniaPriestPaladin_23276()
  mod.testHelper.TestSoundSuccess(
    "TestSoundInsigniaPriestPaladin_23276",
    testCategory,
    23276
  )
end

function me.TestSoundInsigniaDruid_23277()
  mod.testHelper.TestSoundSuccess(
    "TestSoundInsigniaDruid_23277",
    testCategory,
    23277
  )
end

function me.TestSoundArenaGrandMaster_23506()
  mod.testHelper.TestSoundApplied(
    "TestSoundArenaGrandMaster_23506",
    testCategory,
    23506
  )
end

function me.TestSoundDownArenaGrandMaster_23506()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownArenaGrandMaster_23506",
    testCategory,
    23506
  )
end

function me.TestSoundSmolderwebsEye_17330()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSmolderwebsEye_17330",
    testCategory,
    17330
  )
end

function me.TestSoundGreaterInsigniaOfTheHorde_438273()
  mod.testHelper.TestSoundSuccess(
    "TestSoundGreaterInsigniaOfTheHorde_438273",
    testCategory,
    438273
  )
end

function me.TestSoundGreaterInsigniaOfTheAlliance_438273()
  mod.testHelper.TestSoundSuccess(
    "TestSoundGreaterInsigniaOfTheAlliance_438273",
    testCategory,
    438273
  )
end

function me.TestSoundBloodCakedInsignia_474386()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBloodCakedInsignia_474386",
    testCategory,
    474386
  )
end

function me.TestSoundVoidTouchedLeatherGauntletsGloves_429868()
  mod.testHelper.TestSoundApplied(
    "TestSoundVoidTouchedLeatherGauntletsGloves_429868",
    testCategory,
    429868
  )
end

function me.TestSoundDownVoidTouchedLeatherGauntletsGloves_429868()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownVoidTouchedLeatherGauntletsGloves_429868",
    testCategory,
    429868
  )
end

function me.TestSoundExtraplanarSpidersilkBoots_428489()
  mod.testHelper.TestSoundApplied(
    "TestSoundExtraplanarSpidersilkBoots_428489",
    testCategory,
    428489
  )
end

function me.TestSoundDownExtraplanarSpidersilkBoots_428489()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownExtraplanarSpidersilkBoots_428489",
    testCategory,
    428489
  )
end

function me.TestSoundGneuroLinkedArcanoFilamentMonocle_437327()
  mod.testHelper.TestSoundApplied(
    "TestSoundGneuroLinkedArcanoFilamentMonocle_437327",
    testCategory,
    437327
  )
end

function me.TestSoundDownGneuroLinkedArcanoFilamentMonocle_437327()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGneuroLinkedArcanoFilamentMonocle_437327",
    testCategory,
    437327
  )
end

function me.TestSoundGlowingGneuroLinkedCowl_437349()
  mod.testHelper.TestSoundApplied(
    "TestSoundGlowingGneuroLinkedCowl_437349",
    testCategory,
    437349
  )
end

function me.TestSoundDownGlowingGneuroLinkedCowl_437349()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGlowingGneuroLinkedCowl_437349",
    testCategory,
    437349
  )
end

function me.TestSoundTemperedInterferenceNegatingHelmet_437377()
  mod.testHelper.TestSoundApplied(
    "TestSoundTemperedInterferenceNegatingHelmet_437377",
    testCategory,
    437377
  )
end

function me.TestSoundDownTemperedInterferenceNegatingHelmet_437377()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownTemperedInterferenceNegatingHelmet_437377",
    testCategory,
    437377
  )
end

function me.TestSoundGneuroConductiveChannelersHood_437357()
  mod.testHelper.TestSoundApplied(
    "TestSoundGneuroConductiveChannelersHood_437357",
    testCategory,
    437357
  )
end

function me.TestSoundDownGneuroConductiveChannelersHood_437357()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGneuroConductiveChannelersHood_437357",
    testCategory,
    437357
  )
end

function me.TestSoundReflectiveTruesilverBraincage_437382()
  mod.testHelper.TestSoundApplied(
    "TestSoundReflectiveTruesilverBraincage_437382",
    testCategory,
    437382
  )
end

function me.TestSoundDownReflectiveTruesilverBraincage_437382()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownReflectiveTruesilverBraincage_437382",
    testCategory,
    437382
  )
end

function me.TestSoundGlowingHyperconductiveScaleCoif_437362()
  mod.testHelper.TestSoundApplied(
    "TestSoundGlowingHyperconductiveScaleCoif_437362",
    testCategory,
    437362
  )
end

function me.TestSoundDownGlowingHyperconductiveScaleCoif_437362()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGlowingHyperconductiveScaleCoif_437362",
    testCategory,
    437362
  )
end

function me.TestSoundHyperconductiveGoldwrap_437699()
  mod.testHelper.TestSoundApplied(
    "TestSoundHyperconductiveGoldwrap_437699",
    testCategory,
    437699
  )
end

function me.TestSoundDownHyperconductiveGoldwrap_437699()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownHyperconductiveGoldwrap_437699",
    testCategory,
    437699
  )
end

function me.TestSoundHyperconductiveGoldwrap_437698()
  mod.testHelper.TestSoundApplied(
    "TestSoundHyperconductiveGoldwrap_437698",
    testCategory,
    437698
  )
end

function me.TestSoundDownHyperconductiveGoldwrap_437698()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownHyperconductiveGoldwrap_437698",
    testCategory,
    437698
  )
end

function me.TestSoundCatnip_13494()
  mod.testHelper.TestSoundApplied(
    "TestSoundCatnip_13494",
    testCategory,
    13494
  )
end

function me.TestSoundDownCatnip_13494()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownCatnip_13494",
    testCategory,
    13494
  )
end

function me.TestSoundDomesticatedAttackChicken_436069()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDomesticatedAttackChicken_436069",
    testCategory,
    436069
  )
end

function me.TestSoundGniodinePillBottle_435895()
  mod.testHelper.TestSoundApplied(
    "TestSoundGniodinePillBottle_435895",
    testCategory,
    435895
  )
end

function me.TestSoundDownGniodinePillBottle_435895()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGniodinePillBottle_435895",
    testCategory,
    435895
  )
end

function me.TestSoundWirdalsHardenedCore_435359()
  mod.testHelper.TestSoundApplied(
    "TestSoundWirdalsHardenedCore_435359",
    testCategory,
    435359
  )
end

function me.TestSoundDownWirdalsHardenedCore_435359()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownWirdalsHardenedCore_435359",
    testCategory,
    435359
  )
end

function me.TestSoundMiniaturizedFireExtinguisher_461231()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMiniaturizedFireExtinguisher_461231",
    testCategory,
    461231
  )
end

function me.TestSoundWoodcarvedMoonstalker_461235()
  mod.testHelper.TestSoundApplied(
    "TestSoundWoodcarvedMoonstalker_461235",
    testCategory,
    461235
  )
end

function me.TestSoundDownWoodcarvedMoonstalker_461235()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownWoodcarvedMoonstalker_461235",
    testCategory,
    461235
  )
end

function me.TestSoundGerminatingPoisonseed_461227()
  mod.testHelper.TestSoundApplied(
    "TestSoundGerminatingPoisonseed_461227",
    testCategory,
    461227
  )
end

function me.TestSoundDownGerminatingPoisonseed_461227()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGerminatingPoisonseed_461227",
    testCategory,
    461227
  )
end

function me.TestSoundAccursedChalice_461224()
  mod.testHelper.TestSoundApplied(
    "TestSoundAccursedChalice_461224",
    testCategory,
    461224
  )
end

function me.TestSoundDownAccursedChalice_461224()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAccursedChalice_461224",
    testCategory,
    461224
  )
end

function me.TestSoundMarlisEye_467720()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMarlisEye_467720",
    testCategory,
    467720
  )
end

function me.TestSoundShadowflameSword_461253()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowflameSword_461253",
    testCategory,
    461253
  )
end

function me.TestSoundDownShadowflameSword_461253()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowflameSword_461253",
    testCategory,
    461253
  )
end
