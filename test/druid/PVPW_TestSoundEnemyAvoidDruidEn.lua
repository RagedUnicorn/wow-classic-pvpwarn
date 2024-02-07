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
mod.testSoundEnemyAvoidDruidEn = me

me.tag = "TestSoundEnemyAvoidDruidEn"

local testGroupName = "SoundEnemyAvoidDruidEn"
local testCategory = "druid"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEntanglingRoots)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFaerieFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFaerieFireFeral)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBash)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFeralChargeEffect)
end

function me.TestSoundEnemyAvoidEntanglingRoots()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidEntanglingRoots",
    testCategory,
    "Entangling Roots"
  )
end

function me.TestSoundEnemyAvoidFaerieFire()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFaerieFire",
    testCategory,
    "Faerie Fire"
  )
end

function me.TestSoundEnemyAvoidFaerieFireFeral()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFaerieFireFeral",
    testCategory,
    "Faerie Fire (Feral)"
  )
end

function me.TestSoundEnemyAvoidBash()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidBash",
    testCategory,
    "Bash"
  )
end

function me.TestSoundEnemyAvoidFeralChargeEffect()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFeralChargeEffect",
    testCategory,
    "Feral Charge Effect"
  )
end
