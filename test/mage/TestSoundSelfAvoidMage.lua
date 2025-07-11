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
mod.testSoundSelfAvoidMage = me

me.tag = "TestSoundSelfAvoidMage"

local testGroupName = "SoundSelfAvoidMage"
local testCategory = "mage"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidCounterspell_2139)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPolymorph_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPolymorph_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPolymorph_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPolymorph_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPolymorph_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPolymorph_28272)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFrostNova_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFrostNova_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFrostNova_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidFrostNova_6131)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidConeOfCold_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidConeOfCold_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidConeOfCold_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidConeOfCold_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidConeOfCold_10160)
end

function me.TestSoundSelfAvoidCounterspell_2139()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidCounterspell_2139",
    testCategory,
    2139
  )
end

function me.TestSoundSelfAvoidPolymorph_12826()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidPolymorph_12826",
    testCategory,
    12826
  )
end

function me.TestSoundSelfAvoidPolymorph_118()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidPolymorph_118",
    testCategory,
    118
  )
end

function me.TestSoundSelfAvoidPolymorph_12824()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidPolymorph_12824",
    testCategory,
    12824
  )
end

function me.TestSoundSelfAvoidPolymorph_12825()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidPolymorph_12825",
    testCategory,
    12825
  )
end

function me.TestSoundSelfAvoidPolymorph_28271()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidPolymorph_28271",
    testCategory,
    28271
  )
end

function me.TestSoundSelfAvoidPolymorph_28272()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidPolymorph_28272",
    testCategory,
    28272
  )
end

function me.TestSoundSelfAvoidFrostNova_10230()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFrostNova_10230",
    testCategory,
    10230
  )
end

function me.TestSoundSelfAvoidFrostNova_122()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFrostNova_122",
    testCategory,
    122
  )
end

function me.TestSoundSelfAvoidFrostNova_865()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFrostNova_865",
    testCategory,
    865
  )
end

function me.TestSoundSelfAvoidFrostNova_6131()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidFrostNova_6131",
    testCategory,
    6131
  )
end

function me.TestSoundSelfAvoidConeOfCold_10161()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidConeOfCold_10161",
    testCategory,
    10161
  )
end

function me.TestSoundSelfAvoidConeOfCold_120()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidConeOfCold_120",
    testCategory,
    120
  )
end

function me.TestSoundSelfAvoidConeOfCold_8492()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidConeOfCold_8492",
    testCategory,
    8492
  )
end

function me.TestSoundSelfAvoidConeOfCold_10159()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidConeOfCold_10159",
    testCategory,
    10159
  )
end

function me.TestSoundSelfAvoidConeOfCold_10160()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidConeOfCold_10160",
    testCategory,
    10160
  )
end
