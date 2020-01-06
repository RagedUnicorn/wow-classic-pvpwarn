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
mod.testCombatEventsMageEn = me

me.tag = "TestCombatEventsMageEn"

local testGroupName = "CombatEventsMageEn"
local testCategory = "mage"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBlockApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBlockRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPolymorphSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlinkSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireWardApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFireWardRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostWardApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostWardRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCounterspellSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventManaShieldRefresh)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBarrierApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBarrierRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIceBarrierRefresh)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFrostNovaSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventArcanePowerApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventArcanePowerRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEvocationSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPresenceOfMindApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPresenceOfMindRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCombustionApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCombustionRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlastWaveSuccess)

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.TestCombatEventIceBlockApplied()
  local testName = "TestCombatEventIceBlockApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Ice Block"
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

function me.TestCombatEventIceBlockRemoved()
  local testName = "TestCombatEventIceBlockRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Ice Block"
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

function me.TestCombatEventPolymorphSuccess()
  local testName = "TestCombatEventPolymorphSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Polymorph"
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

function me.TestCombatEventBlinkSuccess()
  local testName = "TestCombatEventBlinkSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Blink"
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

function me.TestCombatEventFireWardApplied()
  local testName = "TestCombatEventFireWardApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Fire Ward"
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

function me.TestCombatEventFireWardRemoved()
  local testName = "TestCombatEventFireWardRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Fire Ward"
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

function me.TestCombatEventFrostWardApplied()
  local testName = "TestCombatEventFrostWardApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Frost Ward"
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

function me.TestCombatEventFrostWardRemoved()
  local testName = "TestCombatEventFrostWardRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Frost Ward"
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

function me.TestCombatEventCounterspellSuccess()
  local testName = "TestCombatEventCounterspellSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Counterspell"
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

function me.TestCombatEventManaShieldApplied()
  local testName = "TestCombatEventManaShieldApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Mana Shield"
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

function me.TestCombatEventManaShieldRemoved()
  local testName = "TestCombatEventManaShieldRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Mana Shield"
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

function me.TestCombatEventManaShieldRefresh()
  local testName = "TestCombatEventManaShieldRefresh"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REFRESH
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Mana Shield"
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

function me.TestCombatEventIceBarrierApplied()
  local testName = "TestCombatEventIceBarrierApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Ice Barrier"
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

function me.TestCombatEventIceBarrierRemoved()
  local testName = "TestCombatEventIceBarrierRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Ice Barrier"
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

function me.TestCombatEventIceBarrierRefresh()
  local testName = "TestCombatEventIceBarrierRefresh"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REFRESH
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Ice Barrier"
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

function me.TestCombatEventFrostNovaSuccess()
  local testName = "TestCombatEventFrostNovaSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Frost Nova"
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

function me.TestCombatEventArcanePowerApplied()
  local testName = "TestCombatEventArcanePowerApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Arcane Power"
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

function me.TestCombatEventArcanePowerRemoved()
  local testName = "TestCombatEventArcanePowerRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Arcane Power"
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

function me.TestCombatEventEvocationSuccess()
  local testName = "TestCombatEventEvocationSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Evocation"
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

function me.TestCombatEventPresenceOfMindApplied()
  local testName = "TestCombatEventPresenceOfMindApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Presence of Mind"
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

function me.TestCombatEventPresenceOfMindRemoved()
  local testName = "TestCombatEventPresenceOfMindRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Presence of Mind"
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

function me.TestCombatEventCombustionApplied()
  local testName = "TestCombatEventCombustionApplied"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Combustion"
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

function me.TestCombatEventCombustionRemoved()
  local testName = "TestCombatEventCombustionRemoved"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Combustion"
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

function me.TestCombatEventBlastWaveSuccess()
  local testName = "TestCombatEventBlastWaveSuccess"
  mod.testReporter.StartTestRun(testName)

  local event = RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "BlastWave"
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
