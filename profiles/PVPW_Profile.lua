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

-- luacheck: globals UnitClass strlower GetAddOnMetadata

local mod = rgpvpw
local me = {}
mod.profile = me

me.tag = "Profile"

-- allow for a maximum of 10 profiles
local maxProfiles = 10
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
  Returns the maximal length of a profile name

  @return {number}
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
    version = GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Version"),
    ["spellConfiguration"] = mod.configuration.GetSpellConfiguration(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL),
    ["spellSelfAvoidConfiguration"] =
      mod.configuration.GetSpellConfiguration(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID),
    ["spellEnemyAvoidConfiguration"] =
      mod.configuration.GetSpellConfiguration(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID)
  }

  table.insert(PVPWarnProfiles, profile)
  mod.logger.LogInfo(me.tag, "Created new profile with name - " .. profileName)
end

--[[
  Search and delete the profile with the passed name.
  Note: Deleting a profile has no effect on the current profile
  even if the current profile is the deleted profile. There is no concept of a
  reference of the current active profile. There is just a simple storage of
  configurations. Once such a configuration is loaded there is no connection to
  the stored profile.

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

--[[
  Search for the profile with the passed profile name and load it.
  Note: Overrides the current spell configuration

  @param {string} profileName
]]--
function me.LoadProfile(profileName)
  if profileName == nil then
    mod.logger.PrintUserError(rgpvpw.L["user_message_select_profile_before_load"])
    return
  end

  for i = 1, #PVPWarnProfiles do
    if PVPWarnProfiles[i].name == profileName then
      PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL] = nil
      PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL] = {}
      PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL] = PVPWarnProfiles[i].spellConfiguration

      PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID] = nil
      PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID] = {}
      PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID] =
        PVPWarnProfiles[i].spellSelfAvoidConfiguration

      PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID] = nil
      PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID] = {}
      PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID] =
        PVPWarnProfiles[i].spellEnemyAvoidConfiguration
      mod.logger.LogInfo(me.tag, "Loaded profile with name: " .. PVPWarnProfiles[i].name)

      return
    end
  end
end

--[[
  Load the default profile for the current class

  Note: Overrides the current spell configuration
]]--
function me.LoadDefaultProfile()
  local _, englishClass = UnitClass(RGPVPW_CONSTANTS.UNIT_ID_PLAYER)

  PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL] = nil
  PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL] = {}
  PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL] =
    mod[strlower(englishClass) .. "Profile"].GetSpellProfile(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL)

  PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID] = nil
  PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID] = {}
  PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID] =
    mod[strlower(englishClass) .. "Profile"].GetSpellProfile(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID)

  PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID] = nil
  PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID] = {}
  PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID] =
    mod[strlower(englishClass) .. "Profile"].GetSpellProfile(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID)

  mod.logger.LogInfo(me.tag, "Loaded default profile for: " .. englishClass)
end
