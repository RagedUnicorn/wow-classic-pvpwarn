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
mod.testSoundRogueSod = me

me.tag = "TestSoundRogueSod"

local testCategory = "rogue"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound rogue")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundQuickDraw_398196)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBetweenTheEyes_400009)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBladeDance_400012)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBladeDance_400012)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMutilate_399960)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowstrike_399985)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSaberSlash_424785)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowstep_400029)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPoisonedKnife_425012)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShurikenToss_399986)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnvenom_399963)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMainGauche_424919)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMasterOfSubtlety_425096)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownMasterOfSubtlety_425096)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCutthroat_462708)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownCutthroat_462708)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlunderbuss_436610)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCrimsonTempest_412096)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFanOfKnives_409240)
end

function me.TestSoundQuickDraw_398196()
  mod.testHelper.TestSoundSuccess(
    "TestSoundQuickDraw_398196",
    testCategory,
    398196
  )
end

function me.TestSoundBetweenTheEyes_400009()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBetweenTheEyes_400009",
    testCategory,
    400009
  )
end

function me.TestSoundBladeDance_400012()
  mod.testHelper.TestSoundApplied(
    "TestSoundBladeDance_400012",
    testCategory,
    400012
  )
end

function me.TestSoundDownBladeDance_400012()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBladeDance_400012",
    testCategory,
    400012
  )
end

function me.TestSoundMutilate_399960()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMutilate_399960",
    testCategory,
    399960
  )
end

function me.TestSoundShadowstrike_399985()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowstrike_399985",
    testCategory,
    399985
  )
end

function me.TestSoundSaberSlash_424785()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSaberSlash_424785",
    testCategory,
    424785
  )
end

function me.TestSoundShadowstep_400029()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowstep_400029",
    testCategory,
    400029
  )
end

function me.TestSoundPoisonedKnife_425012()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPoisonedKnife_425012",
    testCategory,
    425012
  )
end

function me.TestSoundShurikenToss_399986()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShurikenToss_399986",
    testCategory,
    399986
  )
end

function me.TestSoundEnvenom_399963()
  mod.testHelper.TestSoundSuccess(
    "TestSoundEnvenom_399963",
    testCategory,
    399963
  )
end

function me.TestSoundMainGauche_424919()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMainGauche_424919",
    testCategory,
    424919
  )
end

function me.TestSoundMasterOfSubtlety_425096()
  mod.testHelper.TestSoundApplied(
    "TestSoundMasterOfSubtlety_425096",
    testCategory,
    425096
  )
end

function me.TestSoundDownMasterOfSubtlety_425096()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownMasterOfSubtlety_425096",
    testCategory,
    425096
  )
end

function me.TestSoundCutthroat_462708()
  mod.testHelper.TestSoundApplied(
    "TestSoundCutthroat_462708",
    testCategory,
    462708
  )
end

function me.TestSoundDownCutthroat_462708()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownCutthroat_462708",
    testCategory,
    462708
  )
end

function me.TestSoundBlunderbuss_436610()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBlunderbuss_436610",
    testCategory,
    436610
  )
end

function me.TestSoundCrimsonTempest_412096()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCrimsonTempest_412096",
    testCategory,
    412096
  )
end

function me.TestSoundFanOfKnives_409240()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFanOfKnives_409240",
    testCategory,
    409240
  )
end
