--[[
  MIT License

  Copyright (c) 2021 Michael Wiesendanger

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
mod.combatLog = me

me.tag = "CombatLog"

--[[
  Processing the details of the current combat log event. Invoked when 'COMBAT_LOG_EVENT_UNFILTERED' is fired

  @param {function} callback
    Optional function that is invoked with status infos. Currently only used for testing
  @param {vararg} ...
]]--
function me.ProcessUnfilteredCombatLogEvent(callback, ...)
  local _, event, _, _, _, sourceFlags = select(1, ...)

  if RGPVPW_ENVIRONMENT.DEBUG then
    mod.debug.TrackLogEvent(...)
  end

  --[[
    Filter for hostile player events only
  ]]--
  if CombatLog_Object_IsA(sourceFlags, COMBATLOG_FILTER_HOSTILE_PLAYERS) then
    if event == "SPELL_CAST_SUCCESS" then
      local _, _, _, _, _, _, _, target, _, _, _, _, spellName = ...
      me.ProcessEvent(spellName, target, nil, event, callback)
    elseif event == "SPELL_AURA_APPLIED" then
      local target, _, _, _, _, spellName, _, buffType = select(8, ...)
      me.ProcessEvent(spellName, target, buffType, event, callback)
    elseif event == "SPELL_AURA_REMOVED" then
      local target, _, _, _, _, spellName, _, buffType = select(8, ...)
      me.ProcessEvent(spellName, target, buffType, event, callback)
    elseif event == "SPELL_AURA_REFRESH" then
      local target, _, _, _, _, spellName, _, buffType = select(8, ...)
      me.ProcessEvent(spellName, target, buffType, event, callback)
    elseif event == "SPELL_MISSED" then
      local spellName, _, missType = select(13, ...)
      me.ProcessResist(spellName, event, missType, RGPVPW_CONSTANTS.TARGET_SELF, callback)
    else
      mod.logger.LogDebug(me.tag, "Ignore unsupported event: " .. event)

      if callback then
        callback()
      end
    end
  elseif CombatLog_Object_IsA(sourceFlags, COMBATLOG_FILTER_MINE) then
    if event == "SPELL_MISSED" then
      local spellName, _, missType = select(13, ...)
      me.ProcessResist(spellName, event, missType, RGPVPW_CONSTANTS.TARGET_ENEMY, callback)
    end
  end
end

--[[
  @param {string} spellName
  @param {string} target
  @param {string} event
  @param {function} callback
]]--
function me.ProcessEvent(spellName, target, buffType, event, callback)
  local normalizedSpellName = mod.common.NormalizeSpellname(spellName)
  local category, spell = mod.spellMap.SearchByName(normalizedSpellName, event)
  local spellType = mod.common.GetSpellType(event)
  local playSound
  local playVisual

  --[[
    Filter events with buff type "DEBUFF" they cause duplicates
  ]]--
  if buffType ~= nil and buffType == RGPVPW_CONSTANTS.BUFF_TYPE_DEBUFF then
    mod.logger.LogDebug(me.tag, "Ignoring event because buffType is " .. RGPVPW_CONSTANTS.BUFF_TYPE_DEBUFF)
    return
  end

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
      "Ignore spell %s because search in spellMap resulted in not found", normalizedSpellName
      )
    )
    return
  end

  --[[
    If the spell is marked as should be ignored when detected on a pet
  ]]--
  if mod.spellConfiguration.IsSpellIgnorePet(spell, target) then
    return
  end

  if not mod.spellConfiguration.IsSpellActive(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL, category, normalizedSpellName) then
    mod.logger.LogDebug(me.tag, string.format(
      "Ignore spell %s - %s because it is not active", category, normalizedSpellName
      )
    )
    return -- spell not active no work
  end

  if mod.spellConfiguration.IsSoundWarningActive(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL, category, normalizedSpellName)
    or mod.spellConfiguration.IsSoundFadeWarningActive(RGPVPW_CONSTANTS.SPELL_TYPE.SPELL, category, spellName) then
    playSound = true
  else
    mod.logger.LogDebug(me.tag, string.format(
      "Ignore playing sound/soundFade for %s - %s because it is not active", category, normalizedSpellName
      )
    )
    playSound = false
  end

  local visualWarningColor = mod.spellConfiguration.GetVisualWarningColor(
    RGPVPW_CONSTANTS.SPELL_TYPE.SPELL, category, normalizedSpellName
  )

  if visualWarningColor ~= RGPVPW_CONSTANTS.DEFAULT_COLOR then
    mod.visual.ShowVisualAlert(visualWarningColor)
    playVisual = true
    spell.visualWarningColor = visualWarningColor
  else
    mod.logger.LogDebug(me.tag, string.format(
      "Ignore playing visual warning for %s - %s because it is not active", category, normalizedSpellName
      )
    )
    playVisual = false
  end

  mod.warn.PlayWarning(category, spellType, spell, callback, playSound, playVisual)
end

--[[
  Process event "SPELL_MISSED" for spell resists

  @param {string} spellName
  @param {string} event
  @param {string} missType
    RGPVPW_CONSTANTS.MISS_TYPES
  @param {number} spellMissedTarget
    TARGET_SELF or TARGET_ENEMY
  @param {function} callback
]]--
function me.ProcessResist(spellName, event, missType, spellMissedTarget, callback)
  if not mod.common.IsSupportedMissType(missType) then
    mod.logger.LogDebug(me.tag, "ProcessResist ignore unsupported missType: " .. missType)
    return
  end

  local normalizedSpellName = mod.common.NormalizeSpellname(spellName)
  local spellType = mod.common.GetSpellType(event, spellMissedTarget)
  local spellMap = mod.common.GetSpellMap(spellType)
  local category, spell = mod.spellAvoidMap.SearchByName(spellName, event)
  local playSound
  local playVisual

  if spellType == nil then
    mod.logger.LogError(me.tag, "Unable to determine spellType - aborting...")
    return
  end

  if category == nil or spell == nil then
    mod.logger.LogInfo(me.tag, string.format(
      "Ignore spell %s because search in spellAvoidMap resulted in not found", spellName
      )
    )
    return
  end

  if not mod.spellConfiguration.IsSpellActive(spellMap, category, normalizedSpellName) then
    mod.logger.LogDebug(me.tag, string.format(
      "Ignore spell %s - %s because it is not active", category, normalizedSpellName
      )
    )
    return -- spell not active no work
  end

  if mod.spellConfiguration.IsSoundWarningActive(spellMap, category, normalizedSpellName) then
    playSound = true
  else
    mod.logger.LogDebug(me.tag, string.format(
      "Ignore playing sound for %s - %s because it is not active", category, normalizedSpellName
      )
    )
    playSound = false
  end

  local visualWarningColor = mod.spellConfiguration.GetVisualWarningColor(
    spellMap, category, normalizedSpellName
  )

  if visualWarningColor ~= RGPVPW_CONSTANTS.DEFAULT_COLOR then
    mod.visual.ShowVisualAlert(visualWarningColor)
    playVisual = true
    spell.visualWarningColor = visualWarningColor
  else
    mod.logger.LogDebug(me.tag, string.format(
      "Ignore playing visual warning for %s - %s because it is not active", category, normalizedSpellName
      )
    )
    playVisual = false
  end

  mod.warn.PlayWarning(category, spellType, spell, callback, playSound, playVisual)
end
