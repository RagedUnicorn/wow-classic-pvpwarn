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
mod.testSoundPaladinSod = me

me.tag = "TestSoundPaladinSod"

local testCategory = "paladin"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound paladin")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAegis_425589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAegis_425589)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDivineSacrifice_407804)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDivineSacrifice_407804)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInspirationExemplar_407880)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAvengersShield_407669)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRebuke_425609)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCrusaderStrike_407676)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDivineStorm_407778)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDivineSteed_461607)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDivineSteed_461607)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHandOfSacrifice_462853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownHandOfSacrifice_462853)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDivineLight_409925)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAvengingWrath_407788)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAvengingWrath_407788)
end

function me.TestSoundAegis_425589()
  mod.testHelper.TestSoundApplied(
    "TestSoundAegis_425589",
    testCategory,
    425589
  )
end

function me.TestSoundDownAegis_425589()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAegis_425589",
    testCategory,
    425589
  )
end

function me.TestSoundDivineSacrifice_407804()
  mod.testHelper.TestSoundApplied(
    "TestSoundDivineSacrifice_407804",
    testCategory,
    407804
  )
end

function me.TestSoundDownDivineSacrifice_407804()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDivineSacrifice_407804",
    testCategory,
    407804
  )
end

function me.TestSoundInspirationExemplar_407880()
  mod.testHelper.TestSoundSuccess(
    "TestSoundInspirationExemplar_407880",
    testCategory,
    407880
  )
end

function me.TestSoundAvengersShield_407669()
  mod.testHelper.TestSoundSuccess(
    "TestSoundAvengersShield_407669",
    testCategory,
    407669
  )
end

function me.TestSoundRebuke_425609()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRebuke_425609",
    testCategory,
    425609
  )
end

function me.TestSoundCrusaderStrike_407676()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCrusaderStrike_407676",
    testCategory,
    407676
  )
end

function me.TestSoundDivineStorm_407778()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDivineStorm_407778",
    testCategory,
    407778
  )
end

function me.TestSoundDivineSteed_461607()
  mod.testHelper.TestSoundApplied(
    "TestSoundDivineSteed_461607",
    testCategory,
    461607
  )
end

function me.TestSoundDownDivineSteed_461607()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDivineSteed_461607",
    testCategory,
    461607
  )
end

function me.TestSoundHandOfSacrifice_462853()
  mod.testHelper.TestSoundApplied(
    "TestSoundHandOfSacrifice_462853",
    testCategory,
    462853
  )
end

function me.TestSoundDownHandOfSacrifice_462853()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownHandOfSacrifice_462853",
    testCategory,
    462853
  )
end

function me.TestSoundDivineLight_409925()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDivineLight_409925",
    testCategory,
    409925
  )
end

function me.TestSoundAvengingWrath_407788()
  mod.testHelper.TestSoundApplied(
    "TestSoundAvengingWrath_407788",
    testCategory,
    407788
  )
end

function me.TestSoundDownAvengingWrath_407788()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAvengingWrath_407788",
    testCategory,
    407788
  )
end
