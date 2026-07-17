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

-- luacheck: globals C_AddOns CombatLogGetCurrentEventInfo

rgpvpw = rgpvpw or {}
local me = rgpvpw

me.tag = "Core"

-- forward declarations
local OnEnteringWorld
local OnCombatLog
local OnTargetChanged
local OnZoneChanged

--[[
  Addon load

  @param {table} self
]]--
function me.OnLoad(self)
  me.RegisterEvents(self)
end

--[[
  Register addon event handlers with the event bus and subscribe the main frame

  @param {table} self
]]--
function me.RegisterEvents(self)
  -- Fired when the player logs in, /reloads the UI, or zones between map instances
  me.event.Register("PLAYER_ENTERING_WORLD", OnEnteringWorld)
  --[[
    Register to combat event unfiltered. Gated so combat log events are ignored
    until initialization completes.

    COMBAT_LOG_EVENT_UNFILTERED - show all logs independent of what the player has configured
    COMBAT_LOG_EVENT - shows only the logs that the player has configured
  ]]--
  me.event.Register("COMBAT_LOG_EVENT_UNFILTERED", OnCombatLog, { gated = true })
  -- Register to the event that fires when the players target changes. Gated until initialization completes.
  me.event.Register("PLAYER_TARGET_CHANGED", OnTargetChanged, { gated = true })
  -- Fired when the user enters a new zone or city
  me.event.Register("ZONE_CHANGED_NEW_AREA", OnZoneChanged)
  -- Version broadcasts from other players. Gated until initialization completes.
  me.event.Register("CHAT_MSG_ADDON", me.comm.OnChatMsgAddon, { gated = true })
  -- Rebroadcast the running version on roster edges. Gated until initialization completes.
  me.event.Register("GROUP_ROSTER_UPDATE", me.comm.BroadcastVersion, { gated = true })

  me.event.Setup(self)
end

--[[
  MainFrame OnEvent handler. Delegates to the event bus for dispatch.

  @param {string} event
  @param {vararg} ...
]]--
function me.OnEvent(event, ...)
  me.event.Dispatch(event, ...)
end

--[[
  Init function
]]--
function me.Initialize()
  me.logger.LogDebug(me.tag, "Initialize addon")
  -- setup slash commands
  me.cmd.SetupSlashCmdList()

  -- setup test commands (development/debug only)
  if RGPVPW_ENVIRONMENT.DEBUG and me.testCmdRegistry and me.testCmdRegistry.Initialize then
    me.testCmdRegistry.Initialize()
  end
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
  -- setup detection bar ui
  me.detectionBarManager.Init(me.detectionBarAnchor.BuildAnchor())
  -- suppress the vignette flash during loading screens
  me.flash.RegisterSuppressionEvents()
  -- start ticker intervals
  me.ticker.StartTickerWarnQueue()

  if me.configuration.IsStanceStateTrackingEnabled() then
    me.ticker.StartTickerCheckStanceStateExpired()
  end

  -- register addon message prefix for the version broadcast
  me.comm.Initialize()

  me.ShowWelcomeMessage()
  me.ShowDetectionBarHint()

  me.logger.LogInfo(me.tag, "Addon initialization complete")
end

--[[
  Show welcome message to user
]]--
function me.ShowWelcomeMessage()
  print(
    string.format("|cFF00FFB0" .. RGPVPW_CONSTANTS.ADDON_NAME .. rgpvpw.L["help"],
    C_AddOns.GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Version"))
  )
end

--[[
  Show a one-time hint pointing new users at the detection bar feature, then remember it was
  shown so it never repeats.
]]--
function me.ShowDetectionBarHint()
  if me.configuration.IsDetectionBarHintShown() then return end

  print("|cFF00FFB0" .. RGPVPW_CONSTANTS.ADDON_NAME .. ":|r " .. rgpvpw.L["detection_bar_hint"])
  me.configuration.SetDetectionBarHintShown()
end

--[[
  Run the bootstrap sequence on login or /reload, then open the readiness gate
  so gated handlers (combat log, target changes) begin processing. Every entering
  world edge (including instance transfers) broadcasts the running addon version;
  the broadcast has its own cooldown against bursts.

  @param {boolean} isInitialLogin
  @param {boolean} isReloadingUi
]]--
OnEnteringWorld = function(isInitialLogin, isReloadingUi)
  if isInitialLogin or isReloadingUi then
    me.Initialize()
    me.event.SetReady()
    me.zone.UpdateZone()
  end

  me.comm.BroadcastVersion()
end

--[[
  Process the current unfiltered combat log event. Gated until initialization
  is complete (see RegisterEvents).
]]--
OnCombatLog = function()
  me.combatLog.ProcessUnfilteredCombatLogEvent(nil, CombatLogGetCurrentEventInfo())
end

--[[
  Update the tracked target when the player's target changes. Gated until
  initialization is complete (see RegisterEvents).
]]--
OnTargetChanged = function()
  me.target.UpdateCurrentTarget()
  me.targetFilter.UpdateCurrentTarget()
end

--[[
  Update the zone state when the player enters a new zone or city
]]--
OnZoneChanged = function()
  me.zone.UpdateZone()
end
