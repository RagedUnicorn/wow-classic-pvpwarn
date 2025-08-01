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
mod.testSoundEnemyAvoidMage = me

me.tag = "TestSoundEnemyAvoidMage"

local testCategory = "mage"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testenemysound mage")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidCounterspell_2139)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPolymorph_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPolymorph_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPolymorph_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPolymorph_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPolymorph_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPolymorph_28272)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFrostNova_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFrostNova_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFrostNova_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFrostNova_6131)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidConeOfCold_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidConeOfCold_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidConeOfCold_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidConeOfCold_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidConeOfCold_10160)
end

function me.TestSoundEnemyAvoidCounterspell_2139()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundEnemyAvoidCounterspell_2139",
    testCategory,
    2139
  )
end

function me.TestSoundEnemyAvoidPolymorph_12826()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundEnemyAvoidPolymorph_12826",
    testCategory,
    12826
  )
end

function me.TestSoundEnemyAvoidPolymorph_118()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundEnemyAvoidPolymorph_118",
    testCategory,
    118
  )
end

function me.TestSoundEnemyAvoidPolymorph_12824()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundEnemyAvoidPolymorph_12824",
    testCategory,
    12824
  )
end

function me.TestSoundEnemyAvoidPolymorph_12825()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundEnemyAvoidPolymorph_12825",
    testCategory,
    12825
  )
end

function me.TestSoundEnemyAvoidPolymorph_28271()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundEnemyAvoidPolymorph_28271",
    testCategory,
    28271
  )
end

function me.TestSoundEnemyAvoidPolymorph_28272()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundEnemyAvoidPolymorph_28272",
    testCategory,
    28272
  )
end

function me.TestSoundEnemyAvoidFrostNova_10230()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundEnemyAvoidFrostNova_10230",
    testCategory,
    10230
  )
end

function me.TestSoundEnemyAvoidFrostNova_122()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundEnemyAvoidFrostNova_122",
    testCategory,
    122
  )
end

function me.TestSoundEnemyAvoidFrostNova_865()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundEnemyAvoidFrostNova_865",
    testCategory,
    865
  )
end

function me.TestSoundEnemyAvoidFrostNova_6131()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundEnemyAvoidFrostNova_6131",
    testCategory,
    6131
  )
end

function me.TestSoundEnemyAvoidConeOfCold_10161()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundEnemyAvoidConeOfCold_10161",
    testCategory,
    10161
  )
end

function me.TestSoundEnemyAvoidConeOfCold_120()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundEnemyAvoidConeOfCold_120",
    testCategory,
    120
  )
end

function me.TestSoundEnemyAvoidConeOfCold_8492()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundEnemyAvoidConeOfCold_8492",
    testCategory,
    8492
  )
end

function me.TestSoundEnemyAvoidConeOfCold_10159()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundEnemyAvoidConeOfCold_10159",
    testCategory,
    10159
  )
end

function me.TestSoundEnemyAvoidConeOfCold_10160()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundEnemyAvoidConeOfCold_10160",
    testCategory,
    10160
  )
end
