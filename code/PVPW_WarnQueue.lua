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

-- luacheck: globals GetTime C_Timer

local mod = rgpvpw
local me = {}
mod.warnQueue = me

me.tag = "WarnQueue"

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
  mod.logger.LogError(me.tag, "AddToQueue")
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

      if warning.spellType == RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL or
        warning.spellType == RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED then
        playedSound = me.PlaySound(warning, RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL)
        playedVisual = me.PlayVisual(warning)
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
  @param {table} warning
  @param {number} spellType
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
      .. " '%s' because sound is disabled for spell", spellType, warning.name))

    return false
  end
end

--[[
  @param {table} warning
]]--
function me.PlayVisual(warning)
  if warning.playVisual then
    -- TODO
    return true
  else
    mod.logger.LogDebug(me.tag, "Skipping playing visual for spell - " .. warning.name
      .. " because visual is disabled for this spell")

    return false
  end
end
