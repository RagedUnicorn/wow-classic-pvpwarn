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

local mod = rgpvpw
local me = {}
mod.testCombatEventsWarlockEn = me

me.tag = "TestCombatEventsWarlockEn"

local testGroupName = "CombatEventsWarlockEn"
local testCategory = "warlock"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFearSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowburnSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowWardApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowWardRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHowlOfTerrorSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDeathCoilSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAmplifyCurseApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAmplifyCurseRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSpellLockSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSoulLinkApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSoulLinkRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFelDominationApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFelDominationRemoved)
  -- runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDemonicGraceApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDemonicGraceRemoved)
end

function me.TestCombatEventFearSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFearSuccess",
    testCategory,
    "Fear"
  )
end

function me.TestCombatEventShadowburnSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowburnSuccess",
    testCategory,
    "Shadowburn"
  )
end

function me.TestCombatEventShadowWardApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowWardApplied",
    testCategory,
    "Shadow Ward"
  )
end

function me.TestCombatEventShadowWardRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowWardRemoved",
    testCategory,
    "Shadow Ward"
  )
end

function me.TestCombatEventHowlOfTerrorSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHowlOfTerrorSuccess",
    testCategory,
    "Howl of Terror"
  )
end

function me.TestCombatEventDeathCoilSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDeathCoilSuccess",
    testCategory,
    "Death Coil"
  )
end

function me.TestCombatEventAmplifyCurseApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAmplifyCurseApplied",
    testCategory,
    "Amplify Curse"
  )
end

function me.TestCombatEventAmplifyCurseRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAmplifyCurseRemoved",
    testCategory,
    "Amplify Curse"
  )
end

function me.TestCombatEventSpellLockSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSpellLockSuccess",
    testCategory,
    "Spell Lock"
  )
end

function me.TestCombatEventSoulLinkApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSoulLinkApplied",
    testCategory,
    "Soul Link"
  )
end

function me.TestCombatEventSoulLinkRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSoulLinkRemoved",
    testCategory,
    "Soul Link"
  )
end

function me.TestCombatEventFelDominationApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFelDominationApplied",
    testCategory,
    "Fel Domination"
  )
end

function me.TestCombatEventFelDominationRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFelDominationRemoved",
    testCategory,
    "Fel Domination"
  )
end

function me.TestCombatEventDemonicGraceApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDemonicGraceApplied",
    testCategory,
    "Demonic Grace"
  )
end

function me.TestCombatEventDemonicGraceRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventDemonicGraceRemoved",
    testCategory,
    "Demonic Grace"
  )
end
