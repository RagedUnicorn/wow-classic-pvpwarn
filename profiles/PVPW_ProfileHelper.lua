--[[
  MIT License

  Copyright (c) 2025 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--

local mod = rgpvpw
local me = {}
mod.profileHelper = me

me.tag = "ProfileHelper"

--[[
  Helper function to create spell configuration

  @param {boolean} active - Whether the spell tracking is active
  @param {boolean} sound - Whether sound warning is active
  @param {boolean} soundFade - Whether sound fade warning is active
  @param {number} color - The visual warning color value

  @return {table} - Spell configuration table
]]--
function me.CreateSpellConfig(active, sound, soundFade, color)
  return {
    ["spellActive"] = active,
    ["soundWarningActive"] = sound,
    ["soundFadeWarningActive"] = soundFade,
    ["visualWarningColor"] = color
  }
end

--[[
  Generic GetSpellProfile function for all profile modules

  @param {table} profiles - Table containing profile mappings
  @param {string} spellType - The type of spell profile to retrieve
  @param {string} tag - The calling module's tag for error logging

  @return {table | nil} - Cloned spell profile or nil if invalid type
]]--
function me.GetSpellProfile(profiles, spellType, tag)
  local profile = profiles[spellType]

  if profile then
    return mod.common.Clone(profile)
  else
    mod.logger.LogError(tag, "Invalid spellType: " .. tostring(spellType))
    return nil
  end
end
