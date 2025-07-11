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

local testGroupName = "CombatEventsItems"
local testCategory = "items"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEphemeralPowerApplied_23271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEphemeralPowerRemoved_23271)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireReflectorApplied_23097)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireReflectorRemoved_23097)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostReflectorApplied_23131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostReflectorRemoved_23131)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowReflectorApplied_23132)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowReflectorRemoved_23132)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSkullOfImpendingDoomApplied_5024)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSkullOfImpendingDoomRemoved_5024)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSpiderBeltApplied_9774)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSpiderBeltRemoved_9774)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGoblinRocketHelmetSuccess_22641)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNetOMaticSuccess_13120)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTidalCharmSuccess_835)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGnomishMindControlCapSuccess_13180)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGnomishRocketBootsApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGnomishRocketBootsRemoved)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGoblinRocketBootsApplied_8892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGoblinRocketBootsRemoved_8892)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSpeedApplied_14530)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSpeedRemoved_14530)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMithrilMechanicalDragonlingSuccess_23075)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInsigniaWarriorHunterShamanSuccess_5579)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInsigniaWarlockRogueSuccess_23273)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInsigniaMageSuccess_23274)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInsigniaPriestPaladinSuccess_23276)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInsigniaDruidSuccess_23277)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventArenaGrandMasterApplied_23506)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventArenaGrandMasterRemoved_23506)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSmolderwebsEyeSuccess_17330)

  -- start sod items
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGreaterInsigniaSuccess_438273)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBloodCakedInsigniaSuccess)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventVoidTouchedLeatherGauntletsApplied_429868)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventVoidTouchedLeatherGauntletsRemoved_429868)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventExtraplanarSpidersilkBootsApplied_428489)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventExtraplanarSpidersilkBootsRemoved_428489)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGneuroLinkedArcanoFilamentMonocleApplied_437327)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGneuroLinkedArcanoFilamentMonocleRemoved_437327)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGlowingGneuroLinkedCowlApplied_437349)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGlowingGneuroLinkedCowlRemoved_437349)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTemperedInterferenceNegatingHelmetApplied_437377)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTemperedInterferenceNegatingHelmetRemoved_437377)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGneuroConductiveChannelersHoodApplied_437357)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGneuroConductiveChannelersHoodRemoved_437357)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventReflectiveTruesilverBraincageApplied_437382)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventReflectiveTruesilverBraincageRemoved_437382)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGlowingHyperconductiveScaleCoifApplied_437362)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGlowingHyperconductiveScaleCoifRemoved_437362)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHyperconductiveGoldwrapApplied_437699)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHyperconductiveGoldwrapRemoved_437699)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHyperconductiveGoldwrapApplied_437698)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHyperconductiveGoldwrapRemoved_437698)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCatnipApplied_13494)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCatnipRemoved_13494)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDomesticatedAttackChickenSuccess_436069)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGniodinePillBottleApplied_435895)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGniodinePillBottleRemoved_435895)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventWirdalsHardenedCoreApplied_435359)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventWirdalsHardenedCoreRemoved_435359)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMiniaturizedFireExtinguisherSuccess_461231)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventWoodcarvedMoonstalkerApplied_461235)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventWoodcarvedMoonstalkerRemoved_461235)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGerminatingPoisonseedApplied_461227)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGerminatingPoisonseedRemoved_461227)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAccursedChaliceApplied_461224)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAccursedChaliceRemoved_461224)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMarlisEyeSuccess_467720)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowflameSwordApplied_461253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowflameSwordRemoved_461253)
end

function me.TestCombatEventEphemeralPowerApplied_23271()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventEphemeralPowerApplied_23271",
    testCategory,
    "Ephemeral Power",
    23271
  )
end

function me.TestCombatEventEphemeralPowerRemoved_23271()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventEphemeralPowerRemoved_23271",
    testCategory,
    "Ephemeral Power",
    23271
  )
end

function me.TestCombatEventFireReflectorApplied_23097()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFireReflectorApplied_23097",
    testCategory,
    "Fire Reflector",
    23097
  )
end

function me.TestCombatEventFireReflectorRemoved_23097()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFireReflectorRemoved_23097",
    testCategory,
    "Fire Reflector",
    23097
  )
end

function me.TestCombatEventFrostReflectorApplied_23131()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFrostReflectorApplied_23131",
    testCategory,
    "Frost Reflector",
    23131
  )
end

function me.TestCombatEventFrostReflectorRemoved_23131()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFrostReflectorRemoved_23131",
    testCategory,
    "Frost Reflector",
    23131
  )
end

function me.TestCombatEventShadowReflectorApplied_23132()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowReflectorApplied_23132",
    testCategory,
    "Shadow Reflector",
    23132
  )
end

function me.TestCombatEventShadowReflectorRemoved_23132()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowReflectorRemoved_23132",
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

function me.TestCombatEventNetOMaticSuccess_13120()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventNetOMaticSuccess_13120",
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

function me.TestCombatEventGnomishRocketBootsApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGnomishRocketBootsApplied",
    testCategory,
    "Gnomish Rocket Boots",
    13141
  )
end

function me.TestCombatEventGnomishRocketBootsRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGnomishRocketBootsRemoved",
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

function me.TestCombatEventSpeedApplied_14530()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSpeedApplied_14530",
    testCategory,
    "Speed",
    14530
  )
end

function me.TestCombatEventSpeedRemoved_14530()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSpeedRemoved_14530",
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

function me.TestCombatEventGreaterInsigniaSuccess_438273()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventGreaterInsigniaSuccess_438273",
    testCategory,
    UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde"
      and "Greater Insignia of the Alliance"
      or "Greater Insignia of the Horder",
    438273
  )
end

function me.TestCombatEventBloodCakedInsigniaSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBloodCakedInsigniaSuccess",
    testCategory,
    "Blood-Caked Insignia",
    474386
  )
end

function me.TestCombatEventVoidTouchedLeatherGauntletsApplied_429868()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventVoidTouchedLeatherGauntletsApplied_429868",
    testCategory,
    "Void-Touched Leather Gauntlets/Gloves",
    429868
  )
end

function me.TestCombatEventVoidTouchedLeatherGauntletsRemoved_429868()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventVoidTouchedLeatherGauntletsRemoved_429868",
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
