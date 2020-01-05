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
mod.testCombatEventsPriestEn = me

me.tag = "TestCombatEventsPriestEn"

local testGroupName = "CombatEventsPriestEn"
local testCategory = "priest"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPsychicScreamSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSilenceSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPowerInfusionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPowerInfusionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPowerInfusionRefresh)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInnerFireApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInnerFireRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInnerFireRefresh)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventVampiricEmbraceApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventVampiricEmbraceRefresh)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDevouringPlagueSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTouchOfWeaknessApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTouchOfWeaknessRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventTouchOfWeaknessRefresh)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFearWardApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFearWardRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFearWardRefresh)

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.TestCombatEventPsychicScreamSuccess()
  local testName = "TestCombatEventPsychicScreamSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Psychic Scream"
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

function me.TestCombatEventSilenceSuccess()
  local testName = "TestCombatEventSilenceSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Silence"
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

function me.TestCombatEventPowerInfusionApplied()
  local testName = "TestCombatEventPowerInfusionApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Power Infusion"
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

function me.TestCombatEventPowerInfusionRemoved()
  local testName = "TestCombatEventPowerInfusionRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Power Infusion"
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

function me.TestCombatEventPowerInfusionRefresh()
  local testName = "TestCombatEventPowerInfusionRefresh"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REFRESH
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Power Infusion"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH, spellType)
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

function me.TestCombatEventInnerFireApplied()
  local testName = "TestCombatEventInnerFireApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Inner Fire"
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

function me.TestCombatEventInnerFireRemoved()
  local testName = "TestCombatEventInnerFireRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Inner Fire"
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

function me.TestCombatEventInnerFireRefresh()
  local testName = "TestCombatEventInnerFireRefresh"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REFRESH
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Inner Fire"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH, spellType)
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

function me.TestCombatEventVampiricEmbraceApplied()
  local testName = "TestCombatEventVampiricEmbraceApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Vampiric Embrace"
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

function me.TestCombatEventVampiricEmbraceRefresh()
  local testName = "TestCombatEventVampiricEmbraceRefresh"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REFRESH
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Vampiric Embrace"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH, spellType)
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

function me.TestCombatEventDevouringPlagueSuccess()
  local testName = "TestCombatEventDevouringPlagueSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Devouring Plague"
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

function me.TestCombatEventTouchOfWeaknessApplied()
  local testName = "TestCombatEventTouchOfWeaknessApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Touch of Weakness"
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

function me.TestCombatEventTouchOfWeaknessRemoved()
  local testName = "TestCombatEventTouchOfWeaknessRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Touch of Weakness"
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

function me.TestCombatEventTouchOfWeaknessRefresh()
  local testName = "TestCombatEventTouchOfWeaknessRefresh"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REFRESH
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Touch of Weakness"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH, spellType)
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

function me.TestCombatEventFearWardApplied()
  local testName = "TestCombatEventFearWardApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Fear Ward"
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

function me.TestCombatEventFearWardRemoved()
  local testName = "TestCombatEventFearWardRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Fear Ward"
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

function me.TestCombatEventFearWardRefresh()
  local testName = "TestCombatEventFearWardRefresh"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REFRESH
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Fear Ward"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH, spellType)
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
