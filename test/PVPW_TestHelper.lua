--[[
  MIT License

  Copyright (c) 2020 Michael Wiesendanger

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

-- luacheck: globals CombatLogGetCurrentEventInfo GetLocale

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
mod.testHelper.missingSoundDownTest = "Did not find a sound down test for %s - %s"

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

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.

  @return {table}
    The spellMap for the passed categoryName
]]--
function me.GetAllForCategory(categoryName)
  local spellMap = mod.spellMap.GetSpellConfiguration()

  return mod.common.Clone(spellMap[categoryName])
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
  return 1352
end

--[[
  Tests wheter a sound can be played for a certain category, spellName and the SPELL_AURA_APPLIED event

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
  Tests wheter a sound can be played for a certain category, spellName and the SPELL_AURA_REMOVED event

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
  Tests wheter a sound can be played for a certain category, spellName and the SPELL_CAST_SUCCESS event

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
  Play a sound and return whether this was possible or not

  @param {string} spellName
  @param {string} testCategory
  @param {string} event
  @param {string} spellType

  @return {boolean}
    true - If the sound could be played
    false - If the sound could not be played
]]--
function me.TestSound(spellName, testCategory, event, spellType)
  local _, spellData = mod.spellMap.SearchByName(spellName, event)

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
    RGPVPW_CONSTANTS.EVENT_SPELL_AURA_APPLIED
  )

  if testCategory ~= category then
    failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
  end

  if RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED ~= spellType then
    failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED, spellType)
  end

  if not spell then
    failureReason = mod.testHelper.unableToGetMetadata
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
    RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REMOVED
  )

  if testCategory ~= category then
    failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
  end

  if RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED ~= spellType then
    failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED, spellType)
  end

  if not spell then
    failureReason = mod.testHelper.unableToGetMetadata
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
    RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REFRESH
  )

  if testCategory ~= category then
    failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
  end

  if RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH ~= spellType then
    failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH, spellType)
  end

  if not spell then
    failureReason = mod.testHelper.unableToGetMetadata
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
    RGPVPW_CONSTANTS.EVENT_SPELL_CAST_SUCCESS
  )

  if testCategory ~= category then
    failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
  end

  if RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL ~= spellType then
    failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, spellType)
  end

  if not spell then
    failureReason = mod.testHelper.unableToGetMetadata
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

  @return {string}, {string}, {table}
]]--
function me.TestCombatEvent(spellName, event)
  local sourceFlags = me.GetEnemyPlayerSourceFlags()
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
  end)
  me.RestoreCombatLogGetCurrentEventInfo()

  return actualCategory, actualSpellType, actualSpell
end
