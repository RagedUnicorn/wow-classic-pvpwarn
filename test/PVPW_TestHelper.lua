--[[
  MIT License

  Copyright (c) 2025 Michael Wiesendanger

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

-- luacheck: globals CombatLogGetCurrentEventInfo GetLocale COMBATLOG_FILTER_HOSTILE_PLAYERS
-- luacheck: globals COMBATLOG_FILTER_MINE

local mod = rgpvpw
local me = {}
mod.testHelper = me

me.tag = "TestHelper"

local origCombatLogGetCurrentEventInfo = CombatLogGetCurrentEventInfo
local origMaxWarnAge

--[[
 SpellMap mapping for spellAvoidMap or spellMap depending on the spell type
]]--
local spellHelperByType = {
  [RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL] = mod.spellMapHelper,
  [RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED] = mod.spellMapHelper,
  [RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED] = mod.spellMapHelper,
  [RGPVPW_CONSTANTS.SPELL_TYPES.START] = mod.spellMapHelper,
  [RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH] = mod.spellMapHelper,
  [RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF] = mod.spellAvoidMapHelper,
  [RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY] = mod.spellAvoidMapHelper
}

--[[
  Reused failure reasons
]]--
mod.testHelper.unableToPlay = "Unable to play sound"
mod.testHelper.unableToGetMetadata = "Did not get any spell metadata"
mod.testHelper.missingSoundTest = "Did not find a sound test for %s - %s"
mod.testHelper.missingSoundAvoidTest = "Did not find a sound avoid test for %s - %s"
mod.testHelper.missingSoundDownTest = "Did not find a sound down test for %s - %s"
mod.testHelper.invalidEvent = "Invalid event for %s - %s"
mod.testHelper.missingCombatEventTest = "Did not find a combat event test for %s - %s"
mod.testHelper.missingCombatEventAvoidTest = "Did not find a combat avoid event test for %s - %s"

--[[
  Mapp a wow event name to a test function name

  @param {string} event

  return {string | nil}
    string - if a matching event could be found
    nil - if no matching event could be found
]]--
function me.MappEventToName(event)
  local eventMap = {
    ["SPELL_CAST_SUCCESS"] = "Success",
    ["SPELL_CAST_START"] = "Start",
    ["SPELL_AURA_APPLIED"] = "Applied",
    ["SPELL_AURA_REMOVED"] = "Removed",
    ["SPELL_AURA_REFRESH"] = "Refresh"
  }

  return eventMap[event]
end


--[[
  Determines the correct spellMap based on the spellType

  @param {number} spellType
]]
function me.GetSpellMap(spellType)
  if spellType == RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL or
      spellType == RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED or
      spellType == RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED or
      spellType == RGPVPW_CONSTANTS.SPELL_TYPES.START or
      spellType == RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH then
    return RGPVPW_CONSTANTS.SPELL_MAP
  end

  if spellType == RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF or
      spellType == RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY then
    return RGPVPW_CONSTANTS.SPELL_AVOID_MAP
  end

  mod.logger.LogError(me.tag, "Invalid spellType: " .. spellType)
  return nil
end


--[[
  Normalize a spellName so it can be matched against a function name

  @param {string} spellName

  @return {string}
    The normalized spellName
]]--
function me.NormalizeSpellName(spellName)
  local name = ""

  for match in string.gmatch(spellName, "%a+") do
    name = name .. me.FirstToUpper(match)
  end

  return name
end

--[[
  Make first character of a string to uppercase

  @param {string}

  @return {string}
]]--
function me.FirstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

--[[
  Hooks the CombatLogGetCurrentEventInfo function and replaces it with the passed function. Hooking this function
  breaks the complete functionality and should never used with other addons running. The sole purpose is for testing.

  @param {table} functionReplacement
]]--
function me.HookCombatLogGetCurrentEventInfo(functionReplacement)
  mod.logger.LogWarn(me.tag, "Warning hooking 'CombatLogGetCurrentEventInfo' for debugging purposes")

  assert(type(functionReplacement) == "function",
    string.format(
      "bad argument #1 to `HookCombatLogGetCurrentEventInfo` (expected function got %s)", type(functionReplacement)
    )
  )

  CombatLogGetCurrentEventInfo = functionReplacement
end

--[[
  Restores the CombatLogGetCurrentEventInfo function to its normal state
]]--
function me.RestoreCombatLogGetCurrentEventInfo()
  mod.logger.LogInfo(me.tag, "Restoring 'CombatLogGetCurrentEventInfo'")
  CombatLogGetCurrentEventInfo = origCombatLogGetCurrentEventInfo
end

--[[
  Hooks the MAX_WARN_AGE constant and replaces it with a value better fitting for tests
]]--
function me.HookMaxWarnAge()
  mod.logger.LogWarn(me.tag, "Warning hooking 'MAX_WARN_AGE' for debugging purposes")
  origMaxWarnAge = RGPVPW_CONSTANTS.MAX_WARN_AGE
  RGPVPW_CONSTANTS.MAX_WARN_AGE = 20
end

--[[
  Restores the MAX_WARN_AGE constant to its normal state
]]--
function me.RestoreMaxWarnAge()
  mod.logger.LogInfo(me.tag, "Restoring 'CombatLogGetCurrentEventInfo'")
  RGPVPW_CONSTANTS.MAX_WARN_AGE = origMaxWarnAge
end

--[[
  Enable Testing mode to bypass spellConfiguration
]]--
function me.EnableTestMode()
  RGPVPW_ENVIRONMENT.TEST = true
end

--[[
  Disable Testing mode to enforce spellConfiguration
]]--
function me.DisableTestMode()
  RGPVPW_ENVIRONMENT.TEST = false
end

--[[
  @return {string}
]]--
function me.GetGenericPlayerId()
  return "Player-531-0764I8DA"
end

--[[
  @return {string}
]]--
function me.GetGenericPlayerName()
  return "PlayerName"
end

--[[
  @return {string}
]]--
function me.GetGenericEnemyId()
  return "Player-531-0764I8DE"
end

--[[
  @return {string}
]]--
function me.GetGenericEnemyName()
  return "EnemyPlayer"
end

--[[
   @return {number}
]]--
function me.GetEnemyPlayerSourceFlags()
  return COMBATLOG_FILTER_HOSTILE_PLAYERS -- 32078
end

--[[
  @return {number}
]]--
function me.GetSelfPlayerSourceFlags()
  return COMBATLOG_FILTER_MINE -- 17681
end

--[[
  Tests whether a sound can be played for a certain category, spellName and the SPELL_AURA_APPLIED event

  @param {string} testName
  @param {string} testCategory
  @param {number} spellId
]]--
function me.TestSoundApplied(testName, testCategory, spellId)
  assert(type(testName) == "string", string.format(
    "bad argument #1 to `TestSoundApplied` (expected string, got %s)", type(testName)))

  assert(type(testCategory) == "string", string.format(
    "bad argument #2 to `TestSoundApplied` (expected string, got %s)", type(testCategory)))

  assert(type(spellId) == "number", string.format(
    "bad argument #3 to `TestSoundApplied` (expected number, got %s)", type(spellId)))

  mod.testReporter.StartTestRun(testName)

  local status = me.TestSound(
    spellId,
    testCategory,
    RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED,
    RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(testCategory, testName, mod.testHelper.unableToPlay)
  end
end

--[[
  Tests whether a sound can be played for a certain category, spellName and the SPELL_AURA_REMOVED event

  @param {string} testName
  @param {string} testCategory
  @param {number} spellId
]]--
function me.TestSoundRemoved(testName, testCategory, spellId)
  assert(type(testName) == "string", string.format(
    "bad argument #1 to `TestSoundRemoved` (expected string, got %s)", type(testName)))

  assert(type(testCategory) == "string", string.format(
    "bad argument #2 to `TestSoundRemoved` (expected string, got %s)", type(testCategory)))

  assert(type(spellId) == "number", string.format(
    "bad argument #3 to `TestSoundRemoved` (expected number, got %s)", type(spellId)))

  mod.testReporter.StartTestRun(testName)

  local status = me.TestSound(
    spellId,
    testCategory,
    RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED,
    RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(testCategory, testName, mod.testHelper.unableToPlay)
  end
end

--[[
  Tests whether a sound can be played for a certain category, spellName and the SPELL_CAST_SUCCESS event

  @param {string} testName
  @param {string} testCategory
  @param {number} spellId
]]--
function me.TestSoundSuccess(testName, testCategory, spellId)
  assert(type(testName) == "string", string.format(
    "bad argument #1 to `TestSoundSuccess` (expected string, got %s)", type(testName)))

  assert(type(testCategory) == "string", string.format(
    "bad argument #2 to `TestSoundSuccess` (expected string, got %s)", type(testCategory)))

  assert(type(spellId) == "number", string.format(
    "bad argument #3 to `TestSoundSuccess` (expected number, got %s)", type(spellId)))

  mod.testReporter.StartTestRun(testName)

  local status = me.TestSound(
    spellId,
    testCategory,
    RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS,
    RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(testCategory, testName, mod.testHelper.unableToPlay)
  end
end

--[[
  Tests whether a sound can be played for a certain category, spellName and the SPELL_CAST_START event

  @param {string} testName
  @param {string} testCategory
  @param {string} spellName
]]--
function me.TestSoundStart(testName, testCategory, spellName) -- TODO has to be rewritten for spellId
  assert(type(testName) == "string", string.format(
    "bad argument #1 to `TestSoundStart` (expected string, got %s)", type(testName)))

  assert(type(testCategory) == "string", string.format(
    "bad argument #2 to `TestSoundStart` (expected string, got %s)", type(testCategory)))

  assert(type(spellName) == "string", string.format(
    "bad argument #3 to `TestSoundStart` (expected string, got %s)", type(spellName)))

  mod.testReporter.StartTestRun(testName)

  local status = me.TestSound(
    spellName,
    testCategory,
    RGPVPW_CONSTANTS.EVENT_SPELL_CAST_START,
    RGPVPW_CONSTANTS.SPELL_TYPES.START
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(testCategory, testName, mod.testHelper.unableToPlay)
  end
end

--[[
  Tests whether a sound can be played for a certain category, spellName and the SPELL_MISSED event

  @param {string} testName
  @param {string} testCategory
  @param {number} spellId
]]--
function me.TestSoundSpellMissedSelf(testName, testCategory, spellId)
  assert(type(testName) == "string", string.format(
    "bad argument #1 to `TestSoundSpellMissedSelf` (expected string, got %s)", type(testName)))

  assert(type(testCategory) == "string", string.format(
    "bad argument #2 to `TestSoundSpellMissedSelf` (expected string, got %s)", type(testCategory)))

  assert(type(spellId) == "number", string.format(
    "bad argument #3 to `TestSoundSpellMissedSelf` (expected number, got %s)", type(spellId)))

  mod.testReporter.StartTestRun(testName)

  local status = me.TestSound(
    spellId,
    testCategory,
    RGPVPW_CONSTANTS.EVENT_SPELL_MISSED,
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(testCategory, testName, mod.testHelper.unableToPlay)
  end
end

--[[
  Tests whether a sound can be played for a certain category, spellName and the SPELL_MISSED event

  @param {string} testName
  @param {string} testCategory
  @param {number} spellId
]]--
function me.TestSoundSpellMissedEnemy(testName, testCategory, spellId)
  assert(type(testName) == "string", string.format(
    "bad argument #1 to `TestSoundSpellMissedEnemy` (expected string, got %s)", type(testName)))

  assert(type(testCategory) == "string", string.format(
    "bad argument #2 to `TestSoundSpellMissedEnemy` (expected string, got %s)", type(testCategory)))

  assert(type(spellId) == "number", string.format(
    "bad argument #3 to `TestSoundSpellMissedEnemy` (expected number, got %s)", type(spellId)))

  mod.testReporter.StartTestRun(testName)

  local status = me.TestSound(
    spellId,
    testCategory,
    RGPVPW_CONSTANTS.EVENT_SPELL_MISSED,
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY
  )

  if status then
    mod.testReporter.ReportSuccessTestRun()
  else
    mod.testReporter.ReportFailureTestRun(testCategory, testName, mod.testHelper.unableToPlay)
  end
end

--[[
  Play a sound and return whether this was possible or not. This function also
  considers that for certain spellTypes a different spellMap needs to be used

  @param {number} spellId
  @param {string} testCategory
  @param {string} event
  @param {string} spellType

  @return {boolean}
    true - If the sound could be played
    false - If the sound could not be played
]]--
function me.TestSound(spellId, testCategory, event, spellType)
  local spellHelper = spellHelperByType[spellType]

  if spellHelper == nil then
    mod.logger.LogError(me.tag, "Failed to retrieve spellHelper")
    return false
  end

  local _, _, spellData = spellHelper.SearchBySpellId(spellId, event)

  if not spellData then
    mod.logger.LogError(me.tag, "Failed to retrieve spellData for spellId: " .. spellId)

    return false
  end

  local status = mod.sound.PlaySound(
    testCategory,
    spellType,
    spellData.soundFileName
  )

  return status
end

function me.TestCombatEventApplied(testName, testCategory, spellName, spellId)
  me.TestCombatEventGeneric(
    testName,
    testCategory,
    spellName,
    spellId,
    RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED,
    RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED
  )
end

function me.TestCombatEventRemoved(testName, testCategory, spellName, spellId)
  me.TestCombatEventGeneric(
    testName,
    testCategory,
    spellName,
    spellId,
    RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED,
    RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED
  )
end

function me.TestCombatEventRefresh(testName, testCategory, spellName, spellId)
  me.TestCombatEventGeneric(
    testName,
    testCategory,
    spellName,
    spellId,
    RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REFRESH,
    RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH
  )
end

function me.TestCombatEventSuccess(testName, testCategory, spellName, spellId)
  me.TestCombatEventGeneric(
    testName,
    testCategory,
    spellName,
    spellId,
    RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS,
    RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL
  )
end

function me.TestCombatEventStart(testName, testCategory, spellName, spellId)
  me.TestCombatEventGeneric(
    testName,
    testCategory,
    spellName,
    spellId,
    RGPVPW_CONSTANTS.EVENT_SPELL_CAST_START,
    RGPVPW_CONSTANTS.SPELL_TYPES.START
  )
end

--[[
  Tests whether a combat event can be processed for a certain category, spellName and the provided event

  @param {string} testName
  @param {string} testCategory
  @param {string} spellName
  @param {number} spellId
  @param {string} event
  @param {number} expectedSpellType
]]--
function me.TestCombatEventGeneric(testName, testCategory, spellName, spellId, event, expectedSpellType)
  assert(type(testName) == "string", string.format(
    "bad argument #1 to `TestCombatEventGeneric` (expected string, got %s)", type(testName)))
  assert(type(testCategory) == "string", string.format(
    "bad argument #2 to `TestCombatEventGeneric` (expected string, got %s)", type(testCategory)))
  assert(type(spellName) == "string", string.format(
    "bad argument #3 to `TestCombatEventGeneric` (expected string, got %s)", type(spellName)))
  assert(type(spellId) == "number", string.format(
    "bad argument #4 to `TestCombatEventGeneric` (expected number, got %s)", type(spellId)))
  assert(type(event) == "string", string.format(
    "bad argument #5 to `TestCombatEventGeneric` (expected string, got %s)", type(event)))
  assert(type(expectedSpellType) == "number", string.format(
    "bad argument #6 to `TestCombatEventGeneric` (expected number, got %s)", type(expectedSpellType)))

  mod.testReporter.StartTestRun(testName)

  local failureReason
  local category, spellType, spell = me.TestCombatEvent(
    spellId,
    spellName,
    event,
    me.GetEnemyPlayerSourceFlags()
  )

  if not spell then
    mod.testReporter.ReportFailureTestRun(testCategory, testName, mod.testHelper.unableToGetMetadata)
    return
  end

  if testCategory ~= category then
    failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
  end

  if expectedSpellType ~= spellType then
    failureReason = string.format("Expected spellType %i but got %i", expectedSpellType, spellType)
  end

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(testCategory, testName, failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

--[[
  @param {string} spellId
  @param {string} spellName
  @param {string} event
  @param {number} sourceFlags
    Source flags to determine the source of the combat log event

  @return {string}, {string}, {table}
]]--
function me.TestCombatEvent(spellId, spellName, event, sourceFlags)
  local target = me.GetGenericEnemyId()
  local targetName = me.GetGenericEnemyName()
  local actualCategory
  local actualSpellType
  local actualSpell

  -- luacheck: ignore _
  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, spellId, spellName
  end

  me.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)

  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    actualCategory = category
    actualSpellType = spellType
    actualSpell = spell
  end, fakeSpellCastCombatEvent())

  me.RestoreCombatLogGetCurrentEventInfo()

  return actualCategory, actualSpellType, actualSpell
end

--[[
  Tests whether a combat event can be processed for a certain category, spellName and the SPELL_MISSED event

  @param {string} testName
  @param {string} testCategory
  @param {number} spellId
  @param {string} spellName
  @param {string} expectedSpellType
    One of RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF or RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY
  @param {number} missType
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES
]]--
function me.TestCombatEventSpellMissed(testName, testCategory, spellId, spellName, expectedSpellType, missType)
  mod.testReporter.StartTestRun(testName)

  local sourceFlags

  if expectedSpellType == RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF then
    sourceFlags = me.GetEnemyPlayerSourceFlags()
  elseif expectedSpellType == RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY then
    sourceFlags = me.GetSelfPlayerSourceFlags()
  else
    mod.logger.LogError(me.tag, "Unknown spell type: " .. expectedSpellType)
  end

  local failureReason
  local category, spellType, spell = me.TestCombatEventAvoid(
    spellId,
    spellName,
    RGPVPW_CONSTANTS.EVENT_SPELL_MISSED,
    sourceFlags,
    missType
  )

  if not spell then
    mod.testReporter.ReportFailureTestRun(testCategory, testName, mod.testHelper.unableToGetMetadata)
    return
  end

  if testCategory ~= category then
    failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
  end

  if expectedSpellType ~= spellType then
    failureReason = string.format(
      "Expected spellType %i but got %i", expectedSpellType, spellType
    )
  end

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(testCategory, testName, failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

--[[
  Tests whether a combat event is ignored for a certain category, spellName and the SPELL_MISSED event

  @param {string} testName
  @param {string} testCategory
  @param {number} spellId
  @param {string} spellName
  @param {string} expectedSpellType
    One of RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF or RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY
  @param {number} IRRELEVANT_MISS_TYPES
    One of RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES
]]--
function me.TestCombatEventSpellMissedIrrelevant(testName, testCategory, spellId, spellName, expectedSpellType,
  irrelevantMissType)
  mod.testReporter.StartTestRun(testName)

  local sourceFlags

  if expectedSpellType == RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF then
    sourceFlags = me.GetEnemyPlayerSourceFlags()
  elseif expectedSpellType == RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY then
    sourceFlags = me.GetSelfPlayerSourceFlags()
  else
    mod.logger.LogError(me.tag, "Unknown spell type: " .. expectedSpellType)
  end

  local category, spellType, spell = me.TestCombatEventAvoid(
    spellId,
    spellName,
    RGPVPW_CONSTANTS.EVENT_SPELL_MISSED,
    sourceFlags,
    irrelevantMissType
  )

  if category ~= nil or spellType ~= nil or spell ~= nil then
    local reason = "Expected spell to be ignored but got category: "
      .. tostring(category) .. ", spellType: " .. tostring(spellType)
    mod.testReporter.ReportFailureTestRun(testCategory, testName, reason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end


--[[
  @param {number} spellId
  @param {string} spellName
  @param {string} event
  @param {number} sourceFlags
    Source flags to determine the source of the combat log event
  @param {string} missTypeName

  @return {string}, {string}, {table}
]]--
function me.TestCombatEventAvoid(spellId, spellName, event, sourceFlags, missTypeName)
  local target = me.GetGenericEnemyId()
  local targetName = me.GetGenericEnemyName()
  local actualCategory
  local actualSpellType
  local actualSpell

  -- luacheck: ignore _
  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, spellId, spellName, _, missTypeName
  end

  me.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)

  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    actualCategory = category
    actualSpellType = spellType
    actualSpell = spell
  end, fakeSpellCastCombatEvent())

  me.RestoreCombatLogGetCurrentEventInfo()

  return actualCategory, actualSpellType, actualSpell
end
