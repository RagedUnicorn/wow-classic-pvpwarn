--[[
  MIT License

  Copyright (c) 2022 Michael Wiesendanger

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

-- luacheck: globals UnitIsPlayer UnitIsEnemy UnitIsPVP UnitAffectingCombat

local mod = rgpvpw
local me = {}
mod.combatState = me

me.tag = "CombatState"

--[[
  Tracks whether configuration mode is enabled or not
]]--
local configurationMode = false

--[[
  Invoked when a new target is aquired
]]--
function me.AcquiredTarget()
  if not mod.configuration.IsCombatStateTrackingEnabled() then return end

  if UnitIsPlayer(RGPVPW_CONSTANTS.UNIT_ID_TARGET) and UnitIsEnemy(RGPVPW_CONSTANTS.UNIT_ID_PLAYER,
    RGPVPW_CONSTANTS.UNIT_ID_TARGET) or configurationMode then
    mod.logger.LogDebug(me.tag, "Aquired new enemy target - starting combatstate tracking")
    -- after switching targets instantly update
    me.CombatStateUpdate()
    --[[
      Start combatState timer - if not already started
    ]]--
    mod.ticker.StartTickerCheckCombatState()
  else
    mod.targetFrame.HideCombatState()
    -- stop combatState time - no valid target (e.g. friendly)
    mod.ticker.StopTickerCheckCombatState()
  end
end

--[[
  - Stop updating combatState when target gets lost stops ticker
  - Update combatState ui to hidden
]]--
function me.LostTarget()
  mod.ticker.StopTickerCheckCombatState()
  mod.targetFrame.HideCombatState()
end

--[[
  Update the combat state of the current target
]]--
function me.CombatStateUpdate()
  local affectingCombat = UnitAffectingCombat(RGPVPW_CONSTANTS.UNIT_ID_TARGET) or configurationMode

  mod.logger.LogDebug(me.tag, "Targeted unit is affected by combat: " .. tostring(affectingCombat))
  mod.targetFrame.UpdateCombateStateUi(affectingCombat)
end

--[[
  Disable the tracking of combatstate
]]--
function me.DisableCombatStateTracking()
  mod.ticker.StopTickerCheckCombatState()
  mod.targetFrame.HideCombatState()
end

--[[
  Enable configuration mode
]]--
function me.EnableConfigurationMode()
  configurationMode = true
  mod.logger.LogInfo(me.tag, "Enabled combat state configuration mode")

  if mod.target.GetCurrentTargetGuid() == nil then
    mod.logger.PrintUserError("Make sure to target something to see the frame")
  end

  mod.targetFrame.ShowCombatState()
end

--[[
  Disabled configuration mode
]]--
function me.DisableConfigurationMode()
  configurationMode = false
  mod.logger.LogInfo(me.tag, "Disabled combat state configuration mode")
  mod.targetFrame.HideCombatState()
end
