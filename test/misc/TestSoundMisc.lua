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
mod.testSoundMisc = me

me.tag = "TestSoundMisc"

local testCategory = "misc"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound misc")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundThistleTea_9512)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMightyRagePotion_17528)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFirstAid_18610)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFirstAid_746)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFirstAid_1159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFirstAid_3267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFirstAid_3268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFirstAid_7926)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFirstAid_7927)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFirstAid_10838)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFirstAid_10839)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFirstAid_18608)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGreaterShadowProtectionPotion_17548)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGreaterShadowProtectionPotion_17548)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGreaterFrostProtectionPotion_17544)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGreaterFrostProtectionPotion_17544)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGreaterFireProtectionPotion_17543)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGreaterFireProtectionPotion_17543)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGreaterNatureProtectionPotion_17546)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGreaterNatureProtectionPotion_17546)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGreaterArcaneProtectionPotion_17549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGreaterArcaneProtectionPotion_17549)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRestorativePotion_11359)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRestorativePotion_11359)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLivingActionPotion_24364)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownLivingActionPotion_24364)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFreeActionPotion_6615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFreeActionPotion_6615)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLimitedInvulnerabilityPotion_3169)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownLimitedInvulnerabilityPotion_3169)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInvisibilityPotion_11392)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLesserInvisibilityPotion_3680)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCatseyeElixir_12608)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownCatseyeElixir_12608)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundElixirOfPoisonResistance_26677)

  -- start sod items
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFirstAid_470345)
end

function me.TestSoundThistleTea_9512()
  mod.testHelper.TestSoundSuccess(
    "TestSoundThistleTea_9512",
    testCategory,
    9512
  )
end

function me.TestSoundMightyRagePotion_17528()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMightyRagePotion_17528",
    testCategory,
    17528
  )
end

function me.TestSoundFirstAid_18610()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFirstAid_18610",
    testCategory,
    18610
  )
end

function me.TestSoundFirstAid_746()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFirstAid_746",
    testCategory,
    746
  )
end

function me.TestSoundFirstAid_1159()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFirstAid_1159",
    testCategory,
    1159
  )
end

function me.TestSoundFirstAid_3267()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFirstAid_3267",
    testCategory,
    3267
  )
end

function me.TestSoundFirstAid_3268()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFirstAid_3268",
    testCategory,
    3268
  )
end

function me.TestSoundFirstAid_7926()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFirstAid_7926",
    testCategory,
    7926
  )
end

function me.TestSoundFirstAid_7927()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFirstAid_7927",
    testCategory,
    7927
  )
end

function me.TestSoundFirstAid_10838()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFirstAid_10838",
    testCategory,
    10838
  )
end

function me.TestSoundFirstAid_10839()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFirstAid_10839",
    testCategory,
    10839
  )
end

function me.TestSoundFirstAid_18608()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFirstAid_18608",
    testCategory,
    18608
  )
end

function me.TestSoundGreaterShadowProtectionPotion_17548()
  mod.testHelper.TestSoundApplied(
    "TestSoundGreaterShadowProtectionPotion_17548",
    testCategory,
    17548
  )
end

function me.TestSoundDownGreaterShadowProtectionPotion_17548()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGreaterShadowProtectionPotion_17548",
    testCategory,
    17548
  )
end

function me.TestSoundGreaterFrostProtectionPotion_17544()
  mod.testHelper.TestSoundApplied(
    "TestSoundGreaterFrostProtectionPotion_17544",
    testCategory,
    17544
  )
end

function me.TestSoundDownGreaterFrostProtectionPotion_17544()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGreaterFrostProtectionPotion_17544",
    testCategory,
    17544
  )
end

function me.TestSoundGreaterFireProtectionPotion_17543()
  mod.testHelper.TestSoundApplied(
    "TestSoundGreaterFireProtectionPotion_17543",
    testCategory,
    17543
  )
end

function me.TestSoundDownGreaterFireProtectionPotion_17543()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGreaterFireProtectionPotion_17543",
    testCategory,
    17543
  )
end

function me.TestSoundGreaterNatureProtectionPotion_17546()
  mod.testHelper.TestSoundApplied(
    "TestSoundGreaterNatureProtectionPotion_17546",
    testCategory,
    17546
  )
end

function me.TestSoundDownGreaterNatureProtectionPotion_17546()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGreaterNatureProtectionPotion_17546",
    testCategory,
    17546
  )
end

function me.TestSoundGreaterArcaneProtectionPotion_17549()
  mod.testHelper.TestSoundApplied(
    "TestSoundGreaterArcaneProtectionPotion_17549",
    testCategory,
    17549
  )
end

function me.TestSoundDownGreaterArcaneProtectionPotion_17549()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGreaterArcaneProtectionPotion_17549",
    testCategory,
    17549
  )
end

function me.TestSoundRestorativePotion_11359()
  mod.testHelper.TestSoundApplied(
    "TestSoundRestorativePotion_11359",
    testCategory,
    11359
  )
end

function me.TestSoundDownRestorativePotion_11359()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownRestorativePotion_11359",
    testCategory,
    11359
  )
end

function me.TestSoundLivingActionPotion_24364()
  mod.testHelper.TestSoundApplied(
    "TestSoundLivingActionPotion_24364",
    testCategory,
    24364
  )
end

function me.TestSoundDownLivingActionPotion_24364()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownLivingActionPotion_24364",
    testCategory,
    24364
  )
end

function me.TestSoundFreeActionPotion_6615()
  mod.testHelper.TestSoundApplied(
    "TestSoundFreeActionPotion_6615",
    testCategory,
    6615
  )
end

function me.TestSoundDownFreeActionPotion_6615()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFreeActionPotion_6615",
    testCategory,
    6615
  )
end

function me.TestSoundLimitedInvulnerabilityPotion_3169()
  mod.testHelper.TestSoundApplied(
    "TestSoundLimitedInvulnerabilityPotion_3169",
    testCategory,
    3169
  )
end

function me.TestSoundDownLimitedInvulnerabilityPotion_3169()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownLimitedInvulnerabilityPotion_3169",
    testCategory,
    3169
  )
end

function me.TestSoundInvisibilityPotion_11392()
  mod.testHelper.TestSoundSuccess(
    "TestSoundInvisibilityPotion_11392",
    testCategory,
    11392
  )
end

function me.TestSoundLesserInvisibilityPotion_3680()
  mod.testHelper.TestSoundSuccess(
    "TestSoundLesserInvisibilityPotion_3680",
    testCategory,
    3680
  )
end

function me.TestSoundCatseyeElixir_12608()
  mod.testHelper.TestSoundApplied(
    "TestSoundCatseyeElixir_12608",
    testCategory,
    12608
  )
end

function me.TestSoundDownCatseyeElixir_12608()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownCatseyeElixir_12608",
    testCategory,
    12608
  )
end

function me.TestSoundElixirOfPoisonResistance_26677()
  mod.testHelper.TestSoundSuccess(
    "TestSoundElixirOfPoisonResistance_26677",
    testCategory,
    26677
  )
end

function me.TestSoundFirstAid_470345()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFirstAid_470345",
    testCategory,
    470345
  )
end
