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
mod.testCombatEventsWarriorEn = me

me.tag = "TestCombatEventsWarriorEn"

local testGroupName = "CombatEventsWarriorEn"
local testCategory = "warrior"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkerRageApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkerRageRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRecklessnessApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRecklessnessRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDeathWishApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDeathWishRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBattleStanceApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkerStanceApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDefensiveStanceApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInterceptSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDisarmSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventConcussionBlowSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBloodrageApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBloodrageRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPummelSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventChargeSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIntimidatingShoutSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldBlockApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldBlockRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldSlamSuccess)

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.TestCombatEventBerserkerRageApplied()
  local testName = "TestCombatEventBerserkerRageApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Berserker Rage"
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

function me.TestCombatEventBerserkerRageRemoved()
  local testName = "TestCombatEventBerserkerRageRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Berserker Rage"
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

function me.TestCombatEventRecklessnessApplied()
  local testName = "TestCombatEventRecklessnessApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Recklessness"
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

function me.TestCombatEventRecklessnessRemoved()
  local testName = "TestCombatEventRecklessnessRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Recklessness"
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

function me.TestCombatEventDeathWishApplied()
  local testName = "TestCombatEventDeathWishApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Death Wish"
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

function me.TestCombatEventDeathWishRemoved()
  local testName = "TestCombatEventDeathWishRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Death Wish"
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

function me.TestCombatEventBattleStanceApplied()
  local testName = "TestCombatEventBattleStanceApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Battle Stance"
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

function me.TestCombatEventBerserkerStanceApplied()
  local testName = "TestCombatEventBerserkerStanceApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Berserker Stance"
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

function me.TestCombatEventDefensiveStanceApplied()
  local testName = "TestCombatEventDefensiveStanceApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Defensive Stance"
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

function me.TestCombatEventInterceptSuccess()
  local testName = "TestCombatEventInterceptSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Intercept"
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

function me.TestCombatEventDisarmSuccess()
  local testName = "TestCombatEventDisarmSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Disarm"
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

function me.TestCombatEventConcussionBlowSuccess()
  local testName = "TestCombatEventConcussionBlowSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Concussion Blow"
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

function me.TestCombatEventBloodrageApplied()
  local testName = "TestCombatEventBloodrageApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Bloodrage"
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

function me.TestCombatEventBloodrageRemoved()
  local testName = "TestCombatEventBloodrageRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Bloodrage"
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

function me.TestCombatEventPummelSuccess()
  local testName = "TestCombatEventPummelSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Pummel"
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

function me.TestCombatEventChargeSuccess()
  local testName = "TestCombatEventChargeSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Charge"
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

function me.TestCombatEventIntimidatingShoutSuccess()
  local testName = "TestCombatEventIntimidatingShoutSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Intimidating Shout"
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

function me.TestCombatEventShieldBlockApplied()
  local testName = "TestCombatEventShieldBlockApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Shield Block"
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

function me.TestCombatEventShieldBlockRemoved()
  local testName = "TestCombatEventShieldBlockRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Shield Block"
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

function me.TestCombatEventShieldSlamSuccess()
  local testName = "TestCombatEventShieldSlamSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Shield Slam"
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
