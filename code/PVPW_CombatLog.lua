--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

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

-- luacheck: globals CombatLogGetCurrentEventInfo CombatLog_Object_IsA GetTime COMBATLOG_FILTER_MINE
-- luacheck: globals COMBATLOG_FILTER_HOSTILE_PLAYERS COMBATLOG_FILTER_HOSTILE_UNITS GetComboPoints

local mod = rgpvpw
local me = {}
mod.combatLog = me

me.tag = "CombatLog"

--[[
  Processing the details of the current combat log event. Invoked when 'COMBAT_LOG_EVENT_UNFILTERED' is fired
]]--
function me.ProcessUnfilteredCombatLogEvent()
  local _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName = CombatLogGetCurrentEventInfo()
  --[[
    Filter for hostile player events only
  ]]--
  if CombatLog_Object_IsA(sourceFlags, COMBATLOG_FILTER_HOSTILE_PLAYERS) then
    mod.logger.LogError(me.tag, "Hostile player event detected: " .. event)

    if event == "SPELL_CAST_SUCCESS" then
      mod.logger.LogInfo(me.tag, "Detected casted spell: " .. spellName)

      local category, spell = mod.spellMap.SearchByName(spellName, event)

      if category ~= nil and spell ~= nil then
        mod.logger.LogDebug(me.tag, "Found tracked spell")
        mod.alert.PlayAlert(category, spell)
      end
    elseif event == "SPELL_AURA_APPLIED" then
      -- TODO this is probably used for all buff related alerts suchs as mage x gets arcane power
      mod.logger.LogInfo(me.tag, "Detected casted spell: " .. spellName)
    elseif event == "SPELL_AURA_REMOVED" then
      -- TODO this is probably going to be used for most "down/faded" sound. E.g. recklesness runs out
    else
      mod.logger.LogDebug(me.tag, "Ignore unsupported event: " .. event)
    end

  end
end
