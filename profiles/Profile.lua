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

-- luacheck: globals UnitClass strlower C_AddOns table.wipe

local mod = rgpvpw
local me = {}
mod.profile = me

me.tag = "Profile"

-- allow for a maximum of 10 profiles
local maxProfiles = 10
local maxProfileNameLength = 25

--[[
  Bumped when the on-the-wire profile payload changes shape. Import refuses any
  string whose schemaVersion is newer than this build understands.
]]--
local SCHEMA_VERSION = 1
--[[
  Identifies a PVPWarn profile string and lets import fast-reject foreign
  strings before any decoding. The authoritative provenance check is the
  envelope's addon/schemaVersion fields.
]]--
local EXPORT_PREFIX = "PVPWarn1:"
local ADDON_TAG = "PVPWarn"

--[[
  The profile fields that make up a portable profile payload - exactly the
  spell configurations the PVPWarnProfiles store already keeps per profile.
]]--
local PROFILE_PAYLOAD_FIELDS = {
  "spellConfiguration",
  "spellSelfAvoidConfiguration",
  "spellEnemyAvoidConfiguration"
}

-- forward declaration
local FindProfile

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
      ["version"] = C_AddOns.GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Version"),
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
  if not profileName or profileName == "" then
    mod.logger.LogWarn(me.tag, "CreateProfile called with invalid profile name")
    return
  end

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
    version = C_AddOns.GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Version"),
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
  if not profileName or profileName == "" then
    mod.logger.LogWarn(me.tag, "DeleteProfile called with invalid profile name")
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
  if not profileName or profileName == "" then
    mod.logger.LogWarn(me.tag, "LoadProfile called with invalid profile name")
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
  if not profileName or profileName == "" then
    mod.logger.LogWarn(me.tag, "UpdateProfile called with invalid profile name")
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

--[[
  Encode a stored profile into a portable, copy-pasteable string.

  @param {string} profileName
    name of a profile in the PVPWarnProfiles store

  @return {string | nil}
    the export string, or nil if no profile with that name exists
]]--
function me.ExportString(profileName)
  local profile = FindProfile(profileName)

  if profile == nil then
    mod.logger.LogWarn(me.tag, "ExportString unable to find profile with name: " .. tostring(profileName))
    return nil
  end

  local payload = {}

  for _, field in ipairs(PROFILE_PAYLOAD_FIELDS) do
    payload[field] = profile[field]
  end

  local envelope = {
    addon = ADDON_TAG,
    schemaVersion = SCHEMA_VERSION,
    addonVersion = C_AddOns.GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Version"),
    name = profile.name,
    payload = payload
  }

  return EXPORT_PREFIX .. mod.encoder.Encode(mod.serializer.Serialize(envelope))
end

--[[
  Decode and validate a profile string. Never raises - returns a localization
  error key on any failure and leaves all state untouched.

  @param {string} encoded

  @return {table | nil}, {string | nil}
    the decoded envelope { addon, schemaVersion, addonVersion, name, payload },
    or nil plus a localization key describing the failure
]]--
function me.ImportString(encoded)
  if type(encoded) ~= "string" then
    return nil, "profile_error_invalid"
  end

  -- strip any whitespace a paste may have wrapped around / into the string
  encoded = string.gsub(encoded, "%s+", "")

  if encoded == "" then
    return nil, "profile_error_empty"
  end

  if string.sub(encoded, 1, #EXPORT_PREFIX) ~= EXPORT_PREFIX then
    return nil, "profile_error_invalid"
  end

  local serialized, decodeErr = mod.encoder.Decode(string.sub(encoded, #EXPORT_PREFIX + 1))

  if not serialized then
    if decodeErr == "checksum" then
      return nil, "profile_error_checksum"
    end

    return nil, "profile_error_invalid"
  end

  local envelope = mod.serializer.Deserialize(serialized)

  if type(envelope) ~= "table" then
    return nil, "profile_error_invalid"
  end

  if envelope.addon ~= ADDON_TAG then
    return nil, "profile_error_wrong_addon"
  end

  if type(envelope.schemaVersion) ~= "number" or envelope.schemaVersion > SCHEMA_VERSION then
    return nil, "profile_error_version"
  end

  if type(envelope.payload) ~= "table" then
    return nil, "profile_error_invalid"
  end

  for _, field in ipairs(PROFILE_PAYLOAD_FIELDS) do
    if type(envelope.payload[field]) ~= "table" then
      return nil, "profile_error_invalid"
    end
  end

  return envelope
end

--[[
  Add an imported profile payload to the PVPWarnProfiles store under the passed
  name. Enforces the same limits as me.CreateProfile but does NOT activate the
  new profile - an imported profile does not match the live configuration until
  the user explicitly loads it.

  @param {string} profileName
  @param {table} payload
    a validated payload as returned inside a me.ImportString envelope

  @return {boolean}
    true - if the profile was added
    false - if the name was invalid, taken, or the profile limit is reached
]]--
function me.AddImportedProfile(profileName, payload)
  if not profileName or profileName == "" then
    mod.logger.LogWarn(me.tag, "AddImportedProfile called with invalid profile name")
    return false
  end

  if #PVPWarnProfiles >= maxProfiles then
    mod.logger.PrintUserError(
      string.format(rgpvpw.L["user_message_add_new_profile_max_reached"], maxProfiles)
    )
    return false
  end

  if FindProfile(profileName) ~= nil then
    mod.logger.PrintUserError(rgpvpw.L["user_message_select_profile_already_exists"])
    return false
  end

  local profile = {
    name = profileName,
    version = C_AddOns.GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Version")
  }

  for _, field in ipairs(PROFILE_PAYLOAD_FIELDS) do
    profile[field] = mod.common.Clone(payload[field])
  end

  table.insert(PVPWarnProfiles, profile)
  mod.logger.LogInfo(me.tag, "Added imported profile with name - " .. profileName)

  return true
end

--[[
  Search for the profile with the passed name in the PVPWarnProfiles store.

  @param {string} profileName

  @return {table | nil}
    the stored profile, or nil if no such profile exists
]]--
FindProfile = function(profileName)
  for i = 1, #PVPWarnProfiles do
    if PVPWarnProfiles[i].name == profileName then
      return PVPWarnProfiles[i]
    end
  end

  return nil
end
