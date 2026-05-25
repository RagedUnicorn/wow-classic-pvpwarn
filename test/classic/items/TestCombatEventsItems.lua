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
mod.testCombatEventsItemsClassic = me

me.tag = "TestCombatEventsItemsClassic"

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
