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
mod.testCombatEventsMisc = me

me.tag = "TestCombatEventsMisc"

local testCategory = "misc"

function me.Test()
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testcombatevent misc")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventThistleTeaSuccess_9512)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMightyRagePotionSuccess_17528)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFirstAidSuccess_18610)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFirstAidSuccess_746)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFirstAidSuccess_1159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFirstAidSuccess_3267)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFirstAidSuccess_3268)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFirstAidSuccess_7926)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFirstAidSuccess_7927)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFirstAidSuccess_10838)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFirstAidSuccess_10839)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFirstAidSuccess_18608)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGreaterShadowProtectionPotionApplied_17548)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGreaterShadowProtectionPotionRemoved_17548)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGreaterFrostProtectionPotionApplied_17544)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGreaterFrostProtectionPotionRemoved_17544)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGreaterFireProtectionPotionApplied_17543)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGreaterFireProtectionPotionRemoved_17543)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGreaterNatureProtectionPotionApplied_17546)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGreaterNatureProtectionPotionRemoved_17546)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGreaterArcaneProtectionPotionApplied_17549)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGreaterArcaneProtectionPotionRemoved_17549)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRestorativePotionApplied_11359)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRestorativePotionRemoved_11359)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLivingFreeActionApplied_24364)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLivingFreeActionRemoved_24364)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFreeActionPotionApplied_6615)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFreeActionPotionRemoved_6615)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLimitedInvulnerabilityPotionApplied_3169)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLimitedInvulnerabilityPotionRemoved_3169)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInvisibilityPotionSuccess_11392)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLesserInvisibilityPotionSuccess_3680)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCatseyeElixirApplied_12608)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCatseyeElixirRemoved_12608)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventElixirOfPoisonResistanceSuccess_26677)

  -- start sod items
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFirstAidSuccess_470345)
end

function me.TestCombatEventThistleTeaSuccess_9512()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventThistleTeaSuccess_9512",
    testCategory,
    "Thistle Tea",
    9512
  )
end

function me.TestCombatEventMightyRagePotionSuccess_17528()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMightyRagePotionSuccess_17528",
    testCategory,
    "Mighty Rage Potion",
    17528
  )
end

function me.TestCombatEventFirstAidSuccess_18610()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFirstAidSuccess_18610",
    testCategory,
    "First Aid",
    18610
  )
end

function me.TestCombatEventFirstAidSuccess_746()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFirstAidSuccess_746",
    testCategory,
    "First Aid",
    746
  )
end

function me.TestCombatEventFirstAidSuccess_1159()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFirstAidSuccess_1159",
    testCategory,
    "First Aid",
    1159
  )
end

function me.TestCombatEventFirstAidSuccess_3267()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFirstAidSuccess_3267",
    testCategory,
    "First Aid",
    3267
  )
end

function me.TestCombatEventFirstAidSuccess_3268()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFirstAidSuccess_3268",
    testCategory,
    "First Aid",
    3268
  )
end

function me.TestCombatEventFirstAidSuccess_7926()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFirstAidSuccess_7926",
    testCategory,
    "First Aid",
    7926
  )
end

function me.TestCombatEventFirstAidSuccess_7927()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFirstAidSuccess_7927",
    testCategory,
    "First Aid",
    7927
  )
end

function me.TestCombatEventFirstAidSuccess_10838()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFirstAidSuccess_10838",
    testCategory,
    "First Aid",
    10838
  )
end

function me.TestCombatEventFirstAidSuccess_10839()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFirstAidSuccess_10839",
    testCategory,
    "First Aid",
    10839
  )
end

function me.TestCombatEventFirstAidSuccess_18608()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFirstAidSuccess_18608",
    testCategory,
    "First Aid",
    18608
  )
end

function me.TestCombatEventGreaterShadowProtectionPotionApplied_17548()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGreaterShadowProtectionPotionApplied_17548",
    testCategory,
    "Greater Shadow Protection Potion",
    17548
  )
end

function me.TestCombatEventGreaterShadowProtectionPotionRemoved_17548()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGreaterShadowProtectionPotionRemoved_17548",
    testCategory,
    "Greater Shadow Protection Potion",
    17548
  )
end

function me.TestCombatEventGreaterFrostProtectionPotionApplied_17544()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGreaterFrostProtectionPotionApplied_17544",
    testCategory,
    "Greater Frost Protection Potion",
    17544
  )
end

function me.TestCombatEventGreaterFrostProtectionPotionRemoved_17544()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGreaterFrostProtectionPotionRemoved_17544",
    testCategory,
    "Greater Frost Protection Potion",
    17544
  )
end

function me.TestCombatEventGreaterFireProtectionPotionApplied_17543()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGreaterFireProtectionPotionApplied_17543",
    testCategory,
    "Greater Fire Protection Potion",
    17543
  )
end

function me.TestCombatEventGreaterFireProtectionPotionRemoved_17543()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGreaterFireProtectionPotionRemoved_17543",
    testCategory,
    "Greater Fire Protection Potion",
    17543
  )
end

function me.TestCombatEventGreaterNatureProtectionPotionApplied_17546()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGreaterNatureProtectionPotionApplied_17546",
    testCategory,
    "Greater Nature Protection Potion",
    17546
  )
end

function me.TestCombatEventGreaterNatureProtectionPotionRemoved_17546()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGreaterNatureProtectionPotionRemoved_17546",
    testCategory,
    "Greater Nature Protection Potion",
    17546
  )
end

function me.TestCombatEventGreaterArcaneProtectionPotionApplied_17549()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGreaterArcaneProtectionPotionApplied_17549",
    testCategory,
    "Greater Arcane Protection Potion",
    17549
  )
end

function me.TestCombatEventGreaterArcaneProtectionPotionRemoved_17549()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventGreaterArcaneProtectionPotionRemoved_17549",
    testCategory,
    "Greater Arcane Protection Potion",
    17549
  )
end

function me.TestCombatEventRestorativePotionApplied_11359()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventRestorativePotionApplied_11359",
    testCategory,
    "Restorative Potion",
    11359
  )
end

function me.TestCombatEventRestorativePotionRemoved_11359()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventRestorativePotionRemoved_11359",
    testCategory,
    "Restorative Potion",
    11359
  )
end

function me.TestCombatEventLivingFreeActionApplied_24364()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventLivingFreeActionApplied_24364",
    testCategory,
    "Living Free Action",
    24364
  )
end

function me.TestCombatEventLivingFreeActionRemoved_24364()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventLivingFreeActionRemoved_24364",
    testCategory,
    "Living Free Action",
    24364
  )
end

function me.TestCombatEventFreeActionPotionApplied_6615()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFreeActionPotionApplied_6615",
    testCategory,
    "Free Action Potion",
    6615
  )
end

function me.TestCombatEventFreeActionPotionRemoved_6615()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFreeActionPotionRemoved_6615",
    testCategory,
    "Free Action Potion",
    6615
  )
end

function me.TestCombatEventLimitedInvulnerabilityPotionApplied_3169()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventLimitedInvulnerabilityPotionApplied_3169",
    testCategory,
    "Limited Invulnerability Potion",
    3169
  )
end

function me.TestCombatEventLimitedInvulnerabilityPotionRemoved_3169()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventLimitedInvulnerabilityPotionRemoved_3169",
    testCategory,
    "Limited Invulnerability Potion",
    3169
  )
end

function me.TestCombatEventInvisibilityPotionSuccess_11392()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInvisibilityPotionSuccess_11392",
    testCategory,
    "Invisibility Potion",
    11392
  )
end

function me.TestCombatEventLesserInvisibilityPotionSuccess_3680()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventLesserInvisibilityPotionSuccess_3680",
    testCategory,
    "Lesser Invisibility Potion",
    3680
  )
end

function me.TestCombatEventCatseyeElixirApplied_12608()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventCatseyeElixirApplied_12608",
    testCategory,
    "Catseye Elixir",
    12608
  )
end

function me.TestCombatEventCatseyeElixirRemoved_12608()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventCatseyeElixirRemoved_12608",
    testCategory,
    "Catseye Elixir",
    12608
  )
end

function me.TestCombatEventElixirOfPoisonResistanceSuccess_26677()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventElixirOfPoisonResistanceSuccess_26677",
    testCategory,
    "Elixir of Poison Resistance",
    26677
  )
end

function me.TestCombatEventFirstAidSuccess_470345()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFirstAidSuccess_470345",
    testCategory,
    "First Aid",
    470345
  )
end
