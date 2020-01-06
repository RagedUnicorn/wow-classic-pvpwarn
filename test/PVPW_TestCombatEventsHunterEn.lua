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

-- luacheck: ignore _

local mod = rgpvpw
local me = {}
mod.testCombatEventsHunterEn = me

me.tag = "TestCombatEventsHunterEn"

local testGroupName = "CombatEventsHunterEn"
local testCategory = "hunter"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventConcussiveShotSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAspectOfTheMonkeySuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAspectOfTheHawkSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRapidFireApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRapidFireRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventExplosiveTrapSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFreezingTrapSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventImmolationTrapSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostTrapSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventViperStingSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventScatterShotSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFlareSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInitmidationApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInitmidationRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBestialWrathApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBestialWrathRemoved)


  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.TestCombatEventConcussiveShotSuccess()
  local testName = "TestCombatEventConcussiveShotSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Concussive Shot"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, spellType)
    end

    if not spell then
      failureReason = "Did not get any spell metadata"
    end
  end)
  mod.testHelper.RestoreCombatLogGetCurrentEventInfo()

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

function me.TestCombatEventAspectOfTheMonkeySuccess()
  local testName = "TestCombatEventAspectOfTheMonkeySuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Aspect of the Monkey"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, spellType)
    end

    if not spell then
      failureReason = "Did not get any spell metadata"
    end
  end)
  mod.testHelper.RestoreCombatLogGetCurrentEventInfo()

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

function me.TestCombatEventAspectOfTheHawkSuccess()
  local testName = "TestCombatEventAspectOfTheHawkSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Aspect of the Hawk"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, spellType)
    end

    if not spell then
      failureReason = "Did not get any spell metadata"
    end
  end)
  mod.testHelper.RestoreCombatLogGetCurrentEventInfo()

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

function me.TestCombatEventRapidFireApplied()
  local testName = "TestCombatEventRapidFireApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Rapid Fire"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED, spellType)
    end

    if not spell then
      failureReason = "Did not get any spell metadata"
    end
  end)
  mod.testHelper.RestoreCombatLogGetCurrentEventInfo()

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

function me.TestCombatEventRapidFireRemoved()
  local testName = "TestCombatEventRapidFireRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Rapid Fire"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED, spellType)
    end

    if not spell then
      failureReason = "Did not get any spell metadata"
    end
  end)
  mod.testHelper.RestoreCombatLogGetCurrentEventInfo()

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

function me.TestCombatEventExplosiveTrapSuccess()
  local testName = "TestCombatEventExplosiveTrapSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Explosive Trap"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, spellType)
    end

    if not spell then
      failureReason = "Did not get any spell metadata"
    end
  end)
  mod.testHelper.RestoreCombatLogGetCurrentEventInfo()

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

function me.TestCombatEventFreezingTrapSuccess()
  local testName = "TestCombatEventFreezingTrapSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Freezing Trap"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, spellType)
    end

    if not spell then
      failureReason = "Did not get any spell metadata"
    end
  end)
  mod.testHelper.RestoreCombatLogGetCurrentEventInfo()

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

function me.TestCombatEventImmolationTrapSuccess()
  local testName = "TestCombatEventImmolationTrapSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Immolation Trap"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, spellType)
    end

    if not spell then
      failureReason = "Did not get any spell metadata"
    end
  end)
  mod.testHelper.RestoreCombatLogGetCurrentEventInfo()

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

function me.TestCombatEventFrostTrapSuccess()
  local testName = "TestCombatEventFrostTrapSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Frost Trap"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, spellType)
    end

    if not spell then
      failureReason = "Did not get any spell metadata"
    end
  end)
  mod.testHelper.RestoreCombatLogGetCurrentEventInfo()

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

function me.TestCombatEventViperStingSuccess()
  local testName = "TestCombatEventViperStingSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Viper Sting"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, spellType)
    end

    if not spell then
      failureReason = "Did not get any spell metadata"
    end
  end)
  mod.testHelper.RestoreCombatLogGetCurrentEventInfo()

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

function me.TestCombatEventScatterShotSuccess()
  local testName = "TestCombatEventScatterShotSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Scatter Shot"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, spellType)
    end

    if not spell then
      failureReason = "Did not get any spell metadata"
    end
  end)
  mod.testHelper.RestoreCombatLogGetCurrentEventInfo()

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

function me.TestCombatEventFlareSuccess()
  local testName = "TestCombatEventFlareSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Flare"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, spellType)
    end

    if not spell then
      failureReason = "Did not get any spell metadata"
    end
  end)
  mod.testHelper.RestoreCombatLogGetCurrentEventInfo()

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end


function me.TestCombatEventInitmidationApplied()
  local testName = "TestCombatEventInitmidationApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Intimidation"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED, spellType)
    end

    if not spell then
      failureReason = "Did not get any spell metadata"
    end
  end)
  mod.testHelper.RestoreCombatLogGetCurrentEventInfo()

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

function me.TestCombatEventInitmidationRemoved()
  local testName = "TestCombatEventInitmidationRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Intimidation"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED, spellType)
    end

    if not spell then
      failureReason = "Did not get any spell metadata"
    end
  end)
  mod.testHelper.RestoreCombatLogGetCurrentEventInfo()

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end


function me.TestCombatEventBestialWrathApplied()
  local testName = "TestCombatEventBestialWrathApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Bestial Wrath"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED, spellType)
    end

    if not spell then
      failureReason = "Did not get any spell metadata"
    end
  end)
  mod.testHelper.RestoreCombatLogGetCurrentEventInfo()

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

function me.TestCombatEventBestialWrathRemoved()
  local testName = "TestCombatEventBestialWrathRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Bestial Wrath"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED, spellType)
    end

    if not spell then
      failureReason = "Did not get any spell metadata"
    end
  end)
  mod.testHelper.RestoreCombatLogGetCurrentEventInfo()

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end
