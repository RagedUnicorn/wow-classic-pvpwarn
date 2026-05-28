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
mod.testSoundHunterTbc = me

me.tag = "TestSoundHunterTbc"

local testCategory = "hunter"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound hunter")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheHawk_27044)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfTheHawk_27044)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheWild_27045)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfTheWild_27045)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundExplosiveTrap_27025)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmolationTrap_27023)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundViperSting_27018)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheViper_34074)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfTheViper_34074)
end

function me.TestSoundAspectOfTheHawk_27044()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfTheHawk_27044",
    testCategory,
    27044
  )
end

function me.TestSoundDownAspectOfTheHawk_27044()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfTheHawk_27044",
    testCategory,
    27044
  )
end

function me.TestSoundAspectOfTheWild_27045()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfTheWild_27045",
    testCategory,
    27045
  )
end

function me.TestSoundDownAspectOfTheWild_27045()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfTheWild_27045",
    testCategory,
    27045
  )
end

function me.TestSoundExplosiveTrap_27025()
  mod.testHelper.TestSoundSuccess(
    "TestSoundExplosiveTrap_27025",
    testCategory,
    27025
  )
end

function me.TestSoundImmolationTrap_27023()
  mod.testHelper.TestSoundSuccess(
    "TestSoundImmolationTrap_27023",
    testCategory,
    27023
  )
end

function me.TestSoundViperSting_27018()
  mod.testHelper.TestSoundSuccess(
    "TestSoundViperSting_27018",
    testCategory,
    27018
  )
end

function me.TestSoundAspectOfTheViper_34074()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfTheViper_34074",
    testCategory,
    34074
  )
end

function me.TestSoundDownAspectOfTheViper_34074()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfTheViper_34074",
    testCategory,
    34074
  )
end
