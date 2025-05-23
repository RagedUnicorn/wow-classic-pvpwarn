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
mod.testSoundWarlockEn = me

me.tag = "TestSoundWarlockEn"

local testGroupName = "SoundWarlockEn"
local testCategory = "warlock"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFear)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowburn)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowWard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShadowWard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHowlOfTerror)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDeathCoil)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAmplifyCurse)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAmplifyCurse)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSpellLock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSoulLink)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSoulLink)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFelDomination)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFelDomination)
  -- runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDemonicGrace)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDemonicGrace)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundHaunt)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVengeance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownVengeance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmolationAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownImmolationAura)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundUnstableAffliction)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBackdraft)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBackdraft)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInfernalArmor)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInfernalArmor)
end

function me.TestSoundFear()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFear",
    testCategory,
    "Fear"
  )
end

function me.TestSoundShadowburn()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowburn",
    testCategory,
    "Shadowburn"
  )
end

function me.TestSoundShadowWard()
  mod.testHelper.TestSoundApplied(
    "TestSoundShadowWard",
    testCategory,
    "Shadow Ward"
  )
end

function me.TestSoundDownShadowWard()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShadowWard",
    testCategory,
    "Shadow Ward"
  )
end

function me.TestSoundHowlOfTerror()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHowlOfTerror",
    testCategory,
    "Howl of Terror"
  )
end

function me.TestSoundDeathCoil()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDeathCoil",
    testCategory,
    "Death Coil"
  )
end

function me.TestSoundAmplifyCurse()
  mod.testHelper.TestSoundApplied(
    "TestSoundAmplifyCurse",
    testCategory,
    "Amplify Curse"
  )
end

function me.TestSoundDownAmplifyCurse()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAmplifyCurse",
    testCategory,
    "Amplify Curse"
  )
end

function me.TestSoundSpellLock()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSpellLock",
    testCategory,
    "Spell Lock"
  )
end

function me.TestSoundSoulLink()
  mod.testHelper.TestSoundApplied(
    "TestSoundSoulLink",
    testCategory,
    "Soul Link"
  )
end

function me.TestSoundDownSoulLink()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSoulLink",
    testCategory,
    "Soul Link"
  )
end

function me.TestSoundFelDomination()
  mod.testHelper.TestSoundApplied(
    "TestSoundFelDomination",
    testCategory,
    "Fel Domination"
  )
end

function me.TestSoundDownFelDomination()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFelDomination",
    testCategory,
    "Fel Domination"
  )
end

function me.TestSoundDemonicGrace()
  mod.testHelper.TestSoundApplied(
    "TestSoundDemonicGrace",
    testCategory,
    "Demonic Grace"
  )
end

function me.TestSoundDownDemonicGrace()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDemonicGrace",
    testCategory,
    "Demonic Grace"
  )
end

function me.TestSoundHaunt()
  mod.testHelper.TestSoundSuccess(
    "TestSoundHaunt",
    testCategory,
    "Haunt"
  )
end

function me.TestSoundVengeance()
  mod.testHelper.TestSoundApplied(
    "TestSoundVengeance",
    testCategory,
    "Vengeance"
  )
end

function me.TestSoundDownVengeance()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownVengeance",
    testCategory,
    "Vengeance"
  )
end

function me.TestSoundImmolationAura()
  mod.testHelper.TestSoundApplied(
    "TestSoundImmolationAura",
    testCategory,
    "Immolation Aura"
  )
end

function me.TestSoundDownImmolationAura()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownImmolationAura",
    testCategory,
    "Immolation Aura"
  )
end

function me.TestSoundUnstableAffliction()
  mod.testHelper.TestSoundSuccess(
    "TestSoundUnstableAffliction",
    testCategory,
    "Unstable Affliction"
  )
end

function me.TestSoundBackdraft()
  mod.testHelper.TestSoundApplied(
    "TestSoundBackdraft",
    testCategory,
    "Backdraft"
  )
end

function me.TestSoundDownBackdraft()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBackdraft",
    testCategory,
    "Backdraft"
  )
end

function me.TestSoundInfernalArmor()
  mod.testHelper.TestSoundApplied(
    "TestSoundInfernalArmor",
    testCategory,
    "Infernal Armor"
  )
end

function me.TestSoundDownInfernalArmor()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownInfernalArmor",
    testCategory,
    "Infernal Armor"
  )
end
