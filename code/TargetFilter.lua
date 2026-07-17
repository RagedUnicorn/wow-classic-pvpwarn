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

-- luacheck: globals UnitIsEnemy UnitGUID

--[[
  Enemy-gated target tracker for the target filter (see code/CombatLog.lua
  ShouldWarnForTarget). Deliberately separate from code/Target.lua: that module tracks any
  target and drives the combat-state/stance-state frames, while the filter only cares about
  the current enemy target and must stay free of that coupling. Updated from Core's
  PLAYER_TARGET_CHANGED handler.
]]--

local mod = rgpvpw
local me = {}

mod.targetFilter = me

me.tag = "TargetFilter"

local currentTargetGuid

--[[
  Returns the players current enemy target guid or nil if the player has no enemy target.

  @return {string | nil}
]]--
function me.GetCurrentTargetGuid()
  return currentTargetGuid
end

--[[
  Update the tracked enemy target guid. The guid is only recorded when the current target
  is an enemy; targeting a friendly unit or clearing the target resets it to nil.
]]--
function me.UpdateCurrentTarget()
  if UnitIsEnemy(RGPVPW_CONSTANTS.UNIT_ID_PLAYER, RGPVPW_CONSTANTS.UNIT_ID_TARGET) then
    currentTargetGuid = UnitGUID(RGPVPW_CONSTANTS.UNIT_ID_TARGET)
  else
    currentTargetGuid = nil
  end

  if currentTargetGuid == nil then
    mod.logger.LogDebug(me.tag, "Update enemy targetGUID: [Empty-target]")
  else
    mod.logger.LogDebug(me.tag, "Update enemy targetGUID: " .. currentTargetGuid)
  end
end
