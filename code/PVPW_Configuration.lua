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
mod.addonOptions = me

me.tag = "AddonOptions"

--[[
  Saved addon variable
]]--
PVPWarnOptions = {


  --[[
    Enemy spells being casted/used/activated
  ]]--
  ["spellList"] = nil,
}

--[[
    Set default values if property is nil. This might happen after an addon upgrade
  ]]--
function me.SetupConfiguration()

  -- initialize spelllist for the first time with default profile
  if PVPWarnOptions.spellList == nil then
    PVPWarnOptions.spellList = {}
    -- PVPWarnOptions.spellList = mod.profile.GetDefaultProfile() TODO
  end
end

--[[
  Set addon version on addon options. Before setting a new version make sure
  to run through migration paths. As of right now there is no migration path.
]]--
function me.SetAddonVersion()
  -- if no version set so far make sure to set the current one
  if PVPWarnOptions.addonVersion == nil then
    PVPWarnOptions.addonVersion = RGPVPW_ENVIRONMENT.ADDON_VERSION
  end

  me.MigrationPath()
  -- migration done update addon version to current
  PVPWarnOptions.addonVersion = RGPVPW_ENVIRONMENT.ADDON_VERSION
end

--[[
  Migration path for older version to newest version. For now this migration path
  is running each time the addon starts. Later versions should consider the save addon
  version before running a migration path
]]--
function me.MigrationPath()
  --[[
  if PVPWarnOptions.addonVersion == "x.x.x" then
    me.PrexxxMigration()
  end
  ]]--
end
