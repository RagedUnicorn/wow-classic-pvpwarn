--[[
  MIT License

  Copyright (c) 2023 Michael Wiesendanger

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

-- luacheck: globals C_Timer

local mod = rgpvpw
local me = {}
mod.ticker = me

me.tag = "Ticker"

local warnQueueTicker
local checkCombatState
local checkStanceStateExpired

--[[
  Start the repeating update ticker for warnQueue
]]--
function me.StartTickerWarnQueue()
  if warnQueueTicker == nil or warnQueueTicker._cancelled then
    warnQueueTicker = C_Timer.NewTicker(
      RGPVPW_CONSTANTS.WARN_QUEUE_UPDATE_INTERVAL, mod.warn.ProcessQueue)
      mod.logger.LogInfo(me.tag, "Started 'WarnQueueTicker'")
  end
end

--[[
  Stop the repeating update ticker for warnQueue
]]--
function me.StopTickerWarnQueue()
  if warnQueueTicker then
    warnQueueTicker:Cancel()
    mod.logger.LogInfo(me.tag, "Stopped 'WarnQueueTicker'")
  end
end

--[[
  Start the repeating update ticker for combatState
]]--
function me.StartTickerCheckCombatState()
  if checkCombatState == nil or checkCombatState._cancelled then
    checkCombatState = C_Timer.NewTicker(
      RGPVPW_CONSTANTS.CHECK_COMBAT_STATE_INTERVAL, mod.combatState.CombatStateUpdate)
      mod.logger.LogInfo(me.tag, "Started 'CheckCombatState'")
  end
end

--[[
  Stop the repeating update ticker for combatState
]]--
function me.StopTickerCheckCombatState()
  if checkCombatState then
    checkCombatState:Cancel()
    mod.logger.LogInfo(me.tag, "Stopped 'CheckCombatState'")
  end
end

--[[
  Start the repeating update ticker for stanceStateExpired
]]--
function me.StartTickerCheckStanceStateExpired()
  if checkStanceStateExpired == nil or checkStanceStateExpired._cancelled then
    checkStanceStateExpired = C_Timer.NewTicker(
      RGPVPW_CONSTANTS.CHECK_STANCE_STACE_EXPIRED_INTERVAL, mod.stanceState.CleanExpiredTrackedStances)
    mod.logger.LogInfo(me.tag, "Started 'CheckStanceStateExpired'")
  end
end

--[[
  Stop the repeating update ticker for stanceStateExpired
]]--
function me.StopTickerCheckStanceStateExpired()
  if checkStanceStateExpired then
    checkStanceStateExpired:Cancel()
    mod.logger.LogInfo(me.tag, "Stopped 'CheckStanceStateExpired'")
  end
end
