--[[
  MIT License

  Copyright (c) 2026 Michael Wiesendanger

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

--[[
  PVPWarn settings profiles - the family feature every sibling addon carries.

  Two data homes: the live configuration is PVPWarnConfiguration, whose three
  per-spell lists (spellList / spellSelfAvoidList / spellEnemyAvoidList) every
  setter writes and every reader reads. The profile store is PVPWarnProfiles, an
  array of { name, version, spellConfiguration, spellSelfAvoidConfiguration,
  spellEnemyAvoidConfiguration } plus the bookkeeping field activeProfile, the
  name of the profile the live configuration belongs to.

  One stored profile is the ACTIVE profile. The live configuration is what the
  player edits; it is mirrored into the active profile's stored copy at the moments
  that matter - before a switch, on PLAYER_LOGOUT (code/Core.lua), on export, after
  a reset to defaults and at login (EnsureActiveProfile) - so a profile never goes
  stale behind the player's back and switching never loses an edit. Between those
  moments the live SavedVariable is the truth; nothing hooks the individual setters.
  "Default" is the editable home profile every character starts on: seeded from the
  class factory lists only when absent, never deleted or renamed, and reset through
  ResetActiveProfile rather than re-loaded.

  PVPWarn switches profiles without a reload: the three lists are plain tables the
  combat log path reads on every event, so a switch takes effect at once. An open
  category panel shows stale state until it is re-opened.
]]--

-- luacheck: globals UnitClass strlower C_AddOns table.wipe

local mod = rgpvpw
local me = {}
mod.profile = me

me.tag = "Profile"

-- allow for a maximum of 10 profiles
local maxProfiles = 10
local maxProfileNameLength = 30

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

--[[
  Maps each profile payload field to the PVPWarnConfiguration spell list it mirrors
]]--
local PROFILE_FIELD_TO_SPELL_TYPE = {
  ["spellConfiguration"] = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
  ["spellSelfAvoidConfiguration"] = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID,
  ["spellEnemyAvoidConfiguration"] = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID
}

-- forward declaration
local FindProfile
local IsNameTooLong
local GetAddonVersion
local BuildDefaultProfile
local ApplyProfile

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
  @param {string} profileName

  @return {boolean}
    true - if the name is the reserved default profile name
    false - otherwise
]]--
function me.IsDefaultProfile(profileName)
  return profileName == RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME
end

--[[
  @param {string} profileName

  @return {boolean}
    true - if a profile with that name is stored
    false - otherwise
]]--
function me.ProfileExists(profileName)
  return FindProfile(profileName) ~= nil
end

--[[
  Initializes the PVPWarnProfiles addon variable for the first time by inserting the classes default profile.
  Afterwards the profile RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME is loaded into the actual configuration.

  Wipes the whole store - the fresh-install path (Configuration.SetupConfiguration) and the
  v2.0.0 upgrade path (Configuration.UpgradeToV2_0_0) are its only callers. Every other login
  goes through EnsureDefaultProfile, which seeds Default only when it is missing.
]]--
function me.InitializeDefaultProfile()
  if PVPWarnProfiles ~= nil then
    table.wipe(PVPWarnProfiles)
  end
  --[[
    Saved addon variable
  ]]--
  PVPWarnProfiles = {
    -- load default profile data into PVPWarnProfiles
    BuildDefaultProfile()
  }
  PVPWarnProfiles.activeProfile = RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME

  ApplyProfile(PVPWarnProfiles[1])
  mod.logger.LogInfo(me.tag, "Initialized the profile store with the class default profile")
end

--[[
  Seed the undeletable default profile from the class factory lists when the store has
  none - a store from before the live model, or a hand-edited file. Called on every login
  (see code/Core.lua Initialize) right after the configuration was set up and ahead of the
  active profile adoption.

  Never re-seeds: Default is the editable home profile, so its stored copy holds the
  player's own settings whenever it is the active one and the mirror is its only writer
  after the seed. The factory settings stay reachable through ResetActiveProfile.
]]--
function me.EnsureDefaultProfile()
  if PVPWarnProfiles == nil then
    PVPWarnProfiles = {}
  end

  if FindProfile(RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME) ~= nil then return end

  table.insert(PVPWarnProfiles, 1, BuildDefaultProfile())
  mod.logger.LogInfo(me.tag, "Seeded the missing default profile from the class factory lists")
end

--[[
  Adopt the active profile at login (see code/Core.lua Initialize, right after
  EnsureDefaultProfile) and mirror the live configuration into it. A store that names a
  stored profile keeps it - unless it still carries the retired modified flag set to true,
  which the snapshot model used to say "the live lists are not this profile any more"; that
  store, a nil name and a dangling name all fall back to Default. The flag is dropped
  either way. Nothing is lost: the live lists become the active profile's, and the factory
  lists stay reachable through ResetActiveProfile. The closing mirror is also the self-heal
  for a logout the mirror missed (a crash).
]]--
function me.EnsureActiveProfile()
  local name = PVPWarnProfiles.activeProfile

  if PVPWarnProfiles.modified == true or name == nil or FindProfile(name) == nil then
    PVPWarnProfiles.activeProfile = RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME
    mod.logger.LogInfo(me.tag, "Adopted \"" .. RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME
      .. "\" as the active profile (was: " .. tostring(name) .. ")")
  end

  PVPWarnProfiles.modified = nil

  me.SaveActiveProfile()
end

--[[
  Mirror the live configuration into the active profile's stored copy - the one writer of a
  profile from the live state. A nil or dangling active name (a store from before the active
  profile existed, a hand-edited file) is repaired to Default first, so the mirror always
  lands somewhere. The stored profile is stamped with the running addon version.

  Runs before a switch, on PLAYER_LOGOUT, on export, after a reset and at login; between
  those moments the live SavedVariable is the truth.

  @return {string}
    the name the configuration was mirrored into
]]--
function me.SaveActiveProfile()
  local name = PVPWarnProfiles.activeProfile
  local profile = name ~= nil and FindProfile(name) or nil

  if profile == nil then
    me.EnsureDefaultProfile()
    name = RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME
    profile = FindProfile(name)
    PVPWarnProfiles.activeProfile = name
  end

  for _, field in ipairs(PROFILE_PAYLOAD_FIELDS) do
    profile[field] = mod.common.Clone(PVPWarnConfiguration[PROFILE_FIELD_TO_SPELL_TYPE[field]])
  end

  profile.version = GetAddonVersion()

  return name
end

--[[
  Create a new profile from the live configuration and make it the active one. The
  profile that was active keeps everything edited up to now (it is mirrored first).

  @param {string} profileName

  @return {boolean}
    true - if the profile was created
    false - if the name was invalid, taken, or the profile limit is reached
]]--
function me.CreateProfile(profileName)
  if not profileName or profileName == "" then
    mod.logger.LogWarn(me.tag, "CreateProfile called with invalid profile name")
    return false
  end

  if IsNameTooLong(profileName) then
    mod.logger.PrintUserError(
      string.format(rgpvpw.L["user_message_profile_name_too_long"], maxProfileNameLength)
    )
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

  me.SaveActiveProfile()

  local profile = {
    name = profileName,
    version = GetAddonVersion()
  }

  for _, field in ipairs(PROFILE_PAYLOAD_FIELDS) do
    profile[field] = mod.configuration.GetSpellConfiguration(PROFILE_FIELD_TO_SPELL_TYPE[field])
  end

  table.insert(PVPWarnProfiles, profile)
  mod.logger.LogInfo(me.tag, "Created new profile with name - " .. profileName)

  PVPWarnProfiles.activeProfile = profileName

  return true
end

--[[
  Search and delete the profile with the passed name. The default profile can never be
  deleted. Deleting the active profile falls back to Default: its stored copy is applied
  to the live configuration and it becomes the active one - with no mirror before or
  after, which would only resurrect the deleted profile.

  @param {string} profileName

  @return {boolean}, {boolean}
    true on success, false for an invalid, unknown or the default profile name;
    whether the live configuration fell back to Default (the active profile went)
]]--
function me.DeleteProfile(profileName)
  if not profileName or profileName == "" then
    mod.logger.LogWarn(me.tag, "DeleteProfile called with invalid profile name")
    return false, false
  end

  if me.IsDefaultProfile(profileName) then
    mod.logger.LogWarn(me.tag, "DeleteProfile refused for the default profile")
    return false, false
  end

  local profile, index = FindProfile(profileName)

  if profile == nil then return false, false end

  table.remove(PVPWarnProfiles, index)
  mod.logger.LogInfo(me.tag, "Deleted profile with name - " .. profileName)

  if PVPWarnProfiles.activeProfile ~= profileName then
    return true, false
  end

  me.EnsureDefaultProfile()
  ApplyProfile(FindProfile(RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME))
  PVPWarnProfiles.activeProfile = RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME
  mod.logger.LogInfo(me.tag, "Deleted the active profile - fell back to the default profile")

  return true, true
end

--[[
  Switch to a stored profile: mirror the live configuration into the active profile first,
  so nothing edited since it was activated is lost, then load the target's lists into the
  live configuration and make it the active one. No reload - the combat log path reads the
  lists on the next event; an open category panel re-reads them when it is re-opened.
  Switching to the profile that is active already is a no-op.

  @param {string} profileName

  @return {boolean}
    true on a real switch, false for an unknown name or the active profile
]]--
function me.SwitchProfile(profileName)
  if not profileName or profileName == "" then
    mod.logger.LogWarn(me.tag, "SwitchProfile called with invalid profile name")
    return false
  end

  local profile = FindProfile(profileName)

  if profile == nil then
    mod.logger.LogWarn(me.tag, "Unable to find profile with name: " .. profileName)
    return false
  end

  if PVPWarnProfiles.activeProfile == profile.name then
    mod.logger.LogInfo(me.tag, "Profile is active already: " .. profile.name)
    return false
  end

  me.SaveActiveProfile()
  ApplyProfile(profile)
  PVPWarnProfiles.activeProfile = profile.name
  mod.logger.LogInfo(me.tag, "Switched to profile with name: " .. profile.name)

  return true
end

--[[
  Alias of SwitchProfile kept for callers of the snapshot-era name (macros written against
  rgpvpw.profile.LoadProfile). New code calls SwitchProfile.
]]--
me.LoadProfile = me.SwitchProfile

--[[
  Reset the active profile to the factory settings: the class factory lists are written
  into the live configuration and mirrored into the active profile. This is what "reset to
  defaults" means since Default became an editable profile - loading Default no longer
  resets anything.
]]--
function me.ResetActiveProfile()
  ApplyProfile(BuildDefaultProfile())
  me.SaveActiveProfile()
  mod.logger.LogInfo(me.tag, "Reset the active profile to the class factory lists")
end

--[[
  Rename a stored profile in place (it keeps its spot in the list). The default profile can
  neither be renamed nor be replaced by renaming another profile onto its name; an empty,
  overlong or taken name is refused. Renaming the active profile moves the active name
  along.

  @param {string} oldName
  @param {string} newName

  @return {boolean}
    true - if the profile was renamed
    false - if the rename was refused (the user message was printed where one applies)
]]--
function me.RenameProfile(oldName, newName)
  if not oldName or oldName == "" or not newName or newName == "" then
    mod.logger.LogWarn(me.tag, "RenameProfile called with invalid profile name")
    return false
  end

  if me.IsDefaultProfile(oldName) or me.IsDefaultProfile(newName) then
    mod.logger.PrintUserError(rgpvpw.L["user_message_default_profile_cannot_be_renamed"])
    return false
  end

  if IsNameTooLong(newName) then
    mod.logger.PrintUserError(
      string.format(rgpvpw.L["user_message_profile_name_too_long"], maxProfileNameLength)
    )
    return false
  end

  local profile = FindProfile(oldName)

  if profile == nil then
    mod.logger.LogWarn(me.tag, "Unable to find profile with name: " .. oldName)
    return false
  end

  if newName == oldName then
    return true
  end

  if FindProfile(newName) ~= nil then
    mod.logger.PrintUserError(rgpvpw.L["user_message_select_profile_already_exists"])
    return false
  end

  profile.name = newName

  if PVPWarnProfiles.activeProfile == oldName then
    PVPWarnProfiles.activeProfile = newName
  end

  mod.logger.LogInfo(me.tag, "Renamed profile " .. oldName .. " to " .. newName)

  return true
end

--[[
  Returns the name of the currently active profile - the profile the live configuration
  belongs to and is mirrored into.

  @return {string}
]]--
function me.GetActiveProfileName()
  return PVPWarnProfiles.activeProfile
end

--[[
  Encode a stored profile into a portable, copy-pasteable string. The live configuration
  is mirrored into the active profile first, so exporting the active profile always
  carries the settings as they are now.

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

  me.SaveActiveProfile()

  local payload = {}

  for _, field in ipairs(PROFILE_PAYLOAD_FIELDS) do
    payload[field] = profile[field]
  end

  local envelope = {
    addon = ADDON_TAG,
    schemaVersion = SCHEMA_VERSION,
    addonVersion = GetAddonVersion(),
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

  if IsNameTooLong(profileName) then
    mod.logger.PrintUserError(
      string.format(rgpvpw.L["user_message_profile_name_too_long"], maxProfileNameLength)
    )
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
    version = GetAddonVersion()
  }

  for _, field in ipairs(PROFILE_PAYLOAD_FIELDS) do
    profile[field] = mod.common.Clone(payload[field])
  end

  table.insert(PVPWarnProfiles, profile)
  mod.logger.LogInfo(me.tag, "Added imported profile with name - " .. profileName)

  return true
end

--[[
  Whether a profile name exceeds the maximum allowed length. A plain `#profileName`
  would count bytes and cut a localized name short, so continuation bytes (0x80-0xBF)
  of a utf-8 sequence are not counted.

  @param {string} profileName

  @return {boolean}
    true - if the name is longer than maxProfileNameLength characters
    false - otherwise
]]--
IsNameTooLong = function(profileName)
  if type(profileName) ~= "string" then
    return false
  end

  local _, count = string.gsub(profileName, "[^\128-\191]", "")

  return count > maxProfileNameLength
end

--[[
  Search for the profile with the passed name in the PVPWarnProfiles store.

  @param {string} profileName

  @return {table | nil}, {number | nil}
    the stored profile and its index, or nil if no such profile exists
]]--
FindProfile = function(profileName)
  for i = 1, #PVPWarnProfiles do
    if PVPWarnProfiles[i].name == profileName then
      return PVPWarnProfiles[i], i
    end
  end

  return nil
end

--[[
  @return {string}
    the running addon version, stamped onto every stored profile
]]--
GetAddonVersion = function()
  return C_AddOns.GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Version")
end

--[[
  Build the class factory profile: the Default profile as a fresh character gets it, seeded
  from the per-class profile module of the logged-in character. Every call returns fresh
  tables (GetSpellProfile clones), so a caller may hand them to the live configuration.

  @return {table}
    a stored-profile shaped table named RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME
]]--
BuildDefaultProfile = function()
  local _, englishClass = UnitClass(RGPVPW_CONSTANTS.UNIT_ID_PLAYER)
  local classProfile = mod[strlower(englishClass) .. "Profile"]
  local profile = {
    ["name"] = RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME,
    ["version"] = GetAddonVersion()
  }

  for _, field in ipairs(PROFILE_PAYLOAD_FIELDS) do
    profile[field] = classProfile.GetSpellProfile(PROFILE_FIELD_TO_SPELL_TYPE[field])
  end

  return profile
end

--[[
  Overwrite the three live spell lists of PVPWarnConfiguration with clones of a stored
  profile's lists. Does not touch activeProfile - the caller decides what the live
  configuration now belongs to.

  @param {table} profile
    a stored profile (or a table shaped like one)
]]--
ApplyProfile = function(profile)
  for _, field in ipairs(PROFILE_PAYLOAD_FIELDS) do
    PVPWarnConfiguration[PROFILE_FIELD_TO_SPELL_TYPE[field]] = mod.common.Clone(profile[field])
  end
end
