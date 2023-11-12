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
mod.testSoundSelfAvoidHunterEn = me

me.tag = "TestSoundSelfAvoidHunterEn"

local testGroupName = "SoundSelfAvoidHunterEn"
local testCategory = "hunter"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidConcussiveShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidScatterShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSerpentSting)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidViperSting)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFreezingTrapEffect)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidWingClip)
end

function me.TestSoundSelfAvoidConcussiveShot()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidConcussiveShot",
    testCategory,
    "Concussive Shot"
  )
end

function me.TestSoundSelfAvoidScatterShot()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidScatterShot",
    testCategory,
    "Scatter Shot"
  )
end

function me.TestSoundSelfAvoidSerpentSting()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidSerpentSting",
    testCategory,
    "Serpent Sting"
  )
end

function me.TestSoundSelfAvoidViperSting()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidViperSting",
    testCategory,
    "Viper Sting"
  )
end

function me.TestSoundSelfAvoidFreezingTrapEffect()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFreezingTrapEffect",
    testCategory,
    "Freezing Trap Effect"
  )
end

function me.TestSoundSelfAvoidWingClip()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidWingClip",
    testCategory,
    "Wing Clip"
  )
end
