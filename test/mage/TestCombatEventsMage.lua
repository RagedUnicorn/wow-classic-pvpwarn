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

local mod = rgpvpw
local me = {}
mod.testCombatEventsMage = me

me.tag = "TestCombatEventsMage"

local testGroupName = "CombatEventsMage"
local testCategory = "mage"

function me.Test()
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testcombatevent mage")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBlockApplied_11958)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBlockRemoved_11958)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPolymorphSuccess_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPolymorphStart_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPolymorphSuccess_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPolymorphStart_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPolymorphSuccess_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPolymorphStart_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPolymorphSuccess_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPolymorphStart_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPolymorphSuccess_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPolymorphStart_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPolymorphSuccess_28272)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPolymorphStart_28272)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlinkSuccess_1953)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireWardApplied_10225)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireWardRemoved_10225)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireWardApplied_543)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireWardRemoved_543)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireWardApplied_8457)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireWardRemoved_8457)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireWardApplied_8458)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireWardRemoved_8458)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireWardApplied_10223)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireWardRemoved_10223)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostWardApplied_28609)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostWardRemoved_28609)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostWardApplied_6143)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostWardRemoved_6143)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostWardApplied_8461)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostWardRemoved_8461)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostWardApplied_8462)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostWardRemoved_8462)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostWardApplied_10177)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostWardRemoved_10177)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCounterspellSuccess_2139)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldApplied_10193)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldRemoved_10193)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldApplied_1463)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldRemoved_1463)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldApplied_8494)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldRemoved_8494)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldApplied_8495)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldRemoved_8495)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldApplied_10191)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldRemoved_10191)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldApplied_10192)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldRemoved_10192)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBarrierApplied_13033)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBarrierRemoved_13033)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBarrierApplied_11426)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBarrierRemoved_11426)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBarrierApplied_13031)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBarrierRemoved_13031)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBarrierApplied_13032)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBarrierRemoved_13032)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostNovaSuccess_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostNovaSuccess_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostNovaSuccess_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostNovaSuccess_6131)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventArcanePowerApplied_12042)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventArcanePowerRemoved_12042)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEvocationSuccess_12051)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPresenceOfMindApplied_12043)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPresenceOfMindRemoved_12043)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCombustionApplied_11129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCombustionRemoved_11129)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlastWaveSuccess_13021)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlastWaveSuccess_11113)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlastWaveSuccess_13018)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlastWaveSuccess_13019)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlastWaveSuccess_13020)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventColdSnapSuccess_12472)

  -- start runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFingersOfFrostApplied_400647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFingersOfFrostRemoved_400647)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIcyVeinsApplied_425121)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIcyVeinsRemoved_425121)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventArcaneSurgeSuccess_425124)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLivingBombSuccess_400613)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventChronostaticPreservationApplied_436516)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventChronostaticPreservationRemoved_436516)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLivingFlameSuccess_401556)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceLanceSuccess_400640)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDeepFreezeSuccess_428739)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostfireBoltSuccess_401502)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSpellfrostBoltSuccess_412532)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBalefireBoltSuccess_428878)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHotStreakApplied_400624)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHotStreakRemoved_400624)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBrainFreezeApplied_400731)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBrainFreezeRemoved_400731)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrozenOrbSuccess_440802)
end

function me.TestCombatEventIceBlockApplied_11958()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventIceBlockApplied_11958",
    testCategory,
    "Ice Block",
    11958
  )
end

function me.TestCombatEventIceBlockRemoved_11958()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventIceBlockRemoved_11958",
    testCategory,
    "Ice Block",
    11958
  )
end

function me.TestCombatEventPolymorphSuccess_12826()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPolymorphSuccess_12826",
    testCategory,
    "Polymorph",
    12826
  )
end

function me.TestCombatEventPolymorphStart_12826()
  mod.testHelper.TestCombatEventStart(
    "TestCombatEventPolymorphStart_12826",
    testCategory,
    "Polymorph",
    12826
  )
end

function me.TestCombatEventPolymorphSuccess_118()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPolymorphSuccess_118",
    testCategory,
    "Polymorph",
    118
  )
end

function me.TestCombatEventPolymorphStart_118()
  mod.testHelper.TestCombatEventStart(
    "TestCombatEventPolymorphStart_118",
    testCategory,
    "Polymorph",
    118
  )
end

function me.TestCombatEventPolymorphSuccess_12824()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPolymorphSuccess_12824",
    testCategory,
    "Polymorph",
    12824
  )
end

function me.TestCombatEventPolymorphStart_12824()
  mod.testHelper.TestCombatEventStart(
    "TestCombatEventPolymorphStart_12824",
    testCategory,
    "Polymorph",
    12824
  )
end

function me.TestCombatEventPolymorphSuccess_12825()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPolymorphSuccess_12825",
    testCategory,
    "Polymorph",
    12825
  )
end

function me.TestCombatEventPolymorphStart_12825()
  mod.testHelper.TestCombatEventStart(
    "TestCombatEventPolymorphStart_12825",
    testCategory,
    "Polymorph",
    12825
  )
end

function me.TestCombatEventPolymorphSuccess_28271()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPolymorphSuccess_28271",
    testCategory,
    "Polymorph",
    28271
  )
end

function me.TestCombatEventPolymorphStart_28271()
  mod.testHelper.TestCombatEventStart(
    "TestCombatEventPolymorphStart_28271",
    testCategory,
    "Polymorph",
    28271
  )
end

function me.TestCombatEventPolymorphSuccess_28272()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPolymorphSuccess_28272",
    testCategory,
    "Polymorph",
    28272
  )
end

function me.TestCombatEventPolymorphStart_28272()
  mod.testHelper.TestCombatEventStart(
    "TestCombatEventPolymorphStart_28272",
    testCategory,
    "Polymorph",
    28272
  )
end

function me.TestCombatEventBlinkSuccess_1953()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBlinkSuccess_1953",
    testCategory,
    "Blink",
    1953
  )
end

function me.TestCombatEventFireWardApplied_10225()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFireWardApplied_10225",
    testCategory,
    "Fire Ward",
    10225
  )
end

function me.TestCombatEventFireWardRemoved_10225()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFireWardRemoved_10225",
    testCategory,
    "Fire Ward",
    10225
  )
end

function me.TestCombatEventFireWardApplied_543()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFireWardApplied_543",
    testCategory,
    "Fire Ward",
    543
  )
end

function me.TestCombatEventFireWardRemoved_543()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFireWardRemoved_543",
    testCategory,
    "Fire Ward",
    543
  )
end

function me.TestCombatEventFireWardApplied_8457()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFireWardApplied_8457",
    testCategory,
    "Fire Ward",
    8457
  )
end

function me.TestCombatEventFireWardRemoved_8457()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFireWardRemoved_8457",
    testCategory,
    "Fire Ward",
    8457
  )
end

function me.TestCombatEventFireWardApplied_8458()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFireWardApplied_8458",
    testCategory,
    "Fire Ward",
    8458
  )
end

function me.TestCombatEventFireWardRemoved_8458()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFireWardRemoved_8458",
    testCategory,
    "Fire Ward",
    8458
  )
end

function me.TestCombatEventFireWardApplied_10223()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFireWardApplied_10223",
    testCategory,
    "Fire Ward",
    10223
  )
end

function me.TestCombatEventFireWardRemoved_10223()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFireWardRemoved_10223",
    testCategory,
    "Fire Ward",
    10223
  )
end

function me.TestCombatEventFrostWardApplied_28609()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFrostWardApplied_28609",
    testCategory,
    "Frost Ward",
    28609
  )
end

function me.TestCombatEventFrostWardRemoved_28609()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFrostWardRemoved_28609",
    testCategory,
    "Frost Ward",
    28609
  )
end

function me.TestCombatEventFrostWardApplied_6143()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFrostWardApplied_6143",
    testCategory,
    "Frost Ward",
    6143
  )
end

function me.TestCombatEventFrostWardRemoved_6143()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFrostWardRemoved_6143",
    testCategory,
    "Frost Ward",
    6143
  )
end

function me.TestCombatEventFrostWardApplied_8461()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFrostWardApplied_8461",
    testCategory,
    "Frost Ward",
    8461
  )
end

function me.TestCombatEventFrostWardRemoved_8461()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFrostWardRemoved_8461",
    testCategory,
    "Frost Ward",
    8461
  )
end

function me.TestCombatEventFrostWardApplied_8462()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFrostWardApplied_8462",
    testCategory,
    "Frost Ward",
    8462
  )
end

function me.TestCombatEventFrostWardRemoved_8462()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFrostWardRemoved_8462",
    testCategory,
    "Frost Ward",
    8462
  )
end

function me.TestCombatEventFrostWardApplied_10177()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFrostWardApplied_10177",
    testCategory,
    "Frost Ward",
    10177
  )
end

function me.TestCombatEventFrostWardRemoved_10177()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFrostWardRemoved_10177",
    testCategory,
    "Frost Ward",
    10177
  )
end

function me.TestCombatEventCounterspellSuccess_2139()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventCounterspellSuccess_2139",
    testCategory,
    "Counterspell",
    2139
  )
end

function me.TestCombatEventManaShieldApplied_10193()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventManaShieldApplied_10193",
    testCategory,
    "Mana Shield",
    10193
  )
end

function me.TestCombatEventManaShieldRemoved_10193()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventManaShieldRemoved_10193",
    testCategory,
    "Mana Shield",
    10193
  )
end

function me.TestCombatEventManaShieldApplied_1463()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventManaShieldApplied_1463",
    testCategory,
    "Mana Shield",
    1463
  )
end

function me.TestCombatEventManaShieldRemoved_1463()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventManaShieldRemoved_1463",
    testCategory,
    "Mana Shield",
    1463
  )
end

function me.TestCombatEventManaShieldApplied_8494()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventManaShieldApplied_8494",
    testCategory,
    "Mana Shield",
    8494
  )
end

function me.TestCombatEventManaShieldRemoved_8494()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventManaShieldRemoved_8494",
    testCategory,
    "Mana Shield",
    8494
  )
end

function me.TestCombatEventManaShieldApplied_8495()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventManaShieldApplied_8495",
    testCategory,
    "Mana Shield",
    8495
  )
end

function me.TestCombatEventManaShieldRemoved_8495()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventManaShieldRemoved_8495",
    testCategory,
    "Mana Shield",
    8495
  )
end

function me.TestCombatEventManaShieldApplied_10191()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventManaShieldApplied_10191",
    testCategory,
    "Mana Shield",
    10191
  )
end

function me.TestCombatEventManaShieldRemoved_10191()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventManaShieldRemoved_10191",
    testCategory,
    "Mana Shield",
    10191
  )
end

function me.TestCombatEventManaShieldApplied_10192()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventManaShieldApplied_10192",
    testCategory,
    "Mana Shield",
    10192
  )
end

function me.TestCombatEventManaShieldRemoved_10192()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventManaShieldRemoved_10192",
    testCategory,
    "Mana Shield",
    10192
  )
end

function me.TestCombatEventIceBarrierApplied_13033()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventIceBarrierApplied_13033",
    testCategory,
    "Ice Barrier",
    13033
  )
end

function me.TestCombatEventIceBarrierRemoved_13033()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventIceBarrierRemoved_13033",
    testCategory,
    "Ice Barrier",
    13033
  )
end

function me.TestCombatEventIceBarrierApplied_11426()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventIceBarrierApplied_11426",
    testCategory,
    "Ice Barrier",
    11426
  )
end

function me.TestCombatEventIceBarrierRemoved_11426()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventIceBarrierRemoved_11426",
    testCategory,
    "Ice Barrier",
    11426
  )
end

function me.TestCombatEventIceBarrierApplied_13031()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventIceBarrierApplied_13031",
    testCategory,
    "Ice Barrier",
    13031
  )
end

function me.TestCombatEventIceBarrierRemoved_13031()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventIceBarrierRemoved_13031",
    testCategory,
    "Ice Barrier",
    13031
  )
end

function me.TestCombatEventIceBarrierApplied_13032()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventIceBarrierApplied_13032",
    testCategory,
    "Ice Barrier",
    13032
  )
end

function me.TestCombatEventIceBarrierRemoved_13032()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventIceBarrierRemoved_13032",
    testCategory,
    "Ice Barrier",
    13032
  )
end

function me.TestCombatEventFrostNovaSuccess_10230()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostNovaSuccess_10230",
    testCategory,
    "Frost Nova",
    10230
  )
end

function me.TestCombatEventFrostNovaSuccess_122()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostNovaSuccess_122",
    testCategory,
    "Frost Nova",
    122
  )
end

function me.TestCombatEventFrostNovaSuccess_865()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostNovaSuccess_865",
    testCategory,
    "Frost Nova",
    865
  )
end

function me.TestCombatEventFrostNovaSuccess_6131()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostNovaSuccess_6131",
    testCategory,
    "Frost Nova",
    6131
  )
end

function me.TestCombatEventArcanePowerApplied_12042()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventArcanePowerApplied_12042",
    testCategory,
    "Arcane Power",
    12042
  )
end

function me.TestCombatEventArcanePowerRemoved_12042()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventArcanePowerRemoved_12042",
    testCategory,
    "Arcane Power",
    12042
  )
end

function me.TestCombatEventEvocationSuccess_12051()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventEvocationSuccess_12051",
    testCategory,
    "Evocation",
    12051
  )
end

function me.TestCombatEventPresenceOfMindApplied_12043()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventPresenceOfMindApplied_12043",
    testCategory,
    "Presence of Mind",
    12043
  )
end

function me.TestCombatEventPresenceOfMindRemoved_12043()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventPresenceOfMindRemoved_12043",
    testCategory,
    "Presence of Mind",
    12043
  )
end

function me.TestCombatEventCombustionApplied_11129()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventCombustionApplied_11129",
    testCategory,
    "Combustion",
    11129
  )
end

function me.TestCombatEventCombustionRemoved_11129()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventCombustionRemoved_11129",
    testCategory,
    "Combustion",
    11129
  )
end

function me.TestCombatEventBlastWaveSuccess_13021()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBlastWaveSuccess_13021",
    testCategory,
    "Blast Wave",
    13021
  )
end

function me.TestCombatEventBlastWaveSuccess_11113()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBlastWaveSuccess_11113",
    testCategory,
    "Blast Wave",
    11113
  )
end

function me.TestCombatEventBlastWaveSuccess_13018()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBlastWaveSuccess_13018",
    testCategory,
    "Blast Wave",
    13018
  )
end

function me.TestCombatEventBlastWaveSuccess_13019()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBlastWaveSuccess_13019",
    testCategory,
    "Blast Wave",
    13019
  )
end

function me.TestCombatEventBlastWaveSuccess_13020()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBlastWaveSuccess_13020",
    testCategory,
    "Blast Wave",
    13020
  )
end

function me.TestCombatEventColdSnapSuccess_12472()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventColdSnapSuccess_12472",
    testCategory,
    "Cold Snap",
    12472
  )
end

function me.TestCombatEventFingersOfFrostApplied_400647()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFingersOfFrostApplied_400647",
    testCategory,
    "Fingers of Frost",
    400647
  )
end

function me.TestCombatEventFingersOfFrostRemoved_400647()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFingersOfFrostRemoved_400647",
    testCategory,
    "Fingers of Frost",
    400647
  )
end

function me.TestCombatEventIcyVeinsApplied_425121()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventIcyVeinsApplied_425121",
    testCategory,
    "Icy Veins",
    425121
  )
end

function me.TestCombatEventIcyVeinsRemoved_425121()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventIcyVeinsRemoved_425121",
    testCategory,
    "Icy Veins",
    425121
  )
end

function me.TestCombatEventArcaneSurgeSuccess_425124()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventArcaneSurgeSuccess_425124",
    testCategory,
    "Arcane Surge",
    425124
  )
end

function me.TestCombatEventLivingBombSuccess_400613()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventLivingBombSuccess_400613",
    testCategory,
    "Living Bomb",
    400613
  )
end

function me.TestCombatEventChronostaticPreservationApplied_436516()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventChronostaticPreservationApplied_436516",
    testCategory,
    "Chronostatic Preservation",
    436516
  )
end

function me.TestCombatEventChronostaticPreservationRemoved_436516()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventChronostaticPreservationRemoved_436516",
    testCategory,
    "Chronostatic Preservation",
    436516
  )
end

function me.TestCombatEventLivingFlameSuccess_401556()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventLivingFlameSuccess_401556",
    testCategory,
    "Living Flame",
    401556
  )
end

function me.TestCombatEventIceLanceSuccess_400640()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventIceLanceSuccess_400640",
    testCategory,
    "Ice Lance",
    400640
  )
end

function me.TestCombatEventDeepFreezeSuccess_428739()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDeepFreezeSuccess_428739",
    testCategory,
    "Deep Freeze",
    428739
  )
end

function me.TestCombatEventFrostfireBoltSuccess_401502()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostfireBoltSuccess_401502",
    testCategory,
    "Frostfire Bolt",
    401502
  )
end

function me.TestCombatEventSpellfrostBoltSuccess_412532()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSpellfrostBoltSuccess_412532",
    testCategory,
    "Spellfrost Bolt",
    412532
  )
end

function me.TestCombatEventBalefireBoltSuccess_428878()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBalefireBoltSuccess_428878",
    testCategory,
    "Balefire Bolt",
    428878
  )
end

function me.TestCombatEventHotStreakApplied_400624()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventHotStreakApplied_400624",
    testCategory,
    "Hot Streak",
    400624
  )
end

function me.TestCombatEventHotStreakRemoved_400624()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventHotStreakRemoved_400624",
    testCategory,
    "Hot Streak",
    400624
  )
end

function me.TestCombatEventBrainFreezeApplied_400731()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBrainFreezeApplied_400731",
    testCategory,
    "Brain Freeze",
    400731
  )
end

function me.TestCombatEventBrainFreezeRemoved_400731()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBrainFreezeRemoved_400731",
    testCategory,
    "Brain Freeze",
    400731
  )
end

function me.TestCombatEventFrozenOrbSuccess_440802()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrozenOrbSuccess_440802",
    testCategory,
    "Frozen Orb",
    440802
  )
end
