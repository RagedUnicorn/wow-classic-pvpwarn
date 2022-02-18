--[[
  MIT License

  Copyright (c) 2022 Michael Wiesendanger

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
local languageMapping = {
  ["enUS"] = "En",
  ["enGB"] = "En",
  ["deDE"] = "De"
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
  Returns a matched language to a locale string

  @return {string | nil}
    string - if a language was found in the mapping
    nil - if no language was found in the mapping
]]--
function me.GetLanguage(language)
  if language then
    return languageMapping[language]
  else
    return languageMapping[GetLocale()]
  end
end

--[[
  A testhelper function to get the spellMap for a specific categoryName

  @param {String} spellMap
    RGPVPW_CONSTANTS.SPELL_MAP or RGPVPW_CONSTANTS.SPELL_AVOID_MAP
  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.

  @return {table}
    The spellMap for the passed categoryName
]]--
function me.GetAllForCategory(spellMap, categoryName)
  local map = mod[spellMap].GetSpellConfiguration()

  return mod.common.Clone(map[categoryName])
end

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
  Normalize a spellName so it can be matched against a functionname

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
  Enable Testing mode and thus ignoring the spellConfiguration
]]--
function me.EnableTestMode()
  RGPVPW_ENVIRONMENT.TEST = true
end

--[[
  Enable Testing mode and thus stop ignoring the spellConfiguration
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
  return "Player-531-0764I8DA"
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
  @param {number} missTypeId
    RGPVPW_CONSTANTS.MISS_TYPES

  @return {string | nil}
    string - the textual representation of the missTypeId
    nil - if no matching missType could be found
]]--
function me.GetMissTypeNameById(missTypeId)
  for missTypeName, id in pairs(RGPVPW_CONSTANTS.MISS_TYPES) do
    if missTypeId == id then
      return missTypeName
    end
  end

  return nil
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
  @param {string} spellName
]]--
function me.TestSoundApplied(testName, testCategory, spellName)
  mod.testReporter.StartTestRun(testName)

  local status = me.TestSound(
    spellName,
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
  @param {string} spellName
]]--
function me.TestSoundRemoved(testName, testCategory, spellName)
  mod.testReporter.StartTestRun(testName)

  local status = me.TestSound(
    spellName,
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
  @param {string} spellName
]]--
function me.TestSoundSuccess(testName, testCategory, spellName)
  mod.testReporter.StartTestRun(testName)

  local status = me.TestSound(
    spellName,
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
function me.TestSoundStart(testName, testCategory, spellName)
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
  @param {string} spellName
]]--
function me.TestSoundSpellMissedSelf(testName, testCategory, spellName)
  mod.testReporter.StartTestRun(testName)

  local status = me.TestSound(
    spellName,
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
  @param {string} spellName
]]--
function me.TestSoundSpellMissedEnemy(testName, testCategory, spellName)
  mod.testReporter.StartTestRun(testName)

  local status = me.TestSound(
    spellName,
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
  considers that for certain spellTypes a different spellMap needs to be usedw

  @param {string} spellName
  @param {string} testCategory
  @param {string} event
  @param {string} spellType

  @return {boolean}
    true - If the sound could be played
    false - If the sound could not be played
]]--
function me.TestSound(spellName, testCategory, event, spellType)
  local spellMap = me.GetSpellMap(spellType)

  if spellMap == nil then
    mod.logger.LogError(me.tag, "Failed to retrieve spellMap")
    return false
  end

  local _, spellData = mod[spellMap].SearchByName(spellName, event)

  local status = mod.sound.PlaySound(
    testCategory,
    spellType,
    spellData.soundFileName
  )

  return status
end

--[[
  Tests whether a combatevent can be processed for a certain category, spellName and the SPELL_AURA_APPLIED event

  @param {string} testName
  @param {string} testCategory
  @param {string} spellName
]]--
function me.TestCombatEventApplied(testName, testCategory, spellName)
  mod.testReporter.StartTestRun(testName)

  local failureReason
  local category, spellType, spell = me.TestCombatEvent(
    spellName,
    RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED,
    me.GetEnemyPlayerSourceFlags()
  )

  if not spell then
    mod.testReporter.ReportFailureTestRun(testCategory, testName, mod.testHelper.unableToGetMetadata)
    return
  end

  if spell.links ~= nil then
    local linkedSpell = me.SearchLinkedSpellWithCategory(testCategory, category, spell)

    if linkedSpell == nil then
      failureReason = string.format("No matching category %s for linked spell found", testCategory)
    end
  else
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED, spellType)
    end
  end

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(testCategory, testName, failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

--[[
  Tests whether a combatevent can be processed for a certain category, spellName and the SPELL_AURA_REMOVED event

  @param {string} testName
  @param {string} testCategory
  @param {string} spellName
]]--
function me.TestCombatEventRemoved(testName, testCategory, spellName)
  mod.testReporter.StartTestRun(testName)

  local failureReason
  local category, spellType, spell = me.TestCombatEvent(
    spellName,
    RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED,
    me.GetEnemyPlayerSourceFlags()
  )

  if not spell then
    mod.testReporter.ReportFailureTestRun(testCategory, testName, mod.testHelper.unableToGetMetadata)
    return
  end

  if spell.links ~= nil then
    local linkedSpell = me.SearchLinkedSpellWithCategory(testCategory, category, spell)

    if linkedSpell == nil then
      failureReason = string.format("No matching category %s for linked spell found", testCategory)
    end
  else
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED, spellType)
    end
  end

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(testCategory, testName, failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

--[[
  Tests whether a combatevent can be processed for a certain category, spellName and the SPELL_AURA_REFRESH event

  @param {string} testName
  @param {string} testCategory
  @param {string} spellName
]]--
function me.TestCombatEventRefresh(testName, testCategory, spellName)
  mod.testReporter.StartTestRun(testName)

  local failureReason
  local category, spellType, spell = me.TestCombatEvent(
    spellName,
    RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REFRESH,
    me.GetEnemyPlayerSourceFlags()
  )

  if not spell then
    mod.testReporter.ReportFailureTestRun(testCategory, testName, mod.testHelper.unableToGetMetadata)
    return
  end

  if spell.links ~= nil then
    local linkedSpell = me.SearchLinkedSpellWithCategory(testCategory, category, spell)

    if linkedSpell == nil then
      failureReason = string.format("No matching category %s for linked spell found", testCategory)
    end
  else
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH, spellType)
    end
  end

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(testCategory, testName, failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

--[[
  Tests whether a combatevent can be processed for a certain category, spellName and the SPELL_CAST_SUCCESS event

  @param {string} testName
  @param {string} testCategory
  @param {string} spellName
]]--
function me.TestCombatEventSuccess(testName, testCategory, spellName)
  mod.testReporter.StartTestRun(testName)

  local failureReason
  local category, spellType, spell = me.TestCombatEvent(
    spellName,
    RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS,
    me.GetEnemyPlayerSourceFlags()
  )

  if not spell then
    mod.testReporter.ReportFailureTestRun(testCategory, testName, mod.testHelper.unableToGetMetadata)
    return
  end

  if spell.links ~= nil then
    local linkedSpell = me.SearchLinkedSpellWithCategory(testCategory, category, spell)

    if linkedSpell == nil then
      failureReason = string.format("No matching category %s for linked spell found", testCategory)
    end
  else
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, spellType)
    end
  end

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(testCategory, testName, failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

--[[
  Tests whether a combatevent can be processed for a certain category, spellName and the SPELL_CAST_START event

  @param {string} testName
  @param {string} testCategory
  @param {string} spellName
]]--
function me.TestCombatEventStart(testName, testCategory, spellName)
  mod.testReporter.StartTestRun(testName)

  local failureReason
  local category, spellType, spell = me.TestCombatEvent(
    spellName,
    RGPVPW_CONSTANTS.EVENT_SPELL_CAST_START,
    me.GetEnemyPlayerSourceFlags()
  )

  if not spell then
    mod.testReporter.ReportFailureTestRun(testCategory, testName, mod.testHelper.unableToGetMetadata)
    return
  end

  if spell.links ~= nil then
    local linkedSpell = me.SearchLinkedSpellWithCategory(testCategory, category, spell)

    if linkedSpell == nil then
      failureReason = string.format("No matching category %s for linked spell found", testCategory)
    end
  else
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.START ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, spellType)
    end
  end

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(testCategory, testName, failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end

--[[
  Tests whether a combatevent can be processed for a certain category, spellName and the SPELL_MISSED event

  @param {string} testName
  @param {string} testCategory
  @param {string} spellName
  @param {string} expectedSpellType
    One of RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF or RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY
  @param {number} missType
    RGPVPW_CONSTANTS.MISS_TYPES
]]--
function me.TestCombatEventSpellMissed(testName, testCategory, spellName, expectedSpellType, missType)
  mod.testReporter.StartTestRun(testName)

  local sourceFlags

  if expectedSpellType == RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF then
    sourceFlags = me.GetEnemyPlayerSourceFlags()
  elseif expectedSpellType == RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY then
    sourceFlags = me.GetSelfPlayerSourceFlags()
  else
    mod.logger.LogError(me.tag, "Unknown spelltype: " .. expectedSpellType)
  end

  local failureReason
  local category, spellType, spell = me.TestCombatEventAvoid(
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
  @param {string} spellName
  @param {string} event
  @param {number} sourceFlags
    Sourceflags to determine the source of the combatlog event

  @return {string}, {string}, {table}
]]--
function me.TestCombatEvent(spellName, event, sourceFlags)
  local target = me.GetGenericEnemyId()
  local targetName = me.GetGenericEnemyName()
  local actualCategory
  local actualSpellType
  local actualSpell

  -- luacheck: ignore _
  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
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
  @param {string} spellName
  @param {string} event
  @param {number} sourceFlags
    Sourceflags to determine the source of the combatlog event
  @param {number} missTypeId
    RGPVPW_CONSTANTS.MISS_TYPES

  @return {string}, {string}, {table}
]]--
function me.TestCombatEventAvoid(spellName, event, sourceFlags, missType)
  local target = me.GetGenericEnemyId()
  local targetName = me.GetGenericEnemyName()
  local missTypeName = me.GetMissTypeNameById(missType)
  local actualCategory
  local actualSpellType
  local actualSpell

  -- luacheck: ignore _
  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName, _, missTypeName
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
  Search the linked spell from the spellMap that matches the spellCategory. If the passed spell
  already matches the expected category it will simply be returned

  @param {string} testCategory
    The category that the test is currently using
  @param {string} spellCategory
    The actual catgory of the spell
  @param {table} spell
    The spell to search for

  @return {table | nil}
    table - the linked spell that was found or the same spell that was passed
    nil - if not matching spell could be found
]]--
function me.SearchLinkedSpellWithCategory(testCategory, spellCategory, spell)
  if testCategory ~= spellCategory then
    local linkedSpellsData = mod.spellMap.GetLinkedSpells(spell)

    for _, linkedSpell in pairs(linkedSpellsData) do
      if linkedSpell.category == testCategory then
        return linkedSpell
      end
    end

    return nil
  else
    return spell
  end
end
