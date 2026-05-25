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
mod.testCombatEventsMageSod = me

me.tag = "TestCombatEventsMageSod"

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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFingersOfFrostApplied_400647)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFingersOfFrostRemoved_400647)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventIcyVeinsApplied_425121)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventIcyVeinsRemoved_425121)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventArcaneSurgeSuccess_425124)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventLivingBombSuccess_400613)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventChronostaticPreservationApplied_436516)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventChronostaticPreservationRemoved_436516)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventLivingFlameSuccess_401556)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventIceLanceSuccess_400640)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDeepFreezeSuccess_428739)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFrostfireBoltSuccess_401502)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSpellfrostBoltSuccess_412532)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBalefireBoltSuccess_428878)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHotStreakApplied_400624)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHotStreakRemoved_400624)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBrainFreezeApplied_400731)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBrainFreezeRemoved_400731)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFrozenOrbSuccess_440802)
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
