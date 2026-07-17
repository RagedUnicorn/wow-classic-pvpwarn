--[[
  MIT License

  Copyright (c) 2025 Michael Wiesendanger

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

-- luacheck: globals GetTime C_Timer

local mod = rgpvpw
local me = {}
mod.warn = me

me.tag = "Warn"

local warnQueue = {}

--[[
  Registered output channels. gui/Flash.lua and gui/DetectionBarManager.lua register
  themselves at load time (gui/ loads after code/ in toc order). Keeping the channels
  behind a registration seam means Warn has no gui references - the pipeline runs
  headlessly with no gui module present; a missing channel is skipped with a debug log.
]]--
local visualChannel
local detectionBarChannel

-- forward declaration
local RemoveFromQueue
local PlaySound
local PlayVisual

--[[
 Whether queue is currently busy playing a sound. Preventing multiple sounds and
 warnings playing at the same time. Queue is first in first served.
]]--
local isQueueBusy = false

--[[
  Register the visual warning output channel (see gui/Flash.lua). Invoked by PlayVisual
  with the spell's visualWarningColor colorValue.

  @param {function} channel
]]--
function me.RegisterVisualChannel(channel)
  assert(type(channel) == "function",
    string.format("bad argument #1 to `RegisterVisualChannel` (expected function got %s)", type(channel))
  )

  visualChannel = channel
end

--[[
  Register the detection bar output channel (see gui/DetectionBarManager.lua). Invoked by
  PlayWarning with a detection bar payload table.

  @param {function} channel
]]--
function me.RegisterDetectionBarChannel(channel)
  assert(type(channel) == "function",
    string.format("bad argument #1 to `RegisterDetectionBarChannel` (expected function got %s)", type(channel))
  )

  detectionBarChannel = channel
end

--[[
  @param {string} warnName
    generated name
  @param {string} category
    e.g rogue, misc, racials etc
  @param {string} spellType
    constant spellType see constants SPELL_TYPES
  @param {table} spell
    retrieved spell from spellMap
  @param {boolean} playSound
    Whether to play sound or not depending on the users preferences
  @param {boolean} playVisual
    Whether to play a visual warning or not depending on the users preferences
]]--
function me.AddToQueue(warnName, category, spellType, spell, playSound, playVisual)
  local warning = {
    ["warnName"] = warnName,
    ["category"] = category,
    ["spell"] = spell,
    ["spellType"] = spellType, -- see constants SPELL_TYPES
    ["playSound"] = playSound,
    ["playVisual"] = playVisual,
    ["startTime"] = GetTime() -- time to track expiry timer
  }

  table.insert(warnQueue, warning)
  mod.logger.LogDebug(me.tag, "Added new warning with name '" .. warning.warnName .. "' to queue")
end

--[[
  @param {number} position
]]--
RemoveFromQueue = function(position)
  table.remove(warnQueue, position)
  mod.logger.LogDebug(me.tag, "Removed warning with position '" .. position .. "' from queue")
end

--[[
  Called in an interval. Warnings that are to old are pruned from the queue first,
  then the warning at the head of the queue is processed
]]--
function me.ProcessQueue()
  -- if queue is already busy abort
  if isQueueBusy then
    return
  end

  -- iterate backwards so removing entries does not shift unvisited elements
  for position = #warnQueue, 1, -1 do
    local age = GetTime() - warnQueue[position].startTime

    if age > RGPVPW_CONSTANTS.MAX_WARN_AGE then
      mod.logger.LogWarn(me.tag, "Skipping warn message because max age was reached")
      RemoveFromQueue(position)
    end
  end

  local warning = warnQueue[1]

  if warning == nil then
    return
  end

  local playedSound = false
  local playedVisual = false
  local spellTypes = RGPVPW_CONSTANTS.SPELL_TYPES

  if warning.spellType == spellTypes.NORMAL or
    warning.spellType == spellTypes.APPLIED or
    warning.spellType == spellTypes.REFRESH then
    playedSound = PlaySound(warning, spellTypes.NORMAL)
    playedVisual = PlayVisual(warning)
  elseif warning.spellType == spellTypes.REMOVED then
    playedSound = PlaySound(warning, spellTypes.REMOVED)
  elseif warning.spellType == spellTypes.MISSED_SELF then
    playedSound = PlaySound(warning, spellTypes.MISSED_SELF)
    playedVisual = PlayVisual(warning)
  elseif warning.spellType == spellTypes.MISSED_ENEMY then
    playedSound = PlaySound(warning, spellTypes.MISSED_ENEMY)
    playedVisual = PlayVisual(warning)
  elseif warning.spellType == spellTypes.START then
    playedSound = PlaySound(warning, spellTypes.START)
  else
    mod.logger.LogError(me.tag, "Found invalid spelltype: " .. warning.spellType)
  end

  if playedSound or playedVisual then
    isQueueBusy = true
    C_Timer.After(RGPVPW_CONSTANTS.WARN_QUEUE_BUSY_GATE, function()
      isQueueBusy = false
    end)
  end

  RemoveFromQueue(1)
end

--[[
  @param {string} category
  @param {number} spellType
  @param {table} spell
  @param {function} callback
    Optional function that is invoked with status infos. Currently only used for testing
  @param {boolean} playSound
  @param {boolean} playVisual
  @param {table | nil} detectionBarPayload
    When present, a payload for the registered detection bar channel. The detection bar is a
    purely visual channel with its own stack semantics, so it is dispatched directly here and
    bypasses the sound/visual warn-queue and its 0.8s busy gate.
]]--
function me.PlayWarning(category, spellType, spell, callback, playSound, playVisual, detectionBarPayload)
  if category == nil or spellType == nil or spell == nil then
    return
  end

  -- queue spell into warnqueue
  me.AddToQueue(tostring(math.floor(math.random() * 100000)), category, spellType, spell, playSound, playVisual)

  --[[
    The detection bar bypasses the warn-queue. Push it directly so it is not throttled by the
    audio busy gate; the manager handles dedup and stack concurrency itself.
  ]]--
  if detectionBarPayload ~= nil then
    if detectionBarChannel ~= nil then
      detectionBarChannel(detectionBarPayload)
    else
      mod.logger.LogDebug(me.tag, "Skipping detection bar payload because no detection bar channel is registered")
    end
  end

  if callback ~= nil then
    assert(type(callback) == "function",
      string.format(
        "bad argument #4 to `ProcessUnfilteredCombatLogEvent` (expected function got %s)", type(callback)
      )
    )

    callback(category, spellType, spell)
  end
end

--[[
  @param {table} warning
  @param {number} spellType

  @return {boolean}
    true - if a sound was played
    false - if no sound was played
]]--
PlaySound = function(warning, spellType)
  if warning.playSound then
    mod.sound.PlaySound(
      warning.category,
      spellType,
      warning.spell.soundFileName
    )

    return true
  else
    mod.logger.LogDebug(me.tag, string.format("Skipping playing normal %s for spell"
      .. " '%s' because sound is disabled for spell", spellType, warning.spell.name))

    return false
  end
end

--[[
  @param {table} warning

  @return {boolean}
    true - if a visual warning was played
    false - if no visual warning was played
]]--
PlayVisual = function(warning)
  if not warning.playVisual then
    mod.logger.LogDebug(me.tag, "Skipping playing visual for spell - " .. warning.spell.name
      .. " because visual is disabled for this spell")

    return false
  end

  if not mod.configuration.IsFlashEnabled() then
    mod.logger.LogDebug(me.tag, "Skipping playing visual for spell - " .. warning.spell.name
      .. " because the flash channel is disabled")

    return false
  end

  if visualChannel == nil then
    mod.logger.LogDebug(me.tag, "Skipping playing visual for spell - " .. warning.spell.name
      .. " because no visual channel is registered")

    return false
  end

  visualChannel(warning.spell.visualWarningColor)

  return true
end
