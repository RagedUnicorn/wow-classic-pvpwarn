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
mod.testCombatEventsDruid = me

me.tag = "TestCombatEventsDruid"

local testGroupName = "CombatEventsDruid"
local testCategory = "druid"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBearFormApplied_5487)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBearFormRemoved_5487)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDireBearFormApplied_9634)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDireBearFormRemoved_9634)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCatFormApplied_768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCatFormRemoved_768)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTravelFormApplied_783)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTravelFormRemoved_783)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAquaticFormApplied_1066)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAquaticFormRemoved_1066)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMoonkinFormApplied_24858)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMoonkinFormRemoved_24858)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBarkskinApplied_22812)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBarkskinRemoved_22812)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesGraspApplied_17329)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesGraspRemoved_17329)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesGraspApplied_16689)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesGraspRemoved_16689)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesGraspApplied_16810)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesGraspRemoved_16810)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesGraspApplied_16811)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesGraspRemoved_16811)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesGraspApplied_16812)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesGraspRemoved_16812)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesGraspApplied_16813)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesGraspRemoved_16813)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBashSuccess_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBashSuccess_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBashSuccess_6798)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFeralChargeSuccess_16979)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrenziedRegenerationApplied_22896)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrenziedRegenerationRemoved_22896)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrenziedRegenerationApplied_22895)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrenziedRegenerationRemoved_22895)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrenziedRegenerationApplied_22842)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrenziedRegenerationRemoved_22842)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAbolishPoisonApplied_2893)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAbolishPoisonRemoved_2893)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInnervateApplied_29166)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInnervateRemoved_29166)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesSwiftnessApplied_17116)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventNaturesSwiftnessRemoved_17116)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFaerieFireSuccess_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFaerieFireSuccess_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFaerieFireSuccess_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFaerieFireSuccess_9749)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFaerieFireFeralSuccess_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFaerieFireFeralSuccess_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFaerieFireFeralSuccess_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFaerieFireFeralSuccess_17391)

  -- start runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSkullBashSuccess_410176)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSavageRoarApplied_407988)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSavageRoarRemoved_407988)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLacerateSuccess_414644)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventWildGrowthSuccess_408120)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMangleSuccess_407995)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkApplied_417141)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkRemoved_417141)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSurvivalInstinctsApplied_408024)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSurvivalInstinctsRemoved_408024)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTreeOfLifeApplied_439733)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTreeOfLifeRemoved_439733)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFuryOfStormrageApplied_414799)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFuryOfStormrageRemoved_414799)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEclipseSolarApplied_408250)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEclipseSolarRemoved_408250)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEclipseLunarApplied_441260)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEclipseLunarRemoved_441260)
end

function me.TestCombatEventBearFormApplied_5487()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBearFormApplied_5487",
    testCategory,
    "Bear Form",
    5487
  )
end

function me.TestCombatEventBearFormRemoved_5487()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBearFormRemoved_5487",
    testCategory,
    "Bear Form",
    5487
  )
end

function me.TestCombatEventDireBearFormApplied_9634()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDireBearFormApplied_9634",
    testCategory,
    "Dire Bear Form",
    9634
  )
end

function me.TestCombatEventDireBearFormRemoved_9634()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventDireBearFormRemoved_9634",
    testCategory,
    "Dire Bear Form",
    9634
  )
end

function me.TestCombatEventCatFormApplied_768()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventCatFormApplied_768",
    testCategory,
    "Cat Form",
    768
  )
end

function me.TestCombatEventCatFormRemoved_768()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventCatFormRemoved_768",
    testCategory,
    "Cat Form",
    768
  )
end

function me.TestCombatEventTravelFormApplied_783()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventTravelFormApplied_783",
    testCategory,
    "Travel Form",
    783
  )
end

function me.TestCombatEventTravelFormRemoved_783()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventTravelFormRemoved_783",
    testCategory,
    "Travel Form",
    783
  )
end

function me.TestCombatEventAquaticFormApplied_1066()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAquaticFormApplied_1066",
    testCategory,
    "Aquatic Form",
    1066
  )
end

function me.TestCombatEventAquaticFormRemoved_1066()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAquaticFormRemoved_1066",
    testCategory,
    "Aquatic Form",
    1066
  )
end

function me.TestCombatEventMoonkinFormApplied_24858()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventMoonkinFormApplied_24858",
    testCategory,
    "Moonkin Form",
    24858
  )
end

function me.TestCombatEventMoonkinFormRemoved_24858()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventMoonkinFormRemoved_24858",
    testCategory,
    "Moonkin Form",
    24858
  )
end

function me.TestCombatEventBarkskinApplied_22812()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBarkskinApplied_22812",
    testCategory,
    "Barkskin",
    22812
  )
end

function me.TestCombatEventBarkskinRemoved_22812()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBarkskinRemoved_22812",
    testCategory,
    "Barkskin",
    22812
  )
end

function me.TestCombatEventNaturesGraspApplied_17329()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventNaturesGraspApplied_17329",
    testCategory,
    "Nature's Grasp",
    17329
  )
end

function me.TestCombatEventNaturesGraspRemoved_17329()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventNaturesGraspRemoved_17329",
    testCategory,
    "Nature's Grasp",
    17329
  )
end

function me.TestCombatEventNaturesGraspApplied_16689()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventNaturesGraspApplied_16689",
    testCategory,
    "Nature's Grasp",
    16689
  )
end

function me.TestCombatEventNaturesGraspRemoved_16689()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventNaturesGraspRemoved_16689",
    testCategory,
    "Nature's Grasp",
    16689
  )
end

function me.TestCombatEventNaturesGraspApplied_16810()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventNaturesGraspApplied_16810",
    testCategory,
    "Nature's Grasp",
    16810
  )
end

function me.TestCombatEventNaturesGraspRemoved_16810()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventNaturesGraspRemoved_16810",
    testCategory,
    "Nature's Grasp",
    16810
  )
end

function me.TestCombatEventNaturesGraspApplied_16811()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventNaturesGraspApplied_16811",
    testCategory,
    "Nature's Grasp",
    16811
  )
end

function me.TestCombatEventNaturesGraspRemoved_16811()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventNaturesGraspRemoved_16811",
    testCategory,
    "Nature's Grasp",
    16811
  )
end

function me.TestCombatEventNaturesGraspApplied_16812()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventNaturesGraspApplied_16812",
    testCategory,
    "Nature's Grasp",
    16812
  )
end

function me.TestCombatEventNaturesGraspRemoved_16812()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventNaturesGraspRemoved_16812",
    testCategory,
    "Nature's Grasp",
    16812
  )
end

function me.TestCombatEventNaturesGraspApplied_16813()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventNaturesGraspApplied_16813",
    testCategory,
    "Nature's Grasp",
    16813
  )
end

function me.TestCombatEventNaturesGraspRemoved_16813()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventNaturesGraspRemoved_16813",
    testCategory,
    "Nature's Grasp",
    16813
  )
end

function me.TestCombatEventBashSuccess_8983()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBashSuccess_8983",
    testCategory,
    "Bash",
    8983
  )
end

function me.TestCombatEventBashSuccess_5211()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBashSuccess_5211",
    testCategory,
    "Bash",
    5211
  )
end

function me.TestCombatEventBashSuccess_6798()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBashSuccess_6798",
    testCategory,
    "Bash",
    6798
  )
end

function me.TestCombatEventFeralChargeSuccess_16979()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFeralChargeSuccess_16979",
    testCategory,
    "Feral Charge",
    16979
  )
end

function me.TestCombatEventFrenziedRegenerationApplied_22896()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFrenziedRegenerationApplied_22896",
    testCategory,
    "Frenzied Regeneration",
    22896
  )
end

function me.TestCombatEventFrenziedRegenerationRemoved_22896()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFrenziedRegenerationRemoved_22896",
    testCategory,
    "Frenzied Regeneration",
    22896
  )
end

function me.TestCombatEventFrenziedRegenerationApplied_22895()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFrenziedRegenerationApplied_22895",
    testCategory,
    "Frenzied Regeneration",
    22895
  )
end

function me.TestCombatEventFrenziedRegenerationRemoved_22895()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFrenziedRegenerationRemoved_22895",
    testCategory,
    "Frenzied Regeneration",
    22895
  )
end

function me.TestCombatEventFrenziedRegenerationApplied_22842()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFrenziedRegenerationApplied_22842",
    testCategory,
    "Frenzied Regeneration",
    22842
  )
end

function me.TestCombatEventFrenziedRegenerationRemoved_22842()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFrenziedRegenerationRemoved_22842",
    testCategory,
    "Frenzied Regeneration",
    22842
  )
end

function me.TestCombatEventAbolishPoisonApplied_2893()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAbolishPoisonApplied_2893",
    testCategory,
    "Abolish Poison",
    2893
  )
end

function me.TestCombatEventAbolishPoisonRemoved_2893()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAbolishPoisonRemoved_2893",
    testCategory,
    "Abolish Poison",
    2893
  )
end

function me.TestCombatEventInnervateApplied_29166()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventInnervateApplied_29166",
    testCategory,
    "Innervate",
    29166
  )
end

function me.TestCombatEventInnervateRemoved_29166()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventInnervateRemoved_29166",
    testCategory,
    "Innervate",
    29166
  )
end

function me.TestCombatEventNaturesSwiftnessApplied_17116()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventNaturesSwiftnessApplied_17116",
    testCategory,
    "Nature's Swiftness",
    17116
  )
end

function me.TestCombatEventNaturesSwiftnessRemoved_17116()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventNaturesSwiftnessRemoved_17116",
    testCategory,
    "Nature's Swiftness",
    17116
  )
end

function me.TestCombatEventFaerieFireSuccess_9907()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFaerieFireSuccess_9907",
    testCategory,
    "Faerie Fire",
    9907
  )
end

function me.TestCombatEventFaerieFireSuccess_770()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFaerieFireSuccess_770",
    testCategory,
    "Faerie Fire",
    770
  )
end

function me.TestCombatEventFaerieFireSuccess_778()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFaerieFireSuccess_778",
    testCategory,
    "Faerie Fire",
    778
  )
end

function me.TestCombatEventFaerieFireSuccess_9749()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFaerieFireSuccess_9749",
    testCategory,
    "Faerie Fire",
    9749
  )
end

function me.TestCombatEventFaerieFireFeralSuccess_17392()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFaerieFireFeralSuccess_17392",
    testCategory,
    "Faerie Fire (Feral)",
    17392
  )
end

function me.TestCombatEventFaerieFireFeralSuccess_16857()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFaerieFireFeralSuccess_16857",
    testCategory,
    "Faerie Fire (Feral)",
    16857
  )
end

function me.TestCombatEventFaerieFireFeralSuccess_17390()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFaerieFireFeralSuccess_17390",
    testCategory,
    "Faerie Fire (Feral)",
    17390
  )
end

function me.TestCombatEventFaerieFireFeralSuccess_17391()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFaerieFireFeralSuccess_17391",
    testCategory,
    "Faerie Fire (Feral)",
    17391
  )
end

function me.TestCombatEventSkullBashSuccess_410176()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSkullBashSuccess_410176",
    testCategory,
    "Skull Bash",
    410176
  )
end

function me.TestCombatEventSavageRoarApplied_407988()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSavageRoarApplied_407988",
    testCategory,
    "Savage Roar",
    407988
  )
end

function me.TestCombatEventSavageRoarRemoved_407988()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSavageRoarRemoved_407988",
    testCategory,
    "Savage Roar",
    407988
  )
end

function me.TestCombatEventLacerateSuccess_414644()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventLacerateSuccess_414644",
    testCategory,
    "Lacerate",
    414644
  )
end

function me.TestCombatEventWildGrowthSuccess_408120()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventWildGrowthSuccess_408120",
    testCategory,
    "Wild Growth",
    408120
  )
end

function me.TestCombatEventMangleSuccess_407995()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMangleSuccess_407995",
    testCategory,
    "Mangle",
    407995
  )
end

function me.TestCombatEventBerserkApplied_417141()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBerserkApplied_417141",
    testCategory,
    "Berserk",
    417141
  )
end

function me.TestCombatEventBerserkRemoved_417141()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBerserkRemoved_417141",
    testCategory,
    "Berserk",
    417141
  )
end

function me.TestCombatEventSurvivalInstinctsApplied_408024()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSurvivalInstinctsApplied_408024",
    testCategory,
    "Survival Instincts",
    408024
  )
end

function me.TestCombatEventSurvivalInstinctsRemoved_408024()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSurvivalInstinctsRemoved_408024",
    testCategory,
    "Survival Instincts",
    408024
  )
end

function me.TestCombatEventTreeOfLifeApplied_439733()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventTreeOfLifeApplied_439733",
    testCategory,
    "Tree of Life",
    439733
  )
end

function me.TestCombatEventTreeOfLifeRemoved_439733()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventTreeOfLifeRemoved_439733",
    testCategory,
    "Tree of Life",
    439733
  )
end

function me.TestCombatEventFuryOfStormrageApplied_414799()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFuryOfStormrageApplied_414799",
    testCategory,
    "Fury of Stormrage",
    414799
  )
end

function me.TestCombatEventFuryOfStormrageRemoved_414799()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFuryOfStormrageRemoved_414799",
    testCategory,
    "Fury of Stormrage",
    414799
  )
end

function me.TestCombatEventEclipseSolarApplied_408250()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventEclipseSolarApplied_408250",
    testCategory,
    "Eclipse: Solar",
    408250
  )
end

function me.TestCombatEventEclipseSolarRemoved_408250()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventEclipseSolarRemoved_408250",
    testCategory,
    "Eclipse: Solar",
    408250
  )
end

function me.TestCombatEventEclipseLunarApplied_441260()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventEclipseLunarApplied_441260",
    testCategory,
    "Eclipse: Lunar",
    441260
  )
end

function me.TestCombatEventEclipseLunarRemoved_441260()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventEclipseLunarRemoved_441260",
    testCategory,
    "Eclipse: Lunar",
    441260
  )
end
