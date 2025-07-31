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
mod.testSoundSelfAvoidWarrior = me

me.tag = "TestSoundSelfAvoidWarrior"

local testGroupName = "SoundSelfAvoidWarrior"
local testCategory = "warrior"

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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidChargeStun_7922)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidInterceptStun_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidInterceptStun_20614)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidInterceptStun_20615)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidHamstring_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidHamstring_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidHamstring_25212)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidMortalStrike_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidMortalStrike_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidMortalStrike_21552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidMortalStrike_21553)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidIntimidatingShout_5246)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPummel_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidPummel_6554)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSelfAvoidDisarm_676)
end

function me.TestSoundSelfAvoidChargeStun_7922()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidChargeStun_7922",
    testCategory,
    7922
  )
end

function me.TestSoundSelfAvoidInterceptStun_20253()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidInterceptStun_20253",
    testCategory,
    20253
  )
end

function me.TestSoundSelfAvoidInterceptStun_20614()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidInterceptStun_20614",
    testCategory,
    20614
  )
end

function me.TestSoundSelfAvoidInterceptStun_20615()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidInterceptStun_20615",
    testCategory,
    20615
  )
end

function me.TestSoundSelfAvoidHamstring_7372()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidHamstring_7372",
    testCategory,
    7372
  )
end

function me.TestSoundSelfAvoidHamstring_7373()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidHamstring_7373",
    testCategory,
    7373
  )
end

function me.TestSoundSelfAvoidHamstring_25212()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidHamstring_25212",
    testCategory,
    25212
  )
end

function me.TestSoundSelfAvoidMortalStrike_12294()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidMortalStrike_12294",
    testCategory,
    12294
  )
end

function me.TestSoundSelfAvoidMortalStrike_21551()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidMortalStrike_21551",
    testCategory,
    21551
  )
end

function me.TestSoundSelfAvoidMortalStrike_21552()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidMortalStrike_21552",
    testCategory,
    21552
  )
end

function me.TestSoundSelfAvoidMortalStrike_21553()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidMortalStrike_21553",
    testCategory,
    21553
  )
end

function me.TestSoundSelfAvoidIntimidatingShout_5246()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidIntimidatingShout_5246",
    testCategory,
    5246
  )
end

function me.TestSoundSelfAvoidPummel_6552()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidPummel_6552",
    testCategory,
    6552
  )
end

function me.TestSoundSelfAvoidPummel_6554()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidPummel_6554",
    testCategory,
    6554
  )
end

function me.TestSoundSelfAvoidDisarm_676()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidDisarm_676",
    testCategory,
    676
  )
end
