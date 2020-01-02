--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

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

-- luacheck: globals CombatLogGetCurrentEventInfo

local mod = rgpvpw
local me = {}
mod.testHelper = me

me.tag = "TestHelper"

local origCombatLogGetCurrentEventInfo = CombatLogGetCurrentEventInfo

--[[
  Reused failure reasons
]]--
mod.testHelper.unableToPlay = "Unable to play sound"

--[[
  Hooks the CombatLogGetCurrentEventInfo function and replaces it with the passed function. Hooking this function
  breaks the complete functionality and should never used with other addons running. The sole purpose is for testing.

  @param {table} functionReplacement
]]--
function me.HookCombatLogGetCurrentEventInfo(functionReplacement)
  mod.logger.LogWarn(me.tag, "Warning hooking 'CombatLogGetCurrentEventInfo' for debugging purposes")

  assert(type(functionReplacement) == "function",
    string.format(
      "bad argument #1 to `HookCombatLogGetCurrentEventInfo` (expected function got %s)", type(functionReplacement)
    )
  )

  CombatLogGetCurrentEventInfo = functionReplacement
end

--[[
  Restores the CombatLogGetCurrentEventInfo function to its normal state
]]--
function me.RestoreCombatLogGetCurrentEventInfo()
  mod.logger.LogInfo(me.tag, "Restoring 'CombatLogGetCurrentEventInfo'")
  CombatLogGetCurrentEventInfo = origCombatLogGetCurrentEventInfo
end

--[[
  @return {string}
]]--
function me.GetGenericPlayerId()
  return "Player-531-0764I8DA"
end

--[[
  @return {string}
]]--
function me.GetGenericPlayerName()
  return "PlayerName"
end

--[[
  @return {string}
]]--
function me.GetGenericEnemyId()
  return "Player-531-0764I8DA"
end

--[[
  @return {string}
]]--
function me.GetGenericEnemyName()
  return "EnemyPlayer"
end
