--[[
  MIT License

  Copyright (c) 2021 Michael Wiesendanger

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
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAuraOfProtectionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAuraOfProtectionRemoved)
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
