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
mod.testSoundSelfAvoidMageEn = me

me.tag = "TestSoundSelfAvoidMageEn"

local testGroupName = "SoundSelfAvoidMageEn"
local testCategory = "mage"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidCounterspell)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidCounterspellSilenced)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPolymorph)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFrostNova)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidConeOfCold)
end

function me.TestSoundSelfAvoidCounterspell()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidCounterspell",
    testCategory,
    "Counterspell"
  )
end

function me.TestSoundSelfAvoidCounterspellSilenced()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidCounterspellSilenced",
    testCategory,
    "Counterspell - Silenced"
  )
end

function me.TestSoundSelfAvoidPolymorph()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidPolymorph",
    testCategory,
    "Polymorph"
  )
end

function me.TestSoundSelfAvoidFrostNova()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFrostNova",
    testCategory,
    "Frost Nova"
  )
end

function me.TestSoundSelfAvoidConeOfCold()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidConeOfCold",
    testCategory,
    "Cone of Cold"
  )
end
