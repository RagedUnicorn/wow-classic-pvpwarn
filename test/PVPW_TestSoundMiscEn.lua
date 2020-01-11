--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

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

    mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRestoreEnergy)
    mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMightyRagePotion)
    mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFirstAid)
    mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowProtection)
    mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostProtection)
    mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireProtection)
    mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNatureProtection)
    mod.testReporter.AddToTestQueueWithDelay(me.TestSoundArcaneProtection)

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
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
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowProtection",
    testCategory,
    "Shadow Protection"
  )
end

function me.TestSoundFrostProtection()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostProtection",
    testCategory,
    "Frost Protection"
  )
end

function me.TestSoundFireProtection()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFireProtection",
    testCategory,
    "Fire Protection"
  )
end

function me.TestSoundNatureProtection()
  mod.testHelper.TestSoundSuccess(
    "TestSoundNatureProtection",
    testCategory,
    "Nature Protection"
  )
end

function me.TestSoundArcaneProtection()
  mod.testHelper.TestSoundSuccess(
    "TestSoundArcaneProtection",
    testCategory,
    "Arcane Protection"
  )
end
