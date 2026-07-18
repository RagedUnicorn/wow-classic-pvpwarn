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
-- luacheck: globals GetPlayerInfoByGUID UnitGUID

local mod = rgpvpw
local me = {}
mod.combatLog = me

me.tag = "CombatLog"

-- lazily cached player GUID (see GetPlayerGuid) - stable for the whole session
local playerGuid

-- forward declaration
local ProcessDetectedSpell

--[[
  Processing the details of the current combat log event. Invoked when 'COMBAT_LOG_EVENT_UNFILTERED' is fired

  @param {function} callback
    Optional function that is invoked with status infos. Currently only used for testing
  @param {vararg} ...
]]--
function me.ProcessUnfilteredCombatLogEvent(callback, ...)
  local event, sourceFlags = mod.common.SelectMultiple({2, 6}, ...)

  --[[
    Ignore events while the player is in a zone that is not enabled
  ]]--
  if not mod.zone.IsZoneEnabled() then return end

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
    mod.logger.LogDebug(me.tag, "Ignore unsupported event: %s", event)

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
  if RGPVPW_ENVIRONMENT.DEBUG then
    mod.debug.TrackLogNormalEvent(...)
  end

  local spellId, spellName = mod.common.SelectMultiple({12, 13}, ...)
  local category, realSpellId, spell = mod.spellMapHelper.SearchBySpellId(spellId, event)
  local spellType = mod.common.GetSpellType(event)

  if not me.HasFoundSpell(category, spell, spellName) then return end

  ProcessDetectedSpell(spellType, category, realSpellId, spell, spellName, callback, ...)
end

--[[
  @param {string} event
  @param {function} callback
  @param {vararg} ...
]]--
function me.ProcessNormal(event, callback, ...)
  if RGPVPW_ENVIRONMENT.DEBUG then
    mod.debug.TrackLogNormalEvent(...)
  end

  local target, spellId, spellName, buffType = mod.common.SelectMultiple({8, 12, 13, 15}, ...)
  local category, realSpellId, spell = mod.spellMapHelper.SearchBySpellId(spellId, event)
  local spellType = mod.common.GetSpellType(event)

  if not me.HasFoundSpell(category, spell, spellName) then return end
  if me.ShouldFilterDebuff(buffType) then return end
  if me.ShouldIgnorePet(spell, target) then return end

  --[[
    Track stance spells, even if the spell is not active
  ]]--
  if me.IsStanceSpell(spell) then
    if event == "SPELL_AURA_APPLIED" then
      mod.stanceState.TrackStanceApplied(spell, target)
    elseif event == "SPELL_AURA_REMOVED" then
      mod.stanceState.TrackStanceRemoved(spell, target)
    end
  end

  ProcessDetectedSpell(spellType, category, realSpellId, spell, spellName, callback, ...)
end

--[[
  @param {table} spell

  @return {boolean}
    true - if the spell is a stance spell
    false - if the spell is not a stance spell
]]--
function me.IsStanceSpell(spell)
  return spell.isStanceSpell
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
  if RGPVPW_ENVIRONMENT.DEBUG then
    mod.debug.TrackLogAvoidEvent(...)
  end

  local spellId, spellName, missType = mod.common.SelectMultiple({12, 13, 15}, ...)

  -- Filter out irrelevant miss types
  if not me.IsRelevantMissType(missType) then return end

  local category, realSpellId, spell = mod.spellAvoidMapHelper.SearchBySpellId(spellId)
  local spellType = mod.common.GetSpellType(event, spellMissedTarget)

  if not me.HasFoundSpell(category, spell, spellName) then return end

  ProcessDetectedSpell(spellType, category, realSpellId, spell, spellName, callback, ...)
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
  @param {string} missType

  @return {boolean}
    true - if the missType is relevant
    false - if the missType is not relevant
]]--
function me.IsRelevantMissType(missType)
  local isRelevant = RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES[missType] ~= nil

  if not isRelevant then
    mod.logger.LogDebug(me.tag, "Ignoring missType: %s", tostring(missType))
  end

  return isRelevant
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
    mod.logger.LogInfo(me.tag,
      "Ignore spell %s because search in spellMap resulted in not found", spellName)
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
    mod.logger.LogDebug(me.tag, "Ignoring event because buffType is %s", RGPVPW_CONSTANTS.BUFF_TYPE_DEBUFF)
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
    mod.logger.LogDebug(me.tag, "Ignoring event because it was detected on a pet {%s}", target)
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
  @param {number} spellId
  @param {string} normalizedSpellName

  @return {boolean}
    true - if the spell is active
    false if the spell is not active
]]--
function me.IsSpellActive(spellList, category, spellId, normalizedSpellName)
  if mod.spellConfiguration.IsSpellActive(spellList, category, spellId) then
    return true
  end

  mod.logger.LogDebug(me.tag,
    "Ignore spell %s - %s (%s) because it is not active",
    category,
    spellId,
    normalizedSpellName
  )

  return false
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} category
  @param {number} spellId
  @param {string} normalizedSpellName

  @return {boolean}
    true - if sound is active for the spell
    false if sound is not active for the spell
]]--
function me.IsSoundWarningActive(spellList, category, spellId, normalizedSpellName)
  if mod.spellConfiguration.IsSoundWarningActive(spellList, category, spellId)
    or mod.spellConfiguration.IsSoundFadeWarningActive(spellList, category, spellId) then
    return true
  end

  mod.logger.LogDebug(me.tag,
    "Ignore playing sound/soundFade for %s - %s - %s because it is not active",
    category,
    spellId,
    normalizedSpellName
  )

  return false
end

--[[
  @param {string} spellList
    Decides upon which stored list should be used. Possible values:
    * spellList - enemy spell detected
    * spellSelfAvoidList - player avoided spell
    * spellEnemyAvoidList - enemy player avoided spell
  @param {string} category
  @param {number} spellId
  @param {string} normalizedSpellName

  @return {boolean}
    true - if visual warning is active
    false- if visual warning is not active
]]--
function me.IsVisualWarningActive(spellList, category, spellId, normalizedSpellName)
  if mod.spellConfiguration.IsVisualWarningActive(spellList, category, spellId) then return true end

  mod.logger.LogDebug(me.tag,
    "Ignore playing visual warning for %s - %s because it is not active", category, normalizedSpellName
  )

  return false
end

--[[
  Resolve the detection-bar payload for the current combat-log event, or nil when the
  detection bar is globally disabled.

  @param {number} spellType
    RGPVPW_CONSTANTS.SPELL_TYPES
  @param {number} spellId
  @param {string} spellName
  @param {number} colorValue
    The detected spell's visual warning colorValue, used for the event-text color
  @param {vararg} ...
    The raw combat-log event args, forwarded for source GUID/name extraction

  @return {table | nil}
    A payload table for mod.detectionBarManager.Push, or nil
]]--
function me.ResolveDetectionBarPayload(spellType, spellId, spellName, colorValue, ...)
  if not mod.configuration.IsDetectionBarEnabled() then return nil end

  local srcGUID, srcName = mod.common.SelectMultiple({4, 5}, ...)

  return me.BuildDetectionBarPayload(spellType, srcGUID, srcName, spellId, spellName, colorValue)
end

--[[
  Convert a spell's visual warning colorValue into a keyed {r, g, b} event-text color,
  falling back to the default when the spell has no color configured (colorValue "none").

  @param {number} colorValue
    A RGPVPW_CONSTANTS.TEXTURES colorValue

  @return {table}
    A keyed { r, g, b } color table
]]--
function me.ResolveDetectionBarEventColor(colorValue)
  if not colorValue or colorValue == RGPVPW_CONSTANTS.DEFAULT_COLOR then
    return RGPVPW_CONSTANTS.DETECTION_BAR_DEFAULT_EVENT_COLOR
  end

  local meta = RGPVPW_COLORS.GetColorMetadata(colorValue)
  local rgb = meta and meta.rgb

  if not rgb then return RGPVPW_CONSTANTS.DETECTION_BAR_DEFAULT_EVENT_COLOR end

  return { r = rgb[1], g = rgb[2], b = rgb[3] }
end

--[[
  Build the event text for an aura-removed detection. The bar's font string gets the red
  removed color as its base color so the localized static suffix ("down") renders red in any
  locale word order, while the substituted spell name is wrapped in an inline color escape
  to keep the regular event color.

  @param {string} spellName
  @param {table} eventColor
    The keyed { r, g, b } event color the spell name should keep

  @return {string}
]]--
function me.BuildRemovedEventText(spellName, eventColor)
  local coloredSpellName = string.format(
    "|cff%02x%02x%02x%s|r",
    math.floor(eventColor.r * 255 + 0.5),
    math.floor(eventColor.g * 255 + 0.5),
    math.floor(eventColor.b * 255 + 0.5),
    spellName
  )

  return string.format(rgpvpw.L["detection_bar_event_removed"], coloredSpellName)
end

--[[
  Build the payload the detection bar manager needs from a combat-log source. Aura-removed
  detections are marked so the bar renders them visibly distinct from a fresh cast.

  @param {number} spellType
    RGPVPW_CONSTANTS.SPELL_TYPES
  @param {string} srcGUID
    The combat-log source GUID, used to derive the enemy class color
  @param {string} srcName
    The combat-log source name (may include a "-Realm" suffix)
  @param {number} spellId
  @param {string} spellName
    The localized spell name to display as the event text
  @param {number} colorValue
    The detected spell's visual warning colorValue, used for the event-text color

  @return {table}
    A payload table for mod.detectionBarManager.Push
]]--
function me.BuildDetectionBarPayload(spellType, srcGUID, srcName, spellId, spellName, colorValue)
  local classToken

  if srcGUID then
    classToken = select(2, GetPlayerInfoByGUID(srcGUID)) -- englishClass e.g. "ROGUE"
  end

  local isRemoved = spellType == RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED
  local eventText = spellName
  local eventColor = me.ResolveDetectionBarEventColor(colorValue)

  --[[ removed detections: red base color (matches the 'X' marker) so only the localized
       suffix renders red while the spell name keeps the regular event color ]]--
  if isRemoved then
    eventText = me.BuildRemovedEventText(spellName, eventColor)
    eventColor = RGPVPW_CONSTANTS.DETECTION_BAR_REMOVED_EVENT_COLOR
  end

  return {
    spellID = spellId,
    classToken = classToken,
    playerName = srcName or "",
    eventText = eventText,
    eventColor = eventColor,
    isRemoved = isRemoved
  }
end

--[[
  Returns the players own GUID, resolving it once on first use. UnitGUID("player") is
  stable for the whole session so the cached value never needs invalidation.

  @return {string}
]]--
function me.GetPlayerGuid()
  if playerGuid == nil then
    playerGuid = UnitGUID(RGPVPW_CONSTANTS.UNIT_ID_PLAYER)
  end

  return playerGuid
end

--[[
  Whether the detected combat log event passes the target filter. In the default
  TARGET_FILTER_MODE_WARN_ALL mode every event passes. In
  TARGET_FILTER_MODE_CURRENT_TARGET mode an event passes when its source or destination
  is the current enemy target, when its destination is the player (being attacked is
  always relevant) or when its source GUID cannot be resolved (fail-open).

  @param {vararg} ...
    The raw combat-log event args, used for source (4) and destination (8) GUID extraction

  @return {boolean}
    true - if the event should warn
    false - if the event should be suppressed
]]--
function me.ShouldWarnForTarget(...)
  if mod.configuration.GetTargetFilterMode() ~= RGPVPW_CONSTANTS.TARGET_FILTER_MODE_CURRENT_TARGET then
    return true
  end

  local sourceGuid, destGuid = mod.common.SelectMultiple({4, 8}, ...)

  if destGuid == me.GetPlayerGuid() then return true end

  local targetGuid = mod.targetFilter.GetCurrentTargetGuid()

  if targetGuid ~= nil and (sourceGuid == targetGuid or destGuid == targetGuid) then
    return true
  end

  if sourceGuid == nil or sourceGuid == "" then return true end

  mod.logger.LogDebug(me.tag, "Suppressing warning because the event did not pass the target filter")

  return false
end

--[[
  Shared tail of the combat log handlers. Gates the detected spell on its configuration,
  resolves the visual warning color and detection bar payload and plays the warning.

  @param {number} spellType
    RGPVPW_CONSTANTS.SPELL_TYPES
  @param {string} category
  @param {number} spellId
    The spellId of the spell as found in the spellMap
  @param {table} spell
  @param {string} spellName
  @param {function} callback
    Optional function that is invoked with status infos. Currently only used for testing
  @param {vararg} ...
    The raw combat-log event args, forwarded for the detection bar payload
]]--
ProcessDetectedSpell = function(spellType, category, spellId, spell, spellName, callback, ...)
  if not me.IsValidSpellType(spellType) then return end
  if not me.ShouldWarnForTarget(...) then return end

  local normalizedSpellName = mod.common.NormalizeSpellName(spellName)
  local spellMap = mod.common.GetSpellMap(spellType)

  if not me.IsSpellActive(spellMap, category, spellId, normalizedSpellName) then return end

  local playSound = me.IsSoundWarningActive(spellMap, category, spellId, normalizedSpellName)
  local playVisual = me.IsVisualWarningActive(spellMap, category, spellId, normalizedSpellName)
  local visualWarningColor = mod.spellConfiguration.GetVisualWarningColor(spellMap, category, spellId)

  if playVisual then
    spell.visualWarningColor = visualWarningColor
  end

  local detectionBarPayload = me.ResolveDetectionBarPayload(spellType, spellId, spellName, visualWarningColor, ...)

  mod.warn.PlayWarning(category, spellType, spell, callback, playSound, playVisual, detectionBarPayload)
end
