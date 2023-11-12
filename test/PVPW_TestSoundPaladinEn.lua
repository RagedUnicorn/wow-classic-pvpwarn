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

local mod = rgpvpw
local me = {}
mod.testSoundPaladinEn = me

me.tag = "TestSoundPaladinEn"

local testGroupName = "SoundPaladinEn"
local testCategory = "paladin"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevotionAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRetributionAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundConcentrationAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowResistanceAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostResistanceAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireResistanceAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlessingOfProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlessingOfProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlessingOfFreedom)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlessingOfFreedom)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlessingOfSacrifice)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBlessingOfSacrifice)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHammerOfJustice)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRepentance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDivineShield)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDivineShield)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundForbearance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownForbearance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLayOnHands)
end

function me.TestSoundDevotionAura()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDevotionAura",
    testCategory,
    "Devotion Aura"
  )
end

function me.TestSoundRetributionAura()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRetributionAura",
    testCategory,
    "Retribution Aura"
  )
end

function me.TestSoundConcentrationAura()
  mod.testHelper.TestSoundSuccess(
    "TestSoundConcentrationAura",
    testCategory,
    "Concentration Aura"
  )
end

function me.TestSoundShadowResistanceAura()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowResistanceAura",
    testCategory,
    "Shadow Resistance Aura"
  )
end

function me.TestSoundFrostResistanceAura()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostResistanceAura",
    testCategory,
    "Frost Resistance Aura"
  )
end

function me.TestSoundFireResistanceAura()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFireResistanceAura",
    testCategory,
    "Fire Resistance Aura"
  )
end

function me.TestSoundBlessingOfProtection()
  mod.testHelper.TestSoundApplied(
    "TestSoundBlessingOfProtection",
    testCategory,
    "Blessing of Protection"
  )
end

function me.TestSoundDownBlessingOfProtection()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBlessingOfProtection",
    testCategory,
    "Blessing of Protection"
  )
end

function me.TestSoundBlessingOfFreedom()
  mod.testHelper.TestSoundApplied(
    "TestSoundBlessingOfFreedom",
    testCategory,
    "Blessing of Freedom"
  )
end

function me.TestSoundDownBlessingOfFreedom()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBlessingOfFreedom",
    testCategory,
    "Blessing of Freedom"
  )
end

function me.TestSoundBlessingOfSacrifice()
  mod.testHelper.TestSoundApplied(
    "TestSoundBlessingOfSacrifice",
    testCategory,
    "Blessing of Sacrifice"
  )
end

function me.TestSoundDownBlessingOfSacrifice()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBlessingOfSacrifice",
    testCategory,
    "Blessing of Sacrifice"
  )
end

function me.TestSoundHammerOfJustice()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHammerOfJustice",
    testCategory,
    "Hammer of Justice"
  )
end

function me.TestSoundRepentance()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRepentance",
    testCategory,
    "Repentance"
  )
end

function me.TestSoundDivineShield()
  mod.testHelper.TestSoundApplied(
    "TestSoundDivineShield",
    testCategory,
    "Divine Shield"
  )
end

function me.TestSoundDownDivineShield()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDivineShield",
    testCategory,
    "Divine Shield"
  )
end

function me.TestSoundForbearance()
  mod.testHelper.TestSoundApplied(
    "TestSoundForbearance",
    testCategory,
    "Forbearance"
  )
end

function me.TestSoundDownForbearance()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownForbearance",
    testCategory,
    "Forbearance"
  )
end

function me.TestSoundLayOnHands()
  mod.testHelper.TestSoundSuccess(
    "TestSoundLayOnHands",
    testCategory,
    "Lay on Hands"
  )
end
