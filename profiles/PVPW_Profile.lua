--[[
  MIT License

  Copyright (c) 2021 Michael Wiesendanger

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
mod.profile = me

me.tag = "Profile"

--[[
  ["type"] = {
    -- e.g. paladin, racials
    ["spellName"] = {
      -- e.g. lay_on_hands as found in SpellMap
      ["spellActive"] = false,
        -- default false
      ["soundWarningActive"] = false,
        -- default false
      ["soundFadeWarningActive"] = false,
        -- default false
      ["visualWarningActive"] = false,
        -- default false
      ["visualWarningColor"] = [number] -- e.g. blue, orange see RGPVPW_CONSTANTS.TEXTURES
        -- default color in RGPVPW_CONSTANTS.DEFAULT_COLOR
    }
  }
]]--
local defaultProfile = {}

-- allow for a maximum of 10 profiles
local maxProfiles = 10 -- TODO
local maxProfileNameLength = 25

--[[
  Saved addon variable
]]--
PVPWarnProfiles = {}

--[[
  Default profiles consider the class from the player that uses the addon. As an
  example lets assume the player is a warrior. What are the spells a warrior absolutely
  needs to know of. Depending on the class a spells importance might greatly differ
  from very important to not interested at all.
]]--

--[[
  TODO
]]--
function me.GetMaxProfileNameLength()
  return maxProfileNameLength
end

--[[
  Create a new profile and add it to the list of profiles

  @param {string} profileName
]]--
function me.CreateProfile(profileName)
  if table.getn(PVPWarnProfiles) >= maxProfiles then
    mod.logger.PrintUserError(
      string.format(rgpvpw.L["user_message_add_new_profile_max_reached"], maxProfiles)
    )
    return
  end

  for i = 1, table.getn(PVPWarnProfiles) do
    if PVPWarnProfiles[i].name == profileName then
      mod.logger.PrintUserError(rgpvpw.L["user_message_select_profile_already_exists"])
      return
    end
  end

  local profile = {
    name = profileName,
    ["spellConfiguration"] = mod.spellMap.GetSpellConfiguration()
  }

  table.insert(PVPWarnProfiles, profile)
  mod.logger.LogInfo(me.tag, "Created new profile with name - " .. profileName)
end

--[[
  Search and delete the profile with the passed name

  @param {string} profileName
]]--
function me.DeleteProfile(profileName)
  if profileName == nil then
    mod.logger.PrintUserError(rgpvpw.L["user_message_select_profile_before_delete"])
    return
  end

  for i = 1, #PVPWarnProfiles do
    if PVPWarnProfiles[i].name == profileName then
      table.remove(PVPWarnProfiles, i)
      mod.logger.LogInfo(me.tag, "Deleted profile with name - " .. profileName)
      return
    end
  end
end

function me.LoadProfile(profileName)
  if profileName == nil then
    mod.logger.PrintUserError(rgpvpw.L["user_message_select_profile_before_load"])
    return
  end
end
