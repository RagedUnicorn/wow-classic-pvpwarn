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
mod.testCombatEventsPaladinSod = me

me.tag = "TestCombatEventsPaladinSod"

local testCategory = "paladin"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testcombatevent paladin")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAegisApplied_425589)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAegisRemoved_425589)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDivineSacrificeApplied_407804)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDivineSacrificeRemoved_407804)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInspirationExemplarSuccess_407880)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAvengersShieldSuccess_407669)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventRebukeSuccess_425609)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventCrusaderStrikeSuccess_407676)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDivineStormSuccess_407778)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDivineSteedApplied_461607)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDivineSteedRemoved_461607)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHandOfSacrificeApplied_462853)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHandOfSacrificeRemoved_462853)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDivineLightSuccess_409925)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAvengingWrathApplied_407788)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAvengingWrathRemoved_407788)
end

function me.TestCombatEventAegisApplied_425589()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAegisApplied_425589",
    testCategory,
    "Aegis",
    425589
  )
end

function me.TestCombatEventAegisRemoved_425589()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAegisRemoved_425589",
    testCategory,
    "Aegis",
    425589
  )
end

function me.TestCombatEventDivineSacrificeApplied_407804()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDivineSacrificeApplied_407804",
    testCategory,
    "Divine Sacrifice",
    407804
  )
end

function me.TestCombatEventDivineSacrificeRemoved_407804()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventDivineSacrificeRemoved_407804",
    testCategory,
    "Divine Sacrifice",
    407804
  )
end

function me.TestCombatEventInspirationExemplarSuccess_407880()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInspirationExemplarSuccess_407880",
    testCategory,
    "Inspiration Exemplar",
    407880
  )
end

function me.TestCombatEventAvengersShieldSuccess_407669()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventAvengersShieldSuccess_407669",
    testCategory,
    "Avenger's Shield",
    407669
  )
end

function me.TestCombatEventRebukeSuccess_425609()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRebukeSuccess_425609",
    testCategory,
    "Rebuke",
    425609
  )
end

function me.TestCombatEventCrusaderStrikeSuccess_407676()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventCrusaderStrikeSuccess_407676",
    testCategory,
    "Crusader Strike",
    407676
  )
end

function me.TestCombatEventDivineStormSuccess_407778()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDivineStormSuccess_407778",
    testCategory,
    "Divine Storm",
    407778
  )
end

function me.TestCombatEventDivineSteedApplied_461607()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDivineSteedApplied_461607",
    testCategory,
    "Divine Steed",
    461607
  )
end

function me.TestCombatEventDivineSteedRemoved_461607()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventDivineSteedRemoved_461607",
    testCategory,
    "Divine Steed",
    461607
  )
end

function me.TestCombatEventHandOfSacrificeApplied_462853()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventHandOfSacrificeApplied_462853",
    testCategory,
    "Hand of Sacrifice",
    462853
  )
end

function me.TestCombatEventHandOfSacrificeRemoved_462853()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventHandOfSacrificeRemoved_462853",
    testCategory,
    "Hand of Sacrifice",
    462853
  )
end

function me.TestCombatEventDivineLightSuccess_409925()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDivineLightSuccess_409925",
    testCategory,
    "Divine Light",
    409925
  )
end

function me.TestCombatEventAvengingWrathApplied_407788()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAvengingWrathApplied_407788",
    testCategory,
    "Avenging Wrath",
    407788
  )
end

function me.TestCombatEventAvengingWrathRemoved_407788()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAvengingWrathRemoved_407788",
    testCategory,
    "Avenging Wrath",
    407788
  )
end
