--[[
  MIT License

  Copyright (c) 2024 Michael Wiesendanger

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

-- luacheck: ignore _

local mod = rgpvpw
local me = {}
mod.testCombatEventsItemsEn = me

me.tag = "TestCombatEventsItemsEn"

local testGroupName = "CombatEventsItemsEn"
local testCategory = "items"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEphemeralPowerApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEphemeralPowerRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireReflectorApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireReflectorRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostReflectorApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostReflectorRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowReflectorApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowReflectorRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFleeApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFleeRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventImmuneRootApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventImmuneRootRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRecklessChargeSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNetOMaticSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTidalCharmSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGnomishMindControlCapSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGnomishRocketBootsApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGnomishRocketBootsRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGoblinRocketBootsApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGoblinRocketBootsRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSpeedApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSpeedRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMithrilMechanicalDragonlingSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventImmuneRootSnareStunSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventImmuneCharmFearPolymorphSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventImmuneFearPolymorphSnareSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventImmuneFearPolymorphStunSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventImmuneCharmFearStunSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPvpTrinketSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAuraOfProtectionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAuraOfProtectionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPoisonSuccess)
  -- sod items
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventVoidMadnessApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventVoidMadnessRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPlanarShiftApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPlanarShiftRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventChargedInspirationApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventChargedInspirationRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGneuroLogicalShockApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGneuroLogicalShockRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIntenseConcentrationApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIntenseConcentrationRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGneuromanticMeditationApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGneuromanticMeditationRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventReinforcedWillpowerApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventReinforcedWillpowerRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRadicalRadResistanceApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRadicalRadResistanceRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHyperconductiveShockApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHyperconductiveShockRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHasteApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHasteRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDomesticatedAttackChickenSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCoinFlipApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCoinFlipRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGniodineDispelApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGniodineDispelRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHardenedToTheCoreApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHardenedToTheCoreRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventExtinguishFireSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMoonstalkerFuryApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMoonstalkerFuryRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGuardianOfNatureApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGuardianOfNatureRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDemonTaintedBloodApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDemonTaintedBloodRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMarlisBrainInfestorsSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowflameFuryApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowflameFuryRemoved)
end

function me.TestCombatEventEphemeralPowerApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventEphemeralPowerApplied",
    testCategory,
    "Ephemeral Power"
  )
end

function me.TestCombatEventEphemeralPowerRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventEphemeralPowerRemoved",
    testCategory,
    "Ephemeral Power"
  )
end

function me.TestCombatEventFireReflectorApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFireReflectorApplied",
    testCategory,
    "Fire Reflector"
  )
end

function me.TestCombatEventFireReflectorRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFireReflectorRemoved",
    testCategory,
    "Fire Reflector"
  )
end

function me.TestCombatEventFrostReflectorApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFrostReflectorApplied",
    testCategory,
    "Frost Reflector"
  )
end

function me.TestCombatEventFrostReflectorRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFrostReflectorRemoved",
    testCategory,
    "Frost Reflector"
  )
end

function me.TestCombatEventShadowReflectorApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowReflectorApplied",
    testCategory,
    "Shadow Reflector"
  )
end

function me.TestCombatEventShadowReflectorRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowReflectorRemoved",
    testCategory,
    "Shadow Reflector"
  )
end

function me.TestCombatEventFleeApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFleeApplied",
    testCategory,
    "Flee"
  )
end

function me.TestCombatEventFleeRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFleeRemoved",
    testCategory,
    "Flee"
  )
end

function me.TestCombatEventImmuneRootApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventImmuneRootApplied",
    testCategory,
    "Immune Root"
  )
end

function me.TestCombatEventImmuneRootRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventImmuneRootRemoved",
    testCategory,
    "Immune Root"
  )
end

function me.TestCombatEventRecklessChargeSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRecklessChargeSuccess",
    testCategory,
    "Reckless Charge"
  )
end

function me.TestCombatEventNetOMaticSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventNetOMaticSuccess",
    testCategory,
    "Net-o-Matic"
  )
end

function me.TestCombatEventTidalCharmSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventTidalCharmSuccess",
    testCategory,
    "Tidal Charm"
  )
end

function me.TestCombatEventGnomishMindControlCapSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventGnomishMindControlCapSuccess",
    testCategory,
    "Gnomish Mind Control Cap"
  )
end

function me.TestCombatEventGnomishRocketBootsApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGnomishRocketBootsApplied",
    testCategory,
    "Gnomish Rocket Boots"
  )
end

function me.TestCombatEventGnomishRocketBootsRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGnomishRocketBootsRemoved",
    testCategory,
    "Gnomish Rocket Boots"
  )
end

function me.TestCombatEventGoblinRocketBootsApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGoblinRocketBootsApplied",
    testCategory,
    "Goblin Rocket Boots"
  )
end

function me.TestCombatEventGoblinRocketBootsRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGoblinRocketBootsRemoved",
    testCategory,
    "Goblin Rocket Boots"
  )
end

function me.TestCombatEventSpeedApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSpeedApplied",
    testCategory,
    "Speed"
  )
end

function me.TestCombatEventSpeedRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSpeedRemoved",
    testCategory,
    "Speed"
  )
end

function me.TestCombatEventMithrilMechanicalDragonlingSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMithrilMechanicalDragonlingSuccess",
    testCategory,
    "Mithril Mechanical Dragonling"
  )
end

-- insignia warrior/hunter/shaman
function me.TestCombatEventImmuneRootSnareStunSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventImmuneRootSnareStunSuccess",
    testCategory,
    "Immune Root/Snare/Stun"
  )
end

-- insignia warlock/rogue
function me.TestCombatEventImmuneCharmFearPolymorphSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventImmuneCharmFearPolymorphSuccess",
    testCategory,
    "Immune Charm/Fear/Polymorph"
  )
end

-- insignia mage
function me.TestCombatEventImmuneFearPolymorphSnareSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventImmuneFearPolymorphSnareSuccess",
    testCategory,
    "Immune Fear/Polymorph/Snare"
  )
end

-- insignia priest/paladin
function me.TestCombatEventImmuneFearPolymorphStunSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventImmuneFearPolymorphStunSuccess",
    testCategory,
    "Immune Fear/Polymorph/Stun"
  )
end

-- insignia druid
function me.TestCombatEventImmuneCharmFearStunSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventImmuneCharmFearStunSuccess",
    testCategory,
    "Immune Charm/Fear/Stun"
  )
end

-- greater insignia of the alliance/horde
function me.TestCombatEventPvpTrinketSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPvpTrinketSuccess",
    testCategory,
    "PvP Trinket"
  )
end

function me.TestCombatEventAuraOfProtectionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAuraOfProtectionApplied",
    testCategory,
    "Aura of Protection"
  )
end

function me.TestCombatEventAuraOfProtectionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAuraOfProtectionRemoved",
    testCategory,
    "Aura of Protection"
  )
end

function me.TestCombatEventPoisonSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPoisonSuccess",
    testCategory,
    "Poison"
  )
end

function me.TestCombatEventVoidMadnessApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventVoidMadnessApplied",
    testCategory,
    "Void Madness"
  )
end

function me.TestCombatEventVoidMadnessRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventVoidMadnessRemoved",
    testCategory,
    "Void Madness"
  )
end

function me.TestCombatEventPlanarShiftApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventPlanarShiftApplied",
    testCategory,
    "Planar Shift"
  )
end

function me.TestCombatEventPlanarShiftRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventPlanarShiftRemoved",
    testCategory,
    "Planar Shift"
  )
end

function me.TestCombatEventChargedInspirationApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventChargedInspirationApplied",
    testCategory,
    "Charged Inspiration"
  )
end

function me.TestCombatEventChargedInspirationRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventChargedInspirationRemoved",
    testCategory,
    "Charged Inspiration"
  )
end

function me.TestCombatEventGneuroLogicalShockApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGneuroLogicalShockApplied",
    testCategory,
    "Gneuro-Logical Shock"
  )
end

function me.TestCombatEventGneuroLogicalShockRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGneuroLogicalShockRemoved",
    testCategory,
    "Gneuro-Logical Shock"
  )
end

function me.TestCombatEventIntenseConcentrationApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventIntenseConcentrationApplied",
    testCategory,
    "Intense Concentration"
  )
end

function me.TestCombatEventIntenseConcentrationRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventIntenseConcentrationRemoved",
    testCategory,
    "Intense Concentration"
  )
end

function me.TestCombatEventGneuromanticMeditationApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGneuromanticMeditationApplied",
    testCategory,
    "Gneuromantic Meditation"
  )
end

function me.TestCombatEventGneuromanticMeditationRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGneuromanticMeditationRemoved",
    testCategory,
    "Gneuromantic Meditation"
  )
end

function me.TestCombatEventReinforcedWillpowerApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventReinforcedWillpowerApplied",
    testCategory,
    "Reinforced Willpower"
  )
end

function me.TestCombatEventReinforcedWillpowerRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventReinforcedWillpowerRemoved",
    testCategory,
    "Reinforced Willpower"
  )
end


function me.TestCombatEventRadicalRadResistanceApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventRadicalRadResistanceApplied",
    testCategory,
    "Radical Rad Resistance"
  )
end

function me.TestCombatEventRadicalRadResistanceRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventRadicalRadResistanceRemoved",
    testCategory,
    "Radical Rad Resistance"
  )
end

function me.TestCombatEventHyperconductiveShockApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventHyperconductiveShockApplied",
    testCategory,
    "Hyperconductive Shock"
  )
end

function me.TestCombatEventHyperconductiveShockRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventHyperconductiveShockRemoved",
    testCategory,
    "Hyperconductive Shock"
  )
end

function me.TestCombatEventHasteApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventHasteApplied",
    testCategory,
    "Haste"
  )
end

function me.TestCombatEventHasteRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventHasteRemoved",
    testCategory,
    "Haste"
  )
end

function me.TestCombatEventDomesticatedAttackChickenSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDomesticatedAttackChickenSuccess",
    testCategory,
    "Domesticated Attack Chicken"
  )
end

function me.TestCombatEventCoinFlipApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventCoinFlipApplied",
    testCategory,
    "Coin Flip"
  )
end

function me.TestCombatEventCoinFlipRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventCoinFlipRemoved",
    testCategory,
    "Coin Flip"
  )
end

function me.TestCombatEventGniodineDispelApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGniodineDispelApplied",
    testCategory,
    "Gniodine Dispel"
  )
end

function me.TestCombatEventGniodineDispelRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGniodineDispelRemoved",
    testCategory,
    "Gniodine Dispel"
  )
end

function me.TestCombatEventHardenedToTheCoreApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventHardenedToTheCoreApplied",
    testCategory,
    "Hardened to the Core"
  )
end

function me.TestCombatEventHardenedToTheCoreRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventHardenedToTheCoreRemoved",
    testCategory,
    "Hardened to the Core"
  )
end

function me.TestCombatEventExtinguishFireSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventExtinguishFireSuccess",
    testCategory,
    "Extinguish Fire"
  )
end

function me.TestCombatEventMoonstalkerFuryApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventMoonstalkerFuryApplied",
    testCategory,
    "Moonstalker Fury"
  )
end

function me.TestCombatEventMoonstalkerFuryRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventMoonstalkerFuryRemoved",
    testCategory,
    "Moonstalker Fury"
  )
end

function me.TestCombatEventGuardianOfNatureApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGuardianOfNatureApplied",
    testCategory,
    "Guardian of Nature"
  )
end

function me.TestCombatEventGuardianOfNatureRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGuardianOfNatureRemoved",
    testCategory,
    "Guardian of Nature"
  )
end

function me.TestCombatEventDemonTaintedBloodApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDemonTaintedBloodApplied",
    testCategory,
    "Demon Tainted Blood"
  )
end

function me.TestCombatEventDemonTaintedBloodRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventDemonTaintedBloodRemoved",
    testCategory,
    "Demon Tainted Blood"
  )
end

function me.TestCombatEventMarlisBrainInfestorsSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMarlisBrainInfestorsSuccess",
    testCategory,
    "Marlis' Brain Infestors"
  )
end

function me.TestCombatEventShadowflameFuryApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowflameFuryApplied",
    testCategory,
    "Shadowflame Fury"
  )
end

function me.TestCombatEventShadowflameFuryRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowflameFuryRemoved",
    testCategory,
    "Shadowflame Fury"
  )
end
