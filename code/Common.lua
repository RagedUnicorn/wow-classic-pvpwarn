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

-- luacheck: globals GetLocale

local mod = rgpvpw
local me = {}
mod.common = me

me.tag = "Common"

--[[
  Normalize spellName by replacing spaces with underscores and removing special characters

  @param {string} spellName
  @return {string}
    normalized spellName
]]--
function me.NormalizeSpellName(spellName)
  local name = string.gsub(string.lower(spellName), "%s+", "_")

  name = string.gsub(name, "_%-_", "_")
  name = string.gsub(name, "[-/]", "_")
  name = string.gsub(name, "[':%(%)!]+", "")

  return name
end

--[[
  @param {table} obj
    the object that should be cloned
  @return {table}
    a clone of the object passed
]]--
function me.Clone(obj)
  if type(obj) ~= "table" then return obj end

  local res = {}

  for k, v in pairs(obj) do
    res[me.Clone(k)] = me.Clone(v)
  end

  return res
end

--[[
  Select multiple values from a variable argument list based on the provided indices

  @param {table} indices
    A table containing the indices of the values to select
  @param {...}
    Variable number of arguments from which to select values

  @return {table}
    Returns a table containing the selected values
]]--
function me.SelectMultiple(indices, ...)
  local results = {}

  for i, index in ipairs(indices) do
    results[i] = select(index, ...)
  end

  return unpack(results)
end

--[[
  Map wow events to a constant mapping

  @param {string} event
  @param {number} targetModifier
    Certain events require to define what was the source of an event to determine the correct
    spelltype

  @return {number | nil}
    number - The number representing the event according to RGPVPW_CONSTANTS.SPELL_TYPES
    nil - if the event is not supported
]]--
function me.GetSpellType(event, targetModifier)
  if event == "SPELL_CAST_SUCCESS" then
    return RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL
  elseif event == "SPELL_CAST_START" then
    return RGPVPW_CONSTANTS.SPELL_TYPES.START
  elseif event == "SPELL_AURA_APPLIED" then
    return RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED
  elseif event == "SPELL_AURA_REMOVED" then
    return RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED
  elseif event == "SPELL_AURA_REFRESH" then
    return RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH
  elseif event == "SPELL_MISSED" then
    if targetModifier == RGPVPW_CONSTANTS.TARGET_SELF then
      return RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF
    elseif targetModifier == RGPVPW_CONSTANTS.TARGET_ENEMY then
      return RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY
    end
  end

  return nil
end

--[[
  @param {number} spellType
    One of RGPVPW.SPELL_TYPES

  @return {string}
    One of RGPVPW.SPELL_TYPE
]]--
function me.GetSpellMap(spellType)
  if spellType == RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF then
    return RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID
  elseif spellType == RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY then
    return RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID
  elseif spellType == RGPVPW_CONSTANTS.SPELL_TYPES.START then
    return RGPVPW_CONSTANTS.SPELL_TYPE.SPELL
  else
    return RGPVPW_CONSTANTS.SPELL_TYPE.SPELL
  end
end

--[[
  Get a textures name by its numerical value

  @parma {number} colorValue

  @return {string}
]]--
function me.GetTextureNameByValue(colorValue)
  for _, texture in pairs(RGPVPW_CONSTANTS.TEXTURES) do
    if colorValue == texture.colorValue then
      return texture.textureName
    end
  end

  return RGPVPW_CONSTANTS.TEXTURES.none.textureName -- default if none was found
end
