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
mod.testSoundWarriorEn = me

me.tag = "TestSoundWarriorEn"

local testGroupName = "SoundWarriorEn"
local testCategory = "warrior"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserkerRage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserkerRage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRecklessness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRecklessness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDeathWish)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDeathWish)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBattleStance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserkerStance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDefensiveStance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntercept)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDisarm)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundConcussionBlow)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBloodrage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBloodrage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPummel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCharge)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntimidatingShout)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldBlock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShieldBlock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldSlam)

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.TestSoundBerserkerRage()
  local testName = "TestSoundBerserkerRage"
  local spellName = "Berserker Rage"
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

function me.TestSoundDownBerserkerRage()
  local testName = "TestSoundDownBerserkerRage"
  local spellName = "Berserker Rage"
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

function me.TestSoundRecklessness()
  local testName = "TestSoundRecklessness"
  local spellName = "Recklessness"
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

function me.TestSoundDownRecklessness()
  local testName = "TestSoundDownRecklessness"
  local spellName = "Recklessness"
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

function me.TestSoundDeathWish()
  local testName = "TestSoundDeathWish"
  local spellName = "Death Wish"
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

function me.TestSoundDownDeathWish()
  local testName = "TestSoundDownDeathWish"
  local spellName = "Death Wish"
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

function me.TestSoundBattleStance()
  local testName = "TestSoundBattleStance"
  local spellName = "Battle Stance"
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

function me.TestSoundBerserkerStance()
  local testName = "TestSoundBerserkerStance"
  local spellName = "Berserker Stance"
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

function me.TestSoundDefensiveStance()
  local testName = "TestSoundDefensiveStance"
  local spellName = "Defensive Stance"
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

function me.TestSoundIntercept()
  local testName = "TestSoundIntercept"
  local spellName = "Intercept"
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

function me.TestSoundDisarm()
  local testName = "TestSoundDisarm"
  local spellName = "Disarm"
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

function me.TestSoundConcussionBlow()
  local testName = "TestSoundConcussionBlow"
  local spellName = "Concussion Blow"
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

function me.TestSoundBloodrage()
  local testName = "TestSoundBloodrage"
  local spellName = "Bloodrage"
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

function me.TestSoundDownBloodrage()
  local testName = "TestSoundDownBloodrage"
  local spellName = "Bloodrage"
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

function me.TestSoundPummel()
  local testName = "TestSoundPummel"
  local spellName = "Pummel"
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

function me.TestSoundCharge()
  local testName = "TestSoundCharge"
  local spellName = "Charge"
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

function me.TestSoundIntimidatingShout()
  local testName = "TestSoundIntimidatingShout"
  local spellName = "Intimidating Shout"
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

function me.TestSoundShieldBlock()
  local testName = "TestSoundShieldBlock"
  local spellName = "Shield Block"
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

function me.TestSoundDownShieldBlock()
  local testName = "TestSoundDownShieldBlock"
  local spellName = "Shield Block"
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

function me.TestSoundShieldSlam()
  local testName = "TestSoundShieldSlam"
  local spellName = "Shield Slam"
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
