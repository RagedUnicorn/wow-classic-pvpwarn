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
mod.testCombatEventsMageEn = me

me.tag = "TestCombatEventsMageEn"

local testGroupName = "CombatEventsMageEn"
local testCategory = "mage"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBlockApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBlockRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPolymorphSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPolymorphStart)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlinkSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireWardApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireWardRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostWardApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostWardRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCounterspellSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldRefresh)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBarrierApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBarrierRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBarrierRefresh)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostNovaSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventArcanePowerApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventArcanePowerRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEvocationSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPresenceOfMindApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPresenceOfMindRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCombustionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCombustionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlastWaveSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventColdSnapSuccess)
  -- runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFingersOfFrostApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFingersOfFrostRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIcyVeinsApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIcyVeinsRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventArcaneSurgeSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLivingBombSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventChronostaticPreservationApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventChronostaticPreservationRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLivingFlameSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceLanceSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDeepFreezeSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostfireBoltSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSpellfrostBoltSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBalefireBoltSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHotStreakApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHotStreakRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireballApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireballRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrozenOrbSuccess)
end

function me.TestCombatEventIceBlockApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventIceBlockApplied",
    testCategory,
    "Ice Block"
  )
end

function me.TestCombatEventIceBlockRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventIceBlockRemoved",
    testCategory,
    "Ice Block"
  )
end

function me.TestCombatEventPolymorphSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPolymorphSuccess",
    testCategory,
    "Polymorph"
  )
end

function me.TestCombatEventPolymorphStart()
  mod.testHelper.TestCombatEventStart(
    "TestCombatEventPolymorphStart",
    testCategory,
    "Polymorph"
  )
end

function me.TestCombatEventBlinkSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBlinkSuccess",
    testCategory,
    "Blink"
  )
end

function me.TestCombatEventFireWardApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFireWardApplied",
    testCategory,
    "Fire Ward"
  )
end

function me.TestCombatEventFireWardRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFireWardRemoved",
    testCategory,
    "Fire Ward"
  )
end

function me.TestCombatEventFrostWardApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFrostWardApplied",
    testCategory,
    "Frost Ward"
  )
end

function me.TestCombatEventFrostWardRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFrostWardRemoved",
    testCategory,
    "Frost Ward"
  )
end

function me.TestCombatEventCounterspellSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventCounterspellSuccess",
    testCategory,
    "Counterspell"
  )
end

function me.TestCombatEventManaShieldApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventManaShieldApplied",
    testCategory,
    "Mana Shield"
  )
end

function me.TestCombatEventManaShieldRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventManaShieldRemoved",
    testCategory,
    "Mana Shield"
  )
end

function me.TestCombatEventManaShieldRefresh()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventManaShieldRefresh",
    testCategory,
    "Mana Shield"
  )
end

function me.TestCombatEventIceBarrierApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventIceBarrierApplied",
    testCategory,
    "Ice Barrier"
  )
end

function me.TestCombatEventIceBarrierRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventIceBarrierRemoved",
    testCategory,
    "Ice Barrier"
  )
end

function me.TestCombatEventIceBarrierRefresh()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventIceBarrierRefresh",
    testCategory,
    "Ice Barrier"
  )
end

function me.TestCombatEventFrostNovaSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostNovaSuccess",
    testCategory,
    "Frost Nova"
  )
end

function me.TestCombatEventArcanePowerApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventArcanePowerApplied",
    testCategory,
    "Arcane Power"
  )
end

function me.TestCombatEventArcanePowerRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventArcanePowerRemoved",
    testCategory,
    "Arcane Power"
  )
end

function me.TestCombatEventEvocationSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventEvocationSuccess",
    testCategory,
    "Evocation"
  )
end

function me.TestCombatEventPresenceOfMindApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventPresenceOfMindApplied",
    testCategory,
    "Presence of Mind"
  )
end

function me.TestCombatEventPresenceOfMindRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventPresenceOfMindRemoved",
    testCategory,
    "Presence of Mind"
  )
end

function me.TestCombatEventCombustionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventCombustionApplied",
    testCategory,
    "Combustion"
  )
end

function me.TestCombatEventCombustionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventCombustionRemoved",
    testCategory,
    "Combustion"
  )
end

function me.TestCombatEventBlastWaveSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBlastWaveSuccess",
    testCategory,
    "Blast Wave"
  )
end

function me.TestCombatEventColdSnapSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventColdSnapSuccess",
    testCategory,
    "Cold Snap"
  )
end

function me.TestCombatEventFingersOfFrostApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFingersOfFrostApplied",
    testCategory,
    "Fingers of Frost"
  )
end

function me.TestCombatEventFingersOfFrostRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFingersOfFrostRemoved",
    testCategory,
    "Fingers of Frost"
  )
end

function me.TestCombatEventIcyVeinsApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventIcyVeinsApplied",
    testCategory,
    "Icy Veins"
  )
end

function me.TestCombatEventIcyVeinsRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventIcyVeinsRemoved",
    testCategory,
    "Icy Veins"
  )
end

function me.TestCombatEventArcaneSurgeSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventArcaneSurgeSuccess",
    testCategory,
    "Arcane Surge"
  )
end

function me.TestCombatEventLivingBombSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventLivingBombSuccess",
    testCategory,
    "Living Bomb"
  )
end

function me.TestCombatEventChronostaticPreservationApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventChronostaticPreservationApplied",
    testCategory,
    "Chronostatic Preservation"
  )
end

function me.TestCombatEventChronostaticPreservationRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventChronostaticPreservationRemoved",
    testCategory,
    "Chronostatic Preservation"
  )
end

function me.TestCombatEventLivingFlameSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventLivingFlameSuccess",
    testCategory,
    "Living Flame"
  )
end

function me.TestCombatEventIceLanceSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventIceLanceSuccess",
    testCategory,
    "Ice Lance"
  )
end

function me.TestCombatEventDeepFreezeSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDeepFreezeSuccess",
    testCategory,
    "Deep Freeze"
  )
end

function me.TestCombatEventFrostfireBoltSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostfireBoltSuccess",
    testCategory,
    "Frostfire Bolt"
  )
end

function me.TestCombatEventSpellfrostBoltSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSpellfrostBoltSuccess",
    testCategory,
    "Spellfrost Bolt"
  )
end

function me.TestCombatEventBalefireBoltSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBalefireBoltSuccess",
    testCategory,
    "Balefire Bolt"
  )
end

function me.TestCombatEventHotStreakApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventHotStreakApplied",
    testCategory,
    "Hot Streak"
  )
end

function me.TestCombatEventHotStreakRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventHotStreakRemoved",
    testCategory,
    "Hot Streak"
  )
end

function me.TestCombatEventFireballApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFireballApplied",
    testCategory,
    "Fireball"
  )
end

function me.TestCombatEventFireballRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFireballRemoved",
    testCategory,
    "Fireball"
  )
end

function me.TestCombatEventFrozenOrbSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrozenOrbSuccess",
    testCategory,
    "Frozen Orb"
  )
end
