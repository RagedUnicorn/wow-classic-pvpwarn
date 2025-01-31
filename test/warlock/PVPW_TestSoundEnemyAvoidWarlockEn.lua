--[[
  MIT License

  Copyright (c) 2025 Michael Wiesendanger

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
mod.testSoundEnemyAvoidWarlockEn = me

me.tag = "TestSoundEnemyAvoidWarlockEn"

local testGroupName = "SoundEnemyAvoidWarlockEn"
local testCategory = "warlock"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidCurseOfTongues)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDeathCoil)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFear)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidHowlOfTerror)
end

function me.TestSoundEnemyAvoidCurseOfTongues()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidCurseOfTongues",
    testCategory,
    "Curse of Tongues"
  )
end

function me.TestSoundEnemyAvoidDeathCoil()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidDeathCoil",
    testCategory,
    "Death Coil"
  )
end

function me.TestSoundEnemyAvoidFear()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFear",
    testCategory,
    "Fear"
  )
end

function me.TestSoundEnemyAvoidHowlOfTerror()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidHowlOfTerror",
    testCategory,
    "Howl of Terror"
  )
end
