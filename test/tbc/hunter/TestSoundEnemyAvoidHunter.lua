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
mod.testSoundEnemyAvoidHunterTbc = me

me.tag = "TestSoundEnemyAvoidHunterTbc"

local testCategory = "hunter"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testenemysound hunter")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSerpentSting_25295)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSerpentSting_27016)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidViperSting_27018)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSilencingShot_34490)
end

function me.TestSoundEnemyAvoidSerpentSting_25295()
  mod.testHelper.TestSoundSpellMissedEnemy("TestSoundEnemyAvoidSerpentSting_25295", testCategory, 25295)
end
function me.TestSoundEnemyAvoidSerpentSting_27016()
  mod.testHelper.TestSoundSpellMissedEnemy("TestSoundEnemyAvoidSerpentSting_27016", testCategory, 27016)
end
function me.TestSoundEnemyAvoidViperSting_27018()
  mod.testHelper.TestSoundSpellMissedEnemy("TestSoundEnemyAvoidViperSting_27018", testCategory, 27018)
end
function me.TestSoundEnemyAvoidSilencingShot_34490()
  mod.testHelper.TestSoundSpellMissedEnemy("TestSoundEnemyAvoidSilencingShot_34490", testCategory, 34490)
end
