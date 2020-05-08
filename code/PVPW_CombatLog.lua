--[[
  MIT License

  Copyright (c) 2020 Michael Wiesendanger

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

-- luacheck: globals CombatLogGetCurrentEventInfo CombatLog_Object_IsA COMBATLOG_FILTER_HOSTILE_PLAYERS

local mod = rgpvpw
local me = {}
mod.combatLog = me

me.tag = "CombatLog"

--[[
  Processing the details of the current combat log event. Invoked when 'COMBAT_LOG_EVENT_UNFILTERED' is fired

  @param {function} callback
    Optional function that is invoked with status infos. Currently only used for testing
]]--
function me.ProcessUnfilteredCombatLogEvent(callback)
  local _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName = CombatLogGetCurrentEventInfo()

  if RGPVPW_ENVIRONMENT.DEBUG then
    mod.debug.TrackLogEvent(event, sourceFlags, target, targetName, spellName)
  end
  --[[
    Filter for hostile player events only
  ]]--
  if CombatLog_Object_IsA(sourceFlags, COMBATLOG_FILTER_HOSTILE_PLAYERS) then
    --and CombatLog_Object_IsA(sourceFlags, COMBATLOG_OBJECT_TARGET)
    if event == "SPELL_CAST_SUCCESS" then
      me.ProcessEvent(spellName, event, callback)
    elseif event == "SPELL_AURA_APPLIED" then
      me.ProcessEvent(spellName, event, callback)
    elseif event == "SPELL_AURA_REMOVED" then
      me.ProcessEvent(spellName, event, callback)
    elseif event == "SPELL_AURA_REFRESH" then
      me.ProcessEvent(spellName, event, callback)
    else
      mod.logger.LogDebug(me.tag, "Ignore unsupported event: " .. event)

      if callback then
        callback()
      end
    end
  end
end

--[[
  @param {string} spellName
  @param {string} event
  @param {function} callback
]]--
function me.ProcessEvent(spellName, event, callback)
  local category, spell = mod.spellMap.SearchByName(spellName, event)
  local spellType = mod.common.GetSpellType(event)
  local playSound
  local playVisual

  if spellType == nil then
    mod.logger.LogError(me.tag, "Unable to determine spellType - aborting...")
    return
  end

  if category == nil or spell == nil then
    --[[
      This doesn't necessarily means that the spell does not exist in the spellMap but
      it might not match to the event that happened
    ]]--
    mod.logger.LogInfo(me.tag, string.format(
      "Ignore spell %s because search in spellMap resulted in not found", spellName
      )
    )
    return
  end

  if not mod.spellConfiguration.IsSpellActive(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL, category, spellName) then
    mod.logger.LogDebug(me.tag, string.format(
      "Ignore spell %s - %s because it is not active", category, spellName
      )
    )
    return -- spell not active no work todo
  end

  if mod.spellConfiguration.IsSoundWarningActive(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL, category, spellName)
    or mod.spellConfiguration.IsSoundFadeWarningActive(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL, category, spellName) then
    playSound = true
  else
    mod.logger.LogDebug(me.tag, string.format(
      "Ignore playing sound/soundFade for %s - %s because it is not active", category, spellName
      )
    )
    playSound = false
  end

  local visualWarningColor = mod.spellConfiguration.GetVisualWarningColor(
    RGPVPW_CONSTANTS.SPELL_TYPE.SPELL, category, spellName
  )

  if visualWarningColor ~= RGPVPW_CONSTANTS.DEFAULT_COLOR then
    mod.visual.ShowVisualAlert(visualWarningColor)
    playVisual = true
    spell.visualWarningColor = visualWarningColor
  else
    mod.logger.LogDebug(me.tag, string.format(
      "Ignore playing sound for %s - %s because it is not active", category, spellName
      )
    )
    playVisual = false
  end

  mod.warn.PlayWarning(category, spellType, spell, callback, playSound, playVisual)
end
