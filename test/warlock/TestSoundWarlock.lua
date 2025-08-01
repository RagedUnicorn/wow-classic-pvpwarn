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
mod.testSoundWarlock = me

me.tag = "TestSoundWarlock"

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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFear_6215)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFear_5782)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFear_6213)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowburn_18871)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowburn_17877)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowburn_18867)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowburn_18868)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowburn_18869)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowburn_18870)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowWard_28610)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowWard_28610)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowWard_6229)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowWard_6229)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowWard_11739)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowWard_11739)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowWard_11740)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowWard_11740)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHowlOfTerror_17928)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHowlOfTerror_5484)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDeathCoil_17926)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDeathCoil_6789)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDeathCoil_17925)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAmplifyCurse_18288)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAmplifyCurse_18288)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSpellLock_19647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSpellLock_19244)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSoulLink_19028)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSoulLink_19028)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFelDomination_18708)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFelDomination_18708)

  -- start runes
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

function me.TestSoundFear_6215()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFear_6215",
    testCategory,
    6215
  )
end

function me.TestSoundFear_5782()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFear_5782",
    testCategory,
    5782
  )
end

function me.TestSoundFear_6213()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFear_6213",
    testCategory,
    6213
  )
end

function me.TestSoundShadowburn_18871()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowburn_18871",
    testCategory,
    18871
  )
end

function me.TestSoundShadowburn_17877()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowburn_17877",
    testCategory,
    17877
  )
end

function me.TestSoundShadowburn_18867()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowburn_18867",
    testCategory,
    18867
  )
end

function me.TestSoundShadowburn_18868()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowburn_18868",
    testCategory,
    18868
  )
end

function me.TestSoundShadowburn_18869()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowburn_18869",
    testCategory,
    18869
  )
end

function me.TestSoundShadowburn_18870()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowburn_18870",
    testCategory,
    18870
  )
end

function me.TestSoundShadowWard_28610()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowWard_28610",
    testCategory,
    28610
  )
end

function me.TestSoundDownShadowWard_28610()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowWard_28610",
    testCategory,
    28610
  )
end

function me.TestSoundShadowWard_6229()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowWard_6229",
    testCategory,
    6229
  )
end

function me.TestSoundDownShadowWard_6229()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowWard_6229",
    testCategory,
    6229
  )
end

function me.TestSoundShadowWard_11739()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowWard_11739",
    testCategory,
    11739
  )
end

function me.TestSoundDownShadowWard_11739()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowWard_11739",
    testCategory,
    11739
  )
end

function me.TestSoundShadowWard_11740()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowWard_11740",
    testCategory,
    11740
  )
end

function me.TestSoundDownShadowWard_11740()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowWard_11740",
    testCategory,
    11740
  )
end

function me.TestSoundHowlOfTerror_17928()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHowlOfTerror_17928",
    testCategory,
    17928
  )
end

function me.TestSoundHowlOfTerror_5484()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHowlOfTerror_5484",
    testCategory,
    5484
  )
end

function me.TestSoundDeathCoil_17926()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDeathCoil_17926",
    testCategory,
    17926
  )
end

function me.TestSoundDeathCoil_6789()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDeathCoil_6789",
    testCategory,
    6789
  )
end

function me.TestSoundDeathCoil_17925()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDeathCoil_17925",
    testCategory,
    17925
  )
end

function me.TestSoundAmplifyCurse_18288()
  mod.testHelper.TestSoundApplied(
    "TestSoundAmplifyCurse_18288",
    testCategory,
    18288
  )
end

function me.TestSoundDownAmplifyCurse_18288()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAmplifyCurse_18288",
    testCategory,
    18288
  )
end

function me.TestSoundSpellLock_19647()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSpellLock_19647",
    testCategory,
    19647
  )
end

function me.TestSoundSpellLock_19244()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSpellLock_19244",
    testCategory,
    19244
  )
end

function me.TestSoundSoulLink_19028()
  mod.testHelper.TestSoundApplied(
    "TestSoundSoulLink_19028",
    testCategory,
    19028
  )
end

function me.TestSoundDownSoulLink_19028()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSoulLink_19028",
    testCategory,
    19028
  )
end

function me.TestSoundFelDomination_18708()
  mod.testHelper.TestSoundApplied(
    "TestSoundFelDomination_18708",
    testCategory,
    18708
  )
end

function me.TestSoundDownFelDomination_18708()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFelDomination_18708",
    testCategory,
    18708
  )
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
