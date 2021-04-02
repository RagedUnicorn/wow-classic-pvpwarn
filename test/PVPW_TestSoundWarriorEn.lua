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
mod.testSoundWarriorEn = me

me.tag = "TestSoundWarriorEn"

local testGroupName = "SoundWarriorEn"
local testCategory = "warrior"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserkerRage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserkerRage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRecklessness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRecklessness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDeathWish)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDeathWish)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBattleStance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserkerStance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDefensiveStance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntercept)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDisarm)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundConcussionBlow)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBloodrage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBloodrage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPummel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCharge)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntimidatingShout)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldBlock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShieldBlock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldSlam)
end

function me.TestSoundBerserkerRage()
  mod.testHelper.TestSoundApplied(
    "TestSoundBerserkerRage",
    testCategory,
    "Berserker Rage"
  )
end

function me.TestSoundDownBerserkerRage()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBerserkerRage",
    testCategory,
    "Berserker Rage"
  )
end

function me.TestSoundRecklessness()
  mod.testHelper.TestSoundApplied(
    "TestSoundRecklessness",
    testCategory,
    "Recklessness"
  )
end

function me.TestSoundDownRecklessness()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownRecklessness",
    testCategory,
    "Recklessness"
  )
end

function me.TestSoundDeathWish()
  mod.testHelper.TestSoundApplied(
    "TestSoundDeathWish",
    testCategory,
    "Death Wish"
  )
end

function me.TestSoundDownDeathWish()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDeathWish",
    testCategory,
    "Death Wish"
  )
end

function me.TestSoundBattleStance()
  mod.testHelper.TestSoundApplied(
    "TestSoundBattleStance",
    testCategory,
    "Battle Stance"
  )
end

function me.TestSoundBerserkerStance()
  mod.testHelper.TestSoundApplied(
    "TestSoundBerserkerStance",
    testCategory,
    "Berserker Stance"
  )
end

function me.TestSoundDefensiveStance()
  mod.testHelper.TestSoundApplied(
    "TestSoundDefensiveStance",
    testCategory,
    "Defensive Stance"
  )
end

function me.TestSoundIntercept()
  mod.testHelper.TestSoundSuccess(
    "TestSoundIntercept",
    testCategory,
    "Intercept"
  )
end

function me.TestSoundDisarm()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDisarm",
    testCategory,
    "Disarm"
  )
end

function me.TestSoundConcussionBlow()
  mod.testHelper.TestSoundSuccess(
    "TestSoundConcussionBlow",
    testCategory,
    "Concussion Blow"
  )
end

function me.TestSoundBloodrage()
  mod.testHelper.TestSoundApplied(
    "TestSoundBloodrage",
    testCategory,
    "Bloodrage"
  )
end

function me.TestSoundDownBloodrage()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBloodrage",
    testCategory,
    "Bloodrage"
  )
end

function me.TestSoundPummel()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPummel",
    testCategory,
    "Pummel"
  )
end

function me.TestSoundCharge()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCharge",
    testCategory,
    "Charge"
  )
end

function me.TestSoundIntimidatingShout()
  mod.testHelper.TestSoundSuccess(
    "TestSoundIntimidatingShout",
    testCategory,
    "Intimidating Shout"
  )
end

function me.TestSoundShieldBlock()
  mod.testHelper.TestSoundApplied(
    "TestSoundShieldBlock",
    testCategory,
    "Shield Block"
  )
end

function me.TestSoundDownShieldBlock()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShieldBlock",
    testCategory,
    "Shield Block"
  )
end

function me.TestSoundShieldSlam()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShieldSlam",
    testCategory,
    "Shield Slam"
  )
end
