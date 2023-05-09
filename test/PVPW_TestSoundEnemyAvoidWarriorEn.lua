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
mod.testSoundEnemyAvoidWarriorEn = me

me.tag = "TestSoundEnemyAvoidWarriorEn"

local testGroupName = "SoundEnemyAvoidWarriorEn"
local testCategory = "warrior"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidChargeStun)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidInterceptStun)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidHamstring)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidMortalStrike)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidIntimidatingShout)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPummel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDisarm)
end

function me.TestSoundEnemyAvoidChargeStun()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidChargeStun",
    testCategory,
    "Charge Stun"
  )
end

function me.TestSoundEnemyAvoidInterceptStun()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidInterceptStun",
    testCategory,
    "Intercept Stun"
  )
end

function me.TestSoundEnemyAvoidHamstring()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidHamstring",
    testCategory,
    "Hamstring"
  )
end

function me.TestSoundEnemyAvoidMortalStrike()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidMortalStrike",
    testCategory,
    "Mortal Strike"
  )
end

function me.TestSoundEnemyAvoidIntimidatingShout()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidIntimidatingShout",
    testCategory,
    "Intimidating Shout"
  )
end

function me.TestSoundEnemyAvoidPummel()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidPummel",
    testCategory,
    "Pummel"
  )
end

function me.TestSoundEnemyAvoidDisarm()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidDisarm",
    testCategory,
    "Disarm"
  )
end
