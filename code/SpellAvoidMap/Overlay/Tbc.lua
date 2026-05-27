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
    warrior = {
      appendRanks = {
        [21553] = {  -- Mortal Strike
          { spellId = 25248, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          { spellId = 30330, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
      add = {
        [25248] = { refId = 21553 },  -- Mortal Strike rank 5
        [30330] = { refId = 21553 },  -- Mortal Strike rank 6
      },
    },
    priest = {
      appendRanks = {
        [19280] = {  -- Devouring Plague
          { spellId = 25467, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [10876] = {  -- Mana Burn
          { spellId = 25379, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          { spellId = 25380, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [10894] = {  -- Shadow Word: Pain
          { spellId = 25367, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          { spellId = 25368, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
      add = {
        [25467] = { refId = 19280 },  -- Devouring Plague rank 7
        [25379] = { refId = 10876 },  -- Mana Burn rank 6
        [25380] = { refId = 10876 },  -- Mana Burn rank 7
        [25367] = { refId = 10894 },  -- Shadow Word: Pain rank 9
        [25368] = { refId = 10894 },  -- Shadow Word: Pain rank 10
      },
    },
    rogue = {
      appendRanks = {
        [1769] = {  -- Kick
          { spellId = 38768, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [11286] = {  -- Gouge
          { spellId = 38764, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [11198] = {  -- Expose Armor
          { spellId = 26866, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [11290] = {  -- Garrote
          { spellId = 26839, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          { spellId = 26884, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [11275] = {  -- Rupture
          { spellId = 26867, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
      add = {
        [38768] = { refId = 1769 },   -- Kick rank 5
        [38764] = { refId = 11286 },  -- Gouge rank 6
        [26866] = { refId = 11198 },  -- Expose Armor rank 6
        [26839] = { refId = 11290 },  -- Garrote rank 7
        [26884] = { refId = 11290 },  -- Garrote rank 8
        [26867] = { refId = 11275 },  -- Rupture rank 7
      },
    },
    mage = {
      appendRanks = {
        [10230] = {  -- Frost Nova
          { spellId = 27088, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [10161] = {  -- Cone of Cold
          { spellId = 27087, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
      add = {
        [27088] = { refId = 10230 },  -- Frost Nova rank 5
        [27087] = { refId = 10161 },  -- Cone of Cold rank 6
      },
    },
    hunter = {
      appendRanks = {
        [13555] = {  -- Serpent Sting
          { spellId = 25295, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          { spellId = 27016, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [14280] = {  -- Viper Sting
          { spellId = 27018, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
      add = {
        [25295] = { refId = 13555 },  -- Serpent Sting rank 9
        [27016] = { refId = 13555 },  -- Serpent Sting rank 10
        [27018] = { refId = 14280 },  -- Viper Sting rank 4
      },
    },
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
