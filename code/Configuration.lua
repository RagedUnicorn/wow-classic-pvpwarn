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

-- luacheck: globals C_AddOns UnitClass strlower

local mod = rgpvpw
local me = {}
mod.configuration = me

me.tag = "AddonOptions"

--[[
  Saved addon variable
]]--
PVPWarnConfiguration = {
  --[[
    Enemy spells being casted/used/activated
  ]]--
  ["spellList"] = nil,
  --[[
    Spells the player avoided
  ]]--
  ["spellSelfAvoidList"] = nil,
  --[[
    Spells an enemy avoided
  ]]--
  ["spellEnemyAvoidList"] = nil,
  --[[
    Whether combat state tracking is enabled or not
  ]]--
  ["enableCombatStateTracking"] = true,
  --[[
    Whether the frame to track an enemies combat state is locked or not
  ]]--
  ["lockCombatStateFrame"] = true,
  --[[
    Whether stance state tracking is enabled or not
  ]]--
  ["enableStanceStateTracking"] = true,
  --[[
    Whether the frame to track an enemies stance state is locked or not
  ]]--
  ["lockStanceStateFrame"] = true,
  --[[
    Whether to hide the stance icon when the stance is unknown
  ]]--
  ["hideUnknownStance"] = false,
  --[[
    A configuration object that tracks in what places the addon should be enabled or disabled. This mostly helps prevent
    spamming events in places where the player doesn't want to receive warnings.
  ]]--
  ["addonZoneConfiguration"] = nil,
  --[[
    The active voice pack name, "default" for built-in sounds
  ]]--
  ["activeVoicePack"] = RGPVPW_CONSTANTS.DEFAULT_VOICE_PACK_NAME,
  --[[
    Framepositions for user draggable Frames
    frames = {
      -- should match the actual frame name
      ["Framename"] = {
      point: "CENTER",
        posX: 0,
        posY: 0
      }
      ...
    }
  ]]--
  ["frames"] = {},
  --[[
    Detection bar settings. The detection bar is a third warning channel (next to sound and
    visual) that surfaces a horizontal alert bar when a tracked enemy spell fires.

    detectionBar = {
      enabled = {boolean},                  -- global on/off switch for the channel
      maxBars = {number},                   -- maximum amount of visible stacked bars (1-4)
      scale = {number},                     -- overall bar size factor (1.0 = 100%)
      dedupWindow = {number},               -- seconds within which a repeated (player, spell) is deduped
      hintShown = {boolean}                 -- whether the one-time discovery hint has been shown
    }
  ]]--
  ["detectionBar"] = {
    ["enabled"] = true,
    ["maxBars"] = 4,
    ["scale"] = 1.0,
    ["dedupWindow"] = 1.0,
    ["hintShown"] = false
  },
  --[[
    Vignette flash settings. The flash is the modern replacement for the cloudy screen
    flash - a soft full-screen vignette that fires on the same per-spell visual warning
    opt-in (visualWarningColor) as before.

    flash = {
      enabled = {boolean},      -- global on/off switch for the channel
      maxOpacity = {number},    -- peak opacity of the flash (0.1 - 1.0)
      pulse = {boolean},        -- whether the lifecycle includes the extra pulse step
      blendMode = {string}      -- texture blend mode, "BLEND" or "ADD"
    }
  ]]--
  ["flash"] = {
    ["enabled"] = true,
    ["maxOpacity"] = 0.85,
    ["pulse"] = true,
    ["blendMode"] = "BLEND"
  }
}

--[[
  Set default values if property is nil. This might happen after an addon upgrade
]]--
function me.SetupConfiguration()
  -- initialize all spellLists for the first time with default profile
  if PVPWarnConfiguration.spellList == nil or PVPWarnConfiguration.spellSelfAvoidList == nil
      or PVPWarnConfiguration.spellEnemyAvoidList == nil then
    mod.profile.InitializeDefaultProfile()
  end

  if PVPWarnConfiguration.enableCombatStateTracking == nil then
    mod.logger.LogInfo(me.tag, "enableCombatStateTracking has unexpected nil value")
    PVPWarnConfiguration.enableCombatStateTracking = true
  end

  if PVPWarnConfiguration.lockCombatStateFrame == nil then
    mod.logger.LogInfo(me.tag, "lockCombatStateFrame has unexpected nil value")
    PVPWarnConfiguration.lockCombatStateFrame = true
  end

  if PVPWarnConfiguration.enableStanceStateTracking == nil then
    mod.logger.LogInfo(me.tag, "enableStanceStateTracking has unexpected nil value")
    PVPWarnConfiguration.enableStanceStateTracking = true
  end

  if PVPWarnConfiguration.lockStanceStateFrame == nil then
    mod.logger.LogInfo(me.tag, "lockStanceStateFrame has unexpected nil value")
    PVPWarnConfiguration.lockStanceStateFrame = true
  end

  if PVPWarnConfiguration.hideUnknownStance == nil then
    mod.logger.LogInfo(me.tag, "hideUnknownStance has unexpected nil value")
    PVPWarnConfiguration.hideUnknownStance = false
  end

  if PVPWarnConfiguration.addonZoneConfiguration == nil then
    mod.logger.LogInfo(me.tag, "addonZoneConfiguration has unexpected nil value")
    PVPWarnConfiguration.addonZoneConfiguration  = mod.zone.InitializeDefaultZoneConfiguration()
  end

  if PVPWarnConfiguration.frames == nil then
    mod.logger.LogInfo(me.tag, "frames has unexpected nil value")
    PVPWarnConfiguration.frames = {}
  end

  -- Migrate nil to "default" for existing users
  if PVPWarnConfiguration.activeVoicePack == nil then
    PVPWarnConfiguration.activeVoicePack = RGPVPW_CONSTANTS.DEFAULT_VOICE_PACK_NAME
  end

  me.SetupDetectionBarConfiguration()
  me.SetupFlashConfiguration()

  --[[
    Set saved variables with addon version. This can be used later to determine whether
    a migration path applies to the current saved variables or not
  ]]--
  me.SetAddonVersion()
end

--[[
  Backfill the detectionBar configuration block. New SavedVariables keys are added the
  idiomatic way - a nil-check that runs after an addon upgrade - so existing players gain
  the detection bar settings without a dedicated migration path. Each sub-key is backfilled
  individually so a partial upgrade (block present but missing a newer field) self-heals.
]]--
function me.SetupDetectionBarConfiguration()
  if PVPWarnConfiguration.detectionBar == nil then
    mod.logger.LogInfo(me.tag, "detectionBar has unexpected nil value")
    PVPWarnConfiguration.detectionBar = {}
  end

  local detectionBar = PVPWarnConfiguration.detectionBar
  local defaults = {
    ["enabled"] = true,
    ["maxBars"] = 4,
    ["scale"] = 1.0,
    ["dedupWindow"] = 1.0,
    ["hintShown"] = false
  }

  for key, value in pairs(defaults) do
    if detectionBar[key] == nil then
      detectionBar[key] = value
    end
  end
end

--[[
  Backfill the flash configuration block. Mirrors SetupDetectionBarConfiguration - new
  SavedVariables keys are added with a nil-check that runs after an addon upgrade, so
  existing players gain the flash settings without a dedicated migration path. Each sub-key
  is backfilled individually so a partial upgrade self-heals.
]]--
function me.SetupFlashConfiguration()
  if PVPWarnConfiguration.flash == nil then
    mod.logger.LogInfo(me.tag, "flash has unexpected nil value")
    PVPWarnConfiguration.flash = {}
  end

  local flash = PVPWarnConfiguration.flash
  local defaults = {
    ["enabled"] = true,
    ["maxOpacity"] = 0.85,
    ["pulse"] = true,
    ["blendMode"] = "BLEND"
  }

  for key, value in pairs(defaults) do
    if flash[key] == nil then
      flash[key] = value
    end
  end
end

--[[
  Set addon version on addon options. Before setting a new version make sure
  to run through migration paths. As of right now there is no migration path.
]]--
function me.SetAddonVersion()
  if PVPWarnConfiguration.addonVersion == C_AddOns.GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Version") then
    return
  end
  -- if no version set so far make sure to set the current one
  if PVPWarnConfiguration.addonVersion == nil then
    PVPWarnConfiguration.addonVersion = C_AddOns.GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Version")
  end

  me.MigrationPath()
  -- migration done update addon version to current
  PVPWarnConfiguration.addonVersion = C_AddOns.GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Version")
end

--[[
  Migration path for older version to newest version. For now this migration path
  is running each time the addon starts. Later versions should consider the save addon
  version before running a migration path
]]--
function me.MigrationPath()
  me.UpgradeToV1_1_2()
  me.UpgradeToV2_0_0()
end

--[[
  Should be run by versions: All < v1.1.2
  Description: Version before did not have a default profile entry in PVPWarnProfiles
]]--
function me.UpgradeToV1_1_2()
  local versions = {"v1.1.1", "v1.1.0", "v1.0.0"}
  local shouldRunUpgradePath = false

  for _, version in pairs(versions) do
    if PVPWarnConfiguration.addonVersion == version then
      shouldRunUpgradePath = true
      break
    end
  end

  if not shouldRunUpgradePath then return end

  mod.logger.LogDebug(me.tag, "Running upgrade path from " .. PVPWarnConfiguration.addonVersion .. " to v1.1.2")

  if PVPWarnProfiles ~= nil then
    local _, englishClass = UnitClass(RGPVPW_CONSTANTS.UNIT_ID_PLAYER)
    local defaultProfile = {
      -- load default profile data into PVPWarnProfiles
      ["name"] = RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME,
      ["version"] = C_AddOns.GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Version"),
      ["spellConfiguration"] =
      mod[strlower(englishClass) .. "Profile"].GetSpellProfile(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL),
      ["spellSelfAvoidConfiguration"] =
      mod[strlower(englishClass) .. "Profile"].GetSpellProfile(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID),
      ["spellEnemyAvoidConfiguration"] =
      mod[strlower(englishClass) .. "Profile"].GetSpellProfile(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID)
    }
    table.insert(PVPWarnProfiles, defaultProfile)
  end

  mod.logger.LogDebug(me.tag, "Finished upgrade path from " .. PVPWarnConfiguration.addonVersion .. " to v1.1.2")
end

--[[
  Should be run by versions: All < v2.0.0
  Description: Profiles structure changed significantly in v2.0.0. This upgrade path checks all
  existing profiles and if any have an old version (or no version), all profiles are reset
  to ensure consistency with the new structure.
]]--
function me.UpgradeToV2_0_0()
  local versions = {"v1.1.11", "v1.2.0", "v1.2.1", "v1.2.2", "v1.2.3", "v1.2.4", "v1.2.5", "v1.2.6", "v1.2.7", "v1.2.8"}
  local shouldRunUpgradePath = false

  for _, version in pairs(versions) do
    if PVPWarnConfiguration.addonVersion == version then
      shouldRunUpgradePath = true
      break
    end
  end

  if not shouldRunUpgradePath then return end

  mod.logger.LogDebug(me.tag, "Running upgrade path from " .. PVPWarnConfiguration.addonVersion .. " to v2.0.0")

  -- Check if profiles exist and need to be upgraded
  if PVPWarnProfiles then
    local needsProfileUpgrade = false

    -- Check each profile's version
    for i = 1, #PVPWarnProfiles do
      local profile = PVPWarnProfiles[i]

      -- If profile has no version field, it needs upgrade
      if not profile.version then
        needsProfileUpgrade = true
        mod.logger.LogDebug(me.tag, "Found profile without version field: " .. (profile.name or "unnamed"))
        break
      end

      -- Check if profile version is one of the old versions
      for _, oldVersion in pairs(versions) do
        if profile.version == oldVersion then
          needsProfileUpgrade = true
          mod.logger.LogDebug(me.tag, "Found profile with old version: " .. profile.name .. " - " .. profile.version)
          break
        end
      end

      if needsProfileUpgrade then break end
    end

    -- If any profile needs upgrade, reinitialize all profiles
    if needsProfileUpgrade then
      mod.logger.LogInfo(me.tag, "Profiles need upgrade - reinitializing with default profile")
      mod.profile.InitializeDefaultProfile()
      -- Inform the user about the profile reset
      print("|cFF00FFB0" .. RGPVPW_CONSTANTS.ADDON_NAME .. ":|r "
        .. rgpvpw.L["user_message_profiles_reset_for_upgrade"])
    end
  end

  mod.logger.LogDebug(me.tag, "Finished upgrade path from " .. PVPWarnConfiguration.addonVersion .. " to v2.0.0")
end

--[[
  Enable combat state tracking
]]--
function me.EnableCombatStateTracking()
  PVPWarnConfiguration.enableCombatStateTracking = true
  -- no actual work needed. Combat state tracking will start once the player acquires a target
end

--[[
  Disable combat state tracking
]]--
function me.DisableCombatStateTracking()
  PVPWarnConfiguration.enableCombatStateTracking = false
  mod.combatState.DisableCombatStateTracking()
end

--[[
  @return {boolean}
    true - if combat state tracking is enabled
    false - if combat state tracking is disabled
]]--
function me.IsCombatStateTrackingEnabled()
  return PVPWarnConfiguration.enableCombatStateTracking
end

--[[
  Lock combat state frame
]]--
function me.LockCombatStateFrame()
  PVPWarnConfiguration.lockCombatStateFrame = true
end

--[[
  Unlock combat state frame
]]--
function me.UnlockCombatStateFrame()
  PVPWarnConfiguration.lockCombatStateFrame = false
end

--[[
  @return {boolean}
    true - if combat state frame is locked
    false - if combat state frame is unlocked
]]--
function me.IsCombatStateFrameLocked()
  return PVPWarnConfiguration.lockCombatStateFrame
end

--[[
  Enable stance state tracking
]]--
function me.EnableStanceStateTracking()
  PVPWarnConfiguration.enableStanceStateTracking = true
  mod.stanceState.EnableStanceStateTracking()
end

--[[
  Disable stance state tracking
]]--
function me.DisableStanceStateTracking()
  PVPWarnConfiguration.enableStanceStateTracking = false
  mod.stanceState.DisableStanceStateTracking()
end

--[[
  @return {boolean}
    true - if stance state tracking is enabled
    false - if stance state tracking is disabled
]]--
function me.IsStanceStateTrackingEnabled()
  return PVPWarnConfiguration.enableStanceStateTracking
end

--[[
  Lock stance state frame
]]--
function me.LockStanceStateFrame()
  PVPWarnConfiguration.lockStanceStateFrame = true
end

--[[
  Unlock stance state frame
]]--
function me.UnlockStanceStateFrame()
  PVPWarnConfiguration.lockStanceStateFrame = false
end

--[[
  @return {boolean}
    true - if stance state frame is locked
    false - if stance state frame is unlocked
]]--
function me.IsStanceStateFrameLocked()
  return PVPWarnConfiguration.lockStanceStateFrame
end

--[[
  Enable hide unknown stance
]]--
function me.EnableHideUnknownStance()
  PVPWarnConfiguration.hideUnknownStance = true
end

--[[
  Disable hide unknown stance
]]--
function me.DisableHideUnknownStance()
  PVPWarnConfiguration.hideUnknownStance = false
end

--[[
  @return {boolean}
    true - if hide unknown stance is enabled
    false - if hide unknown stance is disabled
]]--
function me.IsHideUnknownStanceEnabled()
  return PVPWarnConfiguration.hideUnknownStance
end

--[[
  Save the position of a frame in the addon variables allowing to persist its position

  @param {string} frameName
  @param {string} point
  @param {string} relativeTo
  @param {string} relativePoint
  @param {number} posX
  @param {number} posY
]]--
function me.SaveUserPlacedFramePosition(frameName, point, relativeTo, relativePoint, posX, posY)
  if PVPWarnConfiguration.frames[frameName] == nil then
    PVPWarnConfiguration.frames[frameName] = {}
  end

  PVPWarnConfiguration.frames[frameName].posX = posX
  PVPWarnConfiguration.frames[frameName].posY = posY
  PVPWarnConfiguration.frames[frameName].point = point
  PVPWarnConfiguration.frames[frameName].relativeTo = relativeTo
  PVPWarnConfiguration.frames[frameName].relativePoint = relativePoint

  mod.logger.LogDebug(me.tag, "Saved frame position for - " .. frameName
    .. " - new pos: posX " .. posX .. " posY " .. posY .. " point " .. point)
end

--[[
  Get the position of a saved frame

  @param {string} frameName

  @return {table | nil}
    table - the returned x and y position
    nil - if no frame with the passed name could be found
]]--
function me.GetUserPlacedFramePosition(frameName)
  local frameConfig = PVPWarnConfiguration.frames[frameName]

  if type(frameConfig) == "table" then
    return frameConfig
  end

  return nil
end

--[[
  Returns a clone of the current spell configuration. Cloning is used to prevent
  any connection to the current spell configuration.

  @param {string} spellType
    See RGPVPW_CONSTANTS.SPELL_TYPE

  @return {table}
    A copy of the current spell configuration
]]--
function me.GetSpellConfiguration(spellType)
  return mod.common.Clone(PVPWarnConfiguration[spellType])
end

--[[
  Enable addon in a specific zone
  Note: ZoneId can be an instanceId or mapId

  @param {number} zoneId
    A zone from RGPVPW_ZONE
]]--
function me.EnableZone(zoneId)
  if PVPWarnConfiguration.addonZoneConfiguration[zoneId] ~= nil then
    PVPWarnConfiguration.addonZoneConfiguration[zoneId].enabled = true
    mod.zone.UpdateZone()
  else
    mod.logger.LogWarn(me.tag, "Invalid zoneId ignoring...")
  end
end

--[[
  Disable addon in a specific zone.
  Note: ZoneId can be an instanceId or mapId

  @param {number} zoneId
    A zone from RGPVPW_ZONE
]]--
function me.DisableZone(zoneId)
  if PVPWarnConfiguration.addonZoneConfiguration[zoneId] ~= nil then
    PVPWarnConfiguration.addonZoneConfiguration[zoneId].enabled = false
    mod.zone.UpdateZone()
  else
    mod.logger.LogWarn(me.tag, "Invalid zoneId ignoring...")
  end
end

--[[
  @param {number} zoneId
    A zone from RGPVPW_ZONE

  @return {boolean | nil}
    true - if the zone is enabled or not known to the addon (only certain zones can be configured)
    false - if the zone is not enabled
]]--
function me.IsZoneEnabled(zoneId)
  if PVPWarnConfiguration.addonZoneConfiguration[zoneId] ~= nil then
    return PVPWarnConfiguration.addonZoneConfiguration[zoneId].enabled
  else
    --[[
      Always return true for zones that are not in the configuration
    ]]--
    return true
  end
end

--[[
  Get the active voice pack

  @return {string | nil}
    The name of the active voice pack, or nil if using default
]]--
function me.GetActiveVoicePack()
  return PVPWarnConfiguration.activeVoicePack
end

--[[
  Set the active voice pack

  @param {string | nil} voicePackName
    The name of the voice pack to activate, or nil for default
]]--
function me.SetActiveVoicePack(voicePackName)
  PVPWarnConfiguration.activeVoicePack = voicePackName
end

--[[
  Enable the detection bar warning channel
]]--
function me.EnableDetectionBar()
  PVPWarnConfiguration.detectionBar.enabled = true
end

--[[
  Disable the detection bar warning channel
]]--
function me.DisableDetectionBar()
  PVPWarnConfiguration.detectionBar.enabled = false
end

--[[
  @return {boolean}
    true - if the detection bar warning channel is enabled
    false - if the detection bar warning channel is disabled
]]--
function me.IsDetectionBarEnabled()
  return PVPWarnConfiguration.detectionBar.enabled
end

--[[
  @return {boolean}
    true - if the one-time detection bar discovery hint has already been shown
]]--
function me.IsDetectionBarHintShown()
  return PVPWarnConfiguration.detectionBar.hintShown
end

--[[
  Mark the one-time detection bar discovery hint as shown
]]--
function me.SetDetectionBarHintShown()
  PVPWarnConfiguration.detectionBar.hintShown = true
end

--[[
  @return {number}
    The maximum amount of visible stacked detection bars
]]--
function me.GetDetectionBarMaxBars()
  return PVPWarnConfiguration.detectionBar.maxBars
end

--[[
  @param {number} maxBars
    The maximum amount of visible stacked detection bars (clamped to 1-4)
]]--
function me.SetDetectionBarMaxBars(maxBars)
  if type(maxBars) ~= "number" then return end

  if maxBars < 1 then maxBars = 1 end
  if maxBars > 4 then maxBars = 4 end

  PVPWarnConfiguration.detectionBar.maxBars = maxBars
end

--[[
  @return {number}
    The detection bar scale factor (1.0 = 100%)
]]--
function me.GetDetectionBarScale()
  return PVPWarnConfiguration.detectionBar.scale
end

--[[
  @param {number} scale
    The detection bar scale factor (clamped to 0.5 - 2.0)
]]--
function me.SetDetectionBarScale(scale)
  if type(scale) ~= "number" then return end

  if scale < 0.5 then scale = 0.5 end
  if scale > 2.0 then scale = 2.0 end

  PVPWarnConfiguration.detectionBar.scale = scale
end

--[[
  @return {number}
    The detection bar dedup window in seconds
]]--
function me.GetDetectionBarDedupWindow()
  return PVPWarnConfiguration.detectionBar.dedupWindow
end

--[[
  Enable the vignette flash warning channel
]]--
function me.EnableFlash()
  PVPWarnConfiguration.flash.enabled = true
end

--[[
  Disable the vignette flash warning channel
]]--
function me.DisableFlash()
  PVPWarnConfiguration.flash.enabled = false
end

--[[
  @return {boolean}
    true - if the vignette flash warning channel is enabled
    false - if the vignette flash warning channel is disabled
]]--
function me.IsFlashEnabled()
  return PVPWarnConfiguration.flash.enabled
end

--[[
  @return {number}
    The peak opacity of the flash (0.1 - 1.0)
]]--
function me.GetFlashMaxOpacity()
  return PVPWarnConfiguration.flash.maxOpacity
end

--[[
  @param {number} maxOpacity
    The peak opacity of the flash (clamped to 0.1 - 1.0)
]]--
function me.SetFlashMaxOpacity(maxOpacity)
  if type(maxOpacity) ~= "number" then return end

  if maxOpacity < 0.1 then maxOpacity = 0.1 end
  if maxOpacity > 1.0 then maxOpacity = 1.0 end

  PVPWarnConfiguration.flash.maxOpacity = maxOpacity
end

--[[
  Enable the extra pulse step in the flash lifecycle animation
]]--
function me.EnableFlashPulse()
  PVPWarnConfiguration.flash.pulse = true
end

--[[
  Disable the extra pulse step in the flash lifecycle animation
]]--
function me.DisableFlashPulse()
  PVPWarnConfiguration.flash.pulse = false
end

--[[
  @return {boolean}
    true - if the flash lifecycle includes the extra pulse step
    false - if the flash lifecycle skips the pulse step
]]--
function me.IsFlashPulseEnabled()
  return PVPWarnConfiguration.flash.pulse
end

--[[
  @return {string}
    The flash texture blend mode ("BLEND" or "ADD")
]]--
function me.GetFlashBlendMode()
  return PVPWarnConfiguration.flash.blendMode
end

--[[
  @param {string} blendMode
    The flash texture blend mode - anything other than "ADD" falls back to "BLEND"
]]--
function me.SetFlashBlendMode(blendMode)
  if blendMode == "ADD" then
    PVPWarnConfiguration.flash.blendMode = "ADD"
  else
    PVPWarnConfiguration.flash.blendMode = "BLEND"
  end
end

