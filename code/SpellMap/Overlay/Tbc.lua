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
    warrior = {
      appendRanks = {
        [20252] = {  -- Intercept
          { spellId = 25272, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          { spellId = 25275, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [23922] = {  -- Shield Slam
          { spellId = 25258, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          { spellId = 30356, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [72] = {  -- Shield Bash
          { spellId = 29704, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [12975] = {  -- Last Stand
          { spellId = 12976, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
      add = {
        [25272] = { refId = 20252 },  -- Intercept rank 4
        [25275] = { refId = 20252 },  -- Intercept rank 5
        [25258] = { refId = 23922 },  -- Shield Slam rank 5
        [30356] = { refId = 23922 },  -- Shield Slam rank 6
        [29704] = { refId = 72 },     -- Shield Bash rank 4
        [12976] = { refId = 12975 },  -- Last Stand rank 2
      },
    },
    priest = {
      appendRanks = {
        [10952] = {  -- Inner Fire
          { spellId = 25431, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [19280] = {  -- Devouring Plague
          { spellId = 25467, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [19266] = {  -- Touch of Weakness
          { spellId = 25460, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [19243] = {  -- Desperate Prayer
          { spellId = 25437, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [9035] = {  -- Hex of Weakness
          { spellId = 25470, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [18137] = {  -- Shadowguard
          { spellId = 25477, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
      add = {
        [25431] = { refId = 10952 },  -- Inner Fire rank 7
        [25467] = { refId = 19280 },  -- Devouring Plague rank 7
        [25460] = { refId = 19266 },  -- Touch of Weakness rank 7
        [25437] = { refId = 19243 },  -- Desperate Prayer rank 8
        [25470] = { refId = 9035 },   -- Hex of Weakness rank 7
        [25477] = { refId = 18137 },  -- Shadowguard rank 7
      },
    },
    rogue = {
      appendRanks = {
        [1769] = {  -- Kick
          { spellId = 38768, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [5277] = {  -- Evasion
          { spellId = 26669, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [1857] = {  -- Vanish
          { spellId = 26889, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
      add = {
        [38768] = { refId = 1769 },  -- Kick rank 5
        [26669] = { refId = 5277 },  -- Evasion rank 2
        [26889] = { refId = 1857 },  -- Vanish rank 3
      },
    },
    mage = {
      appendRanks = {
        [10225] = {  -- Fire Ward
          { spellId = 27128, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [28609] = {  -- Frost Ward
          { spellId = 32796, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [10193] = {  -- Mana Shield
          { spellId = 27131, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [13033] = {  -- Ice Barrier
          { spellId = 27134, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          { spellId = 33405, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [10230] = {  -- Frost Nova
          { spellId = 27088, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [13021] = {  -- Blast Wave
          { spellId = 27133, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          { spellId = 33933, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
      replace = {
        -- ID-collision: spell ID 11958 means "Ice Block" in Classic Era but
        -- "Cold Snap" in TBC. Same conceptual Cold Snap as the Classic
        -- entry at [12472] (sound, name, behavior preserved); only the key
        -- and the rank's spellId change. Classic Ice Block tracking is
        -- replaced by the new [45438] add-op below.
        [11958] = {
          name = "Cold Snap",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC,
          soundFileName = "cold_snap",
          spellIcon = "spell_frost_wizardmark",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 11958, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          }
        },
        -- ID-collision: spell ID 12472 means "Cold Snap" in Classic Era but
        -- "Icy Veins" in TBC (a separate spell — Frost talent, 3 min CD,
        -- +20% spellcasting haste). Sound and icon shared with the SoD
        -- Icy Veins entry at [425121] (SoD and TBC are mutually exclusive
        -- at filter time, so the .mp3 / icon are reused with no conflict).
        [12472] = {
          name = "Icy Veins",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC,
          soundFileName = "icy_veins",
          spellIcon = "spell_frost_coldhearted",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 12472, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          }
        },
      },
      add = {
        [27128] = { refId = 10225 },  -- Fire Ward rank 6
        [32796] = { refId = 28609 },  -- Frost Ward rank 6
        [27131] = { refId = 10193 },  -- Mana Shield rank 7
        [27134] = { refId = 13033 },  -- Ice Barrier rank 5
        [33405] = { refId = 13033 },  -- Ice Barrier rank 6
        [27088] = { refId = 10230 },  -- Frost Nova rank 5
        [27133] = { refId = 13021 },  -- Blast Wave rank 6
        [33933] = { refId = 13021 },  -- Blast Wave rank 7
        -- TBC Ice Block lives at a brand-new key (45438), distinct from
        -- the Classic-Era Ice Block key (11958, repurposed by the replace
        -- op above). Sound and icon match the Classic Ice Block entry.
        [45438] = {
          name = "Ice Block",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC,
          soundFileName = "ice_block",
          spellIcon = "spell_frost_frost",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 45438, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          }
        },
      },
    },
    hunter = {
      appendRanks = {
        [25296] = {  -- Aspect of the Hawk
          { spellId = 27044, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [20190] = {  -- Aspect of the Wild
          { spellId = 27045, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [14317] = {  -- Explosive Trap
          { spellId = 27025, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [14305] = {  -- Immolation Trap
          { spellId = 27023, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [14280] = {  -- Viper Sting
          { spellId = 27018, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
      add = {
        [27044] = { refId = 25296 },  -- Aspect of the Hawk rank 8
        [27045] = { refId = 20190 },  -- Aspect of the Wild rank 3
        [27025] = { refId = 14317 },  -- Explosive Trap rank 4
        [27023] = { refId = 14305 },  -- Immolation Trap rank 6
        [27018] = { refId = 14280 },  -- Viper Sting rank 4
        -- TBC-only Aspect of the Viper. The Classic SoD entry lives at
        -- [415423] in Overlay/Sod.lua; SoD and TBC are mutually exclusive
        -- so the brand-new TBC entry sits at the canonical TBC id 34074
        -- with the same name, sound, and icon.
        [34074] = {
          name = "Aspect of the Viper",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC,
          soundFileName = "aspect_of_the_viper",
          spellIcon = "ability_hunter_aspectoftheviper",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 34074, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          }
        },
      },
    },
    warlock = {
      appendRanks = {
        [18871] = {  -- Shadowburn
          { spellId = 27263, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          { spellId = 30546, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [17926] = {  -- Death Coil
          { spellId = 27223, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
      add = {
        [27263] = { refId = 18871 },  -- Shadowburn rank 7
        [30546] = { refId = 18871 },  -- Shadowburn rank 8
        [27223] = { refId = 17926 },  -- Death Coil rank 4
      },
    },
    paladin = {
      appendRanks = {
        [10293] = {  -- Devotion Aura
          { spellId = 27149, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [10301] = {  -- Retribution Aura
          { spellId = 27150, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [19896] = {  -- Shadow Resistance Aura
          { spellId = 27151, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [19898] = {  -- Frost Resistance Aura
          { spellId = 27152, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [19900] = {  -- Fire Resistance Aura
          { spellId = 27153, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [20729] = {  -- Blessing of Sacrifice
          { spellId = 27147, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
          { spellId = 27148, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [10310] = {  -- Lay on Hands
          { spellId = 27154, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
      add = {
        [27149] = { refId = 10293 },  -- Devotion Aura rank 8
        [27150] = { refId = 10301 },  -- Retribution Aura rank 6
        [27151] = { refId = 19896 },  -- Shadow Resistance Aura rank 4
        [27152] = { refId = 19898 },  -- Frost Resistance Aura rank 4
        [27153] = { refId = 19900 },  -- Fire Resistance Aura rank 4
        [27147] = { refId = 20729 },  -- Blessing of Sacrifice rank 3
        [27148] = { refId = 20729 },  -- Blessing of Sacrifice rank 4
        [27154] = { refId = 10310 },  -- Lay on Hands rank 4
      },
    },
    druid = {
      appendRanks = {
        [17329] = {  -- Nature's Grasp
          { spellId = 27009, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [22896] = {  -- Frenzied Regeneration
          { spellId = 26999, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [9907] = {  -- Faerie Fire
          { spellId = 26993, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
        [17392] = {  -- Faerie Fire (Feral)
          { spellId = 27011, type = RGPVPW_CONSTANTS.SPELL_TYPE_TBC },
        },
      },
      add = {
        [27009] = { refId = 17329 },  -- Nature's Grasp rank 7
        [26999] = { refId = 22896 },  -- Frenzied Regeneration rank 4
        [26993] = { refId = 9907 },   -- Faerie Fire rank 5
        [27011] = { refId = 17392 },  -- Faerie Fire (Feral) rank 5
      },
    },
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
