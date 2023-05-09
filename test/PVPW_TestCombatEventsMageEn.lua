--[[
  MIT License

  Copyright (c) 2023 Michael Wiesendanger

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
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
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
