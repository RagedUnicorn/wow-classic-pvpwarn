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
mod.testSoundHunterSod = me

me.tag = "TestSoundHunterSod"

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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundExplosiveTrap_409535)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundExplosiveTrap_409532)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundExplosiveTrap_409534)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFreezingTrap_409519)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFreezingTrap_409510)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFreezingTrap_409512)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmolationTrap_409530)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmolationTrap_409521)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmolationTrap_409524)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmolationTrap_409526)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmolationTrap_409528)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostTrap_409520)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSniperTraining_415399)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSniperTraining_415399)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKillShot_409974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFlankingStrike_415320)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundChimeraShot_409433)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundExplosiveShot_409552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLockAndLoad_415413)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownLockAndLoad_415413)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHitAndRun_440533)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownHitAndRun_440533)
end

function me.TestSoundExplosiveTrap_409535()
  mod.testHelper.TestSoundSuccess(
    "TestSoundExplosiveTrap_409535",
    testCategory,
    409535
  )
end

function me.TestSoundExplosiveTrap_409532()
  mod.testHelper.TestSoundSuccess(
    "TestSoundExplosiveTrap_409532",
    testCategory,
    409532
  )
end

function me.TestSoundExplosiveTrap_409534()
  mod.testHelper.TestSoundSuccess(
    "TestSoundExplosiveTrap_409534",
    testCategory,
    409534
  )
end

function me.TestSoundFreezingTrap_409519()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFreezingTrap_409519",
    testCategory,
    409519
  )
end

function me.TestSoundFreezingTrap_409510()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFreezingTrap_409510",
    testCategory,
    409510
  )
end

function me.TestSoundFreezingTrap_409512()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFreezingTrap_409512",
    testCategory,
    409512
  )
end

function me.TestSoundImmolationTrap_409530()
  mod.testHelper.TestSoundSuccess(
    "TestSoundImmolationTrap_409530",
    testCategory,
    409530
  )
end

function me.TestSoundImmolationTrap_409521()
  mod.testHelper.TestSoundSuccess(
    "TestSoundImmolationTrap_409521",
    testCategory,
    409521
  )
end

function me.TestSoundImmolationTrap_409524()
  mod.testHelper.TestSoundSuccess(
    "TestSoundImmolationTrap_409524",
    testCategory,
    409524
  )
end

function me.TestSoundImmolationTrap_409526()
  mod.testHelper.TestSoundSuccess(
    "TestSoundImmolationTrap_409526",
    testCategory,
    409526
  )
end

function me.TestSoundImmolationTrap_409528()
  mod.testHelper.TestSoundSuccess(
    "TestSoundImmolationTrap_409528",
    testCategory,
    409528
  )
end

function me.TestSoundFrostTrap_409520()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostTrap_409520",
    testCategory,
    409520
  )
end

function me.TestSoundSniperTraining_415399()
  mod.testHelper.TestSoundApplied(
    "TestSoundSniperTraining_415399",
    testCategory,
    415399
  )
end

function me.TestSoundDownSniperTraining_415399()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSniperTraining_415399",
    testCategory,
    415399
  )
end

function me.TestSoundKillShot_409974()
  mod.testHelper.TestSoundSuccess(
    "TestSoundKillShot_409974",
    testCategory,
    409974
  )
end

function me.TestSoundFlankingStrike_415320()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFlankingStrike_415320",
    testCategory,
    415320
  )
end

function me.TestSoundChimeraShot_409433()
  mod.testHelper.TestSoundSuccess(
    "TestSoundChimeraShot_409433",
    testCategory,
    409433
  )
end

function me.TestSoundExplosiveShot_409552()
  mod.testHelper.TestSoundSuccess(
    "TestSoundExplosiveShot_409552",
    testCategory,
    409552
  )
end

function me.TestSoundLockAndLoad_415413()
  mod.testHelper.TestSoundApplied(
    "TestSoundLockAndLoad_415413",
    testCategory,
    415413
  )
end

function me.TestSoundDownLockAndLoad_415413()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownLockAndLoad_415413",
    testCategory,
    415413
  )
end

function me.TestSoundHitAndRun_440533()
  mod.testHelper.TestSoundApplied(
    "TestSoundHitAndRun_440533",
    testCategory,
    440533
  )
end

function me.TestSoundDownHitAndRun_440533()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownHitAndRun_440533",
    testCategory,
    440533
  )
end
