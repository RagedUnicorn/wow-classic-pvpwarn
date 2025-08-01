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
mod.testSoundEnemyAvoidPriest = me

me.tag = "TestSoundEnemyAvoidPriest"

local testCategory = "priest"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testenemysound priest")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDevouringPlague_2944)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDevouringPlague_19276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDevouringPlague_19277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDevouringPlague_19278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDevouringPlague_19279)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDevouringPlague_19280)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBlackout_15268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBlackout_15323)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBlackout_15324)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBlackout_15325)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBlackout_15326)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidManaBurn_8129)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidManaBurn_8131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidManaBurn_10874)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidManaBurn_10875)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidManaBurn_10876)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidMindControl_605)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidMindControl_10911)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidMindControl_10912)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPsychicScream_8122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPsychicScream_8124)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPsychicScream_10888)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPsychicScream_10890)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidShadowWordPain_589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidShadowWordPain_594)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidShadowWordPain_970)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidShadowWordPain_992)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidShadowWordPain_2767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidShadowWordPain_10892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidShadowWordPain_10893)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidShadowWordPain_10894)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSilence_15487)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidVampiricEmbrace_15286)
end

function me.TestSoundEnemyAvoidDevouringPlague_2944()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidDevouringPlague_2944",
    testCategory,
    2944
  )
end

function me.TestSoundEnemyAvoidDevouringPlague_19276()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidDevouringPlague_19276",
    testCategory,
    19276
  )
end

function me.TestSoundEnemyAvoidDevouringPlague_19277()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidDevouringPlague_19277",
    testCategory,
    19277
  )
end

function me.TestSoundEnemyAvoidDevouringPlague_19278()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidDevouringPlague_19278",
    testCategory,
    19278
  )
end

function me.TestSoundEnemyAvoidDevouringPlague_19279()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidDevouringPlague_19279",
    testCategory,
    19279
  )
end

function me.TestSoundEnemyAvoidDevouringPlague_19280()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidDevouringPlague_19280",
    testCategory,
    19280
  )
end

function me.TestSoundEnemyAvoidBlackout_15268()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidBlackout_15268",
    testCategory,
    15268
  )
end

function me.TestSoundEnemyAvoidBlackout_15323()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidBlackout_15323",
    testCategory,
    15323
  )
end

function me.TestSoundEnemyAvoidBlackout_15324()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidBlackout_15324",
    testCategory,
    15324
  )
end

function me.TestSoundEnemyAvoidBlackout_15325()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidBlackout_15325",
    testCategory,
    15325
  )
end

function me.TestSoundEnemyAvoidBlackout_15326()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidBlackout_15326",
    testCategory,
    15326
  )
end

function me.TestSoundEnemyAvoidManaBurn_8129()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidManaBurn_8129",
    testCategory,
    8129
  )
end

function me.TestSoundEnemyAvoidManaBurn_8131()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidManaBurn_8131",
    testCategory,
    8131
  )
end

function me.TestSoundEnemyAvoidManaBurn_10874()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidManaBurn_10874",
    testCategory,
    10874
  )
end

function me.TestSoundEnemyAvoidManaBurn_10875()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidManaBurn_10875",
    testCategory,
    10875
  )
end

function me.TestSoundEnemyAvoidManaBurn_10876()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidManaBurn_10876",
    testCategory,
    10876
  )
end

function me.TestSoundEnemyAvoidMindControl_605()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidMindControl_605",
    testCategory,
    605
  )
end

function me.TestSoundEnemyAvoidMindControl_10911()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidMindControl_10911",
    testCategory,
    10911
  )
end

function me.TestSoundEnemyAvoidMindControl_10912()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidMindControl_10912",
    testCategory,
    10912
  )
end

function me.TestSoundEnemyAvoidPsychicScream_8122()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidPsychicScream_8122",
    testCategory,
    8122
  )
end

function me.TestSoundEnemyAvoidPsychicScream_8124()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidPsychicScream_8124",
    testCategory,
    8124
  )
end

function me.TestSoundEnemyAvoidPsychicScream_10888()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidPsychicScream_10888",
    testCategory,
    10888
  )
end

function me.TestSoundEnemyAvoidPsychicScream_10890()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidPsychicScream_10890",
    testCategory,
    10890
  )
end

function me.TestSoundEnemyAvoidShadowWordPain_589()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidShadowWordPain_589",
    testCategory,
    589
  )
end

function me.TestSoundEnemyAvoidShadowWordPain_594()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidShadowWordPain_594",
    testCategory,
    594
  )
end

function me.TestSoundEnemyAvoidShadowWordPain_970()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidShadowWordPain_970",
    testCategory,
    970
  )
end

function me.TestSoundEnemyAvoidShadowWordPain_992()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidShadowWordPain_992",
    testCategory,
    992
  )
end

function me.TestSoundEnemyAvoidShadowWordPain_2767()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidShadowWordPain_2767",
    testCategory,
    2767
  )
end

function me.TestSoundEnemyAvoidShadowWordPain_10892()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidShadowWordPain_10892",
    testCategory,
    10892
  )
end

function me.TestSoundEnemyAvoidShadowWordPain_10893()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidShadowWordPain_10893",
    testCategory,
    10893
  )
end

function me.TestSoundEnemyAvoidShadowWordPain_10894()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidShadowWordPain_10894",
    testCategory,
    10894
  )
end

function me.TestSoundEnemyAvoidSilence_15487()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidSilence_15487",
    testCategory,
    15487
  )
end

function me.TestSoundEnemyAvoidVampiricEmbrace_15286()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidVampiricEmbrace_15286",
    testCategory,
    15286
  )
end
