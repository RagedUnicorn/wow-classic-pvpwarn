--[[
  MIT License

  Copyright (c) 2020 Michael Wiesendanger

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
mod.testSoundHunterEn = me

me.tag = "TestSoundHunterEn"

local testGroupName = "SoundHunterEn"
local testCategory = "hunter"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundConcussiveShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheMonkey)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheHawk)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRapidFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRapidFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundExplosiveTrap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFreezingTrap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmolationTrap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostTrap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundViperSting)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundScatterShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFlare)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntimidation)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIntimidation)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBestialWrath)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBestialWrath)
end

function me.TestSoundConcussiveShot()
  mod.testHelper.TestSoundSuccess(
    "TestSoundConcussiveShot",
    testCategory,
    "Concussive Shot"
  )
end

function me.TestSoundAspectOfTheMonkey()
  mod.testHelper.TestSoundSuccess(
    "TestSoundAspectOfTheMonkey",
    testCategory,
    "Aspect of the Monkey"
  )
end

function me.TestSoundAspectOfTheHawk()
  mod.testHelper.TestSoundSuccess(
    "TestSoundAspectOfTheHawk",
    testCategory,
    "Aspect of the Hawk"
  )
end

function me.TestSoundRapidFire()
  mod.testHelper.TestSoundApplied(
    "TestSoundRapidFire",
    testCategory,
    "Rapid Fire"
  )
end

function me.TestSoundDownRapidFire()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownRapidFire",
    testCategory,
    "Rapid Fire"
  )
end

function me.TestSoundExplosiveTrap()
  mod.testHelper.TestSoundSuccess(
    "TestSoundExplosiveTrap",
    testCategory,
    "Explosive Trap"
  )
end

function me.TestSoundFreezingTrap()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFreezingTrap",
    testCategory,
    "Freezing Trap"
  )
end

function me.TestSoundImmolationTrap()
  mod.testHelper.TestSoundSuccess(
    "TestSoundImmolationTrap",
    testCategory,
    "Immolation Trap"
  )
end

function me.TestSoundFrostTrap()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostTrap",
    testCategory,
    "Frost Trap"
  )
end

function me.TestSoundViperSting()
  mod.testHelper.TestSoundSuccess(
    "TestSoundViperSting",
    testCategory,
    "Viper Sting"
  )
end

function me.TestSoundScatterShot()
  mod.testHelper.TestSoundSuccess(
    "TestSoundScatterShot",
    testCategory,
    "Scatter Shot"
  )
end

function me.TestSoundFlare()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFlare",
    testCategory,
    "Flare"
  )
end

function me.TestSoundIntimidation()
  mod.testHelper.TestSoundApplied(
    "TestSoundIntimidation",
    testCategory,
    "Intimidation"
  )
end

function me.TestSoundDownIntimidation()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownIntimidation",
    testCategory,
    "Intimidation"
  )
end

function me.TestSoundBestialWrath()
  mod.testHelper.TestSoundApplied(
    "TestSoundBestialWrath",
    testCategory,
    "Bestial Wrath"
  )
end

function me.TestSoundDownBestialWrath()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBestialWrath",
    testCategory,
    "Bestial Wrath"
  )
end
