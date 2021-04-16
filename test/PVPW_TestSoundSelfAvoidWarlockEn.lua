--[[
  MIT License

  Copyright (c) 2021 Michael Wiesendanger

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
mod.testSoundSelfAvoidWarlockEn = me

me.tag = "TestSoundSelfAvoidWarlockEn"

local testGroupName = "SoundSelfAvoidWarlockEn"
local testCategory = "warlock"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidCurseOfTongues)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidDeathCoil)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFear)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidHowlOfTerror)
end

function me.TestSoundSelfAvoidCurseOfTongues()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidCurseOfTongues",
    testCategory,
    "Curse of Tongues"
  )
end

function me.TestSoundSelfAvoidDeathCoil()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidDeathCoil",
    testCategory,
    "Death Coil"
  )
end

function me.TestSoundSelfAvoidFear()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFear",
    testCategory,
    "Fear"
  )
end

function me.TestSoundSelfAvoidHowlOfTerror()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidHowlOfTerror",
    testCategory,
    "Howl of Terror"
  )
end
