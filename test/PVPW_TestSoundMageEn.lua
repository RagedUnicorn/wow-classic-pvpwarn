--[[
  MIT License

  Copyright (c) 2022 Michael Wiesendanger

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
mod.testSoundMageEn = me

me.tag = "TestSoundMageEn"

local testGroupName = "SoundMageEn"
local testCategory = "mage"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIceBlock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIceBlock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPolymorph)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStartPolymorph)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlink)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFireWard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFireWard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostWard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFrostWard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCounterspell)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundManaShield)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownManaShield)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIceBarrier)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIceBarrier)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostNova)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundArcanePower)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownArcanePower)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEvocation)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPresenceOfMind)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownPresenceOfMind)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCombustion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownCombustion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlastWave)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundColdSnap)
end

function me.TestSoundIceBlock()
  mod.testHelper.TestSoundApplied(
    "TestSoundIceBlock",
    testCategory,
    "Ice Block"
  )
end

function me.TestSoundDownIceBlock()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownIceBlock",
    testCategory,
    "Ice Block"
  )
end

function me.TestSoundPolymorph()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPolymorph",
    testCategory,
    "Polymorph"
  )
end

function me.TestSoundStartPolymorph()
  mod.testHelper.TestSoundStart(
    "TestSoundStartPolymorph",
    testCategory,
    "Polymorph"
  )
end

function me.TestSoundBlink()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBlink",
    testCategory,
    "Blink"
  )
end

function me.TestSoundFireWard()
  mod.testHelper.TestSoundApplied(
    "TestSoundFireWard",
    testCategory,
    "Fire Ward"
  )
end

function me.TestSoundDownFireWard()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFireWard",
    testCategory,
    "Fire Ward"
  )
end

function me.TestSoundFrostWard()
  mod.testHelper.TestSoundApplied(
    "TestSoundFrostWard",
    testCategory,
    "Frost Ward"
  )
end

function me.TestSoundDownFrostWard()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFrostWard",
    testCategory,
    "Frost Ward"
  )
end

function me.TestSoundCounterspell()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCounterspell",
    testCategory,
    "Counterspell"
  )
end

function me.TestSoundManaShield()
  mod.testHelper.TestSoundApplied(
    "TestSoundManaShield",
    testCategory,
    "Mana Shield"
  )
end

function me.TestSoundDownManaShield()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownManaShield",
    testCategory,
    "Mana Shield"
  )
end

function me.TestSoundIceBarrier()
  mod.testHelper.TestSoundApplied(
    "TestSoundIceBarrier",
    testCategory,
    "Ice Barrier"
  )
end

function me.TestSoundDownIceBarrier()
  mod.testHelper.TestSoundApplied(
    "TestSoundDownIceBarrier",
    testCategory,
    "Ice Barrier"
  )
end

function me.TestSoundFrostNova()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFrostNova",
    testCategory,
    "Frost Nova"
  )
end

function me.TestSoundArcanePower()
  mod.testHelper.TestSoundApplied(
    "TestSoundArcanePower",
    testCategory,
    "Arcane Power"
  )
end

function me.TestSoundDownArcanePower()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownArcanePower",
    testCategory,
    "Arcane Power"
  )
end

function me.TestSoundEvocation()
  mod.testHelper.TestSoundSuccess(
    "TestSoundEvocation",
    testCategory,
    "Evocation"
  )
end

function me.TestSoundPresenceOfMind()
  mod.testHelper.TestSoundApplied(
    "TestSoundPresenceOfMind",
    testCategory,
    "Presence of Mind"
  )
end

function me.TestSoundDownPresenceOfMind()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownPresenceOfMind",
    testCategory,
    "Presence of Mind"
  )
end

function me.TestSoundCombustion()
  mod.testHelper.TestSoundApplied(
    "TestSoundCombustion",
    testCategory,
    "Combustion"
  )
end

function me.TestSoundDownCombustion()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownCombustion",
    testCategory,
    "Combustion"
  )
end

function me.TestSoundBlastWave()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBlastWave",
    testCategory,
    "Blast Wave"
  )
end

function me.TestSoundColdSnap()
  mod.testHelper.TestSoundSuccess(
    "TestSoundColdSnap",
    testCategory,
    "Cold Snap"
  )
end
