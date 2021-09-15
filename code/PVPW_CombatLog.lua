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
    me.ProcessEventHostilePlayers(event, callback, ...)
  elseif CombatLog_Object_IsA(sourceFlags, COMBATLOG_FILTER_MINE) then
    me.ProcessEventMine(event, callback, ...)
  end
end

--[[
  @param {string} event
  @param {function} callback
    Optional function that is invoked with status infos. Currently only used for testing
  @param {vararg} ...
]]--
function me.ProcessEventHostilePlayers(event, callback, ...)
  if event == "SPELL_CAST_SUCCESS" then
    me.ProcessNormal(event, callback, ...)
  elseif event == "SPELL_CAST_START" then
    me.ProcessStart(event, callback, ...)
  elseif event == "SPELL_AURA_REMOVED" then
    me.ProcessNormal(event, callback, ...)
  elseif event == "SPELL_AURA_REFRESH" then
    me.ProcessNormal(event, callback, ...)
  elseif event == "SPELL_AURA_APPLIED" then
    me.ProcessNormal(event, callback, ...)
  elseif event == "SPELL_MISSED" then
    me.ProcessMissed(event, RGPVPW_CONSTANTS.TARGET_SELF, callback, ...)
  else
    mod.logger.LogDebug(me.tag, "Ignore unsupported event: " .. event)

    if callback then
      callback()
    end
  end
end

--[[
  @param {string} event
  @param {function} callback
    Optional function that is invoked with status infos. Currently only used for testing
  @param {vararg} ...
]]--
function me.ProcessEventMine(event, callback, ...)
  if event == "SPELL_MISSED" then
    me.ProcessMissed(event, RGPVPW_CONSTANTS.TARGET_ENEMY, callback, ...)
  end
end

--[[
  @param {string} event
  @param {function} callback
    Optional function that is invoked with status infos. Currently only used for testing
  @param {vararg} ...
]]--
function me.ProcessStart(event, callback, ...)
  local spellName = select(13, ...)
  local normalizedSpellName = mod.common.NormalizeSpellname(spellName)
  local category, spell = mod.spellMap.SearchByName(normalizedSpellName, event)
  local spellType = mod.common.GetSpellType(event)
  local spellMap = mod.common.GetSpellMap(spellType)
  local playSound
  local playVisual

  if not me.IsValidSpellType(spellType) then return end
  if not me.HasFoundSpell(category, spell, spellName) then return end
  if not me.IsSpellActive(spellMap, category, normalizedSpellName) then return end

  local visualWarningColor = mod.spellConfiguration.GetVisualWarningColor(
    spellMap, category, normalizedSpellName
  )

  playSound = me.IsSoundWarningActive(spellMap, category, spellName, normalizedSpellName)
  playVisual = me.IsVisualWarningActive(category, normalizedSpellName, visualWarningColor)

  mod.warn.PlayWarning(category, spellType, spell, callback, playSound, playVisual)
end

--[[
  @param {string} event
  @param {function} callback
]]--
function me.ProcessNormal(event, callback, ...)
  local target, _, _, _, _, spellName, _, buffType = select(8, ...)
  local normalizedSpellName = mod.common.NormalizeSpellname(spellName)
  local category, spell = mod.spellMap.SearchByName(normalizedSpellName, event)
  local spellType = mod.common.GetSpellType(event)
  local spellMap = mod.common.GetSpellMap(spellType)
  local playSound
  local playVisual

  if me.ShouldFilterDebuff(buffType) then return end
  if me.ShouldIgnorePet(spell, target) then return end
  if not me.IsValidSpellType(spellType) then return end
  if not me.HasFoundSpell(category, spell, spellName) then return end
  if not me.IsSpellActive(spellMap, category, normalizedSpellName) then return end

  local visualWarningColor = mod.spellConfiguration.GetVisualWarningColor(
    spellMap, category, normalizedSpellName
  )

  playSound = me.IsSoundWarningActive(spellMap, category, spellName, normalizedSpellName)
  playVisual = me.IsVisualWarningActive(category, normalizedSpellName, visualWarningColor)

  if playVisual then
    spell.visualWarningColor = visualWarningColor
  end

  mod.warn.PlayWarning(category, spellType, spell, callback, playSound, playVisual)
end

--[[
  Process event "SPELL_MISSED" for spell resists

  @param {string} event
  @param {number} spellMissedTarget
    TARGET_SELF or TARGET_ENEMY
  @param {function} callback
    Optional function that is invoked with status infos. Currently only used for testing
  @param {vararg} ...
]]--
function me.ProcessMissed(event, spellMissedTarget, callback, ...)
  local spellName, _, missType = select(13, ...)

  if not mod.common.IsSupportedMissType(missType) then
    mod.logger.LogDebug(me.tag, "ProcessMissed ignore unsupported missType: " .. missType)
    return
  end

  local normalizedSpellName = mod.common.NormalizeSpellname(spellName)
  local spellType = mod.common.GetSpellType(event, spellMissedTarget)
  local spellList = mod.common.GetSpellMap(spellType)
  local category, spell = mod.spellAvoidMap.SearchByName(spellName, event)
  local playSound
  local playVisual

  if not me.IsValidSpellType(spellType) then return end
  if not me.HasFoundSpell(category, spell, spellName) then return end
  if not me.IsSpellActive(spellList, category, normalizedSpellName) then return end

  local visualWarningColor = mod.spellConfiguration.GetVisualWarningColor(
    spellList, category, normalizedSpellName
  )

  playSound = me.IsSoundWarningActive(spellList, category, spellName, normalizedSpellName)
  playVisual = me.IsVisualWarningActive(category, normalizedSpellName, visualWarningColor)

  if playVisual then
    spell.visualWarningColor = visualWarningColor
  end

  mod.warn.PlayWarning(category, spellType, spell, callback, playSound, playVisual)
end


--[[
  @param {number} spellType
    RGPVPW_CONSTANTS.SPELL_TYPES

  @return {boolean}
    true - if the spellType is valid
    false - if the spellType is not valid
]]--
function me.IsValidSpellType(spellType)
  if spellType == nil then
    mod.logger.LogError(me.tag, "Unable to determine spellType - aborting...")
    return false
  end

  return true
end

--[[
  @param {string} category
  @param {table} spell
  @param {string} spellName

  @return {boolean}
    true - if a spell was found
    false - if no spell could be found
]]--
function me.HasFoundSpell(category, spell, spellName)
  if category == nil or spell == nil then
    --[[
      This doesn't necessarily means that the spell does not exist in the spellMap but
      it might not match to the event that happened
    ]]--
    mod.logger.LogInfo(me.tag, string.format(
      "Ignore spell %s because search in spellAvoidMap resulted in not found", spellName
      )
    )
    return false
  end

  return true
end

--[[
  @param {string} buffType

  @return {boolean}
    true - if the event is of type RGPVPW_CONSTANTS.BUFF_TYPE_DEBUFF and should be filtered
    false - if the event is not of type RGPVPW_CONSTANTS.BUFF_TYPE_DEBUFF and should not be filtered
]]--
function me.ShouldFilterDebuff(buffType)
  --[[
    Filter events with buff type "DEBUFF" they cause duplicates
  ]]--
  if buffType ~= nil and buffType == RGPVPW_CONSTANTS.BUFF_TYPE_DEBUFF then
    mod.logger.LogDebug(me.tag, "Ignoring event because buffType is " .. RGPVPW_CONSTANTS.BUFF_TYPE_DEBUFF)
    return true
  end

  return false
end

--[[
  Whether the spell was detected on a pet e.g. Soul Link and should be ignored

  @param {table} spell
  @param {string} target

  @return {boolean}
    true - if the spell should be ignored
    false - if the spell should not be ignored
]]--
function me.ShouldIgnorePet(spell, target)
  if spell.ignorePet and target ~= nil and target:find("^Pet") ~= nil then
    mod.logger.LogDebug(me.tag, "Ignoring event because it was detected on a pet {" .. target .. "}")
    return true
  end

  return false
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} category
  @param {string} normalizedSpellName

  @return {boolean}
    true - if the spell is active
    false if the spell is not active
]]--
function me.IsSpellActive(spellList, category, normalizedSpellName)
  if not mod.spellConfiguration.IsSpellActive(spellList, category, normalizedSpellName) then
    mod.logger.LogDebug(me.tag, string.format(
      "Ignore spell %s - %s because it is not active", category, normalizedSpellName
      )
    )
    return false
  end

  return true
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} category
  @param {string} spellName
  @param {string} normalizedSpellName

  @return {boolean}
    true - if sound is active for the spell
    false if sound is not active for the spell
]]--
function me.IsSoundWarningActive(spellList, category, spellName, normalizedSpellName)
  if mod.spellConfiguration.IsSoundWarningActive(spellList, category, normalizedSpellName)
    or mod.spellConfiguration.IsSoundFadeWarningActive(spellList, category, spellName) then
    return true
  end

  mod.logger.LogDebug(me.tag, string.format(
    "Ignore playing sound/soundFade for %s - %s because it is not active", category, normalizedSpellName))

  return false
end

--[[
  @param {string} category
  @param {string} normalizedSpellName
  @param {number} visualWarningColor

  @return {boolean}
    true - if visual warning is active
    false- if visual warning is not active
]]--
function me.IsVisualWarningActive(category, normalizedSpellName, visualWarningColor)
  if visualWarningColor ~= RGPVPW_CONSTANTS.DEFAULT_COLOR then
    return true
  end

  mod.logger.LogDebug(me.tag, string.format(
    "Ignore playing visual warning for %s - %s because it is not active", category, normalizedSpellName
    )
  )

  return false
end
