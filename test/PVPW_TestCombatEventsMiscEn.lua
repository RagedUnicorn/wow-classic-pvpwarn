--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

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

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRestoreEnergySuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMightyRagePotionSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFirstAidSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowProtectionSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowProtectionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostProtectionSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostProtectionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireProtectionSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireProtectionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNatureProtectionSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNatureProtectionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventArcaneProtectionSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventArcaneProtectionRemoved)

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
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

function me.TestCombatEventShadowProtectionSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowProtectionSuccess",
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

function me.TestCombatEventFrostProtectionSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostProtectionSuccess",
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

function me.TestCombatEventFireProtectionSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireProtectionSuccess",
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

function me.TestCombatEventNatureProtectionSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventNatureProtectionSuccess",
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

function me.TestCombatEventArcaneProtectionSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventArcaneProtectionSuccess",
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
