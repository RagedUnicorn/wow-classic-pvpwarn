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

local testGroupName = "SoundItems"
local testCategory = "items"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

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

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFlee_5024)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFlee_5024)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmuneRoot_9774)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownImmuneRoot_9774)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRocketHelmet_22641)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNetOMatic_13120)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTidalCharm_835)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMindControlCap_13180)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGnomishRocketBoots_13141)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGnomishRocketBoots_13141)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGoblinRocketBoots_8892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGoblinRocketBoots_8892)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNiftyStopwatch_14530)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNiftyStopwatch_14530)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMithrilDragonling_23075)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInsigniaWarriorHunterShaman_5579)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInsigniaWarlockRogue_23273)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInsigniaMage_23274)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInsigniaPriestPaladin_23276)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInsigniaDruid_23277)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundArenaGrandMaster_23506)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownArenaGrandMaster_23506)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSmolderwebsPoison_17330)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPvpTrinket_438273)

  -- start sod items
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBloodCakedInsignia_474386)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVoidMadness_429868)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownVoidMadness_429868)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPlanarShift_428489)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownPlanarShift_428489)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundChargedInspiration_437327)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownChargedInspiration_437327)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGneuroLogicalShock_437349)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGneuroLogicalShock_437349)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntenseConcentration_437377)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIntenseConcentration_437377)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGneuromanticMeditation_437357)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGneuromanticMeditation_437357)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundReinforcedWillpower_437382)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownReinforcedWillpower_437382)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRadicalRadResistance_437340)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRadicalRadResistance_437340)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHyperconductiveShock_437362)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownHyperconductiveShock_437362)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCoinFlip_437699)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownCoinFlip_437699)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCoinFlip_437698)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownCoinFlip_437698)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHaste_13494)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownHaste_13494)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDomesticatedAttackChicken_436069)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGniodineDispel_435895)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGniodineDispel_435895)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHardenedToTheCore_435359)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownHardenedToTheCore_435359)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundExtinguishFire_461231)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMoonstalkerFury_461235)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownMoonstalkerFury_461235)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGuardianOfNature_461227)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGuardianOfNature_461227)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDemonTaintedBlood_461224)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDemonTaintedBlood_461224)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMarlisEye_467720)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowflameFury_461253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowflameFury_461253)
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

function me.TestSoundFlee_5024()
  mod.testHelper.TestSoundApplied(
    "TestSoundFlee_5024",
    testCategory,
    5024
  )
end

function me.TestSoundDownFlee_5024()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFlee_5024",
    testCategory,
    5024
  )
end

function me.TestSoundImmuneRoot_9774()
  mod.testHelper.TestSoundApplied(
    "TestSoundImmuneRoot_9774",
    testCategory,
    9774
  )
end

function me.TestSoundDownImmuneRoot_9774()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownImmuneRoot_9774",
    testCategory,
    9774
  )
end

function me.TestSoundRocketHelmet_22641()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRocketHelmet_22641",
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

function me.TestSoundMindControlCap_13180()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMindControlCap_13180",
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

function me.TestSoundNiftyStopwatch_14530()
  mod.testHelper.TestSoundApplied(
    "TestSoundNiftyStopwatch_14530",
    testCategory,
    14530
  )
end

function me.TestSoundDownNiftyStopwatch_14530()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownNiftyStopwatch_14530",
    testCategory,
    14530
  )
end

function me.TestSoundMithrilDragonling_23075()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMithrilDragonling_23075",
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

function me.TestSoundSmolderwebsPoison_17330()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSmolderwebsPoison_17330",
    testCategory,
    17330
  )
end

function me.TestSoundPvpTrinket_438273()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPvpTrinket_438273",
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

function me.TestSoundVoidMadness_429868()
  mod.testHelper.TestSoundApplied(
    "TestSoundVoidMadness_429868",
    testCategory,
    429868
  )
end

function me.TestSoundDownVoidMadness_429868()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownVoidMadness_429868",
    testCategory,
    429868
  )
end

function me.TestSoundPlanarShift_428489()
  mod.testHelper.TestSoundApplied(
    "TestSoundPlanarShift_428489",
    testCategory,
    428489
  )
end

function me.TestSoundDownPlanarShift_428489()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownPlanarShift_428489",
    testCategory,
    428489
  )
end

function me.TestSoundChargedInspiration_437327()
  mod.testHelper.TestSoundApplied(
    "TestSoundChargedInspiration_437327",
    testCategory,
    437327
  )
end

function me.TestSoundDownChargedInspiration_437327()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownChargedInspiration_437327",
    testCategory,
    437327
  )
end

function me.TestSoundGneuroLogicalShock_437349()
  mod.testHelper.TestSoundApplied(
    "TestSoundGneuroLogicalShock_437349",
    testCategory,
    437349
  )
end

function me.TestSoundDownGneuroLogicalShock_437349()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGneuroLogicalShock_437349",
    testCategory,
    437349
  )
end

function me.TestSoundIntenseConcentration_437377()
  mod.testHelper.TestSoundApplied(
    "TestSoundIntenseConcentration_437377",
    testCategory,
    437377
  )
end

function me.TestSoundDownIntenseConcentration_437377()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownIntenseConcentration_437377",
    testCategory,
    437377
  )
end

function me.TestSoundGneuromanticMeditation_437357()
  mod.testHelper.TestSoundApplied(
    "TestSoundGneuromanticMeditation_437357",
    testCategory,
    437357
  )
end

function me.TestSoundDownGneuromanticMeditation_437357()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGneuromanticMeditation_437357",
    testCategory,
    437357
  )
end

function me.TestSoundReinforcedWillpower_437382()
  mod.testHelper.TestSoundApplied(
    "TestSoundReinforcedWillpower_437382",
    testCategory,
    437382
  )
end

function me.TestSoundDownReinforcedWillpower_437382()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownReinforcedWillpower_437382",
    testCategory,
    437382
  )
end

function me.TestSoundRadicalRadResistance_437340()
  mod.testHelper.TestSoundApplied(
    "TestSoundRadicalRadResistance_437340",
    testCategory,
    437340
  )
end

function me.TestSoundDownRadicalRadResistance_437340()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownRadicalRadResistance_437340",
    testCategory,
    437340
  )
end

function me.TestSoundHyperconductiveShock_437362()
  mod.testHelper.TestSoundApplied(
    "TestSoundHyperconductiveShock_437362",
    testCategory,
    437362
  )
end

function me.TestSoundDownHyperconductiveShock_437362()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownHyperconductiveShock_437362",
    testCategory,
    437362
  )
end

function me.TestSoundCoinFlip_437699()
  mod.testHelper.TestSoundApplied(
    "TestSoundCoinFlip_437699",
    testCategory,
    437699
  )
end

function me.TestSoundDownCoinFlip_437699()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownCoinFlip_437699",
    testCategory,
    437699
  )
end

function me.TestSoundCoinFlip_437698()
  mod.testHelper.TestSoundApplied(
    "TestSoundCoinFlip_437698",
    testCategory,
    437698
  )
end

function me.TestSoundDownCoinFlip_437698()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownCoinFlip_437698",
    testCategory,
    437698
  )
end

function me.TestSoundHaste_13494()
  mod.testHelper.TestSoundApplied(
    "TestSoundHaste_13494",
    testCategory,
    13494
  )
end

function me.TestSoundDownHaste_13494()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownHaste_13494",
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

function me.TestSoundGniodineDispel_435895()
  mod.testHelper.TestSoundApplied(
    "TestSoundGniodineDispel_435895",
    testCategory,
    435895
  )
end

function me.TestSoundDownGniodineDispel_435895()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGniodineDispel_435895",
    testCategory,
    435895
  )
end

function me.TestSoundHardenedToTheCore_435359()
  mod.testHelper.TestSoundApplied(
    "TestSoundHardenedToTheCore_435359",
    testCategory,
    435359
  )
end

function me.TestSoundDownHardenedToTheCore_435359()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownHardenedToTheCore_435359",
    testCategory,
    435359
  )
end

function me.TestSoundExtinguishFire_461231()
  mod.testHelper.TestSoundSuccess(
    "TestSoundExtinguishFire_461231",
    testCategory,
    461231
  )
end

function me.TestSoundMoonstalkerFury_461235()
  mod.testHelper.TestSoundApplied(
    "TestSoundMoonstalkerFury_461235",
    testCategory,
    461235
  )
end

function me.TestSoundDownMoonstalkerFury_461235()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownMoonstalkerFury_461235",
    testCategory,
    461235
  )
end

function me.TestSoundGuardianOfNature_461227()
  mod.testHelper.TestSoundApplied(
    "TestSoundGuardianOfNature_461227",
    testCategory,
    461227
  )
end

function me.TestSoundDownGuardianOfNature_461227()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGuardianOfNature_461227",
    testCategory,
    461227
  )
end

function me.TestSoundDemonTaintedBlood_461224()
  mod.testHelper.TestSoundApplied(
    "TestSoundDemonTaintedBlood_461224",
    testCategory,
    461224
  )
end

function me.TestSoundDownDemonTaintedBlood_461224()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDemonTaintedBlood_461224",
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

function me.TestSoundShadowflameFury_461253()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowflameFury_461253",
    testCategory,
    461253
  )
end

function me.TestSoundDownShadowflameFury_461253()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowflameFury_461253",
    testCategory,
    461253
  )
end
