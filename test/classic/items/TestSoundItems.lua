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
mod.testSoundItemsClassic = me

me.tag = "TestSoundItemsClassic"

local testCategory = "items"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound items")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTalismanOfEphemeralPower_23271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTalismanOfEphemeralPower_23271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHyperRadiantFlameReflector_23097)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownHyperRadiantFlameReflector_23097)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGyrofreezeIceReflector_23131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGyrofreezeIceReflector_23131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundUltraFlashShadowReflector_23132)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownUltraFlashShadowReflector_23132)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSkullOfImpendingDoom_5024)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSkullOfImpendingDoom_5024)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSpiderBelt_9774)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSpiderBelt_9774)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGoblinRocketHelmet_22641)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGnomishNetOMaticProjector_13120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTidalCharm_835)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGnomishMindControlCap_13180)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGnomishRocketBoots_13141)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGnomishRocketBoots_13141)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGoblinRocketBoots_8892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownGoblinRocketBoots_8892)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNiftyStopwatch_14530)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownNiftyStopwatch_14530)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMithrilMechanicalDragonling_23075)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInsigniaWarriorHunterShaman_5579)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInsigniaWarlockRogue_23273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInsigniaMage_23274)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInsigniaPriestPaladin_23276)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInsigniaDruid_23277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundArenaGrandMaster_23506)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownArenaGrandMaster_23506)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSmolderwebsEye_17330)
end

function me.TestSoundTalismanOfEphemeralPower_23271()
  mod.testHelper.TestSoundApplied(
    "TestSoundTalismanOfEphemeralPower_23271",
    testCategory,
    23271
  )
end

function me.TestSoundDownTalismanOfEphemeralPower_23271()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownTalismanOfEphemeralPower_23271",
    testCategory,
    23271
  )
end

function me.TestSoundHyperRadiantFlameReflector_23097()
  mod.testHelper.TestSoundApplied(
    "TestSoundHyperRadiantFlameReflector_23097",
    testCategory,
    23097
  )
end

function me.TestSoundDownHyperRadiantFlameReflector_23097()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownHyperRadiantFlameReflector_23097",
    testCategory,
    23097
  )
end

function me.TestSoundGyrofreezeIceReflector_23131()
  mod.testHelper.TestSoundApplied(
    "TestSoundGyrofreezeIceReflector_23131",
    testCategory,
    23131
  )
end

function me.TestSoundDownGyrofreezeIceReflector_23131()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGyrofreezeIceReflector_23131",
    testCategory,
    23131
  )
end

function me.TestSoundUltraFlashShadowReflector_23132()
  mod.testHelper.TestSoundApplied(
    "TestSoundUltraFlashShadowReflector_23132",
    testCategory,
    23132
  )
end

function me.TestSoundDownUltraFlashShadowReflector_23132()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownUltraFlashShadowReflector_23132",
    testCategory,
    23132
  )
end

function me.TestSoundSkullOfImpendingDoom_5024()
  mod.testHelper.TestSoundApplied(
    "TestSoundSkullOfImpendingDoom_5024",
    testCategory,
    5024
  )
end

function me.TestSoundDownSkullOfImpendingDoom_5024()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSkullOfImpendingDoom_5024",
    testCategory,
    5024
  )
end

function me.TestSoundSpiderBelt_9774()
  mod.testHelper.TestSoundApplied(
    "TestSoundSpiderBelt_9774",
    testCategory,
    9774
  )
end

function me.TestSoundDownSpiderBelt_9774()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSpiderBelt_9774",
    testCategory,
    9774
  )
end

function me.TestSoundGoblinRocketHelmet_22641()
  mod.testHelper.TestSoundSuccess(
    "TestSoundGoblinRocketHelmet_22641",
    testCategory,
    22641
  )
end

function me.TestSoundGnomishNetOMaticProjector_13120()
  mod.testHelper.TestSoundSuccess(
    "TestSoundGnomishNetOMaticProjector_13120",
    testCategory,
    13120
  )
end

function me.TestSoundTidalCharm_835()
  mod.testHelper.TestSoundSuccess(
    "TestSoundTidalCharm_835",
    testCategory,
    835
  )
end

function me.TestSoundGnomishMindControlCap_13180()
  mod.testHelper.TestSoundSuccess(
    "TestSoundGnomishMindControlCap_13180",
    testCategory,
    13180
  )
end

function me.TestSoundGnomishRocketBoots_13141()
  mod.testHelper.TestSoundApplied(
    "TestSoundGnomishRocketBoots_13141",
    testCategory,
    13141
  )
end

function me.TestSoundDownGnomishRocketBoots_13141()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGnomishRocketBoots_13141",
    testCategory,
    13141
  )
end

function me.TestSoundGoblinRocketBoots_8892()
  mod.testHelper.TestSoundApplied(
    "TestSoundGoblinRocketBoots_8892",
    testCategory,
    8892
  )
end

function me.TestSoundDownGoblinRocketBoots_8892()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownGoblinRocketBoots_8892",
    testCategory,
    8892
  )
end

function me.TestSoundNiftyStopwatch_14530()
  mod.testHelper.TestSoundApplied(
    "TestSoundNiftyStopwatch_14530",
    testCategory,
    14530
  )
end

function me.TestSoundDownNiftyStopwatch_14530()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownNiftyStopwatch_14530",
    testCategory,
    14530
  )
end

function me.TestSoundMithrilMechanicalDragonling_23075()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMithrilMechanicalDragonling_23075",
    testCategory,
    23075
  )
end

function me.TestSoundInsigniaWarriorHunterShaman_5579()
  mod.testHelper.TestSoundSuccess(
    "TestSoundInsigniaWarriorHunterShaman_5579",
    testCategory,
    5579
  )
end

function me.TestSoundInsigniaWarlockRogue_23273()
  mod.testHelper.TestSoundSuccess(
    "TestSoundInsigniaWarlockRogue_23273",
    testCategory,
    23273
  )
end

function me.TestSoundInsigniaMage_23274()
  mod.testHelper.TestSoundSuccess(
    "TestSoundInsigniaMage_23274",
    testCategory,
    23274
  )
end

function me.TestSoundInsigniaPriestPaladin_23276()
  mod.testHelper.TestSoundSuccess(
    "TestSoundInsigniaPriestPaladin_23276",
    testCategory,
    23276
  )
end

function me.TestSoundInsigniaDruid_23277()
  mod.testHelper.TestSoundSuccess(
    "TestSoundInsigniaDruid_23277",
    testCategory,
    23277
  )
end

function me.TestSoundArenaGrandMaster_23506()
  mod.testHelper.TestSoundApplied(
    "TestSoundArenaGrandMaster_23506",
    testCategory,
    23506
  )
end

function me.TestSoundDownArenaGrandMaster_23506()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownArenaGrandMaster_23506",
    testCategory,
    23506
  )
end

function me.TestSoundSmolderwebsEye_17330()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSmolderwebsEye_17330",
    testCategory,
    17330
  )
end
