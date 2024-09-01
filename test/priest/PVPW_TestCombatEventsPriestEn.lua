--[[
  MIT License

  Copyright (c) 2024 Michael Wiesendanger

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
mod.testCombatEventsPriestEn = me

me.tag = "TestCombatEventsPriestEn"

local testGroupName = "CombatEventsPriestEn"
local testCategory = "priest"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPsychicScreamSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSilenceSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPowerInfusionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPowerInfusionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPowerInfusionRefresh)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInnerFireApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInnerFireRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInnerFireRefresh)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventVampiricEmbraceApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventVampiricEmbraceRefresh)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDevouringPlagueSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTouchOfWeaknessApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTouchOfWeaknessRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTouchOfWeaknessRefresh)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFearWardApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFearWardRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFearWardRefresh)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDesperatePrayerSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHexOfWeaknessSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowGuardApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowGuardRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowGuardRefresh)
  -- runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPenanceSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCircleOfHealingSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowWordDeathSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventHomunculiSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDispersionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDispersionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPainSuppressionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPainSuppressionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowfiendSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPrayerOfMendingSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventVoidPlagueSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMindSpikeSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEyeOfTheVoidSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventVoidZoneSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventVampiricTouchSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSpiritOfTheRedeemerApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSpiritOfTheRedeemerRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSurgeOfLightApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSurgeOfLightRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSerendipityApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSerendipityRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSerendipityRefresh)
end

function me.TestCombatEventPsychicScreamSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPsychicScreamSuccess",
    testCategory,
    "Psychic Scream"
  )
end

function me.TestCombatEventSilenceSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSilenceSuccess",
    testCategory,
    "Silence"
  )
end

function me.TestCombatEventPowerInfusionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventPowerInfusionApplied",
    testCategory,
    "Power Infusion"
  )
end

function me.TestCombatEventPowerInfusionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventPowerInfusionRemoved",
    testCategory,
    "Power Infusion"
  )
end

function me.TestCombatEventPowerInfusionRefresh()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventPowerInfusionRefresh",
    testCategory,
    "Power Infusion"
  )
end

function me.TestCombatEventInnerFireApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventInnerFireApplied",
    testCategory,
    "Inner Fire"
  )
end

function me.TestCombatEventInnerFireRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventInnerFireRemoved",
    testCategory,
    "Inner Fire"
  )
end

function me.TestCombatEventInnerFireRefresh()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventInnerFireRefresh",
    testCategory,
    "Inner Fire"
  )
end

function me.TestCombatEventVampiricEmbraceApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventVampiricEmbraceApplied",
    testCategory,
    "Vampiric Embrace"
  )
end

function me.TestCombatEventVampiricEmbraceRefresh()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventVampiricEmbraceRefresh",
    testCategory,
    "Vampiric Embrace"
  )
end

function me.TestCombatEventDevouringPlagueSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDevouringPlagueSuccess",
    testCategory,
    "Devouring Plague"
  )
end

function me.TestCombatEventTouchOfWeaknessApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventTouchOfWeaknessApplied",
    testCategory,
    "Touch of Weakness"
  )
end

function me.TestCombatEventTouchOfWeaknessRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventTouchOfWeaknessRemoved",
    testCategory,
    "Touch of Weakness"
  )
end

function me.TestCombatEventTouchOfWeaknessRefresh()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventTouchOfWeaknessRefresh",
    testCategory,
    "Touch of Weakness"
  )
end

function me.TestCombatEventFearWardApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFearWardApplied",
    testCategory,
    "Fear Ward"
  )
end

function me.TestCombatEventFearWardRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFearWardRemoved",
    testCategory,
    "Fear Ward"
  )
end

function me.TestCombatEventFearWardRefresh()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventFearWardRefresh",
    testCategory,
    "Fear Ward"
  )
end

function me.TestCombatEventDesperatePrayerSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDesperatePrayerSuccess",
    testCategory,
    "Desperate Prayer"
  )
end

function me.TestCombatEventHexOfWeaknessSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHexOfWeaknessSuccess",
    testCategory,
    "Hex of Weakness"
  )
end

function me.TestCombatEventShadowguardApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowguardApplied",
    testCategory,
    "Shadowguard"
  )
end

function me.TestCombatEventShadowguardRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowguardRemoved",
    testCategory,
    "Shadowguard"
  )
end

function me.TestCombatEventShadowguardRefresh()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventShadowguardRefresh",
    testCategory,
    "Shadowguard"
  )
end

function me.TestCombatEventPenanceSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPenanceSuccess",
    testCategory,
    "Penance"
  )
end

function me.TestCombatEventCircleOfHealingSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventCircleOfHealingSuccess",
    testCategory,
    "Circle of Healing"
  )
end

function me.TestCombatEventShadowWordDeathSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowWordDeathSuccess",
    testCategory,
    "Shadow Word: Death"
  )
end

function me.TestCombatEventHomunculiSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHomunculiSuccess",
    testCategory,
    "Homunculi"
  )
end

function me.TestCombatEventDispersionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDispersionApplied",
    testCategory,
    "Dispersion"
  )
end

function me.TestCombatEventDispersionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventDispersionRemoved",
    testCategory,
    "Dispersion"
  )
end

function me.TestCombatEventPainSuppressionApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventPainSuppressionApplied",
    testCategory,
    "Pain Suppression"
  )
end

function me.TestCombatEventPainSuppressionRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventPainSuppressionRemoved",
    testCategory,
    "Pain Suppression"
  )
end

function me.TestCombatEventShadowfiendSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowfiendSuccess",
    testCategory,
    "Shadowfiend"
  )
end

function me.TestCombatEventPrayerOfMendingSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPrayerOfMendingSuccess",
    testCategory,
    "Prayer of Mending"
  )
end

function me.TestCombatEventVoidPlagueSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventVoidPlagueSuccess",
    testCategory,
    "Void Plague"
  )
end

function me.TestCombatEventMindSpikeSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMindSpikeSuccess",
    testCategory,
    "Mind Spike"
  )
end

function me.TestCombatEventEyeOfTheVoidSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventEyeOfTheVoidSuccess",
    testCategory,
    "Eye of the Void"
  )
end

function me.TestCombatEventVoidZoneSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventVoidZoneSuccess",
    testCategory,
    "Void Zone"
  )
end

function me.TestCombatEventVampiricTouchSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventVampiricTouchSuccess",
    testCategory,
    "Vampiric Touch"
  )
end

function me.TestCombatEventSpiritOfTheRedeemerApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSpiritOfTheRedeemerApplied",
    testCategory,
    "Spirit of the Redeemer"
  )
end

function me.TestCombatEventSpiritOfTheRedeemerRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSpiritOfTheRedeemerRemoved",
    testCategory,
    "Spirit of the Redeemer"
  )
end

function me.TestCombatEventSurgeOfLightApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSurgeOfLightApplied",
    testCategory,
    "Surge of Light"
  )
end

function me.TestCombatEventSurgeOfLightRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSurgeOfLightRemoved",
    testCategory,
    "Surge of Light"
  )
end

function me.TestCombatEventSerendipityApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSerendipityApplied",
    testCategory,
    "Serendipity"
  )
end

function me.TestCombatEventSerendipityRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSerendipityRemoved",
    testCategory,
    "Serendipity"
  )
end

function me.TestCombatEventSerendipityRefresh()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventSerendipityRefresh",
    testCategory,
    "Serendipity"
  )
end
