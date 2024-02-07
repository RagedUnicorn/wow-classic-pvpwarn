--[[
  MIT License

  Copyright (c) 2024 Michael Wiesendanger

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

-- luacheck: globals UnitClass strlower GetAddOnMetadata table.wipe

local mod = rgpvpw
local me = {}
mod.profile = me

me.tag = "Profile"

-- allow for a maximum of 10 profiles
local maxProfiles = 10
local maxProfileNameLength = 25

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
  Initializes the PVPWarnProfiles addon variable for the first time by inserting the classes default profile.
  Afterwards the profile RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME is loaded into the actual configuration
]]--
function me.InitializeDefaultProfile()
  local _, englishClass = UnitClass(RGPVPW_CONSTANTS.UNIT_ID_PLAYER)

  if PVPWarnProfiles ~= nil then
    table.wipe(PVPWarnProfiles)
  end
  --[[
    Saved addon variable
  ]]--
  PVPWarnProfiles = {
    -- load default profile data into PVPWarnProfiles
    {
      ["name"] = RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME,
      ["version"] = GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Version"),
      ["spellConfiguration"] =
        mod[strlower(englishClass) .. "Profile"].GetSpellProfile(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL),
      ["spellSelfAvoidConfiguration"] =
        mod[strlower(englishClass) .. "Profile"].GetSpellProfile(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID),
      ["spellEnemyAvoidConfiguration"] =
        mod[strlower(englishClass) .. "Profile"].GetSpellProfile(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID)
    }
  }
  PVPWarnProfiles.activeProfile = RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME
  PVPWarnProfiles.modified = false

  me.LoadProfile(RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME)
end

--[[
  Create a new profile and add it to the list of profiles. This also sets the created profile as the active one

  @param {string} profileName
]]--
function me.CreateProfile(profileName)
  if #PVPWarnProfiles >= maxProfiles then
    mod.logger.PrintUserError(
      string.format(rgpvpw.L["user_message_add_new_profile_max_reached"], maxProfiles)
    )
    return
  end

  for i = 1, #PVPWarnProfiles do
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

  PVPWarnProfiles.activeProfile = profileName
  PVPWarnProfiles.modified = false
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

  if profileName == RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME then
    mod.logger.PrintUserError(rgpvpw.L["user_message_default_profile_cannot_be_deleted"])
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
      if PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL] ~= nil then
        table.wipe(PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL])
      end
      PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL] =
        mod.common.Clone(PVPWarnProfiles[i].spellConfiguration)

      if PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID] ~= nil then
        table.wipe(PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID])
      end
      PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID] =
        mod.common.Clone(PVPWarnProfiles[i].spellSelfAvoidConfiguration)

      if PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID] ~= nil then
        table.wipe(PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID])
      end
      PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID] =
        mod.common.Clone(PVPWarnProfiles[i].spellEnemyAvoidConfiguration)

      PVPWarnProfiles.activeProfile = PVPWarnProfiles[i].name
      PVPWarnProfiles.modified = false
      mod.logger.LogInfo(me.tag, "Loaded profile with name: " .. PVPWarnProfiles[i].name)

      return
    end
  end

  mod.logger.LogWarn(me.tag, "Unable to find profile with name: " .. profileName)
end

--[[
  Updates the selected profile with the currently active configuration

  @param {string} profileName
]]--
function me.UpdateProfile(profileName)
  if profileName == nil then
    mod.logger.PrintUserError(rgpvpw.L["user_message_select_profile_before_update"])
    return
  end

  if profileName == RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME then
    mod.logger.PrintUserError(rgpvpw.L["user_message_default_profile_cannot_be_modified"])
    return
  end

  for i = 1, #PVPWarnProfiles do
    if PVPWarnProfiles[i].name == profileName then
      if PVPWarnProfiles[i].spellConfiguration ~= nil  then
        table.wipe(PVPWarnProfiles[i].spellConfiguration)
      end
      PVPWarnProfiles[i].spellConfiguration =
        mod.common.Clone(PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL])

      if PVPWarnProfiles[i].spellSelfAvoidConfiguration ~= nil  then
        table.wipe(PVPWarnProfiles[i].spellSelfAvoidConfiguration)
      end
      PVPWarnProfiles[i].spellSelfAvoidConfiguration =
        mod.common.Clone(PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID])

      if PVPWarnProfiles[i].spellEnemyAvoidConfiguration ~= nil  then
        table.wipe(PVPWarnProfiles[i].spellEnemyAvoidConfiguration)
      end
      PVPWarnProfiles[i].spellEnemyAvoidConfiguration =
        mod.common.Clone(PVPWarnConfiguration[RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID])

      PVPWarnProfiles.modified = false
      PVPWarnProfiles.activeProfile = PVPWarnProfiles[i].name

      mod.logger.LogInfo(me.tag, "Updated profile with name: " .. PVPWarnProfiles[i].name)

      return
    end
  end

  mod.logger.LogWarn(me.tag, "Unable to find profile with name: " .. profileName)
end

--[[
  Returns the name of the currently active profile. This will only return the name of the last loaded profile. The user
  might have made changes to the loaded profile in the meantime

  @return {string}
]]--
function me.GetActiveProfileName()
  return PVPWarnProfiles.activeProfile
end

--[[
  Returns whether the activated profile was modified in any way.
  Note: This includes any change to the profile even if the change was reverted

  @return {boolean}
    true - if the active profile was modified
    false - if the active profile was not modified
]]--
function me.IsModified()
  return PVPWarnProfiles.modified
end

--[[
  Marks the currently active profile as modified indicating that there was a change to it (that is not saved)
]]--
function me.SetModified()
  PVPWarnProfiles.modified = true
end
