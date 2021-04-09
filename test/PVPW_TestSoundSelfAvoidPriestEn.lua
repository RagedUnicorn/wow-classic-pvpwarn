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
mod.testSoundSelfAvoidPriestEn = me

me.tag = "TestSoundSelfAvoidPriestEn"

-- /run rgpvpw.testSoundSelfAvoidPriestEn.Test()

local testGroupName = "SoundSelfAvoidPriestEn"
local testCategory = "priest"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidDevouringPlague)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidBlackout)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidManaBurn)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidMindControl)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPsychicScream)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidShadowWordPain)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidSilence)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidVampiricEmbrace)
end

function me.TestSoundSelfAvoidDevouringPlague()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidDevouringPlague",
    testCategory,
    "Devouring Plague"
  )
end

function me.TestSoundSelfAvoidBlackout()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidBlackout",
    testCategory,
    "Blackout"
  )
end

function me.TestSoundSelfAvoidManaBurn()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidManaBurn",
    testCategory,
    "Mana Burn"
  )
end

function me.TestSoundSelfAvoidMindControl()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidMindControl",
    testCategory,
    "Mind Control"
  )
end

function me.TestSoundSelfAvoidPsychicScream()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidPsychicScream",
    testCategory,
    "Psychic Scream"
  )
end

function me.TestSoundSelfAvoidShadowWordPain()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidShadowWordPain",
    testCategory,
    "Shadow Word: Pain"
  )
end

function me.TestSoundSelfAvoidSilence()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidSilence",
    testCategory,
    "Silence"
  )
end

function me.TestSoundSelfAvoidVampiricEmbrace()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidVampiricEmbrace",
    testCategory,
    "Vampiric Embrace"
  )
end
