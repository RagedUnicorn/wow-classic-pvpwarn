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
mod.testSoundPaladin = me

me.tag = "TestSoundPaladin"

local testCategory = "paladin"

function me.Test()
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound paladin")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevotionAura_10293)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevotionAura_465)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevotionAura_10290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevotionAura_643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevotionAura_10291)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevotionAura_1032)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevotionAura_10292)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRetributionAura_10301)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRetributionAura_7294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRetributionAura_10298)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRetributionAura_10299)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRetributionAura_10300)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundConcentrationAura_19746)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowResistanceAura_19896)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowResistanceAura_19895)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowResistanceAura_19876)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostResistanceAura_19898)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostResistanceAura_19897)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostResistanceAura_19888)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireResistanceAura_19900)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireResistanceAura_19899)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireResistanceAura_19891)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlessingOfProtection_10278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlessingOfProtection_10278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlessingOfProtection_5599)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlessingOfProtection_5599)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlessingOfProtection_1022)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlessingOfProtection_1022)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlessingOfFreedom_1044)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlessingOfFreedom_1044)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlessingOfSacrifice_20729)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlessingOfSacrifice_20729)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlessingOfSacrifice_6940)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlessingOfSacrifice_6940)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHammerOfJustice_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHammerOfJustice_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHammerOfJustice_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHammerOfJustice_5589)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRepentance_20066)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDivineShield_642)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDivineShield_642)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDivineShield_1020)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDivineShield_1020)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundForbearance_25771)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownForbearance_25771)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLayOnHands_10310)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLayOnHands_633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLayOnHands_2800)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDivineProtection_5573)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDivineProtection_5573)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDivineProtection_498)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDivineProtection_498)

  -- start runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAegis_425589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAegis_425589)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDivineSacrifice_407804)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDivineSacrifice_407804)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInspirationExemplar_407880)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAvengersShield_407669)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRebuke_425609)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCrusaderStrike_407676)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDivineStorm_407778)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDivineSteed_461607)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDivineSteed_461607)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHandOfSacrifice_462853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownHandOfSacrifice_462853)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDivineLight_409925)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAvengingWrath_407788)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAvengingWrath_407788)
end

function me.TestSoundDevotionAura_10293()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDevotionAura_10293",
    testCategory,
    10293
  )
end

function me.TestSoundDevotionAura_465()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDevotionAura_465",
    testCategory,
    465
  )
end

function me.TestSoundDevotionAura_10290()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDevotionAura_10290",
    testCategory,
    10290
  )
end

function me.TestSoundDevotionAura_643()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDevotionAura_643",
    testCategory,
    643
  )
end

function me.TestSoundDevotionAura_10291()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDevotionAura_10291",
    testCategory,
    10291
  )
end

function me.TestSoundDevotionAura_1032()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDevotionAura_1032",
    testCategory,
    1032
  )
end

function me.TestSoundDevotionAura_10292()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDevotionAura_10292",
    testCategory,
    10292
  )
end

function me.TestSoundRetributionAura_10301()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRetributionAura_10301",
    testCategory,
    10301
  )
end

function me.TestSoundRetributionAura_7294()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRetributionAura_7294",
    testCategory,
    7294
  )
end

function me.TestSoundRetributionAura_10298()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRetributionAura_10298",
    testCategory,
    10298
  )
end

function me.TestSoundRetributionAura_10299()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRetributionAura_10299",
    testCategory,
    10299
  )
end

function me.TestSoundRetributionAura_10300()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRetributionAura_10300",
    testCategory,
    10300
  )
end

function me.TestSoundConcentrationAura_19746()
  mod.testHelper.TestSoundSuccess(
    "TestSoundConcentrationAura_19746",
    testCategory,
    19746
  )
end

function me.TestSoundShadowResistanceAura_19896()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowResistanceAura_19896",
    testCategory,
    19896
  )
end

function me.TestSoundShadowResistanceAura_19895()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowResistanceAura_19895",
    testCategory,
    19895
  )
end

function me.TestSoundShadowResistanceAura_19876()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowResistanceAura_19876",
    testCategory,
    19876
  )
end

function me.TestSoundFrostResistanceAura_19898()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostResistanceAura_19898",
    testCategory,
    19898
  )
end

function me.TestSoundFrostResistanceAura_19897()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostResistanceAura_19897",
    testCategory,
    19897
  )
end

function me.TestSoundFrostResistanceAura_19888()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostResistanceAura_19888",
    testCategory,
    19888
  )
end

function me.TestSoundFireResistanceAura_19900()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFireResistanceAura_19900",
    testCategory,
    19900
  )
end

function me.TestSoundFireResistanceAura_19899()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFireResistanceAura_19899",
    testCategory,
    19899
  )
end

function me.TestSoundFireResistanceAura_19891()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFireResistanceAura_19891",
    testCategory,
    19891
  )
end

function me.TestSoundBlessingOfProtection_10278()
  mod.testHelper.TestSoundApplied(
    "TestSoundBlessingOfProtection_10278",
    testCategory,
    10278
  )
end

function me.TestSoundDownBlessingOfProtection_10278()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBlessingOfProtection_10278",
    testCategory,
    10278
  )
end

function me.TestSoundBlessingOfProtection_5599()
  mod.testHelper.TestSoundApplied(
    "TestSoundBlessingOfProtection_5599",
    testCategory,
    5599
  )
end

function me.TestSoundDownBlessingOfProtection_5599()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBlessingOfProtection_5599",
    testCategory,
    5599
  )
end

function me.TestSoundBlessingOfProtection_1022()
  mod.testHelper.TestSoundApplied(
    "TestSoundBlessingOfProtection_1022",
    testCategory,
    1022
  )
end

function me.TestSoundDownBlessingOfProtection_1022()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBlessingOfProtection_1022",
    testCategory,
    1022
  )
end

function me.TestSoundBlessingOfFreedom_1044()
  mod.testHelper.TestSoundApplied(
    "TestSoundBlessingOfFreedom_1044",
    testCategory,
    1044
  )
end

function me.TestSoundDownBlessingOfFreedom_1044()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBlessingOfFreedom_1044",
    testCategory,
    1044
  )
end

function me.TestSoundBlessingOfSacrifice_20729()
  mod.testHelper.TestSoundApplied(
    "TestSoundBlessingOfSacrifice_20729",
    testCategory,
    20729
  )
end

function me.TestSoundDownBlessingOfSacrifice_20729()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBlessingOfSacrifice_20729",
    testCategory,
    20729
  )
end

function me.TestSoundBlessingOfSacrifice_6940()
  mod.testHelper.TestSoundApplied(
    "TestSoundBlessingOfSacrifice_6940",
    testCategory,
    6940
  )
end

function me.TestSoundDownBlessingOfSacrifice_6940()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBlessingOfSacrifice_6940",
    testCategory,
    6940
  )
end

function me.TestSoundHammerOfJustice_10308()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHammerOfJustice_10308",
    testCategory,
    10308
  )
end

function me.TestSoundHammerOfJustice_853()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHammerOfJustice_853",
    testCategory,
    853
  )
end

function me.TestSoundHammerOfJustice_5588()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHammerOfJustice_5588",
    testCategory,
    5588
  )
end

function me.TestSoundHammerOfJustice_5589()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHammerOfJustice_5589",
    testCategory,
    5589
  )
end

function me.TestSoundRepentance_20066()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRepentance_20066",
    testCategory,
    20066
  )
end

function me.TestSoundDivineShield_642()
  mod.testHelper.TestSoundApplied(
    "TestSoundDivineShield_642",
    testCategory,
    642
  )
end

function me.TestSoundDownDivineShield_642()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDivineShield_642",
    testCategory,
    642
  )
end

function me.TestSoundDivineShield_1020()
  mod.testHelper.TestSoundApplied(
    "TestSoundDivineShield_1020",
    testCategory,
    1020
  )
end

function me.TestSoundDownDivineShield_1020()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDivineShield_1020",
    testCategory,
    1020
  )
end

function me.TestSoundForbearance_25771()
  mod.testHelper.TestSoundApplied(
    "TestSoundForbearance_25771",
    testCategory,
    25771
  )
end

function me.TestSoundDownForbearance_25771()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownForbearance_25771",
    testCategory,
    25771
  )
end

function me.TestSoundLayOnHands_10310()
  mod.testHelper.TestSoundSuccess(
    "TestSoundLayOnHands_10310",
    testCategory,
    10310
  )
end

function me.TestSoundLayOnHands_633()
  mod.testHelper.TestSoundSuccess(
    "TestSoundLayOnHands_633",
    testCategory,
    633
  )
end

function me.TestSoundLayOnHands_2800()
  mod.testHelper.TestSoundSuccess(
    "TestSoundLayOnHands_2800",
    testCategory,
    2800
  )
end

function me.TestSoundDivineProtection_5573()
  mod.testHelper.TestSoundApplied(
    "TestSoundDivineProtection_5573",
    testCategory,
    5573
  )
end

function me.TestSoundDownDivineProtection_5573()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDivineProtection_5573",
    testCategory,
    5573
  )
end

function me.TestSoundDivineProtection_498()
  mod.testHelper.TestSoundApplied(
    "TestSoundDivineProtection_498",
    testCategory,
    498
  )
end

function me.TestSoundDownDivineProtection_498()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDivineProtection_498",
    testCategory,
    498
  )
end

function me.TestSoundAegis_425589()
  mod.testHelper.TestSoundApplied(
    "TestSoundAegis_425589",
    testCategory,
    425589
  )
end

function me.TestSoundDownAegis_425589()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAegis_425589",
    testCategory,
    425589
  )
end

function me.TestSoundDivineSacrifice_407804()
  mod.testHelper.TestSoundApplied(
    "TestSoundDivineSacrifice_407804",
    testCategory,
    407804
  )
end

function me.TestSoundDownDivineSacrifice_407804()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDivineSacrifice_407804",
    testCategory,
    407804
  )
end

function me.TestSoundInspirationExemplar_407880()
  mod.testHelper.TestSoundSuccess(
    "TestSoundInspirationExemplar_407880",
    testCategory,
    407880
  )
end

function me.TestSoundAvengersShield_407669()
  mod.testHelper.TestSoundSuccess(
    "TestSoundAvengersShield_407669",
    testCategory,
    407669
  )
end

function me.TestSoundRebuke_425609()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRebuke_425609",
    testCategory,
    425609
  )
end

function me.TestSoundCrusaderStrike_407676()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCrusaderStrike_407676",
    testCategory,
    407676
  )
end

function me.TestSoundDivineStorm_407778()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDivineStorm_407778",
    testCategory,
    407778
  )
end

function me.TestSoundDivineSteed_461607()
  mod.testHelper.TestSoundApplied(
    "TestSoundDivineSteed_461607",
    testCategory,
    461607
  )
end

function me.TestSoundDownDivineSteed_461607()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDivineSteed_461607",
    testCategory,
    461607
  )
end

function me.TestSoundHandOfSacrifice_462853()
  mod.testHelper.TestSoundApplied(
    "TestSoundHandOfSacrifice_462853",
    testCategory,
    462853
  )
end

function me.TestSoundDownHandOfSacrifice_462853()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownHandOfSacrifice_462853",
    testCategory,
    462853
  )
end

function me.TestSoundDivineLight_409925()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDivineLight_409925",
    testCategory,
    409925
  )
end

function me.TestSoundAvengingWrath_407788()
  mod.testHelper.TestSoundApplied(
    "TestSoundAvengingWrath_407788",
    testCategory,
    407788
  )
end

function me.TestSoundDownAvengingWrath_407788()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAvengingWrath_407788",
    testCategory,
    407788
  )
end


