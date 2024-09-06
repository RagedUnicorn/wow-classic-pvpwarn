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

local mod = rgpvpw
local me = {}
mod.testSoundShamanEn = me

me.tag = "TestSoundShamanEn"

local testGroupName = "SoundShamanEn"
local testCategory = "shaman"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundElementalMastery)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownElementalMastery)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNaturesSwiftness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNaturesSwiftness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTremorTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPoisonCleansingTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGroundingTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireResistanceTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFlametongueTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGraceOfAirTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNatureResistanceTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneskinTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStrengthOfEarthTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWindfuryTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWindwallTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEarthbindTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireNovaTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMagmaTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSearingTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneclawTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostResistanceTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHealingStreamTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDiseaseCleansingTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaSpringTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaTideTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTranquilAirTotem)
  -- runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHealingRain)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAncestralGuidance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAncestralGuidance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEarthShield)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEarthShield)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWaterShield)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownWaterShield)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDecoyTotem)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemicProjection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMaelStromWeapon)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownMaelStromWeapon)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTidalWaves)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTidalWaves)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRiptide)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPowerSurge)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownPowerSurge)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFeralSpirit)
end

function me.TestSoundElementalMastery()
  mod.testHelper.TestSoundApplied(
    "TestSoundElementalMastery",
    testCategory,
    "Elemental Mastery"
  )
end

function me.TestSoundDownElementalMastery()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownElementalMastery",
    testCategory,
    "Elemental Mastery"
  )
end

function me.TestSoundNaturesSwiftness()
  mod.testHelper.TestSoundApplied(
    "TestSoundNaturesSwiftness",
    testCategory,
    "Nature's Swiftness"
  )
end

function me.TestSoundDownNaturesSwiftness()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownNaturesSwiftness",
    testCategory,
    "Nature's Swiftness"
  )
end

function me.TestSoundTremorTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundTremorTotem",
    testCategory,
    "Tremor Totem"
  )
end

function me.TestSoundPoisonCleansingTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPoisonCleansingTotem",
    testCategory,
    "Poison Cleansing Totem"
  )
end

function me.TestSoundGroundingTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundGroundingTotem",
    testCategory,
    "Grounding Totem"
  )
end

function me.TestSoundFireResistanceTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFireResistanceTotem",
    testCategory,
    "Fire Resistance Totem"
  )
end

function me.TestSoundFlametongueTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFlametongueTotem",
    testCategory,
    "Flametongue Totem"
  )
end

function me.TestSoundGraceOfAirTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundGraceOfAirTotem",
    testCategory,
    "Grace of Air Totem"
  )
end

function me.TestSoundNatureResistanceTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundNatureResistanceTotem",
    testCategory,
    "Nature Resistance Totem"
  )
end

function me.TestSoundStoneskinTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStoneskinTotem",
    testCategory,
    "Stoneskin Totem"
  )
end

function me.TestSoundStrengthOfEarthTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStrengthOfEarthTotem",
    testCategory,
    "Strength of Earth Totem"
  )
end

function me.TestSoundWindfuryTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundWindfuryTotem",
    testCategory,
    "Windfury Totem"
  )
end

function me.TestSoundWindwallTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundWindwallTotem",
    testCategory,
    "Windwall Totem"
  )
end

function me.TestSoundEarthbindTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundEarthbindTotem",
    testCategory,
    "Earthbind Totem"
  )
end

function me.TestSoundFireNovaTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFireNovaTotem",
    testCategory,
    "Fire Nova Totem"
  )
end

function me.TestSoundMagmaTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMagmaTotem",
    testCategory,
    "Magma Totem"
  )
end

function me.TestSoundSearingTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSearingTotem",
    testCategory,
    "Searing Totem"
  )
end

function me.TestSoundStoneclawTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStoneclawTotem",
    testCategory,
    "Stoneclaw Totem"
  )
end

function me.TestSoundFrostResistanceTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostResistanceTotem",
    testCategory,
    "Frost Resistance Totem"
  )
end

function me.TestSoundHealingStreamTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHealingStreamTotem",
    testCategory,
    "Healing Stream Totem"
  )
end

function me.TestSoundDiseaseCleansingTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDiseaseCleansingTotem",
    testCategory,
    "Disease Cleansing Totem"
  )
end

function me.TestSoundManaSpringTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundManaSpringTotem",
    testCategory,
    "Mana Spring Totem"
  )
end

function me.TestSoundManaTideTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundManaTideTotem",
    testCategory,
    "Mana Tide Totem"
  )
end

function me.TestSoundTranquilAirTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundTranquilAirTotem",
    testCategory,
    "Tranquil Air Totem"
  )
end

function me.TestSoundHealingRain()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHealingRain",
    testCategory,
    "Healing Rain"
  )
end

function me.TestSoundAncestralGuidance()
  mod.testHelper.TestSoundApplied(
    "TestSoundAncestralGuidance",
    testCategory,
    "Ancestral Guidance"
  )
end

function me.TestSoundDownAncestralGuidance()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAncestralGuidance",
    testCategory,
    "Ancestral Guidance"
  )
end

function me.TestSoundEarthShield()
  mod.testHelper.TestSoundApplied(
    "TestSoundEarthShield",
    testCategory,
    "Earth Shield"
  )
end

function me.TestSoundDownEarthShield()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEarthShield",
    testCategory,
    "Earth Shield"
  )
end

function me.TestSoundWaterShield()
  mod.testHelper.TestSoundApplied(
    "TestSoundWaterShield",
    testCategory,
    "Water Shield"
  )
end

function me.TestSoundDownWaterShield()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownWaterShield",
    testCategory,
    "Water Shield"
  )
end

function me.TestSoundDecoyTotem()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDecoyTotem",
    testCategory,
    "Decoy Totem"
  )
end

function me.TestSoundTotemicProjection()
  mod.testHelper.TestSoundSuccess(
    "TestSoundTotemicProjection",
    testCategory,
    "Totemic Projection"
  )
end

function me.TestSoundMaelStromWeapon()
  mod.testHelper.TestSoundApplied(
    "TestSoundMaelStromWeapon",
    testCategory,
    "Maelstrom Weapon"
  )
end

function me.TestSoundDownMaelStromWeapon()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownMaelStromWeapon",
    testCategory,
    "Maelstrom Weapon"
  )
end

function me.TestSoundTidalWaves()
  mod.testHelper.TestSoundApplied(
    "TestSoundTidalWaves",
    testCategory,
    "Tidal Waves"
  )
end

function me.TestSoundDownTidalWaves()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownTidalWaves",
    testCategory,
    "Tidal Waves"
  )
end

function me.TestSoundRiptide()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRiptide",
    testCategory,
    "Riptide"
  )
end

function me.TestSoundPowerSurge()
  mod.testHelper.TestSoundApplied(
    "TestSoundPowerSurge",
    testCategory,
    "Power Surge"
  )
end

function me.TestSoundDownPowerSurge()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownPowerSurge",
    testCategory,
    "Power Surge"
  )
end

function me.TestSoundFeralSpirit()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFeralSpirit",
    testCategory,
    "Feral Spirit"
  )
end
