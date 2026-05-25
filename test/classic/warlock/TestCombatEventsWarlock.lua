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
mod.testCombatEventsWarlockClassic = me

me.tag = "TestCombatEventsWarlockClassic"

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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFearSuccess_6215)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFearSuccess_5782)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFearSuccess_6213)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowburnSuccess_18871)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowburnSuccess_17877)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowburnSuccess_18867)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowburnSuccess_18868)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowburnSuccess_18869)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowburnSuccess_18870)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowWardApplied_28610)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowWardRemoved_28610)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowWardApplied_6229)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowWardRemoved_6229)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowWardApplied_11739)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowWardRemoved_11739)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowWardApplied_11740)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowWardRemoved_11740)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHowlOfTerrorSuccess_17928)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHowlOfTerrorSuccess_5484)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDeathCoilSuccess_17926)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDeathCoilSuccess_6789)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDeathCoilSuccess_17925)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAmplifyCurseApplied_18288)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventAmplifyCurseRemoved_18288)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSpellLockSuccess_19647)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSpellLockSuccess_19244)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSoulLinkApplied_19028)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSoulLinkRemoved_19028)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFelDominationApplied_18708)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFelDominationRemoved_18708)
end

function me.TestCombatEventFearSuccess_6215()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFearSuccess_6215",
    testCategory,
    "Fear",
    6215
  )
end

function me.TestCombatEventFearSuccess_5782()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFearSuccess_5782",
    testCategory,
    "Fear",
    5782
  )
end

function me.TestCombatEventFearSuccess_6213()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFearSuccess_6213",
    testCategory,
    "Fear",
    6213
  )
end

function me.TestCombatEventShadowburnSuccess_18871()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowburnSuccess_18871",
    testCategory,
    "Shadowburn",
    18871
  )
end

function me.TestCombatEventShadowburnSuccess_17877()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowburnSuccess_17877",
    testCategory,
    "Shadowburn",
    17877
  )
end

function me.TestCombatEventShadowburnSuccess_18867()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowburnSuccess_18867",
    testCategory,
    "Shadowburn",
    18867
  )
end

function me.TestCombatEventShadowburnSuccess_18868()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowburnSuccess_18868",
    testCategory,
    "Shadowburn",
    18868
  )
end

function me.TestCombatEventShadowburnSuccess_18869()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowburnSuccess_18869",
    testCategory,
    "Shadowburn",
    18869
  )
end

function me.TestCombatEventShadowburnSuccess_18870()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowburnSuccess_18870",
    testCategory,
    "Shadowburn",
    18870
  )
end

function me.TestCombatEventShadowWardApplied_28610()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowWardApplied_28610",
    testCategory,
    "Shadow Ward",
    28610
  )
end

function me.TestCombatEventShadowWardRemoved_28610()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowWardRemoved_28610",
    testCategory,
    "Shadow Ward",
    28610
  )
end

function me.TestCombatEventShadowWardApplied_6229()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowWardApplied_6229",
    testCategory,
    "Shadow Ward",
    6229
  )
end

function me.TestCombatEventShadowWardRemoved_6229()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowWardRemoved_6229",
    testCategory,
    "Shadow Ward",
    6229
  )
end

function me.TestCombatEventShadowWardApplied_11739()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowWardApplied_11739",
    testCategory,
    "Shadow Ward",
    11739
  )
end

function me.TestCombatEventShadowWardRemoved_11739()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowWardRemoved_11739",
    testCategory,
    "Shadow Ward",
    11739
  )
end

function me.TestCombatEventShadowWardApplied_11740()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowWardApplied_11740",
    testCategory,
    "Shadow Ward",
    11740
  )
end

function me.TestCombatEventShadowWardRemoved_11740()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowWardRemoved_11740",
    testCategory,
    "Shadow Ward",
    11740
  )
end

function me.TestCombatEventHowlOfTerrorSuccess_17928()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHowlOfTerrorSuccess_17928",
    testCategory,
    "Howl of Terror",
    17928
  )
end

function me.TestCombatEventHowlOfTerrorSuccess_5484()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHowlOfTerrorSuccess_5484",
    testCategory,
    "Howl of Terror",
    5484
  )
end

function me.TestCombatEventDeathCoilSuccess_17926()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDeathCoilSuccess_17926",
    testCategory,
    "Death Coil",
    17926
  )
end

function me.TestCombatEventDeathCoilSuccess_6789()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDeathCoilSuccess_6789",
    testCategory,
    "Death Coil",
    6789
  )
end

function me.TestCombatEventDeathCoilSuccess_17925()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDeathCoilSuccess_17925",
    testCategory,
    "Death Coil",
    17925
  )
end

function me.TestCombatEventAmplifyCurseApplied_18288()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAmplifyCurseApplied_18288",
    testCategory,
    "Amplify Curse",
    18288
  )
end

function me.TestCombatEventAmplifyCurseRemoved_18288()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAmplifyCurseRemoved_18288",
    testCategory,
    "Amplify Curse",
    18288
  )
end

function me.TestCombatEventSpellLockSuccess_19647()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSpellLockSuccess_19647",
    testCategory,
    "Spell Lock",
    19647
  )
end

function me.TestCombatEventSpellLockSuccess_19244()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSpellLockSuccess_19244",
    testCategory,
    "Spell Lock",
    19244
  )
end

function me.TestCombatEventSoulLinkApplied_19028()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSoulLinkApplied_19028",
    testCategory,
    "Soul Link",
    19028
  )
end

function me.TestCombatEventSoulLinkRemoved_19028()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSoulLinkRemoved_19028",
    testCategory,
    "Soul Link",
    19028
  )
end

function me.TestCombatEventFelDominationApplied_18708()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFelDominationApplied_18708",
    testCategory,
    "Fel Domination",
    18708
  )
end

function me.TestCombatEventFelDominationRemoved_18708()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFelDominationRemoved_18708",
    testCategory,
    "Fel Domination",
    18708
  )
end
