--[[
  MIT License

  Copyright (c) 2022 Michael Wiesendanger

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
mod.testSoundEnemyAvoidRogueEn = me

me.tag = "TestSoundEnemyAvoidRogueEn"

local testGroupName = "SoundEnemyAvoidRogueEn"
local testCategory = "rogue"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidKick)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidCheapShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGouge)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidKidneyShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBlind)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGhostlyStrike)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDistract)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidExposeArmor)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGarrote)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidRupture)
end

function me.TestSoundEnemyAvoidKick()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidKick",
    testCategory,
    "Kick"
  )
end

function me.TestSoundEnemyAvoidCheapShot()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidCheapShot",
    testCategory,
    "Cheap Shot"
  )
end

function me.TestSoundEnemyAvoidGouge()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGouge",
    testCategory,
    "Gouge"
  )
end

function me.TestSoundEnemyAvoidKidneyShot()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidKidneyShot",
    testCategory,
    "Kidney Shot"
  )
end

function me.TestSoundEnemyAvoidBlind()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidBlind",
    testCategory,
    "Blind"
  )
end

function me.TestSoundEnemyAvoidGhostlyStrike()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGhostlyStrike",
    testCategory,
    "Ghostly Strike"
  )
end

function me.TestSoundEnemyAvoidSap()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidSap",
    testCategory,
    "Sap"
  )
end

function me.TestSoundEnemyAvoidDistract()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidDistract",
    testCategory,
    "Distract"
  )
end

function me.TestSoundEnemyAvoidExposeArmor()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidExposeArmor",
    testCategory,
    "Expose Armor"
  )
end

function me.TestSoundEnemyAvoidGarrote()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGarrote",
    testCategory,
    "Garrote"
  )
end

function me.TestSoundEnemyAvoidRupture()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidRupture",
    testCategory,
    "Rupture"
  )
end
