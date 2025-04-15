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
mod.testSoundEnemyAvoidRogue = me

me.tag = "TestSoundEnemyAvoidRogue"

local testGroupName = "SoundEnemyAvoidRogue"
local testCategory = "rogue"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end


function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidKick_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidKick_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidKick_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidKick_1768)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidCheapShot_1833)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGouge_11286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGouge_1776)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGouge_1777)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGouge_8629)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGouge_11285)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidKidneyShot_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidKidneyShot_408)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidBlind_2094)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGhostlyStrike_14278)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSap_11297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSap_6770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidSap_2070)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDistract_1725)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidExposeArmor_11198)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidExposeArmor_8647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidExposeArmor_8649)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidExposeArmor_8650)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidExposeArmor_11197)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGarrote_11290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGarrote_703)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGarrote_8631)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGarrote_8632)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGarrote_8633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidGarrote_11289)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidRupture_11275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidRupture_1943)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidRupture_8639)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidRupture_8640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidRupture_11273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidRupture_11274)
end

function me.TestSoundEnemyAvoidKick_1769()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidKick_1769",
    testCategory,
    1769
  )
end

function me.TestSoundEnemyAvoidKick_1766()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidKick_1766",
    testCategory,
    1766
  )
end

function me.TestSoundEnemyAvoidKick_1767()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidKick_1767",
    testCategory,
    1767
  )
end

function me.TestSoundEnemyAvoidKick_1768()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidKick_1768",
    testCategory,
    1768
  )
end

function me.TestSoundEnemyAvoidCheapShot_1833()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidCheapShot_1833",
    testCategory,
    1833
  )
end

function me.TestSoundEnemyAvoidGouge_11286()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGouge_11286",
    testCategory,
    11286
  )
end

function me.TestSoundEnemyAvoidGouge_1776()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGouge_1776",
    testCategory,
    1776
  )
end

function me.TestSoundEnemyAvoidGouge_1777()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGouge_1777",
    testCategory,
    1777
  )
end

function me.TestSoundEnemyAvoidGouge_8629()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGouge_8629",
    testCategory,
    8629
  )
end

function me.TestSoundEnemyAvoidGouge_11285()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGouge_11285",
    testCategory,
    11285
  )
end

function me.TestSoundEnemyAvoidKidneyShot_8643()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidKidneyShot_8643",
    testCategory,
    8643
  )
end

function me.TestSoundEnemyAvoidKidneyShot_408()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidKidneyShot_408",
    testCategory,
    408
  )
end

function me.TestSoundEnemyAvoidBlind_2094()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidBlind_2094",
    testCategory,
    2094
  )
end

function me.TestSoundEnemyAvoidGhostlyStrike_14278()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGhostlyStrike_14278",
    testCategory,
    14278
  )
end

function me.TestSoundEnemyAvoidSap_11297()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidSap_11297",
    testCategory,
    11297
  )
end

function me.TestSoundEnemyAvoidSap_6770()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidSap_6770",
    testCategory,
    6770
  )
end

function me.TestSoundEnemyAvoidSap_2070()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidSap_2070",
    testCategory,
    2070
  )
end

function me.TestSoundEnemyAvoidDistract_1725()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidDistract_1725",
    testCategory,
    1725
  )
end

function me.TestSoundEnemyAvoidExposeArmor_11198()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidExposeArmor_11198",
    testCategory,
    11198
  )
end

function me.TestSoundEnemyAvoidExposeArmor_8647()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidExposeArmor_8647",
    testCategory,
    8647
  )
end

function me.TestSoundEnemyAvoidExposeArmor_8649()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidExposeArmor_8649",
    testCategory,
    8649
  )
end

function me.TestSoundEnemyAvoidExposeArmor_8650()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidExposeArmor_8650",
    testCategory,
    8650
  )
end

function me.TestSoundEnemyAvoidExposeArmor_11197()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidExposeArmor_11197",
    testCategory,
    11197
  )
end

function me.TestSoundEnemyAvoidGarrote_11290()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGarrote_11290",
    testCategory,
    11290
  )
end

function me.TestSoundEnemyAvoidGarrote_703()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGarrote_703",
    testCategory,
    703
  )
end

function me.TestSoundEnemyAvoidGarrote_8631()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGarrote_8631",
    testCategory,
    8631
  )
end

function me.TestSoundEnemyAvoidGarrote_8632()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGarrote_8632",
    testCategory,
    8632
  )
end

function me.TestSoundEnemyAvoidGarrote_8633()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGarrote_8633",
    testCategory,
    8633
  )
end

function me.TestSoundEnemyAvoidGarrote_11289()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidGarrote_11289",
    testCategory,
    11289
  )
end

function me.TestSoundEnemyAvoidRupture_11275()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidRupture_11275",
    testCategory,
    11275
  )
end

function me.TestSoundEnemyAvoidRupture_1943()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidRupture_1943",
    testCategory,
    1943
  )
end

function me.TestSoundEnemyAvoidRupture_8639()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidRupture_8639",
    testCategory,
    8639
  )
end

function me.TestSoundEnemyAvoidRupture_8640()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidRupture_8640",
    testCategory,
    8640
  )
end

function me.TestSoundEnemyAvoidRupture_11273()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidRupture_11273",
    testCategory,
    11273
  )
end

function me.TestSoundEnemyAvoidRupture_11274()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidRupture_11274",
    testCategory,
    11274
  )
end
