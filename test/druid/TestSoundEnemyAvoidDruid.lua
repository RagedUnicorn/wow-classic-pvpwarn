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
mod.testSoundEnemyAvoidDruid = me

me.tag = "TestSoundEnemyAvoidDruid"

local testGroupName = "SoundEnemyAvoidDruid"
local testCategory = "druid"

function me.Test()
  local isUsingSessionManager = false

  -- Check if session manager is handling test group management
  if mod.testSessionManager and mod.testSessionManager.IsSessionActive() then
    -- Session manager is active, just collect tests without managing test group
    isUsingSessionManager = true
    me.CollectTestCases()
  else
    -- No session manager, handle test group ourselves
    mod.testReporter.StartTestGroup(testGroupName)
    me.CollectTestCases()
  end

  mod.testReporter.PlayTestQueueWithDelay(function()
    if not isUsingSessionManager then
      mod.testReporter.StopTestGroup() -- async finish of test group
    end
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEntanglingRoots_19970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEntanglingRoots_339)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEntanglingRoots_1062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEntanglingRoots_5195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEntanglingRoots_5196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEntanglingRoots_9852)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFaerieFire_9907)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFaerieFire_770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFaerieFire_778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFaerieFire_9749)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFaerieFireFeral_17392)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFaerieFireFeral_16857)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFaerieFireFeral_17390)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFaerieFireFeral_17391)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBash_8983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBash_5211)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBash_6798)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFeralChargeEffect_19675)
end

function me.TestSoundEnemyAvoidEntanglingRoots_19970()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidEntanglingRoots_19970",
    testCategory,
    19970
  )
end

function me.TestSoundEnemyAvoidEntanglingRoots_339()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidEntanglingRoots_339",
    testCategory,
    339
  )
end

function me.TestSoundEnemyAvoidEntanglingRoots_1062()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidEntanglingRoots_1062",
    testCategory,
    1062
  )
end

function me.TestSoundEnemyAvoidEntanglingRoots_5195()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidEntanglingRoots_5195",
    testCategory,
    5195
  )
end

function me.TestSoundEnemyAvoidEntanglingRoots_5196()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidEntanglingRoots_5196",
    testCategory,
    5196
  )
end

function me.TestSoundEnemyAvoidEntanglingRoots_9852()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidEntanglingRoots_9852",
    testCategory,
    9852
  )
end

function me.TestSoundEnemyAvoidFaerieFire_9907()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFaerieFire_9907",
    testCategory,
    9907
  )
end

function me.TestSoundEnemyAvoidFaerieFire_770()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFaerieFire_770",
    testCategory,
    770
  )
end

function me.TestSoundEnemyAvoidFaerieFire_778()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFaerieFire_778",
    testCategory,
    778
  )
end

function me.TestSoundEnemyAvoidFaerieFire_9749()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFaerieFire_9749",
    testCategory,
    9749
  )
end

function me.TestSoundEnemyAvoidFaerieFireFeral_17392()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFaerieFireFeral_17392",
    testCategory,
    17392
  )
end

function me.TestSoundEnemyAvoidFaerieFireFeral_16857()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFaerieFireFeral_16857",
    testCategory,
    16857
  )
end

function me.TestSoundEnemyAvoidFaerieFireFeral_17390()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFaerieFireFeral_17390",
    testCategory,
    17390
  )
end

function me.TestSoundEnemyAvoidFaerieFireFeral_17391()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFaerieFireFeral_17391",
    testCategory,
    17391
  )
end

function me.TestSoundEnemyAvoidBash_8983()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidBash_8983",
    testCategory,
    8983
  )
end

function me.TestSoundEnemyAvoidBash_5211()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidBash_5211",
    testCategory,
    5211
  )
end

function me.TestSoundEnemyAvoidBash_6798()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidBash_6798",
    testCategory,
    6798
  )
end

function me.TestSoundEnemyAvoidFeralChargeEffect_19675()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFeralChargeEffect_19675",
    testCategory,
    19675
  )
end
