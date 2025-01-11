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

-- luacheck: globals UnitGUID UnitName UnitClass

local mod = rgpvpw
local me = {}

mod.target = me

me.tag = "Target"

local currentTargetGuid
local currentTargetName
local currentTargetClassName

--[[
  Returns the players current target uid or an empty string if the player has no target.

  @return {string | nil}
]]--
function me.GetCurrentTargetGuid()
  return currentTargetGuid
end

--[[
  Returns the players current target name or an empty string if the player has no target.

  @return {string | nil}
]]--
function me.GetCurrentTargetName()
  return currentTargetName
end

--[[
  Returns the players current class name or an empty string if the player has no target.

  @return {string | nil}
]]--
function me.GetCurrentTargetClass()
  return currentTargetClassName
end

--[[
  Get players current target in the form of the targets unique id and update the currentTarget.
]]--
function me.UpdateCurrentTarget()
  local targetId = UnitGUID(RGPVPW_CONSTANTS.UNIT_ID_TARGET)
  local targetName = UnitName(RGPVPW_CONSTANTS.UNIT_ID_TARGET)
  local _, unitClassName = UnitClass(RGPVPW_CONSTANTS.UNIT_ID_TARGET)

  if targetId == nil then
    currentTargetGuid = nil
    mod.logger.LogDebug(me.tag, "Update players targetGUID: [Empty-target]")
  else
    currentTargetGuid = targetId
    mod.logger.LogDebug(me.tag, "Update players targetGUID: " .. currentTargetGuid)
  end

  if targetName == nil then
    currentTargetName = nil
    mod.logger.LogDebug(me.tag, "Update players targetName: [Empty-target]")
  else
    currentTargetName = targetName
    mod.logger.LogDebug(me.tag, "Update players targetName: " .. currentTargetName)
  end

  if unitClassName == nil then
    currentTargetClassName = nil
    mod.logger.LogDebug(me.tag, "Update players targetClassName: [Empty-target]")
  else
    currentTargetClassName = unitClassName
    mod.logger.LogDebug(me.tag, "Update players targetClassName: " .. currentTargetClassName)
  end

  -- updating combatState and stanceState with changed target
  mod.combatState.UpdateCombatState()
  mod.stanceState.UpdateStanceState()
end
