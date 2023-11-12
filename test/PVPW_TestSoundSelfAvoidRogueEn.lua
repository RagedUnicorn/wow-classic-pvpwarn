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
mod.testSoundSelfAvoidRogueEn = me

me.tag = "TestSoundSelfAvoidRogueEn"

local testGroupName = "SoundSelfAvoidRogueEn"
local testCategory = "rogue"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidKick)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidCheapShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidGouge)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidKidneyShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidBlind)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidGhostlyStrike)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidDistract)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidExposeArmor)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidGarrote)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidRupture)
end

function me.TestSoundSelfAvoidKick()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidKick",
    testCategory,
    "Kick"
  )
end

function me.TestSoundSelfAvoidCheapShot()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidCheapShot",
    testCategory,
    "Cheap Shot"
  )
end

function me.TestSoundSelfAvoidGouge()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidGouge",
    testCategory,
    "Gouge"
  )
end

function me.TestSoundSelfAvoidKidneyShot()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidKidneyShot",
    testCategory,
    "Kidney Shot"
  )
end

function me.TestSoundSelfAvoidBlind()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidBlind",
    testCategory,
    "Blind"
  )
end

function me.TestSoundSelfAvoidGhostlyStrike()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidGhostlyStrike",
    testCategory,
    "Ghostly Strike"
  )
end

function me.TestSoundSelfAvoidSap()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidSap",
    testCategory,
    "Sap"
  )
end

function me.TestSoundSelfAvoidDistract()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidDistract",
    testCategory,
    "Distract"
  )
end

function me.TestSoundSelfAvoidExposeArmor()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidExposeArmor",
    testCategory,
    "Expose Armor"
  )
end

function me.TestSoundSelfAvoidGarrote()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidGarrote",
    testCategory,
    "Garrote"
  )
end

function me.TestSoundSelfAvoidRupture()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidRupture",
    testCategory,
    "Rupture"
  )
end
