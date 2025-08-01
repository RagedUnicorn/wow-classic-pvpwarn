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

-- luacheck: globals CombatLog_Object_IsA COMBATLOG_FILTER_HOSTILE_PLAYERS COMBATLOG_FILTER_MINE

local mod = rgpvpw
local me = {}

mod.debug = me

me.tag = "Debug"

_G["__PVPW__DEBUG__PLAYEXAMPLESOUND"] = function()
  mod.sound.PlaySound("warrior", RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED, "shield_wall")
end

_G["__PVPW__DEBUG__SHOWEXAMPLEALERT"] = function()
  mod.visual.CreateVisualAlertFrame()
  mod.visual.ShowVisualAlert(RGPVPW_CONSTANTS.TEXTURES.yellow.colorValue)
end

--[[
  Take an event from CombatLogGetCurrentEventInfo and store it in a savedVariable. This allows to read a textfile with
  all the logs after a reload.

  Filtering for oneOf (and COMBATLOG_FILTER_HOSTILE_PLAYERS):

  - SPELL_CAST_SUCCESS
  - SPELL_CAST_START
  - SPELL_AURA_REMOVED
  - SSPELL_AURA_APPLIED
  - SPELL_AURA_REFRESH,

  @param {table} vararg
    The event to track
]]--
function me.TrackLogNormalEvent(...)
  local logEvent = {...}

  if PVPWarnLogTracker == nil then
    PVPWarnLogTracker = {}
  end

  table.insert(PVPWarnLogTracker, logEvent)
end

--[[
  Take an event from CombatLogGetCurrentEventInfo and store it in a savedVariable. This allows to read a textfile with
    all the logs after a reload.

  Filtering for oneOf (and COMBATLOG_FILTER_HOSTILE_PLAYERS or COMBATLOG_FILTER_MINE):

  - SPELL_MISSED

  @param {table} vararg
    The event to track
]]--
function me.TrackLogAvoidEvent(...)
  local logEvent = {...}
  local sourceFlags = select(6, ...)

  if PVPWarnLogTrackerAvoid == nil then
    PVPWarnLogTrackerAvoid = {}
  end

  if PVPWarnLogTrackerAvoid.enemyAvoid == nil then
    PVPWarnLogTrackerAvoid.enemyAvoid = {}
  end

  if PVPWarnLogTrackerAvoid.selfAvoid == nil then
    PVPWarnLogTrackerAvoid.selfAvoid = {}
  end

  if CombatLog_Object_IsA(sourceFlags, COMBATLOG_FILTER_HOSTILE_PLAYERS) then
    table.insert(PVPWarnLogTrackerAvoid.enemyAvoid, logEvent)
  elseif CombatLog_Object_IsA(sourceFlags, COMBATLOG_FILTER_MINE) then
    table.insert(PVPWarnLogTrackerAvoid.selfAvoid, logEvent)
  end
end
