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
mod.testCombatEventsMageTbc = me

me.tag = "TestCombatEventsMageTbc"

local testCategory = "mage"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testcombatevent mage")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFireWardApplied_27128)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFireWardRemoved_27128)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFrostWardApplied_32796)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFrostWardRemoved_32796)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventManaShieldApplied_27131)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventManaShieldRemoved_27131)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventManaShieldRefresh_27131)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventIceBarrierApplied_27134)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventIceBarrierRemoved_27134)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventIceBarrierRefresh_27134)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventIceBarrierApplied_33405)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventIceBarrierRemoved_33405)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventIceBarrierRefresh_33405)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFrostNovaSuccess_27088)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlastWaveSuccess_27133)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlastWaveSuccess_33933)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventColdSnapSuccess_11958)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventIcyVeinsApplied_12472)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventIcyVeinsRemoved_12472)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventIceBlockApplied_45438)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventIceBlockRemoved_45438)
end

function me.TestCombatEventFireWardApplied_27128()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFireWardApplied_27128",
    testCategory,
    "Fire Ward",
    27128
  )
end

function me.TestCombatEventFireWardRemoved_27128()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFireWardRemoved_27128",
    testCategory,
    "Fire Ward",
    27128
  )
end

function me.TestCombatEventFrostWardApplied_32796()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFrostWardApplied_32796",
    testCategory,
    "Frost Ward",
    32796
  )
end

function me.TestCombatEventFrostWardRemoved_32796()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFrostWardRemoved_32796",
    testCategory,
    "Frost Ward",
    32796
  )
end

function me.TestCombatEventManaShieldApplied_27131()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventManaShieldApplied_27131",
    testCategory,
    "Mana Shield",
    27131
  )
end

function me.TestCombatEventManaShieldRemoved_27131()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventManaShieldRemoved_27131",
    testCategory,
    "Mana Shield",
    27131
  )
end

function me.TestCombatEventManaShieldRefresh_27131()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventManaShieldRefresh_27131",
    testCategory,
    "Mana Shield",
    27131
  )
end

function me.TestCombatEventIceBarrierApplied_27134()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventIceBarrierApplied_27134",
    testCategory,
    "Ice Barrier",
    27134
  )
end

function me.TestCombatEventIceBarrierRemoved_27134()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventIceBarrierRemoved_27134",
    testCategory,
    "Ice Barrier",
    27134
  )
end

function me.TestCombatEventIceBarrierRefresh_27134()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventIceBarrierRefresh_27134",
    testCategory,
    "Ice Barrier",
    27134
  )
end

function me.TestCombatEventIceBarrierApplied_33405()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventIceBarrierApplied_33405",
    testCategory,
    "Ice Barrier",
    33405
  )
end

function me.TestCombatEventIceBarrierRemoved_33405()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventIceBarrierRemoved_33405",
    testCategory,
    "Ice Barrier",
    33405
  )
end

function me.TestCombatEventIceBarrierRefresh_33405()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventIceBarrierRefresh_33405",
    testCategory,
    "Ice Barrier",
    33405
  )
end

function me.TestCombatEventFrostNovaSuccess_27088()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostNovaSuccess_27088",
    testCategory,
    "Frost Nova",
    27088
  )
end

function me.TestCombatEventBlastWaveSuccess_27133()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBlastWaveSuccess_27133",
    testCategory,
    "Blast Wave",
    27133
  )
end

function me.TestCombatEventBlastWaveSuccess_33933()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBlastWaveSuccess_33933",
    testCategory,
    "Blast Wave",
    33933
  )
end

function me.TestCombatEventColdSnapSuccess_11958()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventColdSnapSuccess_11958",
    testCategory,
    "Cold Snap",
    11958
  )
end

function me.TestCombatEventIcyVeinsApplied_12472()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventIcyVeinsApplied_12472",
    testCategory,
    "Icy Veins",
    12472
  )
end

function me.TestCombatEventIcyVeinsRemoved_12472()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventIcyVeinsRemoved_12472",
    testCategory,
    "Icy Veins",
    12472
  )
end

function me.TestCombatEventIceBlockApplied_45438()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventIceBlockApplied_45438",
    testCategory,
    "Ice Block",
    45438
  )
end

function me.TestCombatEventIceBlockRemoved_45438()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventIceBlockRemoved_45438",
    testCategory,
    "Ice Block",
    45438
  )
end
