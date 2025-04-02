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

local mod = rgpvpw
local me = {}

mod.debug = me

me.tag = "Debug"

_G["__PVPW__DEBUG__PLAYEXAMPLESOUND"] = function()
  mod.sound.PlaySound("warrior", 2, "shield_wall")
end

_G["__PVPW__DEBUG__SHOWEXAMPLEALERT"] = function()
  mod.visual.CreateVisualAlertFrame()
  mod.visual.ShowVisualAlert()
end

--[[
  Triggering the simulation of an event where the player himself avoided some spell of
  an enemy player

  /run _G["__PVPW__DEBUG__COMBATEVENT_MISS_SELF_AVOIDED"]()
]]--
-- TODO outdated
_G["__PVPW__DEBUG__COMBATEVENT_MISS_SELF_AVOIDED"] = function()
  local event = {
    1626123629.151,
    "SPELL_MISSED",
    false,
    "EnemyPlayerId",
    "EnemyPlayerName",
    66888, -- fullfills COMBATLOG_FILTER_HOSTILE_PLAYERS
    0,
    "PlayerId",
    "Playername",
    1297,
    0,
    nil,
    "Faerie Fire",
    1,
    "IMMUNE"
  }

  mod.combatLog.ProcessUnfilteredCombatLogEvent(nil, unpack(event))
end

--[[
  Triggering the simulation of an event where an enemy avoided a spell of the player

  /run _G["__PVPW__DEBUG__COMBATEVENT_MISS_ENEMY_AVOIDED"]()
]]--
-- TODO outdated
_G["__PVPW__DEBUG__COMBATEVENT_MISS_ENEMY_AVOIDED"] = function()
  local event = {
    1626123629.151,
    "SPELL_MISSED",
    false,
    "PlayerId",
    "Playername",
    1297, -- fullfills COMBATLOG_FILTER_MINE
    0,
    "EnemyPlayerId",
    "EnemyPlayerName",
    1297,
    0,
    nil,
    "Hamstring",
    1,
    "IMMUNE"
  }

  mod.combatLog.ProcessUnfilteredCombatLogEvent(nil, unpack(event))
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
  local _, _, _, _, _, sourceFlags = select(1, ...)

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
