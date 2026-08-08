--[[
  MIT License

  Copyright (c) 2026 Michael Wiesendanger

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

-- luacheck: globals UnitIsPlayer UnitIsEnemy GetSpellInfo GetTime

local mod = rgpvpw
local me = {}
mod.stanceState = me

me.tag = "StanceState"

-- forward declaration
local MatchesCurrentTargetClass

--[[
  ["spell"] = {table},
  ["detectedTime"] = {number},
  ["category"] = {string} - the spell map category of the stance spell, a lower cased class name
--]]
local stanceTracker = {}
-- Tracks whether configuration mode is enabled or not
local configurationMode = false
-- classes that should be considered to be tracked
local supportedClasses = {"WARRIOR", "DRUID", "PRIEST", "HUNTER", "WARLOCK"}
-- clear stances that are older than 2 minutes
local stanceExpiredTimeout = 120

--[[
  Callback invoked whenever configuration mode is entered or exited. The slot is owned by
  mod.stateFramePositioning, which fans the change out to every registered listener - do not
  assign to it from anywhere else or those listeners stop being notified.
]]--
me.onConfigurationModeChanged = nil

--[[
  Update the stance state of the current target (if there is a valid one)
]]--
function me.UpdateStanceState()
  if not mod.configuration.IsStanceStateTrackingEnabled() then return end

  local hasTrackableEnemyPlayerTarget = UnitIsPlayer(RGPVPW_CONSTANTS.UNIT_ID_TARGET)
    and UnitIsEnemy(RGPVPW_CONSTANTS.UNIT_ID_PLAYER, RGPVPW_CONSTANTS.UNIT_ID_TARGET)
    and me.IsCurrentTargetSupportedClass()

  if hasTrackableEnemyPlayerTarget or configurationMode then
    local currentTargetGuid = mod.target.GetCurrentTargetGuid()

    if currentTargetGuid == nil then
      --[[
        This can only happen in configurationMode because the target check is ignored. Keep the
        icon painted the way UpdateCombatState keeps the combat icon shown - configuration mode
        exists to place the frame and must not blank it.
      ]]--
      mod.logger.LogDebug(me.tag, "No current target guid available")
      mod.stanceFrame.UpdateStanceStateUi(RGPVPW_CONSTANTS.STANCE_STATE_UNKNOWN_STANCE_ICON_ID)

      return
    end

    local playerStanceData = stanceTracker[currentTargetGuid]

    if playerStanceData ~= nil and not MatchesCurrentTargetClass(playerStanceData.category) then
      mod.logger.LogDebug(me.tag, "Ignoring tracked stance: " .. playerStanceData.spell.name
        .. " because its category does not match the class of target: " .. currentTargetGuid)
      playerStanceData = nil
    end

    if playerStanceData ~= nil then
      mod.logger.LogInfo(me.tag, "Found tracked stance: " .. playerStanceData.spell.name
        .. " for target: " .. currentTargetGuid)
      mod.stanceFrame.UpdateStanceStateUi(select(3, GetSpellInfo(playerStanceData.spell.spellId)))
    else
      mod.logger.LogDebug(me.tag, "Unknown stance for player: " .. currentTargetGuid)
      if mod.configuration.IsHideUnknownStanceEnabled() and not configurationMode then
        mod.stanceFrame.HideStanceState()
      else
        mod.stanceFrame.UpdateStanceStateUi(RGPVPW_CONSTANTS.STANCE_STATE_UNKNOWN_STANCE_ICON_ID)
      end
    end
  else
    mod.logger.LogDebug(me.tag, "Stance checking was ignored")
    mod.stanceFrame.HideStanceState()
  end
end

--[[
  Check if the targeted class is supported for stance tracking

  @return {boolean}
    true - if the class has stances to track and is supported
    false - if the class does not have stances and is not supported
]]--
function me.IsCurrentTargetSupportedClass()
  local currentClass = mod.target.GetCurrentTargetClass()

  for _, klass in ipairs(supportedClasses) do
    if klass == currentClass then
      return true
    end
  end

  return false
end

--[[
  Disable the tracking of stance state
]]--
function me.DisableStanceStateTracking()
  mod.ticker.StopTickerCheckStanceStateExpired()
  mod.stanceFrame.HideStanceState()
end

--[[
  Enable the tracking of stance state
]]--
function me.EnableStanceStateTracking()
  mod.ticker.StartTickerCheckStanceStateExpired()
end

--[[
  Enable configuration mode

  @param {boolean} silent
    Optional - skip the no target hint. Used by mod.stateFramePositioning which enables both
    state frames at once and prints the hint itself to avoid duplicating it
]]--
function me.EnableConfigurationMode(silent)
  configurationMode = true
  mod.logger.LogInfo(me.tag, "Enabled stance state configuration mode")

  if not silent and mod.target.GetCurrentTargetGuid() == nil then
    mod.logger.PrintUserError(rgpvpw.L["configuration_mode_no_target"])
  end

  mod.stanceFrame.UpdateStanceStateUi(RGPVPW_CONSTANTS.STANCE_STATE_UNKNOWN_STANCE_ICON_ID)
  mod.stanceFrame.SetPositioningEnabled(true)

  if me.onConfigurationModeChanged then me.onConfigurationModeChanged() end
end

--[[
  Disabled configuration mode
]]--
function me.DisableConfigurationMode()
  configurationMode = false
  mod.logger.LogInfo(me.tag, "Disabled stance state configuration mode")
  mod.stanceFrame.HideStanceState()
  mod.stanceFrame.SetPositioningEnabled(false)

  if me.onConfigurationModeChanged then me.onConfigurationModeChanged() end
end

--[[
  Toggle configuration mode
]]--
function me.ToggleConfigurationMode()
  if configurationMode then
    me.DisableConfigurationMode()
  else
    me.EnableConfigurationMode()
  end
end

--[[
  @return {boolean}
    true - if configuration mode is currently enabled
    false - if configuration mode is currently disabled
]]--
function me.IsConfigurationModeEnabled()
  return configurationMode
end

--[[
  @param {table} spell
  @param {string} target
  @param {string} category
    The spell map category the stance spell was found in. Retained so the render side can tell
    a stance that belongs to the targets class from one that merely landed on them - see
    MatchesCurrentTargetClass
]]--
function me.TrackStanceApplied(spell, target, category)
  if target == nil or spell == nil then return end

  stanceTracker[target] = {
    ["spell"] = spell,
    ["detectedTime"] = GetTime(),
    ["category"] = category
  }

  mod.logger.LogDebug(me.tag, "Tracked stance: " .. spell.name .. " for target: " .. target)

  -- update stance of current target if the update was for the current target
  if target == mod.target.GetCurrentTargetGuid() then
    me.UpdateStanceState()
  end
end

--[[
  @param {table} spell
  @param {string} target
]]--
function me.TrackStanceRemoved(spell, target)
  if target == nil or spell == nil then return end

  local trackedStance = stanceTracker[target]

  --[[
    Only clear when the removal is for the stance that is currently tracked. A stance swap emits a
    removal for the old stance and an application for the new one and the order of those two events
    is not guaranteed - an unconditional clear would wipe the freshly tracked new stance.
  ]]--
  if trackedStance == nil or trackedStance.spell.spellId ~= spell.spellId then
    mod.logger.LogDebug(me.tag, "Ignoring stance removal of an untracked stance: "
      .. spell.name .. " for target: " .. target)

    return
  end

  stanceTracker[target] = nil

  mod.logger.LogDebug(me.tag, "Cleared tracked stance: " .. spell.name .. " for target: " .. target)

  -- update stance of current target if the update was for the current target
  if target == mod.target.GetCurrentTargetGuid() then
    me.UpdateStanceState()
  end
end

--[[
  Cleanup tracked stances that are to old. This is not required very often.
]]--
function me.CleanExpiredTrackedStances()
  for target, stanceData in pairs(stanceTracker) do
    if (GetTime() - stanceData.detectedTime) > stanceExpiredTimeout then
      stanceTracker[target] = nil
      mod.logger.LogInfo(me.tag, "Cleared expired stance data for target: " .. target)
    end
  end
end

--[[
  Whether a tracked stance spell belongs to the class of the current target.

  Almost every stance spell is a self only aura - the caster is the only unit the aura lands on,
  so the spells category can never disagree with the targets class. The hunter aspects of the
  Pack and of the Wild are party wide area auras though: an enemy hunter casting one emits a
  SPELL_AURA_APPLIED for every member of their party, which would otherwise overwrite the stance
  of a targeted warrior standing next to them. The combat log does not carry the class of the
  aura target, so the mismatch can only be resolved here at render time. The mismatched entry is
  left in place rather than deleted - the 2 minute expiry sweep collects it and a declined render
  costs a single comparison.

  @param {string} category
    The spell map category of the tracked stance spell. Categories are lower cased class names
    while GetCurrentTargetClass returns an uppercase class token, hence the normalization

  @return {boolean}
    true - if the category matches the class of the current target or cannot be compared
    false - if the category belongs to a different class than the current target
]]--
MatchesCurrentTargetClass = function(category)
  local currentClass = mod.target.GetCurrentTargetClass()

  --[[
    Fail open when either side is unknown. Stances tracked before the category was plumbed
    through and the no target case of configuration mode both land here
  ]]--
  if category == nil or currentClass == nil then return true end

  return category == string.lower(currentClass)
end
