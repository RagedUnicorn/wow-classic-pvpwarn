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
mod.testSoundPriestEn = me

me.tag = "TestSoundPriestEn"

local testGroupName = "SoundPriestEn"
local testCategory = "priest"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPsychicScream)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSilence)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPowerInfusion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownPowerInfusion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundInnerFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownInnerFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVampiricEmbrace)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDevouringPlague)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundTouchOfWeakness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownTouchOfWeakness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFearWard)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFearWard)

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.TestSoundPsychicScream()
  local testName = "TestSoundPsychicScream"
  local spellName = "Psychic Scream"
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

function me.TestSoundSilence()
  local testName = "TestSoundSilence"
  local spellName = "Silence"
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

function me.TestSoundPowerInfusion()
  local testName = "TestSoundPowerInfusion"
  local spellName = "Power Infusion"
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

function me.TestSoundDownPowerInfusion()
  local testName = "TestSoundDownPowerInfusion"
  local spellName = "Power Infusion"
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

function me.TestSoundInnerFire()
  local testName = "TestSoundInnerFire"
  local spellName = "Inner Fire"
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

function me.TestSoundDownInnerFire()
  local testName = "TestSoundDownInnerFire"
  local spellName = "Inner Fire"
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

function me.TestSoundVampiricEmbrace()
  local testName = "TestSoundVampiricEmbrace"
  local spellName = "Vampiric Embrace"
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

function me.TestSoundDevouringPlague()
  local testName = "TestSoundDevouringPlague"
  local spellName = "Devouring Plague"
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

function me.TestSoundTouchOfWeakness()
  local testName = "TestSoundTouchOfWeakness"
  local spellName = "Touch of Weakness"
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

function me.TestSoundDownTouchOfWeakness()
  local testName = "TestSoundDownTouchOfWeakness"
  local spellName = "Touch of Weakness"
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

function me.TestSoundFearWard()
  local testName = "TestSoundFearWard"
  local spellName = "Fear Ward"
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

function me.TestSoundDownFearWard()
  local testName = "TestSoundDownFearWard"
  local spellName = "Fear Ward"
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
