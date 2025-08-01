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
mod.testCombatEventsWarlock = me

me.tag = "TestCombatEventsWarlock"

local testCategory = "warlock"

function me.Test()
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testcombatevent warlock")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFearSuccess_6215)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFearSuccess_5782)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFearSuccess_6213)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowburnSuccess_18871)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowburnSuccess_17877)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowburnSuccess_18867)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowburnSuccess_18868)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowburnSuccess_18869)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowburnSuccess_18870)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowWardApplied_28610)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowWardRemoved_28610)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowWardApplied_6229)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowWardRemoved_6229)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowWardApplied_11739)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowWardRemoved_11739)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowWardApplied_11740)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowWardRemoved_11740)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHowlOfTerrorSuccess_17928)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHowlOfTerrorSuccess_5484)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDeathCoilSuccess_17926)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDeathCoilSuccess_6789)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDeathCoilSuccess_17925)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAmplifyCurseApplied_18288)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAmplifyCurseRemoved_18288)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSpellLockSuccess_19647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSpellLockSuccess_19244)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSoulLinkApplied_19028)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSoulLinkRemoved_19028)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFelDominationApplied_18708)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFelDominationRemoved_18708)

  -- start runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDemonicGraceApplied_425463)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDemonicGraceRemoved_425463)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHauntSuccess_403501)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventVengeanceApplied_426195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventVengeanceRemoved_426195)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventImmolationAuraApplied_427726)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventImmolationAuraRemoved_427726)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventUnstableAfflictionSuccess_427717)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBackdraftApplied_427713)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBackdraftRemoved_427713)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInfernalArmorApplied_440882)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInfernalArmorRemoved_440882)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMetamorphosisApplied_403789)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMetamorphosisRemoved_403789)
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
