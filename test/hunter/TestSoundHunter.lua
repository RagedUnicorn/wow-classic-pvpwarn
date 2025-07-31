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
mod.testSoundHunter = me

me.tag = "TestSoundHunter"

local testGroupName = "SoundHunter"
local testCategory = "hunter"

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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundConcussiveShot_5116)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheMonkey_13163)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfTheMonkey_13163)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheHawk_25296)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfTheHawk_25296)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheHawk_13165)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfTheHawk_13165)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheHawk_14318)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfTheHawk_14318)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheHawk_14319)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfTheHawk_14319)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheHawk_14320)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfTheHawk_14320)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheHawk_14321)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfTheHawk_14321)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheHawk_14322)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfTheHawk_14322)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfThePack_13159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfThePack_13159)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheCheetah_5118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfTheCheetah_5118)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheWild_20190)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfTheWild_20190)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheWild_20043)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfTheWild_20043)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheBeast_13161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfTheBeast_13161)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheFalcon_469145)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfTheFalcon_469145)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheViper_415423)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAspectOfTheViper_415423)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRapidFire_3045)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRapidFire_3045)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundExplosiveTrap_14317)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundExplosiveTrap_13813)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundExplosiveTrap_14316)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFreezingTrap_27753)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFreezingTrap_1499)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFreezingTrap_14310)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFreezingTrap_14311)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmolationTrap_14305)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmolationTrap_13795)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmolationTrap_14302)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmolationTrap_14303)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmolationTrap_14304)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostTrap_13809)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundViperSting_14280)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundViperSting_3034)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundViperSting_14279)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundScatterShot_19503)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFlare_1543)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntimidation_24394)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIntimidation_24394)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBestialWrath_19574)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBestialWrath_19574)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDeterrence_19263)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDeterrence_19263)

  -- start runes
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

function me.TestSoundConcussiveShot_5116()
  mod.testHelper.TestSoundSuccess(
    "TestSoundConcussiveShot_5116",
    testCategory,
    5116
  )
end

function me.TestSoundAspectOfTheMonkey_13163()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfTheMonkey_13163",
    testCategory,
    13163
  )
end

function me.TestSoundDownAspectOfTheMonkey_13163()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfTheMonkey_13163",
    testCategory,
    13163
  )
end

function me.TestSoundAspectOfTheHawk_25296()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfTheHawk_25296",
    testCategory,
    25296
  )
end

function me.TestSoundDownAspectOfTheHawk_25296()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfTheHawk_25296",
    testCategory,
    25296
  )
end

function me.TestSoundAspectOfTheHawk_13165()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfTheHawk_13165",
    testCategory,
    13165
  )
end

function me.TestSoundDownAspectOfTheHawk_13165()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfTheHawk_13165",
    testCategory,
    13165
  )
end

function me.TestSoundAspectOfTheHawk_14318()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfTheHawk_14318",
    testCategory,
    14318
  )
end

function me.TestSoundDownAspectOfTheHawk_14318()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfTheHawk_14318",
    testCategory,
    14318
  )
end

function me.TestSoundAspectOfTheHawk_14319()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfTheHawk_14319",
    testCategory,
    14319
  )
end

function me.TestSoundDownAspectOfTheHawk_14319()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfTheHawk_14319",
    testCategory,
    14319
  )
end

function me.TestSoundAspectOfTheHawk_14320()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfTheHawk_14320",
    testCategory,
    14320
  )
end

function me.TestSoundDownAspectOfTheHawk_14320()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfTheHawk_14320",
    testCategory,
    14320
  )
end

function me.TestSoundAspectOfTheHawk_14321()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfTheHawk_14321",
    testCategory,
    14321
  )
end

function me.TestSoundDownAspectOfTheHawk_14321()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfTheHawk_14321",
    testCategory,
    14321
  )
end

function me.TestSoundAspectOfTheHawk_14322()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfTheHawk_14322",
    testCategory,
    14322
  )
end

function me.TestSoundDownAspectOfTheHawk_14322()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfTheHawk_14322",
    testCategory,
    14322
  )
end

function me.TestSoundAspectOfThePack_13159()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfThePack_13159",
    testCategory,
    13159
  )
end

function me.TestSoundDownAspectOfThePack_13159()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfThePack_13159",
    testCategory,
    13159
  )
end

function me.TestSoundAspectOfTheCheetah_5118()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfTheCheetah_5118",
    testCategory,
    5118
  )
end

function me.TestSoundDownAspectOfTheCheetah_5118()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfTheCheetah_5118",
    testCategory,
    5118
  )
end

function me.TestSoundAspectOfTheWild_20190()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfTheWild_20190",
    testCategory,
    20190
  )
end

function me.TestSoundDownAspectOfTheWild_20190()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfTheWild_20190",
    testCategory,
    20190
  )
end

function me.TestSoundAspectOfTheWild_20043()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfTheWild_20043",
    testCategory,
    20043
  )
end

function me.TestSoundDownAspectOfTheWild_20043()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfTheWild_20043",
    testCategory,
    20043
  )
end

function me.TestSoundAspectOfTheBeast_13161()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfTheBeast_13161",
    testCategory,
    13161
  )
end

function me.TestSoundDownAspectOfTheBeast_13161()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfTheBeast_13161",
    testCategory,
    13161
  )
end

function me.TestSoundAspectOfTheFalcon_469145()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfTheFalcon_469145",
    testCategory,
    469145
  )
end

function me.TestSoundDownAspectOfTheFalcon_469145()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfTheFalcon_469145",
    testCategory,
    469145
  )
end

function me.TestSoundAspectOfTheViper_415423()
  mod.testHelper.TestSoundApplied(
    "TestSoundAspectOfTheViper_415423",
    testCategory,
    415423
  )
end

function me.TestSoundDownAspectOfTheViper_415423()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAspectOfTheViper_415423",
    testCategory,
    415423
  )
end

function me.TestSoundRapidFire_3045()
  mod.testHelper.TestSoundApplied(
    "TestSoundRapidFire_3045",
    testCategory,
    3045
  )
end

function me.TestSoundDownRapidFire_3045()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownRapidFire_3045",
    testCategory,
    3045
  )
end

function me.TestSoundExplosiveTrap_14317()
  mod.testHelper.TestSoundSuccess(
    "TestSoundExplosiveTrap_14317",
    testCategory,
    14317
  )
end

function me.TestSoundExplosiveTrap_13813()
  mod.testHelper.TestSoundSuccess(
    "TestSoundExplosiveTrap_13813",
    testCategory,
    13813
  )
end

function me.TestSoundExplosiveTrap_14316()
  mod.testHelper.TestSoundSuccess(
    "TestSoundExplosiveTrap_14316",
    testCategory,
    14316
  )
end

function me.TestSoundFreezingTrap_27753()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFreezingTrap_27753",
    testCategory,
    27753
  )
end

function me.TestSoundFreezingTrap_1499()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFreezingTrap_1499",
    testCategory,
    1499
  )
end

function me.TestSoundFreezingTrap_14310()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFreezingTrap_14310",
    testCategory,
    14310
  )
end

function me.TestSoundFreezingTrap_14311()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFreezingTrap_14311",
    testCategory,
    14311
  )
end

function me.TestSoundImmolationTrap_14305()
  mod.testHelper.TestSoundSuccess(
    "TestSoundImmolationTrap_14305",
    testCategory,
    14305
  )
end

function me.TestSoundImmolationTrap_13795()
  mod.testHelper.TestSoundSuccess(
    "TestSoundImmolationTrap_13795",
    testCategory,
    13795
  )
end

function me.TestSoundImmolationTrap_14302()
  mod.testHelper.TestSoundSuccess(
    "TestSoundImmolationTrap_14302",
    testCategory,
    14302
  )
end

function me.TestSoundImmolationTrap_14303()
  mod.testHelper.TestSoundSuccess(
    "TestSoundImmolationTrap_14303",
    testCategory,
    14303
  )
end

function me.TestSoundImmolationTrap_14304()
  mod.testHelper.TestSoundSuccess(
    "TestSoundImmolationTrap_14304",
    testCategory,
    14304
  )
end

function me.TestSoundFrostTrap_13809()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostTrap_13809",
    testCategory,
    13809
  )
end

function me.TestSoundViperSting_14280()
  mod.testHelper.TestSoundSuccess(
    "TestSoundViperSting_14280",
    testCategory,
    14280
  )
end

function me.TestSoundViperSting_3034()
  mod.testHelper.TestSoundSuccess(
    "TestSoundViperSting_3034",
    testCategory,
    3034
  )
end

function me.TestSoundViperSting_14279()
  mod.testHelper.TestSoundSuccess(
    "TestSoundViperSting_14279",
    testCategory,
    14279
  )
end

function me.TestSoundScatterShot_19503()
  mod.testHelper.TestSoundSuccess(
    "TestSoundScatterShot_19503",
    testCategory,
    19503
  )
end

function me.TestSoundFlare_1543()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFlare_1543",
    testCategory,
    1543
  )
end

function me.TestSoundIntimidation_24394()
  mod.testHelper.TestSoundApplied(
    "TestSoundIntimidation_24394",
    testCategory,
    24394
  )
end

function me.TestSoundDownIntimidation_24394()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownIntimidation_24394",
    testCategory,
    24394
  )
end

function me.TestSoundBestialWrath_19574()
  mod.testHelper.TestSoundApplied(
    "TestSoundBestialWrath_19574",
    testCategory,
    19574
  )
end

function me.TestSoundDownBestialWrath_19574()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBestialWrath_19574",
    testCategory,
    19574
  )
end

function me.TestSoundDeterrence_19263()
  mod.testHelper.TestSoundApplied(
    "TestSoundDeterrence_19263",
    testCategory,
    19263
  )
end

function me.TestSoundDownDeterrence_19263()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDeterrence_19263",
    testCategory,
    19263
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
