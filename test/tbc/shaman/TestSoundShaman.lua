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
mod.testSoundShamanTbc = me

me.tag = "TestSoundShamanTbc"

local testCategory = "shaman"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound shaman")
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireResistanceTotem_25563)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostResistanceTotem_25560)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundNatureResistanceTotem_25574)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFlametongueTotem_25557)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneskinTotem_25508)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneskinTotem_25509)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStrengthOfEarthTotem_25528)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWindfuryTotem_25585)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWindfuryTotem_25587)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWindwallTotem_25577)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireNovaTotem_25546)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireNovaTotem_25547)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMagmaTotem_25552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSearingTotem_25533)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStoneclawTotem_25525)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHealingStreamTotem_25567)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaSpringTotem_25570)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEarthShield_974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEarthShield_974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshEarthShield_974)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWaterShield_24398)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownWaterShield_24398)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRefreshWaterShield_24398)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShamanisticRage_30823)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShamanisticRage_30823)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBloodlust_2825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBloodlust_2825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHeroism_32182)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownHeroism_32182)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTotemOfWrath_30706)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundWrathOfAirTotem_3738)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEarthElementalTotem_2062)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireElementalTotem_2894)
end

function me.TestSoundFireResistanceTotem_25563()
  mod.testHelper.TestSoundSuccess("TestSoundFireResistanceTotem_25563", testCategory, 25563)
end

function me.TestSoundFrostResistanceTotem_25560()
  mod.testHelper.TestSoundSuccess("TestSoundFrostResistanceTotem_25560", testCategory, 25560)
end

function me.TestSoundNatureResistanceTotem_25574()
  mod.testHelper.TestSoundSuccess("TestSoundNatureResistanceTotem_25574", testCategory, 25574)
end

function me.TestSoundFlametongueTotem_25557()
  mod.testHelper.TestSoundSuccess("TestSoundFlametongueTotem_25557", testCategory, 25557)
end

function me.TestSoundStoneskinTotem_25508()
  mod.testHelper.TestSoundSuccess("TestSoundStoneskinTotem_25508", testCategory, 25508)
end

function me.TestSoundStoneskinTotem_25509()
  mod.testHelper.TestSoundSuccess("TestSoundStoneskinTotem_25509", testCategory, 25509)
end

function me.TestSoundStrengthOfEarthTotem_25528()
  mod.testHelper.TestSoundSuccess("TestSoundStrengthOfEarthTotem_25528", testCategory, 25528)
end

function me.TestSoundWindfuryTotem_25585()
  mod.testHelper.TestSoundSuccess("TestSoundWindfuryTotem_25585", testCategory, 25585)
end

function me.TestSoundWindfuryTotem_25587()
  mod.testHelper.TestSoundSuccess("TestSoundWindfuryTotem_25587", testCategory, 25587)
end

function me.TestSoundWindwallTotem_25577()
  mod.testHelper.TestSoundSuccess("TestSoundWindwallTotem_25577", testCategory, 25577)
end

function me.TestSoundFireNovaTotem_25546()
  mod.testHelper.TestSoundSuccess("TestSoundFireNovaTotem_25546", testCategory, 25546)
end

function me.TestSoundFireNovaTotem_25547()
  mod.testHelper.TestSoundSuccess("TestSoundFireNovaTotem_25547", testCategory, 25547)
end

function me.TestSoundMagmaTotem_25552()
  mod.testHelper.TestSoundSuccess("TestSoundMagmaTotem_25552", testCategory, 25552)
end

function me.TestSoundSearingTotem_25533()
  mod.testHelper.TestSoundSuccess("TestSoundSearingTotem_25533", testCategory, 25533)
end

function me.TestSoundStoneclawTotem_25525()
  mod.testHelper.TestSoundSuccess("TestSoundStoneclawTotem_25525", testCategory, 25525)
end

function me.TestSoundHealingStreamTotem_25567()
  mod.testHelper.TestSoundSuccess("TestSoundHealingStreamTotem_25567", testCategory, 25567)
end

function me.TestSoundManaSpringTotem_25570()
  mod.testHelper.TestSoundSuccess("TestSoundManaSpringTotem_25570", testCategory, 25570)
end

function me.TestSoundEarthShield_974()
  mod.testHelper.TestSoundApplied(
    "TestSoundEarthShield_974",
    testCategory,
    974
  )
end

function me.TestSoundDownEarthShield_974()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEarthShield_974",
    testCategory,
    974
  )
end

function me.TestSoundRefreshEarthShield_974()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshEarthShield_974",
    testCategory,
    974
  )
end

function me.TestSoundWaterShield_24398()
  mod.testHelper.TestSoundApplied(
    "TestSoundWaterShield_24398",
    testCategory,
    24398
  )
end

function me.TestSoundDownWaterShield_24398()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownWaterShield_24398",
    testCategory,
    24398
  )
end

function me.TestSoundRefreshWaterShield_24398()
  mod.testHelper.TestSoundRefresh(
    "TestSoundRefreshWaterShield_24398",
    testCategory,
    24398
  )
end

function me.TestSoundShamanisticRage_30823()
  mod.testHelper.TestSoundApplied(
    "TestSoundShamanisticRage_30823",
    testCategory,
    30823
  )
end

function me.TestSoundDownShamanisticRage_30823()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShamanisticRage_30823",
    testCategory,
    30823
  )
end

function me.TestSoundBloodlust_2825()
  mod.testHelper.TestSoundApplied(
    "TestSoundBloodlust_2825",
    testCategory,
    2825
  )
end

function me.TestSoundDownBloodlust_2825()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBloodlust_2825",
    testCategory,
    2825
  )
end

function me.TestSoundHeroism_32182()
  mod.testHelper.TestSoundApplied(
    "TestSoundHeroism_32182",
    testCategory,
    32182
  )
end

function me.TestSoundDownHeroism_32182()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownHeroism_32182",
    testCategory,
    32182
  )
end

function me.TestSoundTotemOfWrath_30706()
  mod.testHelper.TestSoundSuccess(
    "TestSoundTotemOfWrath_30706",
    testCategory,
    30706
  )
end

function me.TestSoundWrathOfAirTotem_3738()
  mod.testHelper.TestSoundSuccess(
    "TestSoundWrathOfAirTotem_3738",
    testCategory,
    3738
  )
end

function me.TestSoundEarthElementalTotem_2062()
  mod.testHelper.TestSoundSuccess(
    "TestSoundEarthElementalTotem_2062",
    testCategory,
    2062
  )
end

function me.TestSoundFireElementalTotem_2894()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFireElementalTotem_2894",
    testCategory,
    2894
  )
end
