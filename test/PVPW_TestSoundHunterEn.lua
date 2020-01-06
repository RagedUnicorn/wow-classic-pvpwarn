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
mod.testSoundHunterEn = me

me.tag = "TestSoundHunterEn"

local testGroupName = "SoundHunterEn"
local testCategory = "hunter"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundConcussiveShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheMonkey)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAspectOfTheHawk)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRapidFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRapidFire)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundExplosiveTrap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFreezingTrap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundImmolationTrap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFrostTrap)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundViperString)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundScatterShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFlare)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntimidation)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownIntimidation)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBestialWrath)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBestialWrath)

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.TestSoundConcussiveShot()
  local testName = "TestSoundConcussiveShot"
  local spellName = "Concussive Shot"
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

function me.TestSoundAspectOfTheMonkey()
  local testName = "TestSoundAspectOfTheMonkey"
  local spellName = "Aspect of the Monkey"
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

function me.TestSoundAspectOfTheHawk()
  local testName = "TestSoundAspectOfTheHawk"
  local spellName = "Aspect of the Hawk"
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

function me.TestSoundRapidFire()
  local testName = "TestSoundRapidFire"
  local spellName = "Rapid Fire"
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

function me.TestSoundDownRapidFire()
  local testName = "TestSoundDownRapidFire"
  local spellName = "Rapid Fire"
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

function me.TestSoundExplosiveTrap()
  local testName = "TestSoundExplosiveTrap"
  local spellName = "Explosive Trap"
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

function me.TestSoundFreezingTrap()
  local testName = "TestSoundFreezingTrap"
  local spellName = "Freezing Trap"
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

function me.TestSoundImmolationTrap()
  local testName = "TestSoundImmolationTrap"
  local spellName = "Immolation Trap"
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

function me.TestSoundFrostTrap()
  local testName = "TestSoundFrostTrap"
  local spellName = "Frost Trap"
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

function me.TestSoundViperString()
  local testName = "TestSoundViperString"
  local spellName = "Viper Sting"
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

function me.TestSoundScatterShot()
  local testName = "TestSoundScatterShot"
  local spellName = "Scatter Shot"
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

function me.TestSoundFlare()
  local testName = "TestSoundFlare"
  local spellName = "Flare"
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

function me.TestSoundIntimidation()
  local testName = "TestSoundIntimidation"
  local spellName = "Intimidation"
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

function me.TestSoundDownIntimidation()
  local testName = "TestSoundDownIntimidation"
  local spellName = "Intimidation"
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

function me.TestSoundBestialWrath()
  local testName = "TestSoundBestialWrath"
  local spellName = "Bestial Wrath"
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

function me.TestSoundDownBestialWrath()
  local testName = "TestSoundDownBestialWrath"
  local spellName = "Bestial Wrath"
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
