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
mod.testSoundSelfAvoidWarriorEn = me

me.tag = "TestSoundSelfAvoidWarriorEn"

local testGroupName = "SoundSelfAvoidWarriorEn"
local testCategory = "warrior"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidChargeStun)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidInterceptStun)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidHamstring)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidMortalStrike)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidIntimidatingShout)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPummel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidDisarm)
end

function me.TestSoundSelfAvoidChargeStun()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidChargeStun",
    testCategory,
    "Charge Stun"
  )
end

function me.TestSoundSelfAvoidInterceptStun()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidInterceptStun",
    testCategory,
    "Intercept Stun"
  )
end

function me.TestSoundSelfAvoidHamstring()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidHamstring",
    testCategory,
    "Hamstring"
  )
end

function me.TestSoundSelfAvoidMortalStrike()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidMortalStrike",
    testCategory,
    "Mortal Strike"
  )
end

function me.TestSoundSelfAvoidIntimidatingShout()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidIntimidatingShout",
    testCategory,
    "Intimidating Shout"
  )
end

function me.TestSoundSelfAvoidPummel()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidPummel",
    testCategory,
    "Pummel"
  )
end

function me.TestSoundSelfAvoidDisarm()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidDisarm",
    testCategory,
    "Disarm"
  )
end
