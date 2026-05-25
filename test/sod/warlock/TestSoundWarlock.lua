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
mod.testSoundWarlockSod = me

me.tag = "TestSoundWarlockSod"

local testCategory = "warlock"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound warlock")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDemonicGrace_425463)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDemonicGrace_425463)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHaunt_403501)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVengeance_426195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownVengeance_426195)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmolationAura_427726)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownImmolationAura_427726)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundUnstableAffliction_427717)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBackdraft_427713)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBackdraft_427713)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInfernalArmor_440882)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInfernalArmor_440882)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMetamorphosis_403789)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownMetamorphosis_403789)
end

function me.TestSoundDemonicGrace_425463()
  mod.testHelper.TestSoundApplied(
    "TestSoundDemonicGrace_425463",
    testCategory,
    425463
  )
end

function me.TestSoundDownDemonicGrace_425463()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDemonicGrace_425463",
    testCategory,
    425463
  )
end

function me.TestSoundHaunt_403501()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHaunt_403501",
    testCategory,
    403501
  )
end

function me.TestSoundVengeance_426195()
  mod.testHelper.TestSoundApplied(
    "TestSoundVengeance_426195",
    testCategory,
    426195
  )
end

function me.TestSoundDownVengeance_426195()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownVengeance_426195",
    testCategory,
    426195
  )
end

function me.TestSoundImmolationAura_427726()
  mod.testHelper.TestSoundApplied(
    "TestSoundImmolationAura_427726",
    testCategory,
    427726
  )
end

function me.TestSoundDownImmolationAura_427726()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownImmolationAura_427726",
    testCategory,
    427726
  )
end

function me.TestSoundUnstableAffliction_427717()
  mod.testHelper.TestSoundSuccess(
    "TestSoundUnstableAffliction_427717",
    testCategory,
    427717
  )
end

function me.TestSoundBackdraft_427713()
  mod.testHelper.TestSoundApplied(
    "TestSoundBackdraft_427713",
    testCategory,
    427713
  )
end

function me.TestSoundDownBackdraft_427713()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBackdraft_427713",
    testCategory,
    427713
  )
end

function me.TestSoundInfernalArmor_440882()
  mod.testHelper.TestSoundApplied(
    "TestSoundInfernalArmor_440882",
    testCategory,
    440882
  )
end

function me.TestSoundDownInfernalArmor_440882()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownInfernalArmor_440882",
    testCategory,
    440882
  )
end

function me.TestSoundMetamorphosis_403789()
  mod.testHelper.TestSoundApplied(
    "TestSoundMetamorphosis_403789",
    testCategory,
    403789
  )
end

function me.TestSoundDownMetamorphosis_403789()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownMetamorphosis_403789",
    testCategory,
    403789
  )
end
