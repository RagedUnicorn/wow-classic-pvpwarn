--[[
  MIT License

  Copyright (c) 2022 Michael Wiesendanger

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
 Whether queue is currently busy playing a sound. Preventing multiple sounds and
 warnings playing at the same time. Queue is first in first served.
]]--
local isQueueBusy = false

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
function me.RemoveFromQueue(position)
  table.remove(warnQueue, position)
  mod.logger.LogDebug(me.tag, "Removed warning with position '" .. position .. "' from queue")
end

--[[
  Called in an interval if the warning is to old we remove it and go to the next
  loop until an item is found that is not to old or the queue is empty
]]--
function me.ProcessQueue()
  -- if queue is already busy abort
  if isQueueBusy then
    return
  end

  for key, warning in pairs(warnQueue) do
    local age = GetTime() - warning.startTime

    if age > RGPVPW_CONSTANTS.MAX_WARN_AGE then
      mod.logger.LogWarn(me.tag, "Skipping warn message because max age was reached")
      me.RemoveFromQueue(key)
    else
      local playedSound = false
      local playedVisual = false
      local spellTypes = RGPVPW_CONSTANTS.SPELL_TYPES

      if warning.spellType == spellTypes.NORMAL or
        warning.spellType == spellTypes.APPLIED or
        warning.spellType == spellTypes.REFRESH then
        playedSound = me.PlaySound(warning, spellTypes.NORMAL)
        playedVisual = me.PlayVisual(warning)
      elseif warning.spellType == spellTypes.REMOVED then
        playedSound = me.PlaySound(warning, spellTypes.REMOVED)
      elseif warning.spellType == spellTypes.MISSED_SELF then
        playedSound = me.PlaySound(warning, spellTypes.MISSED_SELF)
        playedVisual = me.PlayVisual(warning)
      elseif warning.spellType == spellTypes.MISSED_ENEMY then
        playedSound = me.PlaySound(warning, spellTypes.MISSED_ENEMY)
        playedVisual = me.PlayVisual(warning)
      elseif warning.spellType == spellTypes.START then
        playedSound = me.PlaySound(warning, spellTypes.START)
      else
        mod.logger.LogError(me.tag, "Found invalid spelltype: " .. warning.spellType)
      end

      if playedSound or playedVisual then
        isQueueBusy = true
        C_Timer.After(.8 or 0, function()
          isQueueBusy = false
        end)
      end

      me.RemoveFromQueue(key)

      return -- abort
    end
  end
end

--[[
  @param {string} category
  @param {number} spellType
  @param {table} spell
  @param {function} callback
    Optional function that is invoked with status infos. Currently only used for testing
  @param {boolean} playSound
  @param {boolean} playVisual
]]--
function me.PlayWarning(category, spellType, spell, callback, playSound, playVisual)
  if category == nil or spellType == nil or spell == nil then
    return
  end

  -- queue spell into warnqueue
  me.AddToQueue(tostring(math.floor(math.random() * 100000)), category, spellType, spell, playSound, playVisual)

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
function me.PlaySound(warning, spellType)
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
function me.PlayVisual(warning)
  if warning.playVisual then
    mod.visual.ShowVisualAlert(warning.spell.visualWarningColor)

    return true
  else
    mod.logger.LogDebug(me.tag, "Skipping playing visual for spell - " .. warning.spell.name
      .. " because visual is disabled for this spell")

    return false
  end
end
