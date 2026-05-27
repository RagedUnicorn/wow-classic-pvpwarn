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

local mod = rgpvpw
local me = {}
mod.spellAvoidMapOverlayTbc = me

me.tag = "SpellAvoidMapOverlayTbc"

--[[
  Branch overlay applied when the Burning Crusade Anniversary client is active. Populated by
  the per-class TBC migration tasks. See code/SpellMap/Overlay/Tbc.lua for the op semantics.

  @return {table}
]]--
function me.GetOverlay()
  return {
    shaman = {
      appendRanks = {
        [10414] = {  -- Earth Shock
          { spellId = 25454, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [29228] = {  -- Flame Shock
          { spellId = 25457, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [10473] = {  -- Frost Shock
          { spellId = 25464, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
      add = {
        [25454] = { refId = 10414 },  -- Earth Shock rank 8
        [25457] = { refId = 29228 },  -- Flame Shock rank 7
        [25464] = { refId = 10473 },  -- Frost Shock rank 5
      },
    },
  }
end
