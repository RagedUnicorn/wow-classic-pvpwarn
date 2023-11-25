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
mod.testCombatEventsMiscEn = me

me.tag = "TestCombatEventsMiscEn"

local testGroupName = "CombatEventsMiscEn"
local testCategory = "misc"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRestoreEnergySuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMightyRagePotionSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFirstAidSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowProtectionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowProtectionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostProtectionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostProtectionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireProtectionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireProtectionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNatureProtectionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNatureProtectionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventArcaneProtectionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventArcaneProtectionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRestorationApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRestorationRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLivingFreeActionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLivingFreeActionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFreeActionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFreeActionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInvulnerabilityApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInvulnerabilityRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInvisibilitySuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLesserInvisibilitySuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventStealthDetectionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventStealthDetectionRemoved)
end

function me.TestCombatEventRestoreEnergySuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRestoreEnergySuccess",
    testCategory,
    "Restore Energy"
  )
end

function me.TestCombatEventMightyRagePotionSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMightyRagePotionSuccess",
    testCategory,
    "Mighty Rage Potion"
  )
end

function me.TestCombatEventFirstAidSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFirstAidSuccess",
    testCategory,
    "First Aid"
  )
end

function me.TestCombatEventShadowProtectionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowProtectionApplied",
    testCategory,
    "Shadow Protection"
  )
end

function me.TestCombatEventShadowProtectionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowProtectionRemoved",
    testCategory,
    "Shadow Protection"
  )
end

function me.TestCombatEventFrostProtectionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFrostProtectionApplied",
    testCategory,
    "Frost Protection"
  )
end

function me.TestCombatEventFrostProtectionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFrostProtectionRemoved",
    testCategory,
    "Frost Protection"
  )
end

function me.TestCombatEventFireProtectionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFireProtectionApplied",
    testCategory,
    "Fire Protection"
  )
end

function me.TestCombatEventFireProtectionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFireProtectionRemoved",
    testCategory,
    "Fire Protection"
  )
end

function me.TestCombatEventNatureProtectionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventNatureProtectionApplied",
    testCategory,
    "Nature Protection"
  )
end

function me.TestCombatEventNatureProtectionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventNatureProtectionRemoved",
    testCategory,
    "Nature Protection"
  )
end

function me.TestCombatEventArcaneProtectionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventArcaneProtectionApplied",
    testCategory,
    "Arcane Protection"
  )
end

function me.TestCombatEventArcaneProtectionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventArcaneProtectionRemoved",
    testCategory,
    "Arcane Protection"
  )
end

function me.TestCombatEventRestorationApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventRestorationApplied",
    testCategory,
    "Restoration"
  )
end

function me.TestCombatEventRestorationRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventRestorationRemoved",
    testCategory,
    "Restoration"
  )
end

function me.TestCombatEventLivingFreeActionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventLivingFreeActionApplied",
    testCategory,
    "Living Free Action"
  )
end

function me.TestCombatEventLivingFreeActionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventLivingFreeActionRemoved",
    testCategory,
    "Living Free Action"
  )
end

function me.TestCombatEventFreeActionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFreeActionApplied",
    testCategory,
    "Free Action"
  )
end

function me.TestCombatEventFreeActionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFreeActionRemoved",
    testCategory,
    "Free Action"
  )
end

function me.TestCombatEventInvulnerabilityApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventInvulnerabilityApplied",
    testCategory,
    "Invulnerability"
  )
end

function me.TestCombatEventInvulnerabilityRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventInvulnerabilityRemoved",
    testCategory,
    "Invulnerability"
  )
end

function me.TestCombatEventInvisibilitySuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInvisibilitySuccess",
    testCategory,
    "Invisibility"
  )
end

function me.TestCombatEventLesserInvisibilitySuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventLesserInvisibilitySuccess",
    testCategory,
    "Lesser Invisibility"
  )
end

function me.TestCombatEventStealthDetectionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventStealthDetectionApplied",
    testCategory,
    "Stealth Detection"
  )
end

function me.TestCombatEventStealthDetectionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventStealthDetectionRemoved",
    testCategory,
    "Stealth Detection"
  )
end
