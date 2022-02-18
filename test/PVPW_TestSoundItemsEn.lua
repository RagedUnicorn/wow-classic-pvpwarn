--[[
  MIT License

  Copyright (c) 2022 Michael Wiesendanger

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
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAuraOfProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAuraOfProtection)
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
