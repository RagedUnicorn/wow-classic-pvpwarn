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
mod.testCombatEventsWarlockSod = me

me.tag = "TestCombatEventsWarlockSod"

local testCategory = "warlock"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testcombatevent warlock")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDemonicGraceApplied_425463)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDemonicGraceRemoved_425463)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHauntSuccess_403501)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventVengeanceApplied_426195)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventVengeanceRemoved_426195)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventImmolationAuraApplied_427726)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventImmolationAuraRemoved_427726)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventUnstableAfflictionSuccess_427717)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBackdraftApplied_427713)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBackdraftRemoved_427713)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInfernalArmorApplied_440882)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInfernalArmorRemoved_440882)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMetamorphosisApplied_403789)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMetamorphosisRemoved_403789)
end

function me.TestCombatEventDemonicGraceApplied_425463()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDemonicGraceApplied_425463",
    testCategory,
    "Demonic Grace",
    425463
  )
end

function me.TestCombatEventDemonicGraceRemoved_425463()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventDemonicGraceRemoved_425463",
    testCategory,
    "Demonic Grace",
    425463
  )
end

function me.TestCombatEventHauntSuccess_403501()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHauntSuccess_403501",
    testCategory,
    "Haunt",
    403501
  )
end

function me.TestCombatEventVengeanceApplied_426195()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventVengeanceApplied_426195",
    testCategory,
    "Vengeance",
    426195
  )
end

function me.TestCombatEventVengeanceRemoved_426195()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventVengeanceRemoved_426195",
    testCategory,
    "Vengeance",
    426195
  )
end

function me.TestCombatEventImmolationAuraApplied_427726()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventImmolationAuraApplied_427726",
    testCategory,
    "Immolation Aura",
    427726
  )
end

function me.TestCombatEventImmolationAuraRemoved_427726()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventImmolationAuraRemoved_427726",
    testCategory,
    "Immolation Aura",
    427726
  )
end

function me.TestCombatEventUnstableAfflictionSuccess_427717()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventUnstableAfflictionSuccess_427717",
    testCategory,
    "Unstable Affliction",
    427717
  )
end

function me.TestCombatEventBackdraftApplied_427713()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBackdraftApplied_427713",
    testCategory,
    "Backdraft",
    427713
  )
end

function me.TestCombatEventBackdraftRemoved_427713()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBackdraftRemoved_427713",
    testCategory,
    "Backdraft",
    427713
  )
end

function me.TestCombatEventInfernalArmorApplied_440882()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventInfernalArmorApplied_440882",
    testCategory,
    "Infernal Armor",
    440882
  )
end

function me.TestCombatEventInfernalArmorRemoved_440882()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventInfernalArmorRemoved_440882",
    testCategory,
    "Infernal Armor",
    440882
  )
end

function me.TestCombatEventMetamorphosisApplied_403789()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventMetamorphosisApplied_403789",
    testCategory,
    "Metamorphosis",
    403789
  )
end

function me.TestCombatEventMetamorphosisRemoved_403789()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventMetamorphosisRemoved_403789",
    testCategory,
    "Metamorphosis",
    403789
  )
end
