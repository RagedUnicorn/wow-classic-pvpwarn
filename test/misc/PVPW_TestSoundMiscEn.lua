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

local mod = rgpvpw
local me = {}
mod.testSoundMiscEn = me

me.tag = "TestSoundMiscEn"

local testGroupName = "SoundMiscEn"
local testCategory = "misc"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRestoreEnergy)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMightyRagePotion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFirstAid)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFireProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNatureProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNatureProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundArcaneProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownArcaneProtection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRestoration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRestoration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLivingFreeAction)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownLivingFreeAction)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFreeAction)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFreeAction)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInvulnerability)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInvulnerability)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInvisibility)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLesserInvisibility)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStealthDetection)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownStealthDetection)
end

function me.TestSoundRestoreEnergy()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRestoreEnergy",
    testCategory,
    "Restore Energy"
  )
end

function me.TestSoundMightyRagePotion()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMightyRagePotion",
    testCategory,
    "Mighty Rage Potion"
  )
end

function me.TestSoundFirstAid()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFirstAid",
    testCategory,
    "First Aid"
  )
end

function me.TestSoundShadowProtection()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowProtection",
    testCategory,
    "Shadow Protection"
  )
end

function me.TestSoundDownShadowProtection()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowProtection",
    testCategory,
    "Shadow Protection"
  )
end

function me.TestSoundFrostProtection()
  mod.testHelper.TestSoundApplied(
    "TestSoundFrostProtection",
    testCategory,
    "Frost Protection"
  )
end

function me.TestSoundDownFrostProtection()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFrostProtection",
    testCategory,
    "Frost Protection"
  )
end

function me.TestSoundFireProtection()
  mod.testHelper.TestSoundApplied(
    "TestSoundFireProtection",
    testCategory,
    "Fire Protection"
  )
end

function me.TestSoundDownFireProtection()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFireProtection",
    testCategory,
    "Fire Protection"
  )
end

function me.TestSoundNatureProtection()
  mod.testHelper.TestSoundApplied(
    "TestSoundNatureProtection",
    testCategory,
    "Nature Protection"
  )
end

function me.TestSoundDownNatureProtection()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownNatureProtection",
    testCategory,
    "Nature Protection"
  )
end

function me.TestSoundArcaneProtection()
  mod.testHelper.TestSoundApplied(
    "TestSoundArcaneProtection",
    testCategory,
    "Arcane Protection"
  )
end

function me.TestSoundDownArcaneProtection()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownArcaneProtection",
    testCategory,
    "Arcane Protection"
  )
end

function me.TestSoundRestoration()
  mod.testHelper.TestSoundApplied(
    "TestSoundRestoration",
    testCategory,
    "Restoration"
  )
end

function me.TestSoundDownRestoration()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownRestoration",
    testCategory,
    "Restoration"
  )
end

function me.TestSoundLivingFreeAction()
  mod.testHelper.TestSoundApplied(
    "TestSoundLivingFreeAction",
    testCategory,
    "Living Free Action"
  )
end

function me.TestSoundDownLivingFreeAction()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownLivingFreeAction",
    testCategory,
    "Living Free Action"
  )
end

function me.TestSoundFreeAction()
  mod.testHelper.TestSoundApplied(
    "TestSoundFreeAction",
    testCategory,
    "Free Action"
  )
end

function me.TestSoundDownFreeAction()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFreeAction",
    testCategory,
    "Free Action"
  )
end

function me.TestSoundInvulnerability()
  mod.testHelper.TestSoundApplied(
    "TestSoundInvulnerability",
    testCategory,
    "Invulnerability"
  )
end

function me.TestSoundDownInvulnerability()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownInvulnerability",
    testCategory,
    "Invulnerability"
  )
end

function me.TestSoundInvisibility()
  mod.testHelper.TestSoundSuccess(
    "TestSoundInvisibility",
    testCategory,
    "Invisibility"
  )
end

function me.TestSoundLesserInvisibility()
  mod.testHelper.TestSoundSuccess(
    "TestSoundLesserInvisibility",
    testCategory,
    "Lesser Invisibility"
  )
end

function me.TestSoundStealthDetection()
  mod.testHelper.TestSoundApplied(
    "TestSoundStealthDetection",
    testCategory,
    "Stealth Detection"
  )
end

function me.TestSoundDownStealthDetection()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownStealthDetection",
    testCategory,
    "Stealth Detection"
  )
end
