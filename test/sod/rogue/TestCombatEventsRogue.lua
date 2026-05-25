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
mod.testCombatEventsRogueSod = me

me.tag = "TestCombatEventsRogueSod"

local testCategory = "rogue"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testcombatevent rogue")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventQuickDrawSuccess_398196)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBetweenTheEyesSuccess_400009)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBladeDanceApplied_400012)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBladeDanceRemoved_400012)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMutilateSuccess_399960)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowstrikeSuccess_399985)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSaberSlashSuccess_424785)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowstepSuccess_400029)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPoisonedKnifeSuccess_425012)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShurikenTossSuccess_399986)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEnvenomSuccess_399963)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMainGaucheSuccess_424919)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMasterOfSubtletyApplied_425096)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMasterOfSubtletyRemoved_425096)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventCutthroatApplied_462708)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventCutthroatRemoved_462708)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlunderbussSuccess_436610)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventCrimsonTempestSuccess_412096)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFanOfKnivesSuccess_409240)
end

function me.TestCombatEventQuickDrawSuccess_398196()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventQuickDrawSuccess_398196",
    testCategory,
    "Quick Draw",
    398196
  )
end

function me.TestCombatEventBetweenTheEyesSuccess_400009()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBetweenTheEyesSuccess_400009",
    testCategory,
    "Between the Eyes",
    400009
  )
end

function me.TestCombatEventBladeDanceApplied_400012()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBladeDanceApplied_400012",
    testCategory,
    "Blade Dance",
    400012
  )
end

function me.TestCombatEventBladeDanceRemoved_400012()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBladeDanceRemoved_400012",
    testCategory,
    "Blade Dance",
    400012
  )
end

function me.TestCombatEventMutilateSuccess_399960()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMutilateSuccess_399960",
    testCategory,
    "Mutilate",
    399960
  )
end

function me.TestCombatEventShadowstrikeSuccess_399985()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowstrikeSuccess_399985",
    testCategory,
    "Shadowstrike",
    399985
  )
end

function me.TestCombatEventSaberSlashSuccess_424785()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSaberSlashSuccess_424785",
    testCategory,
    "Saber Slash",
    424785
  )
end

function me.TestCombatEventShadowstepSuccess_400029()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowstepSuccess_400029",
    testCategory,
    "Shadowstep",
    400029
  )
end

function me.TestCombatEventPoisonedKnifeSuccess_425012()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPoisonedKnifeSuccess_425012",
    testCategory,
    "Poisoned Knife",
    425012
  )
end

function me.TestCombatEventShurikenTossSuccess_399986()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShurikenTossSuccess_399986",
    testCategory,
    "Shuriken Toss",
    399986
  )
end

function me.TestCombatEventEnvenomSuccess_399963()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventEnvenomSuccess_399963",
    testCategory,
    "Envenom",
    399963
  )
end

function me.TestCombatEventMainGaucheSuccess_424919()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMainGaucheSuccess_424919",
    testCategory,
    "Main Gauche",
    424919
  )
end

function me.TestCombatEventMasterOfSubtletyApplied_425096()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventMasterOfSubtletyApplied_425096",
    testCategory,
    "Master of Subtlety",
    425096
  )
end

function me.TestCombatEventMasterOfSubtletyRemoved_425096()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventMasterOfSubtletyRemoved_425096",
    testCategory,
    "Master of Subtlety",
    425096
  )
end

function me.TestCombatEventCutthroatApplied_462708()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventCutthroatApplied_462708",
    testCategory,
    "Cutthroat",
    462708
  )
end

function me.TestCombatEventCutthroatRemoved_462708()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventCutthroatRemoved_462708",
    testCategory,
    "Cutthroat",
    462708
  )
end

function me.TestCombatEventBlunderbussSuccess_436610()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBlunderbussSuccess_436610",
    testCategory,
    "Blunderbuss",
    436610
  )
end

function me.TestCombatEventCrimsonTempestSuccess_412096()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventCrimsonTempestSuccess_412096",
    testCategory,
    "Crimson Tempest",
    412096
  )
end

function me.TestCombatEventFanOfKnivesSuccess_409240()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFanofKnivesSuccess_409240",
    testCategory,
    "Fan of Knives",
    409240
  )
end
