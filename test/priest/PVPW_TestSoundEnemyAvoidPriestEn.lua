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
mod.testSoundEnemyAvoidPriestEn = me

me.tag = "TestSoundEnemyAvoidPriestEn"

local testGroupName = "SoundEnemyAvoidPriestEn"
local testCategory = "priest"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDevouringPlague)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBlackout)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidManaBurn)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidMindControl)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPsychicScream)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidShadowWordPain)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSilence)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidVampiricEmbrace)
end

function me.TestSoundEnemyAvoidDevouringPlague()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidDevouringPlague",
    testCategory,
    "Devouring Plague"
  )
end

function me.TestSoundEnemyAvoidBlackout()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidBlackout",
    testCategory,
    "Blackout"
  )
end

function me.TestSoundEnemyAvoidManaBurn()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidManaBurn",
    testCategory,
    "Mana Burn"
  )
end

function me.TestSoundEnemyAvoidMindControl()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidMindControl",
    testCategory,
    "Mind Control"
  )
end

function me.TestSoundEnemyAvoidPsychicScream()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidPsychicScream",
    testCategory,
    "Psychic Scream"
  )
end

function me.TestSoundEnemyAvoidShadowWordPain()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidShadowWordPain",
    testCategory,
    "Shadow Word: Pain"
  )
end

function me.TestSoundEnemyAvoidSilence()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidSilence",
    testCategory,
    "Silence"
  )
end

function me.TestSoundEnemyAvoidVampiricEmbrace()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidVampiricEmbrace",
    testCategory,
    "Vampiric Embrace"
  )
end
