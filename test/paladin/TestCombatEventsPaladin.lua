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
mod.testCombatEventsPaladin = me

me.tag = "TestCombatEventsPaladin"

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
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDevotionAuraSuccess_10293)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDevotionAuraSuccess_465)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDevotionAuraSuccess_10290)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDevotionAuraSuccess_643)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDevotionAuraSuccess_10291)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDevotionAuraSuccess_1032)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDevotionAuraSuccess_10292)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventRetributionAuraSuccess_10301)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventRetributionAuraSuccess_7294)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventRetributionAuraSuccess_10298)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventRetributionAuraSuccess_10299)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventRetributionAuraSuccess_10300)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventConcentrationAuraSuccess_19746)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowResistanceAuraSuccess_19896)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowResistanceAuraSuccess_19876)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventShadowResistanceAuraSuccess_19895)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFrostResistanceAuraSuccess_19898)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFrostResistanceAuraSuccess_19888)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFrostResistanceAuraSuccess_19897)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFireResistanceAuraSuccess_19900)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFireResistanceAuraSuccess_19891)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventFireResistanceAuraSuccess_19899)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlessingOfProtectionApplied_10278)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlessingOfProtectionRemoved_10278)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlessingOfProtectionApplied_1022)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlessingOfProtectionRemoved_1022)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlessingOfProtectionApplied_5599)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlessingOfProtectionRemoved_5599)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlessingOfFreedomApplied_1044)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlessingOfFreedomRemoved_1044)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlessingOfSacrificeApplied_20729)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlessingOfSacrificeRemoved_20729)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlessingOfSacrificeApplied_6940)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventBlessingOfSacrificeRemoved_6940)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHammerOfJusticeSuccess_10308)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHammerOfJusticeSuccess_853)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHammerOfJusticeSuccess_5588)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventHammerOfJusticeSuccess_5589)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventRepentanceSuccess_20066)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDivineShieldApplied_642)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDivineShieldRemoved_642)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDivineShieldApplied_1020)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDivineShieldRemoved_1020)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventForbearanceApplied_25771)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventForbearanceRemoved_25771)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventLayOnHandsSuccess_10310)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventLayOnHandsSuccess_2800)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventLayOnHandsSuccess_633)

  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDivineProtectionApplied_5573)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDivineProtectionRemoved_5573)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDivineProtectionApplied_498)
  mod.testReporter.AddToTestQueueImmediate(me.TestCombatEventDivineProtectionRemoved_498)

  -- start runes
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

function me.TestCombatEventDevotionAuraSuccess_10293()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDevotionAuraSuccess_10293",
    testCategory,
    "Devotion Aura",
    10293
  )
end

function me.TestCombatEventDevotionAuraSuccess_465()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDevotionAuraSuccess_465",
    testCategory,
    "Devotion Aura",
    465
  )
end

function me.TestCombatEventDevotionAuraSuccess_10290()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDevotionAuraSuccess_10290",
    testCategory,
    "Devotion Aura",
    10290
  )
end

function me.TestCombatEventDevotionAuraSuccess_643()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDevotionAuraSuccess_643",
    testCategory,
    "Devotion Aura",
    643
  )
end

function me.TestCombatEventDevotionAuraSuccess_10291()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDevotionAuraSuccess_10291",
    testCategory,
    "Devotion Aura",
    10291
  )
end

function me.TestCombatEventDevotionAuraSuccess_1032()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDevotionAuraSuccess_1032",
    testCategory,
    "Devotion Aura",
    1032
  )
end

function me.TestCombatEventDevotionAuraSuccess_10292()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDevotionAuraSuccess_10292",
    testCategory,
    "Devotion Aura",
    10292
  )
end

function me.TestCombatEventRetributionAuraSuccess_10301()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRetributionAuraSuccess_10301",
    testCategory,
    "Retribution Aura",
    10301
  )
end

function me.TestCombatEventRetributionAuraSuccess_7294()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRetributionAuraSuccess_7294",
    testCategory,
    "Retribution Aura",
    7294
  )
end

function me.TestCombatEventRetributionAuraSuccess_10298()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRetributionAuraSuccess_10298",
    testCategory,
    "Retribution Aura",
    10298
  )
end

function me.TestCombatEventRetributionAuraSuccess_10299()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRetributionAuraSuccess_10299",
    testCategory,
    "Retribution Aura",
    10299
  )
end

function me.TestCombatEventRetributionAuraSuccess_10300()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRetributionAuraSuccess_10300",
    testCategory,
    "Retribution Aura",
    10300
  )
end

function me.TestCombatEventConcentrationAuraSuccess_19746()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventConcentrationAuraSuccess_19746",
    testCategory,
    "Concentration Aura",
    19746
  )
end

function me.TestCombatEventShadowResistanceAuraSuccess_19896()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowResistanceAuraSuccess_19896",
    testCategory,
    "Shadow Resistance Aura",
    19896
  )
end

function me.TestCombatEventShadowResistanceAuraSuccess_19876()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowResistanceAuraSuccess_19876",
    testCategory,
    "Shadow Resistance Aura",
    19876
  )
end

function me.TestCombatEventShadowResistanceAuraSuccess_19895()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowResistanceAuraSuccess_19895",
    testCategory,
    "Shadow Resistance Aura",
    19895
  )
end

function me.TestCombatEventFrostResistanceAuraSuccess_19898()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostResistanceAuraSuccess_19898",
    testCategory,
    "Frost Resistance Aura",
    19898
  )
end

function me.TestCombatEventFrostResistanceAuraSuccess_19888()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostResistanceAuraSuccess_19888",
    testCategory,
    "Frost Resistance Aura",
    19888
  )
end

function me.TestCombatEventFrostResistanceAuraSuccess_19897()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFrostResistanceAuraSuccess_19897",
    testCategory,
    "Frost Resistance Aura",
    19897
  )
end

function me.TestCombatEventFireResistanceAuraSuccess_19900()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireResistanceAuraSuccess_19900",
    testCategory,
    "Fire Resistance Aura",
    19900
  )
end

function me.TestCombatEventFireResistanceAuraSuccess_19891()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireResistanceAuraSuccess_19891",
    testCategory,
    "Fire Resistance Aura",
    19891
  )
end

function me.TestCombatEventFireResistanceAuraSuccess_19899()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFireResistanceAuraSuccess_19899",
    testCategory,
    "Fire Resistance Aura",
    19899
  )
end

function me.TestCombatEventBlessingOfProtectionApplied_10278()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBlessingOfProtectionApplied_10278",
    testCategory,
    "Blessing of Protection",
    10278
  )
end

function me.TestCombatEventBlessingOfProtectionRemoved_10278()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBlessingOfProtectionRemoved_10278",
    testCategory,
    "Blessing of Protection",
    10278
  )
end

function me.TestCombatEventBlessingOfProtectionApplied_1022()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBlessingOfProtectionApplied_1022",
    testCategory,
    "Blessing of Protection",
    1022
  )
end

function me.TestCombatEventBlessingOfProtectionRemoved_1022()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBlessingOfProtectionRemoved_1022",
    testCategory,
    "Blessing of Protection",
    1022
  )
end

function me.TestCombatEventBlessingOfProtectionApplied_5599()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBlessingOfProtectionApplied_5599",
    testCategory,
    "Blessing of Protection",
    5599
  )
end

function me.TestCombatEventBlessingOfProtectionRemoved_5599()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBlessingOfProtectionRemoved_5599",
    testCategory,
    "Blessing of Protection",
    5599
  )
end

function me.TestCombatEventBlessingOfFreedomApplied_1044()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBlessingOfFreedomApplied_1044",
    testCategory,
    "Blessing of Freedom",
    1044
  )
end

function me.TestCombatEventBlessingOfFreedomRemoved_1044()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBlessingOfFreedomRemoved_1044",
    testCategory,
    "Blessing of Freedom",
    1044
  )
end

function me.TestCombatEventBlessingOfSacrificeApplied_20729()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBlessingOfSacrificeApplied_20729",
    testCategory,
    "Blessing of Sacrifice",
    20729
  )
end

function me.TestCombatEventBlessingOfSacrificeRemoved_20729()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBlessingOfSacrificeRemoved_20729",
    testCategory,
    "Blessing of Sacrifice",
    20729
  )
end

function me.TestCombatEventBlessingOfSacrificeApplied_6940()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBlessingOfSacrificeApplied_6940",
    testCategory,
    "Blessing of Sacrifice",
    6940
  )
end

function me.TestCombatEventBlessingOfSacrificeRemoved_6940()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBlessingOfSacrificeRemoved_6940",
    testCategory,
    "Blessing of Sacrifice",
    6940
  )
end

function me.TestCombatEventHammerOfJusticeSuccess_10308()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHammerOfJusticeSuccess_10308",
    testCategory,
    "Hammer of Justice",
    10308
  )
end

function me.TestCombatEventHammerOfJusticeSuccess_853()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHammerOfJusticeSuccess_853",
    testCategory,
    "Hammer of Justice",
    853
  )
end

function me.TestCombatEventHammerOfJusticeSuccess_5588()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHammerOfJusticeSuccess_5588",
    testCategory,
    "Hammer of Justice",
    5588
  )
end

function me.TestCombatEventHammerOfJusticeSuccess_5589()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventHammerOfJusticeSuccess_5589",
    testCategory,
    "Hammer of Justice",
    5589
  )
end

function me.TestCombatEventRepentanceSuccess_20066()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRepentanceSuccess_20066",
    testCategory,
    "Repentance",
    20066
  )
end

function me.TestCombatEventDivineShieldApplied_642()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDivineShieldApplied_642",
    testCategory,
    "Divine Shield",
    642
  )
end

function me.TestCombatEventDivineShieldRemoved_642()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventDivineShieldRemoved_642",
    testCategory,
    "Divine Shield",
    642
  )
end

function me.TestCombatEventDivineShieldApplied_1020()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDivineShieldApplied_1020",
    testCategory,
    "Divine Shield",
    1020
  )
end

function me.TestCombatEventDivineShieldRemoved_1020()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventDivineShieldRemoved_1020",
    testCategory,
    "Divine Shield",
    1020
  )
end

function me.TestCombatEventForbearanceApplied_25771()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventForbearanceApplied_25771",
    testCategory,
    "Forbearance",
    25771
  )
end

function me.TestCombatEventForbearanceRemoved_25771()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventForbearanceRemoved_25771",
    testCategory,
    "Forbearance",
    25771
  )
end

function me.TestCombatEventLayOnHandsSuccess_10310()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventLayOnHandsSuccess_10310",
    testCategory,
    "Lay on Hands",
    10310
  )
end

function me.TestCombatEventLayOnHandsSuccess_2800()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventLayOnHandsSuccess_2800",
    testCategory,
    "Lay on Hands",
    2800
  )
end

function me.TestCombatEventLayOnHandsSuccess_633()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventLayOnHandsSuccess_633",
    testCategory,
    "Lay on Hands",
    633
  )
end

function me.TestCombatEventDivineProtectionApplied_5573()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDivineProtectionApplied_5573",
    testCategory,
    "Divine Protection",
    5573
  )
end

function me.TestCombatEventDivineProtectionRemoved_5573()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventDivineProtectionRemoved_5573",
    testCategory,
    "Divine Protection",
    5573
  )
end

function me.TestCombatEventDivineProtectionApplied_498()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDivineProtectionApplied_498",
    testCategory,
    "Divine Protection",
    498
  )
end

function me.TestCombatEventDivineProtectionRemoved_498()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventDivineProtectionRemoved_498",
    testCategory,
    "Divine Protection",
    498
  )
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
