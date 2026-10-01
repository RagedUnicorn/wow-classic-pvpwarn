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
  Headless spec for code/Zone.lua (rgpvpw.zone): the cached zone state the combat log hot path
  checks first. Battlegrounds and the open world follow the zone configuration, arenas are always
  on, dungeons and raids always off, and no zone may inherit the previous zone's state.

  The location is described through stubbed IsInInstance, GetInstanceInfo (the instance id is its
  8th return) and C_Map.GetBestMapForUnit. Zone.lua reads rgpvpw.L at load time for the default
  zone names, so a key-echoing L is installed before it is dofile'd; rgpvpw.configuration is a stub
  answering IsZoneEnabled from a table and the logger's LogInfo is a no-op. Every replaced rgpvpw
  field is restored in after_each.
]]--

local wowStubs = require("WowStubs")

describe("Zone", function()
  local zone
  local restoreGlobals
  local instanceType
  local instanceId
  local mapId
  local enabledZones
  local originalZone = rgpvpw.zone
  local originalConfiguration = rgpvpw.configuration
  local originalLogger = rgpvpw.logger
  local originalL = rgpvpw.L

  local OPEN_WORLD_MAP_ID = 1453

  --[[
    @param {string} newInstanceType
      "pvp", "arena", "party", "raid", "none" or anything else
    @param {number} newInstanceId
  ]]--
  local function enter(newInstanceType, newInstanceId)
    instanceType = newInstanceType
    instanceId = newInstanceId
    zone.UpdateZone()
  end

  before_each(function()
    instanceType = "none"
    instanceId = nil
    mapId = OPEN_WORLD_MAP_ID
    enabledZones = {}

    restoreGlobals = wowStubs.install({
      IsInInstance = function() return instanceType ~= "none", instanceType end,
      GetInstanceInfo = function()
        return "name", instanceType, 0, "difficulty", 40, 0, false, instanceId
      end,
      C_Map = { GetBestMapForUnit = function() return mapId end }
    })

    rgpvpw.configuration = {
      IsZoneEnabled = function(zoneId) return enabledZones[zoneId] == true end
    }
    rgpvpw.logger = { LogInfo = function() end }
    rgpvpw.L = setmetatable({}, { __index = function(_, key) return key end })

    dofile("code/Zone.lua")
    zone = rgpvpw.zone
  end)

  after_each(function()
    restoreGlobals()
    rgpvpw.zone = originalZone
    rgpvpw.configuration = originalConfiguration
    rgpvpw.logger = originalLogger
    rgpvpw.L = originalL
  end)

  describe("UpdateZone", function()
    it("enables a battleground that is enabled in the configuration", function()
      enabledZones[RGPVPW_ZONE.ZONE_BATTLEGROUND_WARSONG_GULCH] = true

      enter("pvp", RGPVPW_ZONE.ZONE_BATTLEGROUND_WARSONG_GULCH)

      assert.is_true(zone.IsZoneEnabled())
    end)

    it("disables a battleground that is disabled in the configuration", function()
      enter("pvp", RGPVPW_ZONE.ZONE_BATTLEGROUND_ARATHI_BASIN)

      assert.is_false(zone.IsZoneEnabled())
    end)

    it("always enables an arena", function()
      enter("arena", 559)

      assert.is_true(zone.IsZoneEnabled())
    end)

    it("always disables dungeons and raids, whatever the previous zone was", function()
      for _, pveType in ipairs({ "party", "raid" }) do
        enter("arena", 559)
        enter(pveType, 36)

        assert.is_false(zone.IsZoneEnabled(), pveType)
      end
    end)

    it("follows the configuration for the open world map", function()
      enabledZones[OPEN_WORLD_MAP_ID] = true

      enter("none", nil)
      assert.is_true(zone.IsZoneEnabled())

      enabledZones[OPEN_WORLD_MAP_ID] = nil

      enter("none", nil)
      assert.is_false(zone.IsZoneEnabled())
    end)

    it("disables an unknown zone type", function()
      enter("arena", 559)
      enter("scenario", 1)

      assert.is_false(zone.IsZoneEnabled())
    end)
  end)

  describe("InitializeDefaultZoneConfiguration", function()
    it("enables the three battlegrounds by default", function()
      local defaults = zone.InitializeDefaultZoneConfiguration()

      for _, zoneId in pairs(RGPVPW_ZONE) do
        assert.is_true(defaults[zoneId].enabled, tostring(zoneId))
      end
    end)

    it("returns a clone so the saved configuration cannot write into the defaults", function()
      local first = zone.InitializeDefaultZoneConfiguration()

      first[RGPVPW_ZONE.ZONE_BATTLEGROUND_WARSONG_GULCH].enabled = false

      local second = zone.InitializeDefaultZoneConfiguration()

      assert.is_true(second[RGPVPW_ZONE.ZONE_BATTLEGROUND_WARSONG_GULCH].enabled)
    end)
  end)
end)
