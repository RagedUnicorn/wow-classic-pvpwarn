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

-- luacheck: globals GetLocale

local mod = rgpvpw
local me = {}
mod.common = me

me.tag = "Common"

--[[
  Depending on what locale the client has a different implementation is used
  to normalize a spellname (this is determined once during addon load).
  This is done because this function is time critical and can be called a lot during
  fights with a lot of players.
]]--
if (GetLocale() == "deDE") then
  --[[
    Normalize spellName by replacing spaces with underscores and removing special characters including german umlaute

    @param {string} spellName
    @return {string}
      normalized spellName
  ]]--
  function me.NormalizeSpellname(spellName)
    local name = string.gsub(string.lower(spellName), "%s+", "_")

    name = string.gsub(name, "_%-_", "_")
    name = string.gsub(name, "-", "_")
    name = string.gsub(name, "[':%(%)]+", "")
    name = string.gsub(name, "ö", "oe")
    name = string.gsub(name, "ü", "ue")
    name = string.gsub(name, "ä", "ae")
    name = string.gsub(name, "ß", "ss")

    return name
  end
else
  --[[
    Normalize spellName by replacing spaces with underscores and removing special characters

    @param {string} spellName
    @return {string}
      normalized spellName
  ]]--
  function me.NormalizeSpellname(spellName)
    local name = string.gsub(string.lower(spellName), "%s+", "_")

    name = string.gsub(name, "_%-_", "_")
    name = string.gsub(name, "-", "_")
    name = string.gsub(name, "[':%(%)]+", "")

    return name
  end
end

--[[
  @param {table} obj
    the object that should be cloned
  @return {table}
    a clone of the object passed
]]--
function me.Clone(obj)
  if type(obj) ~= 'table' then return obj end

  local res = {}

  for k, v in pairs(obj) do
    res[me.Clone(k)] = me.Clone(v)
  end

  return res
end

--[[
  Calculate the length of a table

  @param {table} t

  return {number}
]]--
function me.TableLength(t)
  local count = 0

  for _ in pairs(t) do
    count = count + 1
  end

  return count
end

--[[
  Map wow events to a constant mapping

  @param {string} event

  @return {number | nil}
    number - The number representing the event according to RGPVPW_CONSTANTS.SPELL_TYPES
    nil - if the event is not supported
]]--
function me.GetSpellType(event)
  if event == "SPELL_CAST_SUCCESS" then
    return RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL
  elseif event == "SPELL_AURA_APPLIED" then
    return RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED
  elseif event == "SPELL_AURA_REMOVED" then
    return RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED
  elseif event == "SPELL_AURA_REFRESH" then
    return RGPVPW_CONSTANTS.SPELL_TYPES.REFRESH
  end

  return nil
end
