--[[
  MIT License

  Copyright (c) 2026 Michael Wiesendanger

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

-- luacheck: globals UnitIsPlayer UnitIsEnemy UnitAffectingCombat

local mod = rgpvpw
local me = {}
mod.combatState = me

me.tag = "CombatState"

--[[
  Tracks whether configuration mode is enabled or not
]]--
local configurationMode = false

--[[
  Callback invoked whenever configuration mode is entered or exited. The slot is owned by
  mod.stateFramePositioning, which fans the change out to every registered listener - do not
  assign to it from anywhere else or those listeners stop being notified.
]]--
me.onConfigurationModeChanged = nil

--[[
  Update the combat state of the current target (if there is a valid one)
]]--
function me.UpdateCombatState()
  if not mod.configuration.IsCombatStateTrackingEnabled() then return end

  local hasEnemyPlayerTarget = UnitIsPlayer(RGPVPW_CONSTANTS.UNIT_ID_TARGET)
    and UnitIsEnemy(RGPVPW_CONSTANTS.UNIT_ID_PLAYER, RGPVPW_CONSTANTS.UNIT_ID_TARGET)

  if hasEnemyPlayerTarget or configurationMode then
    local affectingCombat = UnitAffectingCombat(RGPVPW_CONSTANTS.UNIT_ID_TARGET) or configurationMode

    mod.logger.LogDebug(me.tag, "Targeted unit is affected by combat: " .. tostring(affectingCombat))
    mod.combatFrame.UpdateCombatStateUi(affectingCombat)
    --[[
      Start combatState timer - if not already started
    ]]--
    mod.ticker.StartTickerCheckCombatState()
  else
    -- Update combatState ui to hidden
    mod.combatFrame.HideCombatState()
    -- stop combatState time - no valid target (e.g. friendly or none at all)
    mod.ticker.StopTickerCheckCombatState()
  end
end

--[[
  Disable the tracking of combatstate
]]--
function me.DisableCombatStateTracking()
  mod.ticker.StopTickerCheckCombatState()
  mod.combatFrame.HideCombatState()
end

--[[
  Enable configuration mode

  @param {boolean} silent
    Optional - skip the no target hint. Used by mod.stateFramePositioning which enables both
    state frames at once and prints the hint itself to avoid duplicating it
]]--
function me.EnableConfigurationMode(silent)
  configurationMode = true
  mod.logger.LogInfo(me.tag, "Enabled combat state configuration mode")

  if not silent and mod.target.GetCurrentTargetGuid() == nil then
    mod.logger.PrintUserError(rgpvpw.L["configuration_mode_no_target"])
  end

  mod.combatFrame.ShowCombatState()
  mod.combatFrame.SetPositioningEnabled(true)

  if me.onConfigurationModeChanged then me.onConfigurationModeChanged() end
end

--[[
  Disabled configuration mode
]]--
function me.DisableConfigurationMode()
  configurationMode = false
  mod.logger.LogInfo(me.tag, "Disabled combat state configuration mode")
  mod.combatFrame.HideCombatState()
  mod.combatFrame.SetPositioningEnabled(false)

  if me.onConfigurationModeChanged then me.onConfigurationModeChanged() end
end

--[[
  Toggle configuration mode
]]--
function me.ToggleConfigurationMode()
  if configurationMode then
    me.DisableConfigurationMode()
  else
    me.EnableConfigurationMode()
  end
end

--[[
  @return {boolean}
    true - if configuration mode is currently enabled
    false - if configuration mode is currently disabled
]]--
function me.IsConfigurationModeEnabled()
  return configurationMode
end
