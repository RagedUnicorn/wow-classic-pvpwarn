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
mod.testSoundEnemyAvoidRogueTbc = me

me.tag = "TestSoundEnemyAvoidRogueTbc"

local testCategory = "rogue"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testenemysound rogue")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    if type(completionCallback) == "function" then
      completionCallback()
    end
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidKick_38768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGouge_38764)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidExposeArmor_26866)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGarrote_26839)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGarrote_26884)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidRupture_26867)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDeadlyThrow_26679)
end

function me.TestSoundEnemyAvoidKick_38768()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidKick_38768",
    testCategory,
    38768
  )
end

function me.TestSoundEnemyAvoidGouge_38764()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGouge_38764",
    testCategory,
    38764
  )
end

function me.TestSoundEnemyAvoidExposeArmor_26866()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidExposeArmor_26866",
    testCategory,
    26866
  )
end

function me.TestSoundEnemyAvoidGarrote_26839()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGarrote_26839",
    testCategory,
    26839
  )
end

function me.TestSoundEnemyAvoidGarrote_26884()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGarrote_26884",
    testCategory,
    26884
  )
end

function me.TestSoundEnemyAvoidRupture_26867()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidRupture_26867",
    testCategory,
    26867
  )
end

function me.TestSoundEnemyAvoidDeadlyThrow_26679()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidDeadlyThrow_26679",
    testCategory,
    26679
  )
end
