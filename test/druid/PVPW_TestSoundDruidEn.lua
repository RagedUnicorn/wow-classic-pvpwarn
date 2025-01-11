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
mod.testSoundDruidEn = me

me.tag = "TestSoundDruidEn"

local testGroupName = "SoundDruidEn"
local testCategory = "druid"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDireBearForm)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCatForm)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTravelForm)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAquaticForm)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMoonkinForm)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBarkskin)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBarkskin)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNaturesGrasp)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNaturesGrasp)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBash)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFeralCharge)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrenziedRegeneration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrenziedRegeneration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAbolishPoison)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAbolishPoison)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInnervate)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInnervate)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNaturesSwiftness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNaturesSwiftness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFaerieFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFaerieFireFeral)
  -- runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSkullBash)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSavageRoar)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSavageRoar)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLacerate)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWildGrowth)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMangle)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserk)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserk)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSurvivalInstincts)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSurvivalInstincts)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTreeOfLife)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFuryOfStormrage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFuryOfStormrage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEclipseSolar)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEclipseSolar)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEclipseLunar)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEclipseLunar)
end

function me.TestSoundDireBearForm()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDireBearForm",
    testCategory,
    "Dire Bear Form"
  )
end

function me.TestSoundCatForm()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCatForm",
    testCategory,
    "Cat Form"
  )
end

function me.TestSoundTravelForm()
  mod.testHelper.TestSoundSuccess(
    "TestSoundTravelForm",
    testCategory,
    "Travel Form"
  )
end

function me.TestSoundAquaticForm()
  mod.testHelper.TestSoundSuccess(
    "TestSoundAquaticForm",
    testCategory,
    "Aquatic Form"
  )
end

function me.TestSoundMoonkinForm()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMoonkinForm",
    testCategory,
    "Moonkin Form"
  )
end

function me.TestSoundBarkskin()
  mod.testHelper.TestSoundApplied(
    "TestSoundBarkskin",
    testCategory,
    "Barkskin"
  )
end

function me.TestSoundDownBarkskin()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBarkskin",
    testCategory,
    "Barkskin"
  )
end

function me.TestSoundNaturesGrasp()
  mod.testHelper.TestSoundApplied(
    "TestSoundNaturesGrasp",
    testCategory,
    "Nature's Grasp"
  )
end

function me.TestSoundDownNaturesGrasp()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownNaturesGrasp",
    testCategory,
    "Nature's Grasp"
  )
end

function me.TestSoundBash()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBash",
    testCategory,
    "Bash"
  )
end

function me.TestSoundFeralCharge()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFeralCharge",
    testCategory,
    "Feral Charge"
  )
end

function me.TestSoundFrenziedRegeneration()
  mod.testHelper.TestSoundApplied(
    "TestSoundFrenziedRegeneration",
    testCategory,
    "Frenzied Regeneration"
  )
end

function me.TestSoundDownFrenziedRegeneration()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFrenziedRegeneration",
    testCategory,
    "Frenzied Regeneration"
  )
end

function me.TestSoundAbolishPoison()
  mod.testHelper.TestSoundApplied(
    "TestSoundAbolishPoison",
    testCategory,
    "Abolish Poison"
  )
end

function me.TestSoundDownAbolishPoison()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAbolishPoison",
    testCategory,
    "Abolish Poison"
  )
end

function me.TestSoundInnervate()
  mod.testHelper.TestSoundApplied(
    "TestSoundInnervate",
    testCategory,
    "Innervate"
  )
end

function me.TestSoundDownInnervate()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownInnervate",
    testCategory,
    "Innervate"
  )
end

function me.TestSoundNaturesSwiftness()
  mod.testHelper.TestSoundApplied(
    "TestSoundNaturesSwiftness",
    testCategory,
    "Nature's Swiftness"
  )
end

function me.TestSoundDownNaturesSwiftness()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownNaturesSwiftness",
    testCategory,
    "Nature's Swiftness"
  )
end

function me.TestSoundFaerieFire()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFaerieFire",
    testCategory,
    "Faerie Fire"
  )
end

function me.TestSoundFaerieFireFeral()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFaerieFireFeral",
    testCategory,
    "Faerie Fire (Feral)"
  )
end

function me.TestSoundSkullBash()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSkullBash",
    testCategory,
    "Skull Bash"
  )
end

function me.TestSoundSavageRoar()
  mod.testHelper.TestSoundApplied(
    "TestSoundSavageRoar",
    testCategory,
    "Savage Roar"
  )
end

function me.TestSoundDownSavageRoar()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSavageRoar",
    testCategory,
    "Savage Roar"
  )
end

function me.TestSoundLacerate()
  mod.testHelper.TestSoundSuccess(
    "TestSoundLacerate",
    testCategory,
    "Lacerate"
  )
end

function me.TestSoundWildGrowth()
  mod.testHelper.TestSoundSuccess(
    "TestSoundWildGrowth",
    testCategory,
    "Wild Growth"
  )
end

function me.TestSoundMangle()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMangle",
    testCategory,
    "Mangle"
  )
end

function me.TestSoundBerserk()
  mod.testHelper.TestSoundApplied(
    "TestSoundBerserk",
    testCategory,
    "Berserk"
  )
end

function me.TestSoundDownBerserk()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBerserk",
    testCategory,
    "Berserk"
  )
end

function me.TestSoundSurvivalInstincts()
  mod.testHelper.TestSoundApplied(
    "TestSoundSurvivalInstincts",
    testCategory,
    "Survival Instincts"
  )
end

function me.TestSoundDownSurvivalInstincts()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSurvivalInstincts",
    testCategory,
    "Survival Instincts"
  )
end

function me.TestSoundTreeOfLife()
  mod.testHelper.TestSoundSuccess(
    "TestSoundTreeOfLife",
    testCategory,
    "Tree of Life"
  )
end

function me.TestSoundFuryOfStormrage()
  mod.testHelper.TestSoundApplied(
    "TestSoundFuryOfStormrage",
    testCategory,
    "Fury of Stormrage"
  )
end

function me.TestSoundDownFuryOfStormrage()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFuryOfStormrage",
    testCategory,
    "Fury of Stormrage"
  )
end

function me.TestSoundEclipseSolar()
  mod.testHelper.TestSoundApplied(
    "TestSoundEclipseSolar",
    testCategory,
    "Eclipse (Solar)"
  )
end

function me.TestSoundDownEclipseSolar()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEclipseSolar",
    testCategory,
    "Eclipse (Solar)"
  )
end

function me.TestSoundEclipseLunar()
  mod.testHelper.TestSoundApplied(
    "TestSoundEclipseLunar",
    testCategory,
    "Eclipse (Lunar)"
  )
end

function me.TestSoundDownEclipseLunar()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEclipseLunar",
    testCategory,
    "Eclipse (Lunar)"
  )
end
