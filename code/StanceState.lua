--[[
  MIT License

  Copyright (c) 2025 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--

-- luacheck: globals UnitIsPlayer UnitIsEnemy GetSpellInfo GetTime

local mod = rgpvpw
local me = {}
mod.stanceState = me

me.tag = "StanceState"

--[[
  ["spell"] = {table},
  ["detectedTime"] = {number}
--]]
local stanceTracker = {}
-- Tracks whether configuration mode is enabled or not
local configurationMode = false
-- classes that should be considered to be tracked
local supportedClasses = {"WARRIOR", "DRUID", "PRIEST", "HUNTER", "WARLOCK"}
-- clear stances that are older than 2 minutes
local stanceExpiredTimeout = 120

--[[
  Update the stance state of the current target (if there is a valid one)
]]--
function me.UpdateStanceState()
  if not mod.configuration.IsStanceStateTrackingEnabled() then return end

  if UnitIsPlayer(RGPVPW_CONSTANTS.UNIT_ID_TARGET) and UnitIsEnemy(RGPVPW_CONSTANTS.UNIT_ID_PLAYER,
    RGPVPW_CONSTANTS.UNIT_ID_TARGET) and me.IsCurrentTargetSupportedClass() or configurationMode then

    local currentTargetGuid = mod.target.GetCurrentTargetGuid()

    if currentTargetGuid == nil then
      --[[
        This can only happen in configurationMode because the target check is ignored
      ]]--
      mod.logger.LogDebug(me.tag, "No current target guid available")
      mod.stanceFrame.HideStanceState()

      return
    end

    local playerStanceData = stanceTracker[currentTargetGuid]

    if playerStanceData ~= nil then
      mod.logger.LogInfo(me.tag, "Found tracked stance: " .. playerStanceData.spell.name
        .. " for target: " .. currentTargetGuid)
      mod.stanceFrame.UpdateStanceStateUi(select(3, GetSpellInfo(playerStanceData.spell.spellId)))
    else
      mod.logger.LogDebug(me.tag, "Unknown stance for player: " .. currentTargetGuid)
      if mod.configuration.IsHideUnknownStanceEnabled() and not configurationMode then
        mod.stanceFrame.HideStanceState()
      else
        mod.stanceFrame.UpdateStanceStateUi(RGPVPW_CONSTANTS.STANCE_STATE_UNKNOWN_STANCE_ICON_ID)
      end
    end
  else
    mod.logger.LogDebug(me.tag, "Stance checking was ignored")
    mod.stanceFrame.HideStanceState()
  end
end

--[[
  Check if the targeted class is supported for stance tracking

  @return {boolean}
    true - if the class has stances to track and is supported
    false - if the class does not have stances and is not supported
]]--
function me.IsCurrentTargetSupportedClass()
  local currentClass = mod.target.GetCurrentTargetClass()

  for _, klass in ipairs(supportedClasses) do
    if klass == currentClass then
      return true
    end
  end

  return false
end

--[[
  Disable the tracking of stance state
]]--
function me.DisableStanceStateTracking()
  mod.ticker.StopTickerCheckStanceStateExpired()
  mod.stanceFrame.HideStanceState()
end

--[[
  Enable the tracking of stance state
]]--
function me.EnableStanceStateTracking()
  mod.ticker.StartTickerCheckStanceStateExpired()
end

--[[
  Enable configuration mode
]]--
function me.EnableConfigurationMode()
  configurationMode = true
  mod.logger.LogInfo(me.tag, "Enabled stance state configuration mode")

  if mod.target.GetCurrentTargetGuid() == nil then
    mod.logger.PrintUserError("Make sure to target something to see the frame")
  end

  mod.stanceFrame.UpdateStanceStateUi(RGPVPW_CONSTANTS.STANCE_STATE_UNKNOWN_STANCE_ICON_ID)
end

--[[
  Disabled configuration mode
]]--
function me.DisableConfigurationMode()
  configurationMode = false
  mod.logger.LogInfo(me.tag, "Disabled stance state configuration mode")
  mod.stanceFrame.HideStanceState()
end

--[[
  @param {table} spell
  @param {string} target
]]--
function me.TrackStanceApplied(spell, target)
  if target == nil or spell == nil then return end

  stanceTracker[target] = {
    ["spell"] = spell,
    ["detectedTime"] = GetTime()
  }

  mod.logger.LogDebug(me.tag, "Tracked stance: " .. spell.name .. " for target: " .. target)

  -- update stance of current target if the update was for the current target
  if target == mod.target.GetCurrentTargetGuid() then
    me.UpdateStanceState()
  end
end

--[[
  @param {table} spell
  @param {string} target
]]--
function me.TrackStanceRemoved(spell, target)
  if target == nil or spell == nil then return end

  stanceTracker[target] = nil

  -- update stance of current target if the update was for the current target
  if target == mod.target.GetCurrentTargetGuid() then
    me.UpdateStanceState()
  end
end

--[[
  Cleanup tracked stances that are to old. This is not required very often.
]]--
function me.CleanExpiredTrackedStances()
  for target, stanceData in pairs(stanceTracker) do
    if (GetTime() - stanceData.detectedTime) > stanceExpiredTimeout then
      stanceTracker[target] = nil
      mod.logger.LogInfo(me.tag, "Cleared expired stance data for target: " .. target)
    end
  end
end
