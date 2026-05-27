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
mod.spellMapOverlayTbc = me

me.tag = "SpellMapOverlayTbc"

--[[
  Branch overlay applied when the Burning Crusade Anniversary client is active. Populated by
  the per-class TBC migration tasks (PWI-0017..PWI-0026).

  Op semantics (see code/SpellMap/Assemble.lua):
    - add:          insert a brand-new entry (or a refId alias) at a key not present in Base.
    - replace:      swap a Base entry whole (only mage [11958] / [12472] for the Ice Block /
                    Cold Snap / Icy Veins ID swap; lives in PWI-0023).
    - appendRanks:  add one or more `{ spellId, type }` rank entries to an existing Base
                    entry's `allRanks` array. The base spellId must already exist in the
                    working map.

  Every appended rank also gets a paired `add` entry installing a refId alias so combat-log
  dispatch via SpellMapHelper.SearchBySpellId routes back to the base entry.

  @return {table}
]]--
function me.GetOverlay()
  return {
    shaman = {
      appendRanks = {
        [10538] = {  -- Fire Resistance Totem
          { spellId = 25563, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [10479] = {  -- Frost Resistance Totem
          { spellId = 25560, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [10601] = {  -- Nature Resistance Totem
          { spellId = 25574, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [16387] = {  -- Flametongue Totem
          { spellId = 25557, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [10408] = {  -- Stoneskin Totem
          { spellId = 25508, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          { spellId = 25509, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [25361] = {  -- Strength of Earth Totem
          { spellId = 25528, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [10614] = {  -- Windfury Totem
          { spellId = 25585, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          { spellId = 25587, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [15112] = {  -- Windwall Totem
          { spellId = 25577, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [11315] = {  -- Fire Nova Totem
          { spellId = 25546, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          { spellId = 25547, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [10587] = {  -- Magma Totem
          { spellId = 25552, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [10438] = {  -- Searing Totem
          { spellId = 25533, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [10428] = {  -- Stoneclaw Totem
          { spellId = 25525, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [10463] = {  -- Healing Stream Totem
          { spellId = 25567, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [10497] = {  -- Mana Spring Totem
          { spellId = 25570, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
      add = {
        [25563] = { refId = 10538 },  -- Fire Resistance Totem rank 4
        [25560] = { refId = 10479 },  -- Frost Resistance Totem rank 4
        [25574] = { refId = 10601 },  -- Nature Resistance Totem rank 4
        [25557] = { refId = 16387 },  -- Flametongue Totem rank 5
        [25508] = { refId = 10408 },  -- Stoneskin Totem rank 7
        [25509] = { refId = 10408 },  -- Stoneskin Totem rank 8
        [25528] = { refId = 25361 },  -- Strength of Earth Totem rank 6
        [25585] = { refId = 10614 },  -- Windfury Totem rank 4
        [25587] = { refId = 10614 },  -- Windfury Totem rank 5
        [25577] = { refId = 15112 },  -- Windwall Totem rank 4
        [25546] = { refId = 11315 },  -- Fire Nova Totem rank 6
        [25547] = { refId = 11315 },  -- Fire Nova Totem rank 7
        [25552] = { refId = 10587 },  -- Magma Totem rank 5
        [25533] = { refId = 10438 },  -- Searing Totem rank 7
        [25525] = { refId = 10428 },  -- Stoneclaw Totem rank 7
        [25567] = { refId = 10463 },  -- Healing Stream Totem rank 6
        [25570] = { refId = 10497 },  -- Mana Spring Totem rank 5
      },
    },
  }
end
