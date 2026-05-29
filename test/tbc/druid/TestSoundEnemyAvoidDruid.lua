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
mod.testSoundEnemyAvoidDruidTbc = me

me.tag = "TestSoundEnemyAvoidDruidTbc"

local testCategory = "druid"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testenemysound druid")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEntanglingRoots_26989)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFaerieFire_26993)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFaerieFireFeral_27011)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidCyclone_33786)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidMaim_22570)
end

function me.TestSoundEnemyAvoidEntanglingRoots_26989()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidEntanglingRoots_26989",
    testCategory,
    26989
  )
end

function me.TestSoundEnemyAvoidFaerieFire_26993()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFaerieFire_26993",
    testCategory,
    26993
  )
end

function me.TestSoundEnemyAvoidFaerieFireFeral_27011()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFaerieFireFeral_27011",
    testCategory,
    27011
  )
end

function me.TestSoundEnemyAvoidCyclone_33786()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidCyclone_33786",
    testCategory,
    33786
  )
end

function me.TestSoundEnemyAvoidMaim_22570()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidMaim_22570",
    testCategory,
    22570
  )
end
