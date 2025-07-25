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

-- luacheck: globals GetAddOnMetadata CombatLogGetCurrentEventInfo

rgpvpw = rgpvpw or {}
local me = rgpvpw

me.tag = "Core"

-- Track whether addon initialization is complete
local isInitialized = false

--[[
  Addon load

  @param {table} self
]]--
function me.OnLoad(self)
  me.RegisterEvents(self)
end

--[[
  Register addon events

  @param {table} self
]]--
function me.RegisterEvents(self)
  -- Fired when the player logs in, /reloads the UI, or zones between map instances
  self:RegisterEvent("PLAYER_ENTERING_WORLD")
  --[[
    Register to combat event unfiltered

    COMBAT_LOG_EVENT_UNFILTERED - show all logs independent of what the player has configured
    COMBAT_LOG_EVENT - shows only the logs that the player has configured
  ]]--
  self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
  -- Register to the event that fires when the players target changes
  self:RegisterEvent("PLAYER_TARGET_CHANGED")
  -- Fired when the user enters a new zone or city
  self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
end

--[[
  MainFrame OnEvent handler

  @param {string} event
]]--
function me.OnEvent(event, ...)
  if event == "PLAYER_ENTERING_WORLD" then
    me.logger.LogEvent(me.tag, "PLAYER_ENTERING_WORLD")

    local isInitialLogin, isReloadingUi = ...

    if isInitialLogin or isReloadingUi then
      me.Initialize()
      me.zone.UpdateZone()
    end
  elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
    if not isInitialized then
      me.logger.LogDebug(me.tag, "Ignoring COMBAT_LOG_EVENT_UNFILTERED - addon not yet initialized")

      return
    end
    me.logger.LogEvent(me.tag, "COMBAT_LOG_EVENT_UNFILTERED")
    me.combatLog.ProcessUnfilteredCombatLogEvent(nil, CombatLogGetCurrentEventInfo())
  elseif event == "PLAYER_TARGET_CHANGED" then
    if not isInitialized then
      me.logger.LogDebug(me.tag, "Ignoring PLAYER_TARGET_CHANGED - addon not yet initialized")

      return
    end
    me.logger.LogEvent(me.tag, "PLAYER_TARGET_CHANGED")
    me.target.UpdateCurrentTarget()
  elseif event == "ZONE_CHANGED_NEW_AREA" then
    me.logger.LogEvent(me.tag, "ZONE_CHANGED_NEW_AREA")
    me.zone.UpdateZone()
  end
end

--[[
  Init function
]]--
function me.Initialize()
  me.logger.LogDebug(me.tag, "Initialize addon")
  -- setup slash commands
  me.cmd.SetupSlashCmdList()
  -- register default voice pack
  me.voicePack.RegisterDefaultVoicePack()
  -- load addon variables
  me.configuration.SetupConfiguration()
  -- setup addon configuration ui
  me.addonConfiguration.SetupAddonConfiguration()
  -- setup combat state ui
  me.combatFrame.BuildCombatStateUi()
  -- setup stance state ui
  me.stanceFrame.BuildStanceStateUi()
  -- start ticker intervals
  me.ticker.StartTickerWarnQueue()

  if me.configuration.IsStanceStateTrackingEnabled() then
    me.ticker.StartTickerCheckStanceStateExpired()
  end

  me.ShowWelcomeMessage()

  isInitialized = true
  me.logger.LogInfo(me.tag, "Addon initialization complete")
end

--[[
  Show welcome message to user
]]--
function me.ShowWelcomeMessage()
  print(
    string.format("|cFF00FFB0" .. RGPVPW_CONSTANTS.ADDON_NAME .. rgpvpw.L["help"],
    GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Version"))
  )
end
