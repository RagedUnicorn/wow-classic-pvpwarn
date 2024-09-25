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
mod.testSoundItemsEn = me

me.tag = "TestSoundItemsEn"

local testGroupName = "SoundItemsEn"
local testCategory = "items"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEphemeralPower)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEphemeralPower)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireReflector)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFireReflector)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostReflector)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostReflector)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowReflector)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowReflector)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFlee)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFlee)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmuneRoot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownImmuneRoot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRecklessCharge)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNetOMatic)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTidalCharm)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGnomishMindControlCap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGnomishRocketBoots)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGnomishRocketBoots)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGoblinRocketBoots)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGoblinRocketBoots)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSpeed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSpeed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMithrilMechanicalDragonling)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownMithrilMechanicalDragonling)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmuneRootSnareStun)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmuneCharmFearPolymorph)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmuneFearPolymorphSnare)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmuneFearPolymorphStun)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmuneCharmFearStun)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPvpTrinket)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAuraOfProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAuraOfProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPoison)
  -- sod items
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVoidMadness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownVoidMadness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPlanarShift)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownPlanarShift)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundChargedInspiration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownChargedInspiration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGneuroLogicalShock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGneuroLogicalShock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntenseConcentration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIntenseConcentration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGneuromanticMeditation)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGneuromanticMeditation)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundReinforcedWillpower)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownReinforcedWillpower)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRadicalRadResistance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRadicalRadResistance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHyperconductiveShock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownHyperconductiveShock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHaste)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownHaste)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDomesticatedAttackChicken)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCoinFlip)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownCoinFlip)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGniodineDispel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGniodineDispel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHardenedToTheCore)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownHardenedToTheCore)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundExtinguishFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMoonstalkerFury)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownMoonstalkerFury)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGuardianOfNature)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGuardianOfNature)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDemonTaintedBlood)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDemonTaintedBlood)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMarlisBrainInfestors)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowflameFury)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowflameFury)
end

function me.TestSoundEphemeralPower()
  mod.testHelper.TestSoundApplied(
    "TestSoundEphemeralPower",
    testCategory,
    "Ephemeral Power"
  )
end

function me.TestSoundDownEphemeralPower()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEphemeralPower",
    testCategory,
    "Ephemeral Power"
  )
end

function me.TestSoundFireReflector()
  mod.testHelper.TestSoundApplied(
    "TestSoundFireReflector",
    testCategory,
    "Fire Reflector"
  )
end

function me.TestSoundDownFireReflector()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFireReflector",
    testCategory,
    "Fire Reflector"
  )
end

function me.TestSoundFrostReflector()
  mod.testHelper.TestSoundApplied(
    "TestSoundFrostReflector",
    testCategory,
    "Frost Reflector"
  )
end

function me.TestSoundDownFrostReflector()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFrostReflector",
    testCategory,
    "Frost Reflector"
  )
end

function me.TestSoundShadowReflector()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowReflector",
    testCategory,
    "Shadow Reflector"
  )
end

function me.TestSoundDownShadowReflector()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowReflector",
    testCategory,
    "Shadow Reflector"
  )
end

function me.TestSoundFlee()
  mod.testHelper.TestSoundApplied(
    "TestSoundFlee",
    testCategory,
    "Flee"
  )
end

function me.TestSoundDownFlee()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFlee",
    testCategory,
    "Flee"
  )
end

function me.TestSoundImmuneRoot()
  mod.testHelper.TestSoundApplied(
    "TestSoundImmuneRoot",
    testCategory,
    "Immune Root"
  )
end

function me.TestSoundDownImmuneRoot()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownImmuneRoot",
    testCategory,
    "Immune Root"
  )
end

function me.TestSoundRecklessCharge()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRecklessCharge",
    testCategory,
    "Reckless Charge"
  )
end

function me.TestSoundNetOMatic()
  mod.testHelper.TestSoundSuccess(
    "TestSoundNetOMatic",
    testCategory,
    "Net-o-Matic"
  )
end

function me.TestSoundTidalCharm()
  mod.testHelper.TestSoundSuccess(
    "TestSoundTidalCharm",
    testCategory,
    "Tidal Charm"
  )
end

function me.TestSoundGnomishMindControlCap()
  mod.testHelper.TestSoundSuccess(
    "TestSoundGnomishMindControlCap",
    testCategory,
    "Gnomish Mind Control Cap"
  )
end

function me.TestSoundGnomishRocketBoots()
  mod.testHelper.TestSoundApplied(
    "TestSoundGnomishRocketBoots",
    testCategory,
    "Gnomish Rocket Boots"
  )
end

function me.TestSoundDownGnomishRocketBoots()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGnomishRocketBoots",
    testCategory,
    "Gnomish Rocket Boots"
  )
end

function me.TestSoundGoblinRocketBoots()
  mod.testHelper.TestSoundApplied(
    "TestSoundGoblinRocketBoots",
    testCategory,
    "Goblin Rocket Boots"
  )
end

function me.TestSoundDownGoblinRocketBoots()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGoblinRocketBoots",
    testCategory,
    "Goblin Rocket Boots"
  )
end

function me.TestSoundSpeed()
  mod.testHelper.TestSoundApplied(
    "TestSoundSpeed",
    testCategory,
    "Speed"
  )
end

function me.TestSoundDownSpeed()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSpeed",
    testCategory,
    "Speed"
  )
end

function me.TestSoundMithrilMechanicalDragonling()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMithrilMechanicalDragonling",
    testCategory,
    "Mithril Mechanical Dragonling"
  )
end

-- insignia warrior/hunter/shaman
function me.TestSoundImmuneRootSnareStun()
  mod.testHelper.TestSoundSuccess(
    "TestSoundImmuneRootSnareStun",
    testCategory,
    "Immune Root/Snare/Stun"
  )
end

-- insignia warlock/rogue
function me.TestSoundImmuneCharmFearPolymorph()
  mod.testHelper.TestSoundSuccess(
    "TestSoundImmuneCharmFearPolymorph",
    testCategory,
    "Immune Charm/Fear/Polymorph"
  )
end

-- insignia mage
function me.TestSoundImmuneFearPolymorphSnare()
  mod.testHelper.TestSoundSuccess(
    "TestSoundImmuneFearPolymorphSnare",
    testCategory,
    "Immune Fear/Polymorph/Snare"
  )
end

-- insignia priest/paladin
function me.TestSoundImmuneFearPolymorphStun()
  mod.testHelper.TestSoundSuccess(
    "TestSoundImmuneFearPolymorphStun",
    testCategory,
    "Immune Fear/Polymorph/Stun"
  )
end

-- insignia druid
function me.TestSoundImmuneCharmFearStun()
  mod.testHelper.TestSoundSuccess(
    "TestSoundImmuneCharmFearStun",
    testCategory,
    "Immune Charm/Fear/Stun"
  )
end

-- greater insignia of the alliance/horde
function me.TestSoundPvpTrinket()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPvpTrinket",
    testCategory,
    "PvP Trinket"
  )
end

function me.TestSoundAuraOfProtection()
  mod.testHelper.TestSoundApplied(
    "TestSoundAuraOfProtection",
    testCategory,
    "Aura of Protection"
  )
end

function me.TestSoundDownAuraOfProtection()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAuraOfProtection",
    testCategory,
    "Aura of Protection"
  )
end

function me.TestSoundPoison()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPoison",
    testCategory,
    "Poison"
  )
end

function me.TestSoundVoidMadness()
  mod.testHelper.TestSoundApplied(
    "TestSoundVoidMadness",
    testCategory,
    "Void Madness"
  )
end

function me.TestSoundDownVoidMadness()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownVoidMadness",
    testCategory,
    "Void Madness"
  )
end

function me.TestSoundPlanarShift()
  mod.testHelper.TestSoundApplied(
    "TestSoundPlanarShift",
    testCategory,
    "Planar Shift"
  )
end

function me.TestSoundDownPlanarShift()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownPlanarShift",
    testCategory,
    "Planar Shift"
  )
end

function me.TestSoundChargedInspiration()
  mod.testHelper.TestSoundApplied(
    "TestSoundChargedInspiration",
    testCategory,
    "Charged Inspiration"
  )
end

function me.TestSoundDownChargedInspiration()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownChargedInspiration",
    testCategory,
    "Charged Inspiration"
  )
end

function me.TestSoundGneuroLogicalShock()
  mod.testHelper.TestSoundApplied(
    "TestSoundGneuroLogicalShock",
    testCategory,
    "Gneuro-Logical Shock"
  )
end

function me.TestSoundDownGneuroLogicalShock()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGneuroLogicalShock",
    testCategory,
    "Gneuro-Logical Shock"
  )
end

function me.TestSoundIntenseConcentration()
  mod.testHelper.TestSoundApplied(
    "TestSoundIntenseConcentration",
    testCategory,
    "Intense Concentration"
  )
end

function me.TestSoundDownIntenseConcentration()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownIntenseConcentration",
    testCategory,
    "Intense Concentration"
  )
end


function me.TestSoundGneuromanticMeditation()
  mod.testHelper.TestSoundApplied(
    "TestSoundGneuromanticMeditation",
    testCategory,
    "Gneuromantic Meditation"
  )
end

function me.TestSoundDownGneuromanticMeditation()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGneuromanticMeditation",
    testCategory,
    "Gneuromantic Meditation"
  )
end

function me.TestSoundReinforcedWillpower()
  mod.testHelper.TestSoundApplied(
    "TestSoundReinforcedWillpower",
    testCategory,
    "Reinforced Willpower"
  )
end

function me.TestSoundDownReinforcedWillpower()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownReinforcedWillpower",
    testCategory,
    "Reinforced Willpower"
  )
end

function me.TestSoundRadicalRadResistance()
  mod.testHelper.TestSoundApplied(
    "TestSoundRadicalRadResistance",
    testCategory,
    "Radical Rad Resistance"
  )
end

function me.TestSoundDownRadicalRadResistance()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownRadicalRadResistance",
    testCategory,
    "Radical Rad Resistance"
  )
end

function me.TestSoundHyperconductiveShock()
  mod.testHelper.TestSoundApplied(
    "TestSoundHyperconductiveShock",
    testCategory,
    "Hyperconductive Shock"
  )
end

function me.TestSoundDownHyperconductiveShock()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownHyperconductiveShock",
    testCategory,
    "Hyperconductive Shock"
  )
end

function me.TestSoundHaste()
  mod.testHelper.TestSoundApplied(
    "TestSoundHaste",
    testCategory,
    "Haste"
  )
end

function me.TestSoundDownHaste()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownHaste",
    testCategory,
    "Haste"
  )
end

function me.TestSoundDomesticatedAttackChicken()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDomesticatedAttackChicken",
    testCategory,
    "Domesticated Attack Chicken"
  )
end

function me.TestSoundCoinFlip()
  mod.testHelper.TestSoundApplied(
    "TestSoundCoinFlip",
    testCategory,
    "Coin Flip"
  )
end

function me.TestSoundDownCoinFlip()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownCoinFlip",
    testCategory,
    "Coin Flip"
  )
end

function me.TestSoundGniodineDispel()
  mod.testHelper.TestSoundApplied(
    "TestSoundGniodineDispel",
    testCategory,
    "Gniodine Dispel"
  )
end

function me.TestSoundDownGniodineDispel()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGniodineDispel",
    testCategory,
    "Gniodine Dispel"
  )
end

function me.TestSoundHardenedToTheCore()
  mod.testHelper.TestSoundApplied(
    "TestSoundHardenedToTheCore",
    testCategory,
    "Hardened to the Core"
  )
end

function me.TestSoundDownHardenedToTheCore()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownHardenedToTheCore",
    testCategory,
    "Hardened to the Core"
  )
end

function me.TestSoundExtinguishFire()
  mod.testHelper.TestSoundSuccess(
    "TestSoundExtinguishFire",
    testCategory,
    "Extinguish Fire"
  )
end

function me.TestSoundMoonstalkerFury()
  mod.testHelper.TestSoundApplied(
    "TestSoundMoonstalkerFury",
    testCategory,
    "Moonstalker Fury"
  )
end

function me.TestSoundDownMoonstalkerFury()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownMoonstalkerFury",
    testCategory,
    "Moonstalker Fury"
  )
end

function me.TestSoundGuardianOfNature()
  mod.testHelper.TestSoundApplied(
    "TestSoundGuardianOfNature",
    testCategory,
    "Guardian of Nature"
  )
end

function me.TestSoundDownGuardianOfNature()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGuardianOfNature",
    testCategory,
    "Guardian of Nature"
  )
end

function me.TestSoundDemonTaintedBlood()
  mod.testHelper.TestSoundApplied(
    "TestSoundDemonTaintedBlood",
    testCategory,
    "Demon Tainted Blood"
  )
end

function me.TestSoundDownDemonTaintedBlood()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDemonTaintedBlood",
    testCategory,
    "Demon Tainted Blood"
  )
end

function me.TestSoundMarlisBrainInfestors()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMarlisBrainInfestors",
    testCategory,
    "Marlis' Brain Infestors"
  )
end

function me.TestSoundShadowflameFury()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowflameFury",
    testCategory,
    "Shadowflame Fury"
  )
end

function me.TestSoundDownShadowflameFury()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowflameFury",
    testCategory,
    "Shadowflame Fury"
  )
end
