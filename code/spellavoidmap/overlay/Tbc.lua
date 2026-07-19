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
  the per-class TBC migration tasks. See code/spellmap/overlay/Tbc.lua for the op semantics.

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
        [44041] = {
          name = "Chastise",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC,
          soundFileName = "chastise",
          self_avoid = true,
          enemy_avoid = true,
          allRanks = {
            { spellId = 44041, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          }
        },
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
        [26679] = {
          name = "Deadly Throw",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC,
          soundFileName = "deadly_throw",
          self_avoid = true,
          enemy_avoid = true,
          allRanks = {
            { spellId = 26679, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          }
        },
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
        [31661] = {
          name = "Dragon's Breath",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC,
          soundFileName = "dragons_breath",
          self_avoid = true,
          enemy_avoid = true,
          allRanks = {
            { spellId = 31661, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          }
        },
        [30449] = {
          name = "Spellsteal",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC,
          soundFileName = "spellsteal",
          self_avoid = true,
          enemy_avoid = true,
          allRanks = {
            { spellId = 30449, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          }
        },
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
        [34490] = {
          name = "Silencing Shot",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC,
          soundFileName = "silencing_shot",
          self_avoid = true,
          enemy_avoid = true,
          allRanks = {
            { spellId = 34490, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          }
        },
      },
    },
    warlock = {
      appendRanks = {
        [17926] = {  -- Death Coil
          { spellId = 27223, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
      add = {
        [30283] = {
          name = "Shadowfury",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC,
          soundFileName = "shadowfury",
          self_avoid = true,
          enemy_avoid = true,
          allRanks = {
            { spellId = 30283, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          }
        },
      },
    },
    paladin = {
      appendRanks = {
        [24239] = {  -- Hammer of Wrath
          { spellId = 27180, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
    },
    druid = {
      appendRanks = {
        [19970] = {  -- Entangling Roots
          { spellId = 26989, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [9907] = {  -- Faerie Fire
          { spellId = 26993, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [17392] = {  -- Faerie Fire (Feral)
          { spellId = 27011, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
      add = {
        [33786] = {
          name = "Cyclone",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC,
          soundFileName = "cyclone",
          self_avoid = true,
          enemy_avoid = true,
          allRanks = {
            { spellId = 33786, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          }
        },
        [22570] = {
          name = "Maim",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC,
          soundFileName = "maim",
          self_avoid = true,
          enemy_avoid = true,
          allRanks = {
            { spellId = 22570, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          }
        },
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
    },
  }
end
