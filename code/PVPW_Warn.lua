--[[
  MIT License

  Copyright (c) 2020 Michael Wiesendanger

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

local mod = rgpvpw
local me = {}
mod.warn = me

me.tag = "Warn"


--[[
  @param {string} category
  @param {number} spellType
  @param {table} spell
  @param {function} callback
    Optional function that is invoked with status infos. Currently only used for testing
]]--
function me.PlayWarning(category, spellType, spell, callback)
  if category == nil or spellType == nil or spell == nil then
    return
  end

  if not spell.hasFade and spellType == RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED then
    mod.logger.LogError(me.tag, string.format("Tried to play removed sound for spell '%s' that indicated no"
      .. " support for such. Check spellMap for a potential error", spell.name))
    return
  end

  -- check in configuration if the spells should be processed
  -- if not mod.opt.IsSpellActive(spellList, soundCategory, normalizedSpellName) then
    -- mod.logger.LogDebug(me.tag, "Skipping add to queue for disabled spell - " .. normalizedSpellName)
    -- return
  -- end


  -- queue spell into warnqueue
  mod.warnQueue.AddToQueue(tostring(math.floor(math.random() * 100000)), category, spellType, spell, true, true)

  if callback ~= nil then
    assert(type(callback) == "function",
      string.format(
        "bad argument #4 to `ProcessUnfilteredCombatLogEvent` (expected function got %s)", type(callback))
      )

    callback(category, spellType, spell)
  end
end
