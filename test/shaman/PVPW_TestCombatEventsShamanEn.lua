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

-- luacheck: ignore _

local mod = rgpvpw
local me = {}
mod.testCombatEventsShamanEn = me

me.tag = "TestCombatEventsShamanEn"

local testGroupName = "CombatEventsShamanEn"
local testCategory = "shaman"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventElementalMasteryApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventElementalMasteryRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesSwiftnessApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesSwiftnessRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPoisonCleansingTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTremorTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGroundingTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireResistanceTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFlametongueTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGraceOfAirTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNatureResistanceTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventStoneskinTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventStrengthOfEarthTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventWindfuryTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventWindwallTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEarthbindTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireNovaTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMagmaTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSearingTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventStoneclawTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostResistanceTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHealingStreamTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDiseaseCleansingTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaSpringTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaTideTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTranquilAirTotemSuccess)
  -- runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHealingRainSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAncestralGuidanceApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAncestralGuidanceRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEarthShieldApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEarthShieldRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventWaterShieldApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventWaterShieldRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDecoyTotemSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTotemicProjectionSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMaelstromWeaponApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMaelstromWeaponRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTidalWavesApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTidalWavesRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRiptideSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPowerSurgeApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPowerSurgeRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFeralSpiritSuccess)
end

function me.TestCombatEventElementalMasteryApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventElementalMasteryApplied",
    testCategory,
    "Elemental Mastery"
  )
end

function me.TestCombatEventElementalMasteryRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventElementalMasteryRemoved",
    testCategory,
    "Elemental Mastery"
  )
end

function me.TestCombatEventNaturesSwiftnessApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventNaturesSwiftnessApplied",
    testCategory,
    "Nature's Swiftness"
  )
end

function me.TestCombatEventNaturesSwiftnessRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventNaturesSwiftnessRemoved",
    testCategory,
    "Nature's Swiftness"
  )
end

function me.TestCombatEventTremorTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventTremorTotemSuccess",
    testCategory,
    "Tremor Totem"
  )
end

function me.TestCombatEventPoisonCleansingTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPoisonCleansingTotemSuccess",
    testCategory,
    "Poison Cleansing Totem"
  )
end

function me.TestCombatEventGroundingTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventGroundingTotemSuccess",
    testCategory,
    "Grounding Totem"
  )
end

function me.TestCombatEventFireResistanceTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireResistanceTotemSuccess",
    testCategory,
    "Fire Resistance Totem"
  )
end

function me.TestCombatEventFlametongueTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFlametongueTotemSuccess",
    testCategory,
    "Flametongue Totem"
  )
end

function me.TestCombatEventGraceOfAirTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventGraceOfAirTotemSuccess",
    testCategory,
    "Grace of Air Totem"
  )
end

function me.TestCombatEventNatureResistanceTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventNatureResistanceTotemSuccess",
    testCategory,
    "Nature Resistance Totem"
  )
end

function me.TestCombatEventStoneskinTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStoneskinTotemSuccess",
    testCategory,
    "Stoneskin Totem"
  )
end

function me.TestCombatEventStrengthOfEarthTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStrengthOfEarthTotemSuccess",
    testCategory,
    "Strength of Earth Totem"
  )
end

function me.TestCombatEventWindfuryTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventWindfuryTotemSuccess",
    testCategory,
    "Windfury Totem"
  )
end

function me.TestCombatEventWindwallTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventWindwallTotemSuccess",
    testCategory,
    "Windwall Totem"
  )
end

function me.TestCombatEventEarthbindTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventEarthbindTotemSuccess",
    testCategory,
    "Earthbind Totem"
  )
end

function me.TestCombatEventFireNovaTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireNovaTotemSuccess",
    testCategory,
    "Fire Nova Totem"
  )
end

function me.TestCombatEventMagmaTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMagmaTotemSuccess",
    testCategory,
    "Magma Totem"
  )
end

function me.TestCombatEventSearingTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSearingTotemSuccess",
    testCategory,
    "Searing Totem"
  )
end

function me.TestCombatEventStoneclawTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStoneclawTotemSuccess",
    testCategory,
    "Stoneclaw Totem"
  )
end

function me.TestCombatEventFrostResistanceTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostResistanceTotemSuccess",
    testCategory,
    "Frost Resistance Totem"
  )
end

function me.TestCombatEventHealingStreamTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHealingStreamTotemSuccess",
    testCategory,
    "Healing Stream Totem"
  )
end

function me.TestCombatEventDiseaseCleansingTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDiseaseCleansingTotemSuccess",
    testCategory,
    "Disease Cleansing Totem"
  )
end

function me.TestCombatEventManaSpringTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventManaSpringTotemSuccess",
    testCategory,
    "Mana Spring Totem"
  )
end

function me.TestCombatEventManaTideTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventManaTideTotemSuccess",
    testCategory,
    "Mana Tide Totem"
  )
end

function me.TestCombatEventTranquilAirTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventTranquilAirTotemSuccess",
    testCategory,
    "Tranquil Air Totem"
  )
end

function me.TestCombatEventHealingRainSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHealingRainSuccess",
    testCategory,
    "Healing Rain"
  )
end

function me.TestCombatEventAncestralGuidanceApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAncestralGuidanceApplied",
    testCategory,
    "Ancestral Guidance"
  )
end

function me.TestCombatEventAncestralGuidanceRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAncestralGuidanceRemoved",
    testCategory,
    "Ancestral Guidance"
  )
end

function me.TestCombatEventEarthShieldApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventEarthShieldApplied",
    testCategory,
    "Earth Shield"
  )
end

function me.TestCombatEventEarthShieldRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventEarthShieldRemoved",
    testCategory,
    "Earth Shield"
  )
end

function me.TestCombatEventWaterShieldApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventWaterShieldApplied",
    testCategory,
    "Water Shield"
  )
end

function me.TestCombatEventWaterShieldRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventWaterShieldRemoved",
    testCategory,
    "Water Shield"
  )
end

function me.TestCombatEventDecoyTotemSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDecoyTotemSuccess",
    testCategory,
    "Decoy Totem"
  )
end

function me.TestCombatEventTotemicProjectionSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventTotemicProjectionSuccess",
    testCategory,
    "Totemic Projection"
  )
end

function me.TestCombatEventMaelstromWeaponApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventMaelstromWeaponApplied",
    testCategory,
    "Maelstrom Weapon"
  )
end

function me.TestCombatEventMaelstromWeaponRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventMaelstromWeaponRemoved",
    testCategory,
    "Maelstrom Weapon"
  )
end

function me.TestCombatEventTidalWavesApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventTidalWavesApplied",
    testCategory,
    "Tidal Waves"
  )
end

function me.TestCombatEventTidalWavesRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventTidalWavesRemoved",
    testCategory,
    "Tidal Waves"
  )
end

function me.TestCombatEventRiptideSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRiptideSuccess",
    testCategory,
    "Riptide"
  )
end

function me.TestCombatEventPowerSurgeApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventPowerSurgeApplied",
    testCategory,
    "Power Surge"
  )
end

function me.TestCombatEventPowerSurgeRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventPowerSurgeRemoved",
    testCategory,
    "Power Surge"
  )
end

function me.TestCombatEventFeralSpiritSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFeralSpiritSuccess",
    testCategory,
    "Feral Spirit"
  )
end
