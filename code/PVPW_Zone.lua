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

-- luacheck: globals IsInInstance GetInstanceInfo C_Map

local mod = rgpvpw
local me = {}
mod.zone = me

me.tag = "Zone"

local zoneType = {
  ["battleGround"] = "pvp",
  ["none"] = "none"
}

--[[
  List of supported zones and their respective map or instance id
]]--
RGPVPW_ZONE = {
  ZONE_BATTLEGROUND_WARSONG_GULCH = 489,
  ZONE_BATTLEGROUND_ARATHI_BASIN = 529,
  ZONE_BATTLEGROUND_ALTERAC_VALLEY = 30
}

--[[
  Only update if not set or after a zone change. After that the value is cached to avoid the repeated work for every
  combatevent
]]--
local isZoneEnabled = false
--[[
  Holds the current zone identifier. Update when reloading the ui or changing the zone
]]--
local zoneIdentifier

local addonZoneConfiguration = {
  --[[
    Battleground instance ids
  --]]
  [RGPVPW_ZONE.ZONE_BATTLEGROUND_ALTERAC_VALLEY] = {
    ["enabled"] = true,
    ["name"] = rgpvpw.L["battleground_alterac_valley"]
  },
  [RGPVPW_ZONE.ZONE_BATTLEGROUND_ARATHI_BASIN] = {
    ["enabled"] = true,
    ["name"] = rgpvpw.L["battleground_arathi_basin"]
  },
  [RGPVPW_ZONE.ZONE_BATTLEGROUND_WARSONG_GULCH] = {
    ["enabled"] = true,
    ["name"] = rgpvpw.L["battleground_warsong_gulch"]
  }
}

--[[
  Retrieve the default configuration for zones

  @return {table}
]]--
function me.InitializeDefaultZoneConfiguration()
  return addonZoneConfiguration
end

--[[
  Zone is updated as a response of ZONE_CHANGED_NEW_AREA event
]]--
function me.UpdateZone()
  local _, type = IsInInstance()

  if type == zoneType.battleGround then
    zoneIdentifier = select(8, GetInstanceInfo())
    mod.logger.LogInfo(me.tag, "Updated instance id to: " .. zoneIdentifier)
    me.UpdateZoneStatus(zoneIdentifier)
  elseif type == zoneType.none then
    zoneIdentifier = C_Map.GetBestMapForUnit(RGPVPW_CONSTANTS.UNIT_ID_PLAYER)
    mod.logger.LogInfo(me.tag, "Updated map id to: " .. zoneIdentifier)
    me.UpdateZoneStatus(zoneIdentifier)
  else
    mod.logger.LogInfo(me.tag, "Ignore non-tracked zone type: " .. type)
  end
end

--[[
  Updates the cached zone state

  @param {number} zone
    A zone from RGPVPW_ZONE
]]--
function me.UpdateZoneStatus(zone)
  if mod.configuration.IsZoneEnabled(zone) then
    isZoneEnabled = true
    mod.logger.LogInfo(me.tag, "Enabled addon for zone with id {" .. zone .. "}")
  else
    isZoneEnabled = false
    mod.logger.LogInfo(me.tag, "Disabled addon for zone with id {" .. zone .. "}")
  end
end

--[[
  Determines whether the addon is enabled or disabled in the currentZone

  @return {boolean}
    true - if the current zone is enabled
    false - if the current zone is not enabled
]]--
function me.IsZoneEnabled()
  return isZoneEnabled
end
