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
mod.testSoundDruid = me

me.tag = "TestSoundDruid"

local testCategory = "druid"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound druid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBearForm_5487)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBearForm_5487)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDireBearForm_9634)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDireBearForm_9634)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCatForm_768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownCatForm_768)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTravelForm_783)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTravelForm_783)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAquaticForm_1066)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAquaticForm_1066)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMoonkinForm_24858)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownMoonkinForm_24858)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBarkskin_22812)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBarkskin_22812)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNaturesGrasp_17329)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNaturesGrasp_17329)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNaturesGrasp_16689)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNaturesGrasp_16689)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNaturesGrasp_16810)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNaturesGrasp_16810)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNaturesGrasp_16811)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNaturesGrasp_16811)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNaturesGrasp_16812)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNaturesGrasp_16812)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNaturesGrasp_16813)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNaturesGrasp_16813)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBash_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBash_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBash_6798)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFeralCharge_16979)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrenziedRegeneration_22896)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrenziedRegeneration_22896)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrenziedRegeneration_22842)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrenziedRegeneration_22842)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrenziedRegeneration_22895)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrenziedRegeneration_22895)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAbolishPoison_2893)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAbolishPoison_2893)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInnervate_29166)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInnervate_29166)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNaturesSwiftness_17116)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNaturesSwiftness_17116)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFaerieFire_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFaerieFire_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFaerieFire_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFaerieFire_9749)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFaerieFireFeral_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFaerieFireFeral_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFaerieFireFeral_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFaerieFireFeral_17391)

  -- start runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSkullBash_410176)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSavageRoar_407988)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSavageRoar_407988)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLacerate_414644)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWildGrowth_408120)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMangle_407995)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserk_417141)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserk_417141)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSurvivalInstincts_408024)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSurvivalInstincts_408024)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTreeOfLife_439733)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTreeOfLife_439733)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFuryOfStormrage_414799)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFuryOfStormrage_414799)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEclipseSolar_408250)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEclipseSolar_408250)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEclipseLunar_441260)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEclipseLunar_441260)
end

function me.TestSoundBearForm_5487()
  mod.testHelper.TestSoundApplied(
    "TestSoundBearForm_5487",
    testCategory,
    5487
  )
end

function me.TestSoundDownBearForm_5487()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBearForm_5487",
    testCategory,
    5487
  )
end

function me.TestSoundDireBearForm_9634()
  mod.testHelper.TestSoundApplied(
    "TestSoundDireBearForm_9634",
    testCategory,
    9634
  )
end

function me.TestSoundDownDireBearForm_9634()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDireBearForm_9634",
    testCategory,
    9634
  )
end

function me.TestSoundCatForm_768()
  mod.testHelper.TestSoundApplied(
    "TestSoundCatForm_768",
    testCategory,
    768
  )
end

function me.TestSoundDownCatForm_768()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownCatForm_768",
    testCategory,
    768
  )
end

function me.TestSoundTravelForm_783()
  mod.testHelper.TestSoundApplied(
    "TestSoundTravelForm_783",
    testCategory,
    783
  )
end

function me.TestSoundDownTravelForm_783()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownTravelForm_783",
    testCategory,
    783
  )
end

function me.TestSoundAquaticForm_1066()
  mod.testHelper.TestSoundApplied(
    "TestSoundAquaticForm_1066",
    testCategory,
    1066
  )
end

function me.TestSoundDownAquaticForm_1066()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAquaticForm_1066",
    testCategory,
    1066
  )
end

function me.TestSoundMoonkinForm_24858()
  mod.testHelper.TestSoundApplied(
    "TestSoundMoonkinForm_24858",
    testCategory,
    24858
  )
end

function me.TestSoundDownMoonkinForm_24858()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownMoonkinForm_24858",
    testCategory,
    24858
  )
end

function me.TestSoundBarkskin_22812()
  mod.testHelper.TestSoundApplied(
    "TestSoundBarkskin_22812",
    testCategory,
    22812
  )
end

function me.TestSoundDownBarkskin_22812()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBarkskin_22812",
    testCategory,
    22812
  )
end

function me.TestSoundNaturesGrasp_17329()
  mod.testHelper.TestSoundApplied(
    "TestSoundNaturesGrasp_17329",
    testCategory,
    17329
  )
end

function me.TestSoundDownNaturesGrasp_17329()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownNaturesGrasp_17329",
    testCategory,
    17329
  )
end

function me.TestSoundNaturesGrasp_16689()
  mod.testHelper.TestSoundApplied(
    "TestSoundNaturesGrasp_16689",
    testCategory,
    16689
  )
end

function me.TestSoundDownNaturesGrasp_16689()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownNaturesGrasp_16689",
    testCategory,
    16689
  )
end

function me.TestSoundNaturesGrasp_16810()
  mod.testHelper.TestSoundApplied(
    "TestSoundNaturesGrasp_16810",
    testCategory,
    16810
  )
end

function me.TestSoundDownNaturesGrasp_16810()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownNaturesGrasp_16810",
    testCategory,
    16810
  )
end

function me.TestSoundNaturesGrasp_16811()
  mod.testHelper.TestSoundApplied(
    "TestSoundNaturesGrasp_16811",
    testCategory,
    16811
  )
end

function me.TestSoundDownNaturesGrasp_16811()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownNaturesGrasp_16811",
    testCategory,
    16811
  )
end

function me.TestSoundNaturesGrasp_16812()
  mod.testHelper.TestSoundApplied(
    "TestSoundNaturesGrasp_16812",
    testCategory,
    16812
  )
end

function me.TestSoundDownNaturesGrasp_16812()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownNaturesGrasp_16812",
    testCategory,
    16812
  )
end

function me.TestSoundNaturesGrasp_16813()
  mod.testHelper.TestSoundApplied(
    "TestSoundNaturesGrasp_16813",
    testCategory,
    16813
  )
end

function me.TestSoundDownNaturesGrasp_16813()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownNaturesGrasp_16813",
    testCategory,
    16813
  )
end

function me.TestSoundBash_8983()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBash_8983",
    testCategory,
    8983
  )
end

function me.TestSoundBash_5211()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBash_5211",
    testCategory,
    5211
  )
end

function me.TestSoundBash_6798()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBash_6798",
    testCategory,
    6798
  )
end

function me.TestSoundFeralCharge_16979()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFeralCharge_16979",
    testCategory,
    16979
  )
end

function me.TestSoundFrenziedRegeneration_22896()
  mod.testHelper.TestSoundApplied(
    "TestSoundFrenziedRegeneration_22896",
    testCategory,
    22896
  )
end

function me.TestSoundDownFrenziedRegeneration_22896()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFrenziedRegeneration_22896",
    testCategory,
    22896
  )
end

function me.TestSoundFrenziedRegeneration_22842()
  mod.testHelper.TestSoundApplied(
    "TestSoundFrenziedRegeneration_22842",
    testCategory,
    22842
  )
end

function me.TestSoundDownFrenziedRegeneration_22842()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFrenziedRegeneration_22842",
    testCategory,
    22842
  )
end

function me.TestSoundFrenziedRegeneration_22895()
  mod.testHelper.TestSoundApplied(
    "TestSoundFrenziedRegeneration_22895",
    testCategory,
    22895
  )
end

function me.TestSoundDownFrenziedRegeneration_22895()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFrenziedRegeneration_22895",
    testCategory,
    22895
  )
end

function me.TestSoundAbolishPoison_2893()
  mod.testHelper.TestSoundApplied(
    "TestSoundAbolishPoison_2893",
    testCategory,
    2893
  )
end

function me.TestSoundDownAbolishPoison_2893()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAbolishPoison_2893",
    testCategory,
    2893
  )
end

function me.TestSoundInnervate_29166()
  mod.testHelper.TestSoundApplied(
    "TestSoundInnervate_29166",
    testCategory,
    29166
  )
end

function me.TestSoundDownInnervate_29166()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownInnervate_29166",
    testCategory,
    29166
  )
end

function me.TestSoundNaturesSwiftness_17116()
  mod.testHelper.TestSoundApplied(
    "TestSoundNaturesSwiftness_17116",
    testCategory,
    17116
  )
end

function me.TestSoundDownNaturesSwiftness_17116()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownNaturesSwiftness_17116",
    testCategory,
    17116
  )
end

function me.TestSoundFaerieFire_9907()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFaerieFire_9907",
    testCategory,
    9907
  )
end

function me.TestSoundFaerieFire_770()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFaerieFire_770",
    testCategory,
    770
  )
end

function me.TestSoundFaerieFire_778()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFaerieFire_778",
    testCategory,
    778
  )
end

function me.TestSoundFaerieFire_9749()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFaerieFire_9749",
    testCategory,
    9749
  )
end

function me.TestSoundFaerieFireFeral_17392()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFaerieFireFeral_17392",
    testCategory,
    17392
  )
end

function me.TestSoundFaerieFireFeral_16857()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFaerieFireFeral_16857",
    testCategory,
    16857
  )
end

function me.TestSoundFaerieFireFeral_17390()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFaerieFireFeral_17390",
    testCategory,
    17390
  )
end

function me.TestSoundFaerieFireFeral_17391()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFaerieFireFeral_17391",
    testCategory,
    17391
  )
end

function me.TestSoundSkullBash_410176()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSkullBash_410176",
    testCategory,
    410176
  )
end

function me.TestSoundSavageRoar_407988()
  mod.testHelper.TestSoundApplied(
    "TestSoundSavageRoar_407988",
    testCategory,
    407988
  )
end

function me.TestSoundDownSavageRoar_407988()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSavageRoar_407988",
    testCategory,
    407988
  )
end

function me.TestSoundLacerate_414644()
  mod.testHelper.TestSoundSuccess(
    "TestSoundLacerate_414644",
    testCategory,
    414644
  )
end

function me.TestSoundWildGrowth_408120()
  mod.testHelper.TestSoundSuccess(
    "TestSoundWildGrowth_408120",
    testCategory,
    408120
  )
end

function me.TestSoundMangle_407995()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMangle_407995",
    testCategory,
    407995
  )
end

function me.TestSoundBerserk_417141()
  mod.testHelper.TestSoundApplied(
    "TestSoundBerserk_417141",
    testCategory,
    417141
  )
end

function me.TestSoundDownBerserk_417141()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBerserk_417141",
    testCategory,
    417141
  )
end

function me.TestSoundSurvivalInstincts_408024()
  mod.testHelper.TestSoundApplied(
    "TestSoundSurvivalInstincts_408024",
    testCategory,
    408024
  )
end

function me.TestSoundDownSurvivalInstincts_408024()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSurvivalInstincts_408024",
    testCategory,
    408024
  )
end

function me.TestSoundTreeOfLife_439733()
  mod.testHelper.TestSoundApplied(
    "TestSoundTreeOfLife_439733",
    testCategory,
    439733
  )
end

function me.TestSoundDownTreeOfLife_439733()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownTreeOfLife_439733",
    testCategory,
    439733
  )
end

function me.TestSoundFuryOfStormrage_414799()
  mod.testHelper.TestSoundApplied(
    "TestSoundFuryOfStormrage_414799",
    testCategory,
    414799
  )
end

function me.TestSoundDownFuryOfStormrage_414799()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFuryOfStormrage_414799",
    testCategory,
    414799
  )
end

function me.TestSoundEclipseSolar_408250()
  mod.testHelper.TestSoundApplied(
    "TestSoundEclipseSolar_408250",
    testCategory,
    408250
  )
end

function me.TestSoundDownEclipseSolar_408250()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEclipseSolar_408250",
    testCategory,
    408250
  )
end

function me.TestSoundEclipseLunar_441260()
  mod.testHelper.TestSoundApplied(
    "TestSoundEclipseLunar_441260",
    testCategory,
    441260
  )
end

function me.TestSoundDownEclipseLunar_441260()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEclipseLunar_441260",
    testCategory,
    441260
  )
end
