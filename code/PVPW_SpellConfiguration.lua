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
mod.spellConfiguration = me

me.tag = "SpellConfiguration"

--[[
  @param {string} spellList
    See constants RGPVPW_CONSTANTS.PELL_TYPE
  @param {string} categoryName
  @param {string} spellName
]]--
function me.ToggleSpellState(spellList, categoryName, spellName)
  assert(type(spellList) == "string", string.format(
    "bad argument #1 to `ToggleSpellState` (expected string got %s)", type(spellList)))

  assert(type(categoryName) == "string", string.format(
    "bad argument #2 to `ToggleSpellState` (expected string got %s)", type(categoryName)))

  assert(type(spellName) == "string", string.format(
    "bad argument #3 to `ToggleSpellState` (expected string got %s)", type(spellName)))

    me.ToggleSpell(
      spellList,
      categoryName,
      spellName,
      not me.IsSpellActive(spellList, categoryName, spellName)
    )
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName

  @return {boolean}
    true if the spell is active
    false if the spell is inactive
]]--
function me.IsSpellActive(spellList, categoryName, spellName)
  assert(type(spellList) == "string", string.format(
    "bad argument #1 to `IsSpellActive` (expected string got %s)", type(spellList)))

  assert(type(categoryName) == "string", string.format(
    "bad argument #2 to `IsSpellActive` (expected string got %s)", type(categoryName)))

  assert(type(spellName) == "string", string.format(
    "bad argument #3 to `IsSpellActive` (expected string got %s)", type(spellName)))

  if PVPWarnOptions[spellList][categoryName] then
    if PVPWarnOptions[spellList][categoryName][spellName] then
      return PVPWarnOptions[spellList][categoryName][spellName].spellActive
    end
  end

  return false
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
  @param {boolean} state
    true if the option should be active
    false if the option should be inactive
]]--
function me.ToggleSpell(spellList, categoryName, spellName, state)
  me.SetupPrerequisiteForOptionEntry(spellList, categoryName, spellName)

  mod.logger.LogDebug(me.tag,
    string.format(
      "Updating spell %s spellstate for category %s - current value: %s / new value: %s",
      spellName,
      categoryName,
      tostring(PVPWarnOptions[spellList][categoryName][spellName].spellActive),
      tostring(state)
    )
  )
  PVPWarnOptions[spellList][categoryName][spellName].spellActive = state
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
]]--
function me.ToggleSoundWarning(spellList, categoryName, spellName)
  assert(type(spellList) == "string", string.format(
    "bad argument #1 to `ToggleSoundWarning` (expected string got %s)", type(spellList)))

  assert(type(categoryName) == "string", string.format(
    "bad argument #2 to `ToggleSoundWarning` (expected string got %s)", type(categoryName)))

  assert(type(spellName) == "string", string.format(
    "bad argument #3 to `ToggleSoundWarning` (expected string got %s)", type(spellName)))

  me.ToggleSound(
    spellList,
    categoryName,
    spellName,
    not me.IsSoundWarningActive(spellList, categoryName, spellName)
  )
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
  @return {boolean}
    true if the sound warning is active
    false if the sound warning is inactive
]]--
function me.IsSoundWarningActive(spellList, categoryName, spellName)
  assert(type(spellList) == "string", string.format(
    "bad argument #1 to `IsSoundWarningActive` (expected string got %s)", type(spellList)))

  assert(type(categoryName) == "string", string.format(
    "bad argument #2 to `IsSoundWarningActive` (expected string got %s)", type(categoryName)))

  assert(type(spellName) == "string", string.format(
    "bad argument #3 to `IsSoundWarningActive` (expected string got %s)", type(spellName)))

  if PVPWarnOptions[spellList][categoryName] then
    if PVPWarnOptions[spellList][categoryName][spellName] then
      return PVPWarnOptions[spellList][categoryName][spellName].soundWarningActive
    end
  end

  return false
end

--[[
  @param {string} spellList
    decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
  @param {boolean} state
    true if the option should be active
    false if the option should be inactive
]]--
function me.ToggleSound(spellList, categoryName, spellName, state)
  me.SetupPrerequisiteForOptionEntry(spellList, categoryName, spellName)

  mod.logger.LogDebug(me.tag,
    string.format(
      "Updating spell %s soundstate for category %s - current value: %s / new value: %s",
      spellName,
      categoryName,
      tostring(PVPWarnOptions[spellList][categoryName][spellName].soundWarningActive),
      tostring(state)
    )
  )
  PVPWarnOptions[spellList][categoryName][spellName].soundWarningActive = state
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {string} spellName
]]--
function me.SetupPrerequisiteForOptionEntry(spellList, categoryName, spellName)
  if not PVPWarnOptions[spellList][categoryName] then
    mod.logger.LogInfo(me.tag, "Class - " .. categoryName .. " does not exist. Creating new one...")
    PVPWarnOptions[spellList][categoryName] = {}
  end

  if not PVPWarnOptions[spellList][categoryName][spellName] then
    mod.logger.LogInfo(me.tag, "SpellName - " .. spellName .. " for class "
      .. categoryName .. " does not exist. Creating new one...")
    PVPWarnOptions[spellList][categoryName][spellName] = me.GetDefaultSpellConfiguration()
  end
end

--[[
  Returns a default config object for a spell

  @return {table}
    Returns a default object for a spell
]]--
function me.GetDefaultSpellConfiguration()
  return {
    ["spellActive"] = false,
    ["soundWarningActive"] = false,
    ["soundFadeWarningActive"] = false,
    ["visualWarningActive"] = false,
    ["visualWarningColor"] = RGPVPW_CONSTANTS.DEFAULT_COLOR
  }
end
