--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

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

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIceBlock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIceBlock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPolymorph)
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

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.TestSoundIceBlock()
  local testName = "TestSoundIceBlock"
  local spellName = "Ice Block"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundDownIceBlock()
  local testName = "TestSoundDownIceBlock"
  local spellName = "Ice Block"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundPolymorph()
  local testName = "TestSoundPolymorph"
  local spellName = "Polymorph"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundBlink()
  local testName = "TestSoundBlink"
  local spellName = "Blink"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundFireWard()
  local testName = "TestSoundFireWard"
  local spellName = "Fire Ward"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundDownFireWard()
  local testName = "TestSoundDownFireWard"
  local spellName = "Fire Ward"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundFrostWard()
  local testName = "TestSoundFrostWard"
  local spellName = "Frost Ward"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundDownFrostWard()
  local testName = "TestSoundDownFrostWard"
  local spellName = "Frost Ward"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundCounterspell()
  local testName = "TestSoundCounterspell"
  local spellName = "Counterspell"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundManaShield()
  local testName = "TestSoundManaShield"
  local spellName = "Mana Shield"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundDownManaShield()
  local testName = "TestSoundDownManaShield"
  local spellName = "Mana Shield"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundIceBarrier()
  local testName = "TestSoundIceBarrier"
  local spellName = "Ice Barrier"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundDownIceBarrier()
  local testName = "TestSoundDownIceBarrier"
  local spellName = "Ice Barrier"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundFrostNova()
  local testName = "TestSoundFrostNova"
  local spellName = "Frost Nova"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundArcanePower()
  local testName = "TestSoundArcanePower"
  local spellName = "Arcane Power"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundDownArcanePower()
  local testName = "TestSoundDownArcanePower"
  local spellName = "Arcane Power"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundEvocation()
  local testName = "TestSoundEvocation"
  local spellName = "Evocation"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundPresenceOfMind()
  local testName = "TestSoundPresenceOfMind"
  local spellName = "Presence of Mind"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundDownPresenceOfMind()
  local testName = "TestSoundDownPresenceOfMind"
  local spellName = "Presence of Mind"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundCombustion()
  local testName = "TestSoundCombustion"
  local spellName = "Combustion"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundDownCombustion()
  local testName = "TestSoundDownCombustion"
  local spellName = "Combustion"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundBlastWave()
  local testName = "TestSoundBlastWave"
  local spellName = "Blast Wave"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end
