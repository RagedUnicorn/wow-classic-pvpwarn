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
mod.testSoundRogueEn = me

me.tag = "TestSoundRogueEn"

local testGroupName = "SoundRogueEn"
local testCategory = "rogue"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKick)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlind)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSprint)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSprint)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEvasion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEvasion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKidneyShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCheapShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAdrenalineRush)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAdrenalineRush)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBladeFlurry)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBladeFlurry)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundColdBlood)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownColdBlood)

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.TestSoundBlind()
  local testName = "TestSoundBlind"
  local spellName = "Blind"
  local _, spellData = mod.spellMap.SearchByName(spellName, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED)

  mod.testReporter.StartTestRun(testName)

  local status = mod.sound.PlaySound(
    testCategory,
    RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED,
    spellData.soundFileName
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(mod.testHelper.unableToPlay)
  end
end

function me.TestSoundKick()
  local testName = "TestSoundKick"
  local spellName = "Kick"
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

function me.TestSoundSprint()
  local testName = "TestSoundSprint"
  local spellName = "Sprint"
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

function me.TestSoundDownSprint()
  local testName = "TestSoundDownSprint"
  local spellName = "Sprint"
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

function me.TestSoundEvasion()
  local testName = "TestSoundEvasion"
  local spellName = "Evasion"
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

function me.TestSoundDownEvasion()
  local testName = "TestSoundDownEvasion"
  local spellName = "Evasion"
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

function me.TestSoundKidneyShot()
  local testName = "TestSoundKidneyShot"
  local spellName = "Kidney Shot"
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

function me.TestSoundCheapShot()
  local testName = "TestSoundCheapShot"
  local spellName = "Cheap Shot"
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

function me.TestSoundAdrenalineRush()
  local testName = "TestSoundAdrenalineRush"
  local spellName = "Adrenaline Rush"
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

function me.TestSoundDownAdrenalineRush()
  local testName = "TestSoundDownAdrenalineRush"
  local spellName = "Adrenaline Rush"
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

function me.TestSoundBladeFlurry()
  local testName = "TestSoundBladeFlurry"
  local spellName = "Blade Flurry"
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

function me.TestSoundDownBladeFlurry()
  local testName = "TestSoundDownBladeFlurry"
  local spellName = "Blade Flurry"
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

function me.TestSoundColdBlood()
  local testName = "TestSoundColdBlood"
  local spellName = "Cold Blood"
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

function me.TestSoundDownColdBlood()
  local testName = "TestSoundDownColdBlood"
  local spellName = "Cold Blood"
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
