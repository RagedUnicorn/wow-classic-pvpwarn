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
mod.testCombatEventsPriest = me

me.tag = "TestCombatEventsPriest"

local testCategory = "priest"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testcombatevent priest")
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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowformApplied_15473)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowformRemoved_15473)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPsychicScreamSuccess_8122)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPsychicScreamSuccess_8124)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPsychicScreamSuccess_10888)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPsychicScreamSuccess_10890)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSilenceSuccess_15487)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPowerInfusionApplied_10060)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPowerInfusionRemoved_10060)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPowerInfusionRefresh_10060)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireApplied_588)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireRemoved_588)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireRefresh_588)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireApplied_7128)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireRemoved_7128)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireRefresh_7128)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireApplied_602)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireRemoved_602)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireRefresh_602)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireApplied_1006)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireRemoved_1006)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireRefresh_1006)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireApplied_10951)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireRemoved_10951)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireRefresh_10951)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireApplied_10952)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireRemoved_10952)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventInnerFireRefresh_10952)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventVampiricEmbraceApplied_15286)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventVampiricEmbraceRefresh_15286)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDevouringPlagueSuccess_2944)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDevouringPlagueSuccess_19276)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDevouringPlagueSuccess_19277)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDevouringPlagueSuccess_19278)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDevouringPlagueSuccess_19279)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDevouringPlagueSuccess_19280)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessApplied_2652)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessRemoved_2652)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessRefresh_2652)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessApplied_19261)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessRemoved_19261)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessRefresh_19261)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessApplied_19262)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessRemoved_19262)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessRefresh_19262)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessApplied_19264)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessRemoved_19264)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessRefresh_19264)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessApplied_19265)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessRemoved_19265)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessRefresh_19265)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessApplied_19266)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessRemoved_19266)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventTouchOfWeaknessRefresh_19266)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFearWardApplied_6346)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFearWardRemoved_6346)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFearWardRefresh_6346)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDesperatePrayerSuccess_13908)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDesperatePrayerSuccess_19238)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDesperatePrayerSuccess_19240)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDesperatePrayerSuccess_19241)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDesperatePrayerSuccess_19242)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDesperatePrayerSuccess_19243)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHexOfWeaknessSuccess_9035)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHexOfWeaknessSuccess_19281)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHexOfWeaknessSuccess_19282)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHexOfWeaknessSuccess_19283)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHexOfWeaknessSuccess_19284)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHexOfWeaknessSuccess_19285)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardApplied_18137)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardRemoved_18137)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardRefresh_18137)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardApplied_19308)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardRemoved_19308)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardRefresh_19308)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardApplied_19309)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardRemoved_19309)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardRefresh_19309)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardApplied_19310)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardRemoved_19310)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardRefresh_19310)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardApplied_19311)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardRemoved_19311)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardRefresh_19311)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardApplied_19312)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardRemoved_19312)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowguardRefresh_19312)

  -- start runes
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPenanceSuccess_402289)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPenanceSuccess_402284)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventCircleOfHealingSuccess_401946)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowWordDeathSuccess_401955)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHomunculiSuccess_402799)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDispersionApplied_425294)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDispersionRemoved_425294)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPainSuppressionApplied_402004)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPainSuppressionRemoved_402004)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowfiendSuccess_401977)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventPrayerOfMendingSuccess_401859)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventVoidPlagueSuccess_425204)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventMindSpikeSuccess_431655)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventEyeOfTheVoidSuccess_402789)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventVoidZoneSuccess_431681)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventVampiricTouchSuccess_402668)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSpiritOfTheRedeemerApplied_425284)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSpiritOfTheRedeemerRemoved_425284)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSurgeOfLightApplied_431664)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSurgeOfLightRemoved_431664)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSerendipityApplied_413248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSerendipityRemoved_413248)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventSerendipityRefresh_413248)
end

function me.TestCombatEventShadowformApplied_15473()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowformApplied_15473",
    testCategory,
    "Shadowform",
    15473
  )
end

function me.TestCombatEventShadowformRemoved_15473()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowformRemoved_15473",
    testCategory,
    "Shadowform",
    15473
  )
end

function me.TestCombatEventPsychicScreamSuccess_8122()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPsychicScreamSuccess_8122",
    testCategory,
    "Psychic Scream",
    8122
  )
end

function me.TestCombatEventPsychicScreamSuccess_8124()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPsychicScreamSuccess_8124",
    testCategory,
    "Psychic Scream",
    8124
  )
end

function me.TestCombatEventPsychicScreamSuccess_10888()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPsychicScreamSuccess_10888",
    testCategory,
    "Psychic Scream",
    10888
  )
end

function me.TestCombatEventPsychicScreamSuccess_10890()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPsychicScreamSuccess_10890",
    testCategory,
    "Psychic Scream",
    10890
  )
end

function me.TestCombatEventSilenceSuccess_15487()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSilenceSuccess_15487",
    testCategory,
    "Silence",
    15487
  )
end

function me.TestCombatEventPowerInfusionApplied_10060()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventPowerInfusionApplied_10060",
    testCategory,
    "Power Infusion",
    10060
  )
end

function me.TestCombatEventPowerInfusionRemoved_10060()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventPowerInfusionRemoved_10060",
    testCategory,
    "Power Infusion",
    10060
  )
end

function me.TestCombatEventPowerInfusionRefresh_10060()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventPowerInfusionRefresh_10060",
    testCategory,
    "Power Infusion",
    10060
  )
end

function me.TestCombatEventInnerFireApplied_588()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventInnerFireApplied_588",
    testCategory,
    "Inner Fire",
    588
  )
end

function me.TestCombatEventInnerFireRemoved_588()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventInnerFireRemoved_588",
    testCategory,
    "Inner Fire",
    588
  )
end

function me.TestCombatEventInnerFireRefresh_588()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventInnerFireRefresh_588",
    testCategory,
    "Inner Fire",
    588
  )
end

function me.TestCombatEventInnerFireApplied_7128()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventInnerFireApplied_7128",
    testCategory,
    "Inner Fire",
    7128
  )
end

function me.TestCombatEventInnerFireRemoved_7128()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventInnerFireRemoved_7128",
    testCategory,
    "Inner Fire",
    7128
  )
end

function me.TestCombatEventInnerFireRefresh_7128()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventInnerFireRefresh_7128",
    testCategory,
    "Inner Fire",
    7128
  )
end

function me.TestCombatEventInnerFireApplied_602()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventInnerFireApplied_602",
    testCategory,
    "Inner Fire",
    602
  )
end

function me.TestCombatEventInnerFireRemoved_602()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventInnerFireRemoved_602",
    testCategory,
    "Inner Fire",
    602
  )
end

function me.TestCombatEventInnerFireRefresh_602()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventInnerFireRefresh_602",
    testCategory,
    "Inner Fire",
    602
  )
end

function me.TestCombatEventInnerFireApplied_1006()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventInnerFireApplied_1006",
    testCategory,
    "Inner Fire",
    1006
  )
end

function me.TestCombatEventInnerFireRemoved_1006()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventInnerFireRemoved_1006",
    testCategory,
    "Inner Fire",
    1006
  )
end

function me.TestCombatEventInnerFireRefresh_1006()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventInnerFireRefresh_1006",
    testCategory,
    "Inner Fire",
    1006
  )
end

function me.TestCombatEventInnerFireApplied_10951()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventInnerFireApplied_10951",
    testCategory,
    "Inner Fire",
    10951
  )
end

function me.TestCombatEventInnerFireRemoved_10951()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventInnerFireRemoved_10951",
    testCategory,
    "Inner Fire",
    10951
  )
end

function me.TestCombatEventInnerFireRefresh_10951()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventInnerFireRefresh_10951",
    testCategory,
    "Inner Fire",
    10951
  )
end

function me.TestCombatEventInnerFireApplied_10952()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventInnerFireApplied_10952",
    testCategory,
    "Inner Fire",
    10952
  )
end

function me.TestCombatEventInnerFireRemoved_10952()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventInnerFireRemoved_10952",
    testCategory,
    "Inner Fire",
    10952
  )
end

function me.TestCombatEventInnerFireRefresh_10952()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventInnerFireRefresh_10952",
    testCategory,
    "Inner Fire",
    10952
  )
end

function me.TestCombatEventVampiricEmbraceApplied_15286()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventVampiricEmbraceApplied_15286",
    testCategory,
    "Vampiric Embrace",
    15286
  )
end

function me.TestCombatEventVampiricEmbraceRefresh_15286()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventVampiricEmbraceRefresh_15286",
    testCategory,
    "Vampiric Embrace",
    15286
  )
end

function me.TestCombatEventDevouringPlagueSuccess_2944()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDevouringPlagueSuccess_2944",
    testCategory,
    "Devouring Plague",
    2944
  )
end

function me.TestCombatEventDevouringPlagueSuccess_19276()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDevouringPlagueSuccess_19276",
    testCategory,
    "Devouring Plague",
    19276
  )
end

function me.TestCombatEventDevouringPlagueSuccess_19277()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDevouringPlagueSuccess_19277",
    testCategory,
    "Devouring Plague",
    19277
  )
end

function me.TestCombatEventDevouringPlagueSuccess_19278()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDevouringPlagueSuccess_19278",
    testCategory,
    "Devouring Plague",
    19278
  )
end

function me.TestCombatEventDevouringPlagueSuccess_19279()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDevouringPlagueSuccess_19279",
    testCategory,
    "Devouring Plague",
    19279
  )
end

function me.TestCombatEventDevouringPlagueSuccess_19280()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDevouringPlagueSuccess_19280",
    testCategory,
    "Devouring Plague",
    19280
  )
end

function me.TestCombatEventTouchOfWeaknessApplied_2652()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventTouchOfWeaknessApplied_2652",
    testCategory,
    "Touch of Weakness",
    2652
  )
end

function me.TestCombatEventTouchOfWeaknessRemoved_2652()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventTouchOfWeaknessRemoved_2652",
    testCategory,
    "Touch of Weakness",
    2652
  )
end

function me.TestCombatEventTouchOfWeaknessRefresh_2652()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventTouchOfWeaknessRefresh_2652",
    testCategory,
    "Touch of Weakness",
    2652
  )
end

function me.TestCombatEventTouchOfWeaknessApplied_19261()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventTouchOfWeaknessApplied_19261",
    testCategory,
    "Touch of Weakness",
    19261
  )
end

function me.TestCombatEventTouchOfWeaknessRemoved_19261()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventTouchOfWeaknessRemoved_19261",
    testCategory,
    "Touch of Weakness",
    19261
  )
end

function me.TestCombatEventTouchOfWeaknessRefresh_19261()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventTouchOfWeaknessRefresh_19261",
    testCategory,
    "Touch of Weakness",
    19261
  )
end

function me.TestCombatEventTouchOfWeaknessApplied_19262()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventTouchOfWeaknessApplied_19262",
    testCategory,
    "Touch of Weakness",
    19262
  )
end

function me.TestCombatEventTouchOfWeaknessRemoved_19262()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventTouchOfWeaknessRemoved_19262",
    testCategory,
    "Touch of Weakness",
    19262
  )
end

function me.TestCombatEventTouchOfWeaknessRefresh_19262()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventTouchOfWeaknessRefresh_19262",
    testCategory,
    "Touch of Weakness",
    19262
  )
end

function me.TestCombatEventTouchOfWeaknessApplied_19264()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventTouchOfWeaknessApplied_19264",
    testCategory,
    "Touch of Weakness",
    19264
  )
end

function me.TestCombatEventTouchOfWeaknessRemoved_19264()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventTouchOfWeaknessRemoved_19264",
    testCategory,
    "Touch of Weakness",
    19264
  )
end

function me.TestCombatEventTouchOfWeaknessRefresh_19264()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventTouchOfWeaknessRefresh_19264",
    testCategory,
    "Touch of Weakness",
    19264
  )
end

function me.TestCombatEventTouchOfWeaknessApplied_19265()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventTouchOfWeaknessApplied_19265",
    testCategory,
    "Touch of Weakness",
    19265
  )
end

function me.TestCombatEventTouchOfWeaknessRemoved_19265()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventTouchOfWeaknessRemoved_19265",
    testCategory,
    "Touch of Weakness",
    19265
  )
end

function me.TestCombatEventTouchOfWeaknessRefresh_19265()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventTouchOfWeaknessRefresh_19265",
    testCategory,
    "Touch of Weakness",
    19265
  )
end

function me.TestCombatEventTouchOfWeaknessApplied_19266()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventTouchOfWeaknessApplied_19266",
    testCategory,
    "Touch of Weakness",
    19266
  )
end

function me.TestCombatEventTouchOfWeaknessRemoved_19266()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventTouchOfWeaknessRemoved_19266",
    testCategory,
    "Touch of Weakness",
    19266
  )
end

function me.TestCombatEventTouchOfWeaknessRefresh_19266()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventTouchOfWeaknessRefresh_19266",
    testCategory,
    "Touch of Weakness",
    19266
  )
end

function me.TestCombatEventFearWardApplied_6346()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFearWardApplied_6346",
    testCategory,
    "Fear Ward",
    6346
  )
end

function me.TestCombatEventFearWardRemoved_6346()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFearWardRemoved_6346",
    testCategory,
    "Fear Ward",
    6346
  )
end

function me.TestCombatEventFearWardRefresh_6346()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventFearWardRefresh_6346",
    testCategory,
    "Fear Ward",
    6346
  )
end

function me.TestCombatEventDesperatePrayerSuccess_13908()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDesperatePrayerSuccess_13908",
    testCategory,
    "Desperate Prayer",
    13908
  )
end

function me.TestCombatEventDesperatePrayerSuccess_19238()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDesperatePrayerSuccess_19238",
    testCategory,
    "Desperate Prayer",
    19238
  )
end

function me.TestCombatEventDesperatePrayerSuccess_19240()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDesperatePrayerSuccess_19240",
    testCategory,
    "Desperate Prayer",
    19240
  )
end

function me.TestCombatEventDesperatePrayerSuccess_19241()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDesperatePrayerSuccess_19241",
    testCategory,
    "Desperate Prayer",
    19241
  )
end

function me.TestCombatEventDesperatePrayerSuccess_19242()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDesperatePrayerSuccess_19242",
    testCategory,
    "Desperate Prayer",
    19242
  )
end

function me.TestCombatEventDesperatePrayerSuccess_19243()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDesperatePrayerSuccess_19243",
    testCategory,
    "Desperate Prayer",
    19243
  )
end

function me.TestCombatEventHexOfWeaknessSuccess_9035()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHexOfWeaknessSuccess_9035",
    testCategory,
    "Hex of Weakness",
    9035
  )
end

function me.TestCombatEventHexOfWeaknessSuccess_19281()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHexOfWeaknessSuccess_19281",
    testCategory,
    "Hex of Weakness",
    19281
  )
end

function me.TestCombatEventHexOfWeaknessSuccess_19282()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHexOfWeaknessSuccess_19282",
    testCategory,
    "Hex of Weakness",
    19282
  )
end

function me.TestCombatEventHexOfWeaknessSuccess_19283()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHexOfWeaknessSuccess_19283",
    testCategory,
    "Hex of Weakness",
    19283
  )
end

function me.TestCombatEventHexOfWeaknessSuccess_19284()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHexOfWeaknessSuccess_19284",
    testCategory,
    "Hex of Weakness",
    19284
  )
end

function me.TestCombatEventHexOfWeaknessSuccess_19285()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHexOfWeaknessSuccess_19285",
    testCategory,
    "Hex of Weakness",
    19285
  )
end

function me.TestCombatEventShadowguardApplied_18137()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowguardApplied_18137",
    testCategory,
    "Shadowguard",
    18137
  )
end

function me.TestCombatEventShadowguardRemoved_18137()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowguardRemoved_18137",
    testCategory,
    "Shadowguard",
    18137
  )
end

function me.TestCombatEventShadowguardRefresh_18137()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventShadowguardRefresh_18137",
    testCategory,
    "Shadowguard",
    18137
  )
end

function me.TestCombatEventShadowguardApplied_19308()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowguardApplied_19308",
    testCategory,
    "Shadowguard",
    19308
  )
end

function me.TestCombatEventShadowguardRemoved_19308()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowguardRemoved_19308",
    testCategory,
    "Shadowguard",
    19308
  )
end

function me.TestCombatEventShadowguardRefresh_19308()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventShadowguardRefresh_19308",
    testCategory,
    "Shadowguard",
    19308
  )
end

function me.TestCombatEventShadowguardApplied_19309()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowguardApplied_19309",
    testCategory,
    "Shadowguard",
    19309
  )
end

function me.TestCombatEventShadowguardRemoved_19309()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowguardRemoved_19309",
    testCategory,
    "Shadowguard",
    19309
  )
end

function me.TestCombatEventShadowguardRefresh_19309()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventShadowguardRefresh_19309",
    testCategory,
    "Shadowguard",
    19309
  )
end

function me.TestCombatEventShadowguardApplied_19310()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowguardApplied_19310",
    testCategory,
    "Shadowguard",
    19310
  )
end

function me.TestCombatEventShadowguardRemoved_19310()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowguardRemoved_19310",
    testCategory,
    "Shadowguard",
    19310
  )
end

function me.TestCombatEventShadowguardRefresh_19310()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventShadowguardRefresh_19310",
    testCategory,
    "Shadowguard",
    19310
  )
end

function me.TestCombatEventShadowguardApplied_19311()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowguardApplied_19311",
    testCategory,
    "Shadowguard",
    19311
  )
end

function me.TestCombatEventShadowguardRemoved_19311()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowguardRemoved_19311",
    testCategory,
    "Shadowguard",
    19311
  )
end

function me.TestCombatEventShadowguardRefresh_19311()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventShadowguardRefresh_19311",
    testCategory,
    "Shadowguard",
    19311
  )
end

function me.TestCombatEventShadowguardApplied_19312()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShadowguardApplied_19312",
    testCategory,
    "Shadowguard",
    19312
  )
end

function me.TestCombatEventShadowguardRemoved_19312()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShadowguardRemoved_19312",
    testCategory,
    "Shadowguard",
    19312
  )
end

function me.TestCombatEventShadowguardRefresh_19312()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventShadowguardRefresh_19312",
    testCategory,
    "Shadowguard",
    19312
  )
end

function me.TestCombatEventPenanceSuccess_402289()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPenanceSuccess_402289",
    testCategory,
    "Penance",
    402289
  )
end

function me.TestCombatEventPenanceSuccess_402284()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPenanceSuccess_402284",
    testCategory,
    "Penance",
    402284
  )
end

function me.TestCombatEventCircleOfHealingSuccess_401946()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventCircleOfHealingSuccess_401946",
    testCategory,
    "Circle of Healing",
    401946
  )
end

function me.TestCombatEventShadowWordDeathSuccess_401955()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowWordDeathSuccess_401955",
    testCategory,
    "Shadow Word: Death",
    401955
  )
end

function me.TestCombatEventHomunculiSuccess_402799()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHomunculiSuccess_402799",
    testCategory,
    "Homunculi",
    402799
  )
end

function me.TestCombatEventDispersionApplied_425294()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDispersionApplied_425294",
    testCategory,
    "Dispersion",
    425294
  )
end

function me.TestCombatEventDispersionRemoved_425294()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventDispersionRemoved_425294",
    testCategory,
    "Dispersion",
    425294
  )
end

function me.TestCombatEventPainSuppressionApplied_402004()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventPainSuppressionApplied_402004",
    testCategory,
    "Pain Suppression",
    402004
  )
end

function me.TestCombatEventPainSuppressionRemoved_402004()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventPainSuppressionRemoved_402004",
    testCategory,
    "Pain Suppression",
    402004
  )
end

function me.TestCombatEventShadowfiendSuccess_401977()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowfiendSuccess_401977",
    testCategory,
    "Shadowfiend",
    401977
  )
end

function me.TestCombatEventPrayerOfMendingSuccess_401859()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPrayerOfMendingSuccess_401859",
    testCategory,
    "Prayer of Mending",
    401859
  )
end

function me.TestCombatEventVoidPlagueSuccess_425204()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventVoidPlagueSuccess_425204",
    testCategory,
    "Void Plague",
    425204
  )
end

function me.TestCombatEventMindSpikeSuccess_431655()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMindSpikeSuccess_431655",
    testCategory,
    "Mind Spike",
    431655
  )
end

function me.TestCombatEventEyeOfTheVoidSuccess_402789()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventEyeOfTheVoidSuccess_402789",
    testCategory,
    "Eye of the Void",
    402789
  )
end

function me.TestCombatEventVoidZoneSuccess_431681()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventVoidZoneSuccess_431681",
    testCategory,
    "Void Zone",
    431681
  )
end

function me.TestCombatEventVampiricTouchSuccess_402668()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventVampiricTouchSuccess_402668",
    testCategory,
    "Vampiric Touch",
    402668
  )
end

function me.TestCombatEventSpiritOfTheRedeemerApplied_425284()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSpiritOfTheRedeemerApplied_425284",
    testCategory,
    "Spirit of the Redeemer",
    425284
  )
end

function me.TestCombatEventSpiritOfTheRedeemerRemoved_425284()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSpiritOfTheRedeemerRemoved_425284",
    testCategory,
    "Spirit of the Redeemer",
    425284
  )
end

function me.TestCombatEventSurgeOfLightApplied_431664()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSurgeOfLightApplied_431664",
    testCategory,
    "Surge of Light",
    431664
  )
end

function me.TestCombatEventSurgeOfLightRemoved_431664()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSurgeOfLightRemoved_431664",
    testCategory,
    "Surge of Light",
    431664
  )
end

function me.TestCombatEventSerendipityApplied_413248()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSerendipityApplied_413248",
    testCategory,
    "Serendipity",
    413248
  )
end

function me.TestCombatEventSerendipityRemoved_413248()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSerendipityRemoved_413248",
    testCategory,
    "Serendipity",
    413248
  )
end

function me.TestCombatEventSerendipityRefresh_413248()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventSerendipityRefresh_413248",
    testCategory,
    "Serendipity",
    413248
  )
end
