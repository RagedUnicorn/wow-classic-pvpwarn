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
mod.testSoundEnemyAvoidPaladin = me

me.tag = "TestSoundEnemyAvoidPaladin"

local testGroupName = "SoundEnemyAvoidPaladin"
local testCategory = "paladin"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidHammerOfWrath_24239)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidHammerOfJustice_10308)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidHammerOfJustice_853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidHammerOfJustice_5588)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidHammerOfJustice_5589)
end

function me.TestSoundEnemyAvoidHammerOfWrath_24239()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidHammerOfWrath_24239",
    testCategory,
    24239
  )
end

function me.TestSoundEnemyAvoidHammerOfJustice_10308()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidHammerOfJustice_10308",
    testCategory,
    10308
  )
end

function me.TestSoundEnemyAvoidHammerOfJustice_853()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidHammerOfJustice_853",
    testCategory,
    853
  )
end

function me.TestSoundEnemyAvoidHammerOfJustice_5588()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidHammerOfJustice_5588",
    testCategory,
    5588
  )
end

function me.TestSoundEnemyAvoidHammerOfJustice_5589()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidHammerOfJustice_5589",
    testCategory,
    5589
  )
end
