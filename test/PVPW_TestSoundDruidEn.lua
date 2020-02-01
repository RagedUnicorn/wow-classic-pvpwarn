--[[
  MIT License

  Copyright (c) 2020 Michael Wiesendanger

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
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
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
