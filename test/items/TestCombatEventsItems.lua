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

-- luacheck: globals UnitFactionGroup

local mod = rgpvpw
local me = {}
mod.testCombatEventsItems = me

me.tag = "TestCombatEventsItems"

local testCategory = "items"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testcombatevent items")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTalismanOfEphemeralPowerApplied_23271)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTalismanOfEphemeralPowerRemoved_23271)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHyperRadiantFlameReflectorApplied_23097)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHyperRadiantFlameReflectorRemoved_23097)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGyrofreezeIceReflectorApplied_23131)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGyrofreezeIceReflectorRemoved_23131)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventUltraFlashShadowReflectorApplied_23132)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventUltraFlashShadowReflectorRemoved_23132)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSkullOfImpendingDoomApplied_5024)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSkullOfImpendingDoomRemoved_5024)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSpiderBeltApplied_9774)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSpiderBeltRemoved_9774)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGoblinRocketHelmetSuccess_22641)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGnomishNetOMaticProjectorSuccess_13120)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTidalCharmSuccess_835)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGnomishMindControlCapSuccess_13180)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGnomishRocketBootsApplied_13141)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGnomishRocketBootsRemoved_13141)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGoblinRocketBootsApplied_8892)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGoblinRocketBootsRemoved_8892)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventNiftyStopwatchApplied_14530)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventNiftyStopwatchRemoved_14530)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMithrilMechanicalDragonlingSuccess_23075)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInsigniaWarriorHunterShamanSuccess_5579)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInsigniaWarlockRogueSuccess_23273)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInsigniaMageSuccess_23274)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInsigniaPriestPaladinSuccess_23276)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInsigniaDruidSuccess_23277)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventArenaGrandMasterApplied_23506)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventArenaGrandMasterRemoved_23506)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSmolderwebsEyeSuccess_17330)

  -- start sod items
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGreaterInsigniaOfTheHordeSuccess_438273)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGreaterInsigniaOfTheAllianceSuccess_438273)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBloodCakedInsigniaSuccess_474386)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventVoidTouchedLeatherGauntletsGlovesApplied_429868)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventVoidTouchedLeatherGauntletsGlovesRemoved_429868)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventExtraplanarSpidersilkBootsApplied_428489)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventExtraplanarSpidersilkBootsRemoved_428489)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGneuroLinkedArcanoFilamentMonocleApplied_437327)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGneuroLinkedArcanoFilamentMonocleRemoved_437327)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGlowingGneuroLinkedCowlApplied_437349)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGlowingGneuroLinkedCowlRemoved_437349)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTemperedInterferenceNegatingHelmetApplied_437377)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTemperedInterferenceNegatingHelmetRemoved_437377)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGneuroConductiveChannelersHoodApplied_437357)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGneuroConductiveChannelersHoodRemoved_437357)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventReflectiveTruesilverBraincageApplied_437382)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventReflectiveTruesilverBraincageRemoved_437382)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGlowingHyperconductiveScaleCoifApplied_437362)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGlowingHyperconductiveScaleCoifRemoved_437362)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHyperconductiveGoldwrapApplied_437699)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHyperconductiveGoldwrapRemoved_437699)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHyperconductiveGoldwrapApplied_437698)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHyperconductiveGoldwrapRemoved_437698)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventCatnipApplied_13494)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventCatnipRemoved_13494)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDomesticatedAttackChickenSuccess_436069)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGniodinePillBottleApplied_435895)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGniodinePillBottleRemoved_435895)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWirdalsHardenedCoreApplied_435359)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWirdalsHardenedCoreRemoved_435359)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMiniaturizedFireExtinguisherSuccess_461231)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWoodcarvedMoonstalkerApplied_461235)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventWoodcarvedMoonstalkerRemoved_461235)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGerminatingPoisonseedApplied_461227)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventGerminatingPoisonseedRemoved_461227)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAccursedChaliceApplied_461224)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAccursedChaliceRemoved_461224)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMarlisEyeSuccess_467720)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowflameSwordApplied_461253)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowflameSwordRemoved_461253)
end

function me.TestCombatEventTalismanOfEphemeralPowerApplied_23271()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventTalismanOfEphemeralPowerApplied_23271",
    testCategory,
    "Ephemeral Power",
    23271
  )
end

function me.TestCombatEventTalismanOfEphemeralPowerRemoved_23271()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventTalismanOfEphemeralPowerRemoved_23271",
    testCategory,
    "Ephemeral Power",
    23271
  )
end

function me.TestCombatEventHyperRadiantFlameReflectorApplied_23097()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventHyperRadiantFlameReflectorApplied_23097",
    testCategory,
    "Fire Reflector",
    23097
  )
end

function me.TestCombatEventHyperRadiantFlameReflectorRemoved_23097()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventHyperRadiantFlameReflectorRemoved_23097",
    testCategory,
    "Fire Reflector",
    23097
  )
end

function me.TestCombatEventGyrofreezeIceReflectorApplied_23131()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGyrofreezeIceReflectorApplied_23131",
    testCategory,
    "Frost Reflector",
    23131
  )
end

function me.TestCombatEventGyrofreezeIceReflectorRemoved_23131()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGyrofreezeIceReflectorRemoved_23131",
    testCategory,
    "Frost Reflector",
    23131
  )
end

function me.TestCombatEventUltraFlashShadowReflectorApplied_23132()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventUltraFlashShadowReflectorApplied_23132",
    testCategory,
    "Shadow Reflector",
    23132
  )
end

function me.TestCombatEventUltraFlashShadowReflectorRemoved_23132()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventUltraFlashShadowReflectorRemoved_23132",
    testCategory,
    "Shadow Reflector",
    23132
  )
end

function me.TestCombatEventSkullOfImpendingDoomApplied_5024()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSkullOfImpendingDoomApplied_5024",
    testCategory,
    "Skull of Impending Doom",
    5024
  )
end

function me.TestCombatEventSkullOfImpendingDoomRemoved_5024()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSkullOfImpendingDoomRemoved_5024",
    testCategory,
    "Skull of Impending Doom",
    5024
  )
end

function me.TestCombatEventSpiderBeltApplied_9774()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSpiderBeltApplied_9774",
    testCategory,
    "Spider Belt",
    9774
  )
end

function me.TestCombatEventSpiderBeltRemoved_9774()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSpiderBeltRemoved_9774",
    testCategory,
    "Spider Belt",
    9774
  )
end

function me.TestCombatEventGoblinRocketHelmetSuccess_22641()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventGoblinRocketHelmetSuccess_22641",
    testCategory,
    "Goblin Rocket Helmet",
    22641
  )
end

function me.TestCombatEventGnomishNetOMaticProjectorSuccess_13120()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventGnomishNetOMaticProjectorSuccess_13120",
    testCategory,
    "Net-o-Matic",
    13120
  )
end

function me.TestCombatEventTidalCharmSuccess_835()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventTidalCharmSuccess_835",
    testCategory,
    "Tidal Charm",
    835
  )
end

function me.TestCombatEventGnomishMindControlCapSuccess_13180()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventGnomishMindControlCapSuccess_13180",
    testCategory,
    "Gnomish Mind Control Cap",
    13180
  )
end

function me.TestCombatEventGnomishRocketBootsApplied_13141()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGnomishRocketBootsApplied_13141",
    testCategory,
    "Gnomish Rocket Boots",
    13141
  )
end

function me.TestCombatEventGnomishRocketBootsRemoved_13141()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGnomishRocketBootsRemoved_13141",
    testCategory,
    "Gnomish Rocket Boots",
    13141
  )
end

function me.TestCombatEventGoblinRocketBootsApplied_8892()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGoblinRocketBootsApplied_8892",
    testCategory,
    "Goblin Rocket Boots",
    8892
  )
end

function me.TestCombatEventGoblinRocketBootsRemoved_8892()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGoblinRocketBootsRemoved_8892",
    testCategory,
    "Goblin Rocket Boots",
    8892
  )
end

function me.TestCombatEventNiftyStopwatchApplied_14530()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventNiftyStopwatchApplied_14530",
    testCategory,
    "Speed",
    14530
  )
end

function me.TestCombatEventNiftyStopwatchRemoved_14530()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventNiftyStopwatchRemoved_14530",
    testCategory,
    "Speed",
    14530
  )
end

function me.TestCombatEventMithrilMechanicalDragonlingSuccess_23075()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMithrilMechanicalDragonlingSuccess_23075",
    testCategory,
    "Mithril Mechanical Dragonling",
    23075
  )
end

function me.TestCombatEventInsigniaWarriorHunterShamanSuccess_5579()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInsigniaWarriorHunterShamanSuccess_5579",
    testCategory,
    "Insignia Warrior/Hunter/Shaman",
    5579
  )
end

function me.TestCombatEventInsigniaWarlockRogueSuccess_23273()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInsigniaWarlockRogueSuccess_23273",
    testCategory,
    "Insignia Warlock/Rogue",
    23273
  )
end

function me.TestCombatEventInsigniaMageSuccess_23274()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInsigniaMageSuccess_23274",
    testCategory,
    "Insignia Mage",
    23274
  )
end

function me.TestCombatEventInsigniaPriestPaladinSuccess_23276()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInsigniaPriestPaladinSuccess_23276",
    testCategory,
    "Insignia Priest/Paladin",
    23276
  )
end

function me.TestCombatEventInsigniaDruidSuccess_23277()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInsigniaDruidSuccess_23277",
    testCategory,
    "Insignia Druid",
    23277
  )
end

function me.TestCombatEventArenaGrandMasterApplied_23506()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventArenaGrandMasterApplied_23506",
    testCategory,
    "Arena Grand Master",
    23506
  )
end

function me.TestCombatEventArenaGrandMasterRemoved_23506()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventArenaGrandMasterRemoved_23506",
    testCategory,
    "Arena Grand Master",
    23506
  )
end

function me.TestCombatEventSmolderwebsEyeSuccess_17330()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSmolderwebsEyeSuccess_17330",
    testCategory,
    "Smolderweb's Eye",
    17330
  )
end

function me.TestCombatEventGreaterInsigniaOfTheHordeSuccess_438273()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventGreaterInsigniaSuccess_438273",
    testCategory,
    UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde"
      and "Greater Insignia of the Alliance"
      or "Greater Insignia of the Horder",
    438273
  )
end

function me.TestCombatEventGreaterInsigniaOfTheAllianceSuccess_438273()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventGreaterInsigniaSuccess_438273",
    testCategory,
    UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde"
      and "Greater Insignia of the Alliance"
      or "Greater Insignia of the Horder",
    438273
  )
end

function me.TestCombatEventBloodCakedInsigniaSuccess_474386()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBloodCakedInsigniaSuccess_474386",
    testCategory,
    "Blood-Caked Insignia",
    474386
  )
end

function me.TestCombatEventVoidTouchedLeatherGauntletsGlovesApplied_429868()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventVoidTouchedLeatherGauntletsGlovesApplied_429868",
    testCategory,
    "Void-Touched Leather Gauntlets/Gloves",
    429868
  )
end

function me.TestCombatEventVoidTouchedLeatherGauntletsGlovesRemoved_429868()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventVoidTouchedLeatherGauntletsGlovesRemoved_429868",
    testCategory,
    "Void-Touched Leather Gauntlets/Gloves",
    429868
  )
end

function me.TestCombatEventExtraplanarSpidersilkBootsApplied_428489()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventExtraplanarSpidersilkBootsApplied_428489",
    testCategory,
    "Extraplanar Spidersilk Boots",
    428489
  )
end

function me.TestCombatEventExtraplanarSpidersilkBootsRemoved_428489()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventExtraplanarSpidersilkBootsRemoved_428489",
    testCategory,
    "Extraplanar Spidersilk Boots",
    428489
  )
end

function me.TestCombatEventGneuroLinkedArcanoFilamentMonocleApplied_437327()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGneuroLinkedArcanoFilamentMonocleApplied_437327",
    testCategory,
    "Gneuro-Linked Arcano-Filament Monocle",
    437327
  )
end

function me.TestCombatEventGneuroLinkedArcanoFilamentMonocleRemoved_437327()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGneuroLinkedArcanoFilamentMonocleRemoved_437327",
    testCategory,
    "Gneuro-Linked Arcano-Filament Monocle",
    437327
  )
end

function me.TestCombatEventGlowingGneuroLinkedCowlApplied_437349()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGlowingGneuroLinkedCowlApplied_437349",
    testCategory,
    "Glowing Gneuro-Linked Cowl",
    437349
  )
end

function me.TestCombatEventGlowingGneuroLinkedCowlRemoved_437349()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGlowingGneuroLinkedCowlRemoved_437349",
    testCategory,
    "Glowing Gneuro-Linked Cowl",
    437349
  )
end

function me.TestCombatEventTemperedInterferenceNegatingHelmetApplied_437377()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventTemperedInterferenceNegatingHelmetApplied_437377",
    testCategory,
    "Tempered Interference-Negating Helmet",
    437377
  )
end

function me.TestCombatEventTemperedInterferenceNegatingHelmetRemoved_437377()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventTemperedInterferenceNegatingHelmetRemoved_437377",
    testCategory,
    "Tempered Interference-Negating Helmet",
    437377
  )
end

function me.TestCombatEventGneuroConductiveChannelersHoodApplied_437357()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGneuroConductiveChannelersHoodApplied_437357",
    testCategory,
    "Gneuro-Conductive Channeler's Hood",
    437357
  )
end

function me.TestCombatEventGneuroConductiveChannelersHoodRemoved_437357()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGneuroConductiveChannelersHoodRemoved_437357",
    testCategory,
    "Gneuro-Conductive Channeler's Hood",
    437357
  )
end

function me.TestCombatEventReflectiveTruesilverBraincageApplied_437382()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventReflectiveTruesilverBraincageApplied_437382",
    testCategory,
    "Reflective Truesilver Braincage",
    437382
  )
end

function me.TestCombatEventReflectiveTruesilverBraincageRemoved_437382()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventReflectiveTruesilverBraincageRemoved_437382",
    testCategory,
    "Reflective Truesilver Braincage",
    437382
  )
end

function me.TestCombatEventGlowingHyperconductiveScaleCoifApplied_437362()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGlowingHyperconductiveScaleCoifApplied_437362",
    testCategory,
    "Glowing Hyperconductive Scale Coif",
    437362
  )
end

function me.TestCombatEventGlowingHyperconductiveScaleCoifRemoved_437362()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGlowingHyperconductiveScaleCoifRemoved_437362",
    testCategory,
    "Glowing Hyperconductive Scale Coif",
    437362
  )
end

function me.TestCombatEventHyperconductiveGoldwrapApplied_437699()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventHyperconductiveGoldwrapApplied_437699",
    testCategory,
    "Hyperconductive Goldwrap",
    437699
  )
end

function me.TestCombatEventHyperconductiveGoldwrapRemoved_437699()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventHyperconductiveGoldwrapRemoved_437699",
    testCategory,
    "Hyperconductive Goldwrap",
    437699
  )
end

function me.TestCombatEventHyperconductiveGoldwrapApplied_437698()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventHyperconductiveGoldwrapApplied_437698",
    testCategory,
    "Hyperconductive Goldwrap",
    437698
  )
end

function me.TestCombatEventHyperconductiveGoldwrapRemoved_437698()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventHyperconductiveGoldwrapRemoved_437698",
    testCategory,
    "Hyperconductive Goldwrap",
    437698
  )
end

function me.TestCombatEventCatnipApplied_13494()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventCatnipApplied_13494",
    testCategory,
    "Catnip",
    13494
  )
end

function me.TestCombatEventCatnipRemoved_13494()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventCatnipRemoved_13494",
    testCategory,
    "Catnip",
    13494
  )
end

function me.TestCombatEventDomesticatedAttackChickenSuccess_436069()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDomesticatedAttackChickenSuccess_436069",
    testCategory,
    "Domesticated Attack Chicken",
    436069
  )
end

function me.TestCombatEventGniodinePillBottleApplied_435895()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGniodinePillBottleApplied_435895",
    testCategory,
    "Gniodine Pill Bottle",
    435895
  )
end

function me.TestCombatEventGniodinePillBottleRemoved_435895()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGniodinePillBottleRemoved_435895",
    testCategory,
    "Gniodine Pill Bottle",
    435895
  )
end

function me.TestCombatEventWirdalsHardenedCoreApplied_435359()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventWirdalsHardenedCoreApplied_435359",
    testCategory,
    "Wirdal's Hardened Core",
    435359
  )
end

function me.TestCombatEventWirdalsHardenedCoreRemoved_435359()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventWirdalsHardenedCoreRemoved_435359",
    testCategory,
    "Wirdal's Hardened Core",
    435359
  )
end

function me.TestCombatEventMiniaturizedFireExtinguisherSuccess_461231()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMiniaturizedFireExtinguisherSuccess_461231",
    testCategory,
    "Miniaturized Fire Extinguisher",
    461231
  )
end

function me.TestCombatEventWoodcarvedMoonstalkerApplied_461235()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventWoodcarvedMoonstalkerApplied_461235",
    testCategory,
    "Woodcarved Moonstalker",
    461235
  )
end

function me.TestCombatEventWoodcarvedMoonstalkerRemoved_461235()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventWoodcarvedMoonstalkerRemoved_461235",
    testCategory,
    "Woodcarved Moonstalker",
    461235
  )
end

function me.TestCombatEventGerminatingPoisonseedApplied_461227()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGerminatingPoisonseedApplied_461227",
    testCategory,
    "Germinating Poisonseed",
    461227
  )
end

function me.TestCombatEventGerminatingPoisonseedRemoved_461227()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGerminatingPoisonseedRemoved_461227",
    testCategory,
    "Germinating Poisonseed",
    461227
  )
end

function me.TestCombatEventAccursedChaliceApplied_461224()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAccursedChaliceApplied_461224",
    testCategory,
    "Accursed Chalice",
    461224
  )
end

function me.TestCombatEventAccursedChaliceRemoved_461224()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAccursedChaliceRemoved_461224",
    testCategory,
    "Accursed Chalice",
    461224
  )
end

function me.TestCombatEventMarlisEyeSuccess_467720()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMarlisEyeSuccess_467720",
    testCategory,
    "Mar'li's Eye",
    467720
  )
end

function me.TestCombatEventShadowflameSwordApplied_461253()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowflameSwordApplied_461253",
    testCategory,
    "Shadowflame Sword",
    461253
  )
end

function me.TestCombatEventShadowflameSwordRemoved_461253()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowflameSwordRemoved_461253",
    testCategory,
    "Shadowflame Sword",
    461253
  )
end
