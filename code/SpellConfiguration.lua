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

local mod = rgpvpw
local me = {}
mod.spellConfiguration = me

me.tag = "SpellConfiguration"

--[[
  @param {string} spellList
    See constants RGPVPW_CONSTANTS.SPELL_TYPE
  @param {string} categoryName
  @param {number} spellId
  @param {string} spellName
]]--
function me.ToggleSpellState(spellList, categoryName, spellId, spellName)
  me.ToggleOption(spellList, categoryName, spellId, spellName, "spellActive")
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {number} spellId

  @return {boolean}
    true if the spell is active
    false if the spell is inactive
]]--
function me.IsSpellActive(spellList, categoryName, spellId)
  return me.IsOptionActive(spellList, categoryName, spellId, "spellActive")
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {number} spellId
  @param {string} spellName
]]--
function me.ToggleSoundWarning(spellList, categoryName, spellId, spellName)
  me.ToggleOption(spellList, categoryName, spellId, spellName, "soundWarningActive")
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {number} spellId

  @return {boolean}
    true if the sound warning is active
    false if the sound warning is inactive
]]--
function me.IsSoundWarningActive(spellList, categoryName, spellId)
  return me.IsOptionActive(spellList, categoryName, spellId, "soundWarningActive")
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {number} spellId
  @param {string} spellName
]]--
function me.ToggleSoundFadeWarning(spellList, categoryName, spellId, spellName)
  me.ToggleOption(spellList, categoryName, spellId, spellName, "soundFadeWarningActive")
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {number} spellId

  @return {boolean}
    true if the sound warning is active
    false if the sound warning is inactive
]]--
function me.IsSoundFadeWarningActive(spellList, categoryName, spellId)
  return me.IsOptionActive(spellList, categoryName, spellId, "soundFadeWarningActive")
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {number} spellId
  @param {string} spellName
]]--
function me.ToggleSoundStartWarning(spellList, categoryName, spellId, spellName)
  me.ToggleOption(spellList, categoryName, spellId, spellName, "soundStartWarningActive")
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {number} spellId

  @return {boolean}
    true if the sound start warning is active
    false if the sound start warning is inactive
]]--
function me.IsSoundStartWarningActive(spellList, categoryName, spellId)
  return me.IsOptionActive(spellList, categoryName, spellId, "soundStartWarningActive")
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {number} spellId

  @return {number}
    A number representing the current color. If none can be found the default color is returned
]]--
function me.GetVisualWarningColor(spellList, categoryName, spellId)
  assert(type(spellList) == "string", string.format(
    "bad argument #1 to `GetVisualWarningColor` (expected string, got %s)", type(spellList)))

  assert(type(categoryName) == "string", string.format(
    "bad argument #2 to `GetVisualWarningColor` (expected string, got %s)", type(categoryName)))

  assert(type(spellId) == "number", string.format(
    "bad argument #3 to `GetVisualWarningColor` (expected number, got %s)", type(spellId)))


  local category = PVPWarnConfiguration[spellList] and PVPWarnConfiguration[spellList][categoryName]
  local spell = category and category[spellId]

  return spell and spell.visualWarningColor or RGPVPW_CONSTANTS.DEFAULT_COLOR
end

--[[
  @param {string} spellList
    decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {number} spellId
  @param {string} spellName
  @param {number} color
    A number representing the color - see RGPVPW_CONSTANTS.TEXTURES
]]--
function me.UpdateVisualWarningColor(spellList, categoryName, spellId, spellName, color)
  me.SetupPrerequisiteForOptionEntry(spellList, categoryName, spellId)

  local category = PVPWarnConfiguration[spellList][categoryName]
  local spell = category and category[spellId]

  if not spell then
    mod.logger.LogError(me.tag,
      string.format("Spell entry missing for %s - %s in category %s", spellId, spellName, categoryName)
    )
    return
  end

  mod.logger.LogDebug(me.tag,
    string.format(
      "Updating spell %s - %s visual warning color for category %s (current: %s / new: %s)",
      spellId, spellName, categoryName,
      tostring(spell.visualWarningColor),
      tostring(color)
    )
  )

  spell.visualWarningColor = color
  mod.profile.SetModified()
end

--[[
  Check if a visual warning is active for a specific spell

  @param {string} spellList
  @param {string} categoryName
  @param {number} spellId

  @return {boolean}
]]--
function me.IsVisualWarningActive(spellList, categoryName, spellId)
  assert(type(spellList) == "string", string.format(
    "bad argument #1 to `IsVisualWarningActive` (expected string, got %s)", type(spellList)))

  assert(type(categoryName) == "string", string.format(
    "bad argument #2 to `IsVisualWarningActive` (expected string, got %s)", type(categoryName)))

  assert(type(spellId) == "number", string.format(
    "bad argument #3 to `IsVisualWarningActive` (expected number, got %s)", type(spellId)))

  local category = PVPWarnConfiguration[spellList] and PVPWarnConfiguration[spellList][categoryName]
  local spell = category and category[spellId]

  if not spell or spell.visualWarningColor == nil then
    return false
  end

  return spell.visualWarningColor ~= RGPVPW_CONSTANTS.DEFAULT_COLOR
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} categoryName
  @param {number} spellId
]]--
function me.SetupPrerequisiteForOptionEntry(spellList, categoryName, spellId)
  if type(PVPWarnConfiguration[spellList]) ~= "table" then
    mod.logger.LogInfo(me.tag, "Spell list '" .. spellList .. "' does not exist. Creating new one...")
    PVPWarnConfiguration[spellList] = {}
  end

  if type(PVPWarnConfiguration[spellList][categoryName]) ~= "table" then
    mod.logger.LogInfo(me.tag, "Class - " .. categoryName .. " does not exist. Creating new one...")
    PVPWarnConfiguration[spellList][categoryName] = {}
  end

  if type(PVPWarnConfiguration[spellList][categoryName][spellId]) ~= "table" then
    mod.logger.LogInfo(me.tag,
      "SpellId - " .. spellId .. " for class " .. categoryName .. " does not exist. Creating new one...")

    local spellConfig = me.GetDefaultSpellConfiguration()
    local spellMetadata = mod.spellMap.GetSpellMetadata(categoryName, spellId)

    if spellMetadata then
      if spellMetadata.hasFade then
        spellConfig["soundFadeWarningActive"] = false
      end

      if spellMetadata.hasCast then
        spellConfig["soundStartWarningActive"] = false
      end
    end

    PVPWarnConfiguration[spellList][categoryName][spellId] = spellConfig
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
    ["visualWarningColor"] = RGPVPW_CONSTANTS.DEFAULT_COLOR
  }
end

--[[
  Returns the spell entry from the configuration or nil if not found

  @param {string} spellList
  @param {string} categoryName
  @param {number} spellId

  @return {table|nil}
]]--
function me.GetSpellEntry(spellList, categoryName, spellId)
  assert(type(spellList) == "string", string.format(
    "bad argument #1 to `GetSpellEntry` (expected string, got %s)", type(spellList)))

  assert(type(categoryName) == "string", string.format(
    "bad argument #2 to `GetSpellEntry` (expected string, got %s)", type(categoryName)))

  assert(type(spellId) == "number", string.format(
    "bad argument #3 to `GetSpellEntry` (expected number, got %s)", type(spellId)))

  local category = PVPWarnConfiguration[spellList] and PVPWarnConfiguration[spellList][categoryName]
  local spell = category and category[spellId]

  return spell
end

--[[
  Toggles a boolean option inside a spell entry

  @param {string} spellList
  @param {string} categoryName
  @param {number} spellId
  @param {string} spellName
  @param {string} optionName
]]--
function me.ToggleOption(spellList, categoryName, spellId, spellName, optionName)
  me.SetupPrerequisiteForOptionEntry(spellList, categoryName, spellId)

  local spell = me.GetSpellEntry(spellList, categoryName, spellId)

  if not spell then
    mod.logger.LogError(me.tag,
      string.format("Spell entry missing for %s - %s in category %s", spellId, spellName, categoryName)
    )
    return
  end

  local currentState = spell[optionName]

  if type(currentState) ~= "boolean" then
    mod.logger.LogError(me.tag,
      string.format("Option '%s' is not a boolean in spell entry %s - %s", optionName, spellId, spellName)
    )
    return
  end

  mod.logger.LogDebug(me.tag,
    string.format(
      "Toggling option '%s' for spell %s - %s in category %s (current: %s / new: %s)",
      optionName, spellId, spellName, categoryName,
      tostring(currentState), tostring(not currentState)
    )
  )

  spell[optionName] = not currentState
  mod.profile.SetModified()
end

--[[
  Checks if a boolean option is active inside a spell entry

  @param {string} spellList
  @param {string} categoryName
  @param {number} spellId
  @param {string} optionName

  @return {boolean}
    true if the option is active
    false if the option is inactive
]]--
function me.IsOptionActive(spellList, categoryName, spellId, optionName)
  if RGPVPW_ENVIRONMENT.TEST then return true end

  assert(type(spellList) == "string", string.format(
    "bad argument #1 to `IsOptionActive` (expected string, got %s)", type(spellList)))

  assert(type(categoryName) == "string", string.format(
    "bad argument #2 to `IsOptionActive` (expected string, got %s)", type(categoryName)))

  assert(type(spellId) == "number", string.format(
    "bad argument #3 to `IsOptionActive` (expected number, got %s)", type(spellId)))

  assert(type(optionName) == "string", string.format(
    "bad argument #4 to `IsOptionActive` (expected string, got %s)", type(optionName)))

  local spell = me.GetSpellEntry(spellList, categoryName, spellId)

  return spell and spell[optionName] or false
end
