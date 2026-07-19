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

-- forward declaration
local NormalizeSpellConfigEntries

--[[
  Helper function to create spell configuration. The returned entry is aligned with the
  spell's metadata when the profile is retrieved through GetSpellProfile - see
  NormalizeSpellConfigEntries.

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
    local clonedProfile = mod.common.Clone(profile)
    NormalizeSpellConfigEntries(clonedProfile)

    return clonedProfile
  else
    mod.logger.LogError(tag, "Invalid spellType: " .. tostring(spellType))
    return nil
  end
end

--[[
  Align profile-seeded entries with the shape SpellConfiguration.SetupPrerequisiteForOptionEntry
  creates lazily: soundFadeWarningActive / soundStartWarningActive are present exactly when the
  spell's metadata has hasFade / hasCast. Entries without metadata are left untouched.

  @param {table} profile
    A profile table shaped [categoryName][spellId] = spellConfig
]]--
NormalizeSpellConfigEntries = function(profile)
  for categoryName, spells in pairs(profile) do
    for spellId, spellConfig in pairs(spells) do
      local spellMetadata = mod.spellMap.GetSpellMetadata(categoryName, spellId)

      if spellMetadata then
        if spellMetadata.hasFade then
          if spellConfig.soundFadeWarningActive == nil then
            spellConfig.soundFadeWarningActive = false
          end
        else
          spellConfig.soundFadeWarningActive = nil
        end

        if spellMetadata.hasCast then
          if spellConfig.soundStartWarningActive == nil then
            spellConfig.soundStartWarningActive = false
          end
        else
          spellConfig.soundStartWarningActive = nil
        end
      end
    end
  end
end
