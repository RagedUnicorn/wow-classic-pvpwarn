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
    Whether combat state tracking is enabled or not
  ]]--
  ["enableCombatStateTracking"] = true
}

--[[
    Set default values if property is nil. This might happen after an addon upgrade
  ]]--
function me.SetupConfiguration()

  -- initialize spelllist for the first time with default profile
  if PVPWarnConfiguration.spellList == nil then
    PVPWarnConfiguration.spellList = {}
    -- PVPWarnConfiguration.spellList = mod.profile.GetDefaultProfile() TODO
  end

  if PVPWarnConfiguration.enableCombatStateTracking == nil then
    mod.logger.LogInfo(me.tag, "enableCombatStateTracking has unexpected nil value")
    PVPWarnConfiguration.enableCombatStateTracking = true
  end
end

--[[
  Set addon version on addon options. Before setting a new version make sure
  to run through migration paths. As of right now there is no migration path.
]]--
function me.SetAddonVersion()
  -- if no version set so far make sure to set the current one
  if PVPWarnConfiguration.addonVersion == nil then
    PVPWarnConfiguration.addonVersion = RGPVPW_ENVIRONMENT.ADDON_VERSION
  end

  me.MigrationPath()
  -- migration done update addon version to current
  PVPWarnConfiguration.addonVersion = RGPVPW_ENVIRONMENT.ADDON_VERSION
end

--[[
  Migration path for older version to newest version. For now this migration path
  is running each time the addon starts. Later versions should consider the save addon
  version before running a migration path
]]--
function me.MigrationPath()
  --[[
  if PVPWarnConfiguration.addonVersion == "x.x.x" then
    me.PrexxxMigration()
  end
  ]]--
end

--[[
  Enable combat state tracking
]]--
function me.EnableCombatStateTracking()
  PVPWarnConfiguration.enableCombatStateTracking = true
  -- no actual work needed. Combatstate tracking will start once the player acquires a target
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
