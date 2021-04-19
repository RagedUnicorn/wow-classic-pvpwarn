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
mod.testSoundRogueEn = me

me.tag = "TestSoundRogueEn"

local testGroupName = "SoundRogueEn"
local testCategory = "rogue"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKick)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlind)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSprint)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSprint)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEvasion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEvasion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKidneyShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCheapShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAdrenalineRush)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAdrenalineRush)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBladeFlurry)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBladeFlurry)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundColdBlood)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownColdBlood)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPreparation)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVanish)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStealth)
end

function me.TestSoundBlind()
  mod.testHelper.TestSoundApplied(
    "TestSoundBlind",
    testCategory,
    "Blind"
  )
end

function me.TestSoundKick()
  mod.testHelper.TestSoundSuccess(
    "TestSoundKick",
    testCategory,
    "Kick"
  )
end

function me.TestSoundSprint()
  mod.testHelper.TestSoundApplied(
    "TestSoundSprint",
    testCategory,
    "Sprint"
  )
end

function me.TestSoundDownSprint()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSprint",
    testCategory,
    "Sprint"
  )
end

function me.TestSoundEvasion()
  mod.testHelper.TestSoundApplied(
    "TestSoundEvasion",
    testCategory,
    "Evasion"
  )
end

function me.TestSoundDownEvasion()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEvasion",
    testCategory,
    "Evasion"
  )
end

function me.TestSoundKidneyShot()
  mod.testHelper.TestSoundSuccess(
    "TestSoundKidneyShot",
    testCategory,
    "Kidney Shot"
  )
end

function me.TestSoundCheapShot()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCheapShot",
    testCategory,
    "Cheap Shot"
  )
end

function me.TestSoundAdrenalineRush()
  mod.testHelper.TestSoundApplied(
    "TestSoundAdrenalineRush",
    testCategory,
    "Adrenaline Rush"
  )
end

function me.TestSoundDownAdrenalineRush()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAdrenalineRush",
    testCategory,
    "Adrenaline Rush"
  )
end

function me.TestSoundBladeFlurry()
  mod.testHelper.TestSoundApplied(
    "TestSoundBladeFlurry",
    testCategory,
    "Blade Flurry"
  )
end

function me.TestSoundDownBladeFlurry()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBladeFlurry",
    testCategory,
    "Blade Flurry"
  )
end

function me.TestSoundColdBlood()
  mod.testHelper.TestSoundApplied(
    "TestSoundColdBlood",
    testCategory,
    "Cold Blood"
  )
end

function me.TestSoundDownColdBlood()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownColdBlood",
    testCategory,
    "Cold Blood"
  )
end

function me.TestSoundPreparation()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPreparation",
    testCategory,
    "Preparation"
  )
end

function me.TestSoundVanish()
  mod.testHelper.TestSoundSuccess(
    "TestSoundVanish",
    testCategory,
    "Vanish"
  )
end

function me.TestSoundStealth()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStealth",
    testCategory,
    "Stealth"
  )
end
