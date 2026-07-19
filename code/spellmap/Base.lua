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

-- luacheck: globals UnitFactionGroup

local mod = rgpvpw
local me = {}
mod.spellMapBase = me

me.tag = "SpellMapBase"

local spellMap = {
  ["warrior"] = {
    [18499] = {
      name = "Berserker Rage",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "berserker_rage",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 18499, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [1719] = {
      name = "Recklessness",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "recklessness",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 1719, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [12328] = {
      name = "Death Wish",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "death_wish",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 12328, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [12292] = {
      name = "Sweeping Strikes",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "sweeping_strikes",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 12292, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [2457] = {
      name = "Battle Stance",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "battle_stance",
      hasFade = false,
      isStanceSpell = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED"
      },
      allRanks = {
        { spellId = 2457, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [2458] = {
      name = "Berserker Stance",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "berserker_stance",
      hasFade = false,
      isStanceSpell = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED"
      },
      allRanks = {
        { spellId = 2458, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [71] = {
      name = "Defensive Stance",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "defensive_stance",
      hasFade = false,
      isStanceSpell = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED"
      },
      allRanks = {
        { spellId = 71, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [20252] = {
      name = "Intercept",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "intercept",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 20252, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 20616, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 20617, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [676] = {
      name = "Disarm",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "disarm",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 676, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [12809] = {
      name = "Concussion Blow",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "concussion_blow",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 12809, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [2687] = {
      name = "Bloodrage",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "bloodrage",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 2687, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [6552] = {
      name = "Pummel",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "pummel",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 6552, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6554, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [100] = {
      name = "Charge",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "charge",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 100, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6178, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 11578, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [5246] = {
      name = "Intimidating Shout",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "intimidating_shout",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 5246, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [2565] = {
      name = "Shield Block",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shield_block",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 2565, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [23922] = {
      name = "Shield Slam",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shield_slam",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 23922, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 23923, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 23924, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 23925, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [871] = {
      name = "Shield Wall",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shield_wall",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 871, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [12975] = {
      name = "Last Stand",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "last_stand",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 12975, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [72] = {
      name = "Shield Bash",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shield_bash",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 72, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 1671, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 1672, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [20230] = {
      name = "Retaliation",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "retaliation",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 20230, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
  },
  ["priest"] = {
    [15473] = {
      name = "Shadowform",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shadowform",
      hasFade = true,
      isStanceSpell = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 15473, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10890] = {
      name = "Psychic Scream",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "psychic_scream",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 8122, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8124, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10888, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10890, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [15487] = {
      name = "Silence",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "silence",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 15487, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10060] = {
      name = "Power Infusion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "power_infusion",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED",
        "SPELL_AURA_REFRESH"
      },
      allRanks = {
        { spellId = 10060, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10952] = {
      name = "Inner Fire",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "inner_fire",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED",
        "SPELL_AURA_REFRESH"
      },
      allRanks = {
        { spellId = 588, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 7128, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 602, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 1006, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10951, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10952, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [15286] = {
      name = "Vampiric Embrace",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "vampiric_embrace",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REFRESH"
      },
      allRanks = {
        { spellId = 15286, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [19280] = {
      name = "Devouring Plague",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "devouring_plague",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 2944, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19276, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19277, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19278, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19279, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19280, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [19266] = {
      name = "Touch of Weakness",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "touch_of_weakness",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED",
        "SPELL_AURA_REFRESH"
      },
      allRanks = {
        { spellId = 2652, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19261, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19262, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19264, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19265, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19266, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [6346] = {
      name = "Fear Ward",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "fear_ward",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED",
        "SPELL_AURA_REFRESH"
      },
      allRanks = {
        { spellId = 6346, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [19243] = {
      name = "Desperate Prayer",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "desperate_prayer",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 13908, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19236, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19238, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19240, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19241, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19242, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19243, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [9035] = {
      name = "Hex of Weakness",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "hex_of_weakness",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 9035, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19281, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19282, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19283, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19284, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19285, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [18137] = {
      name = "Shadowguard",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shadowguard",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED",
        "SPELL_AURA_REFRESH"
      },
      allRanks = {
        { spellId = 18137, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19308, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19309, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19310, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19311, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19312, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
  },
  ["rogue"] = {
    [2094] = {
      name = "Blind",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blind",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REFRESH"
      },
      allRanks = {
        { spellId = 2094, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [1769] = {
      name = "Kick",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "kick",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 1766, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 1767, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 1768, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 1769, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [11305] = {
      name = "Sprint",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "sprint",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 2983, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8696, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 11305, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [5277] = {
      name = "Evasion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "evasion",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 5277, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [8643] = {
      name = "Kidney Shot",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "kidney_shot",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 408, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8643, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [1833] = {
      name = "Cheap Shot",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "cheap_shot",
      soundText = "Cheapshot",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 1833, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [13750] = {
      name = "Adrenaline Rush",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "adrenaline_rush",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 13750, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [13877] = {
      name = "Blade Flurry",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blade_flurry",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 13877, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [14177] = {
      name = "Cold Blood",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "cold_blood",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 14177, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [14185] = {
      name = "Preparation",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "preparation",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 14185, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [1857] = {
      name = "Vanish",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "vanish",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 1856, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 1857, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [1787] = {
      name = "Stealth",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "stealth",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 1784, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 1785, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 1786, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 1787, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
  },
  ["mage"] = {
    [11958] = {
      name = "Ice Block",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "ice_block",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 11958, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [12826] = {
      name = "Polymorph",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "polymorph",
      hasFade = false,
      hasCast = true,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS",
        "SPELL_CAST_START"
      },
      allRanks = {
        { spellId = 118, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 12824, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 12825, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 12826, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 28271, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 28272, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [1953] = {
      name = "Blink",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blink",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 1953, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10225] = {
      name = "Fire Ward",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "fire_ward",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 543, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8457, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8458, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10223, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10225, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [28609] = {
      name = "Frost Ward",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "frost_ward",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 6143, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8461, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8462, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10177, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 28609, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [2139] = {
      name = "Counterspell",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "counterspell",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 2139, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10193] = {
      name = "Mana Shield",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "mana_shield",
      soundText = "Manashield",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED",
        "SPELL_AURA_REFRESH"
      },
      allRanks = {
        { spellId = 1463, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8494, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8495, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10191, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10192, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10193, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [13033] = {
      name = "Ice Barrier",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "ice_barrier",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED",
        "SPELL_AURA_REFRESH"
      },
      allRanks = {
        { spellId = 11426, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 13031, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 13032, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 13033, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10230] = {
      name = "Frost Nova",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "frost_nova",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 122, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 865, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6131, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10230, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [12042] = {
      name = "Arcane Power",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "arcane_power",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 12042, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [12051] = {
      name = "Evocation",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "evocation",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 12051, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [12043] = {
      name = "Presence of Mind",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "presence_of_mind",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 12043, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [11129] = {
      name = "Combustion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "combustion",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 11129, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [13021] = {
      name = "Blast Wave",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blast_wave",
      soundText = "Blastwave",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 11113, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 13018, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 13019, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 13020, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 13021, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [12472] = {
      name = "Cold Snap",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "cold_snap",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 12472, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
  },
  ["hunter"] = {
    [5116] = {
      name = "Concussive Shot",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "concussive_shot",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 5116, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [13163] = {
      name = "Aspect of the Monkey",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "aspect_of_the_monkey",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 13163, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [25296] = {
      name = "Aspect of the Hawk",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "aspect_of_the_hawk",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 13165, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14318, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14319, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14320, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14321, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14322, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 25296, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [13159] = {
      name = "Aspect of the Pack",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "aspect_of_the_pack",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 13159, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [5118] = {
      name = "Aspect of the Cheetah",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "aspect_of_the_cheetah",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 5118, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [20190] = {
      name = "Aspect of the Wild",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "aspect_of_the_wild",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 20043, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 20190, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [13161] = {
      name = "Aspect of the Beast",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "aspect_of_the_beast",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 13161, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [3045] = {
      name = "Rapid Fire",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "rapid_fire",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 3045, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [14317] = {
      name = "Explosive Trap",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "explosive_trap",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 13813, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14316, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14317, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [14311] = {
      name = "Freezing Trap",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "freezing_trap",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 1499, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14310, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14311, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [14305] = {
      name = "Immolation Trap",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "immolation_trap",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 13795, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14302, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14303, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14304, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14305, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [13809] = {
      name = "Frost Trap",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "frost_trap",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 13809, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [14280] = {
      name = "Viper Sting",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "viper_sting",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 3034, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14279, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14280, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [19503] = {
      name = "Scatter Shot",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "scatter_shot",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 19503, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [1543] = {
      name = "Flare",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "flare",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 1543, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [24394] = {
      name = "Intimidation",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "intimidation",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 24394, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [19574] = {
      name = "Bestial Wrath",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "bestial_wrath",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 19574, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [19263] = {
      name = "Deterrence",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "deterrence",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 19263, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
  },
  ["warlock"] = {
    [6215] = {
      name = "Fear",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "fear",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 5782, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6213, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6215, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [18871] = {
      name = "Shadowburn",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shadowburn",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 17877, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 18867, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 18868, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 18869, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 18870, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 18871, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [28610] = {
      name = "Shadow Ward",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shadow_ward",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 6229, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 11739, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 11740, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 28610, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [17928] = {
      name = "Howl of Terror",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "howl_of_terror",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 5484, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 17928, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [17926] = {
      name = "Death Coil",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "death_coil",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 6789, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 17925, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 17926, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [18288] = {
      name = "Amplify Curse",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "amplify_curse",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 18288, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [19647] = {
      name = "Spell Lock",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "spell_lock",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 19244, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19647, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [19028] = {
      name = "Soul Link",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "soul_link",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 19028, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      },
      ignorePet = true
    },
    [18708] = {
      name = "Fel Domination",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "fel_domination",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 18708, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
  },
  ["paladin"] = {
    [10293] = {
      name = "Devotion Aura",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "devotion_aura",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 465, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10290, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 643, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10291, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 1032, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10292, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10293, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10301] = {
      name = "Retribution Aura",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "retribution_aura",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 7294, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10298, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10299, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10300, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10301, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [19746] = {
      name = "Concentration Aura",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "concentration_aura",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 19746, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [19896] = {
      name = "Shadow Resistance Aura",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shadow_resistance_aura",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 19876, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19895, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19896, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [19898] = {
      name = "Frost Resistance Aura",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "frost_resistance_aura",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 19888, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19897, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19898, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [19900] = {
      name = "Fire Resistance Aura",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "fire_resistance_aura",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 19891, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19899, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19900, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10278] = {
      name = "Blessing of Protection",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blessing_of_protection",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 1022, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 5599, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10278, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [1044] = {
      name = "Blessing of Freedom",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blessing_of_freedom",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 1044, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [20729] = {
      name = "Blessing of Sacrifice",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blessing_of_sacrifice",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 6940, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 20729, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10308] = {
      name = "Hammer of Justice",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "hammer_of_justice",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 853, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 5588, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 5589, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10308, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [20066] = {
      name = "Repentance",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "repentance",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 20066, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [1020] = {
      name = "Divine Shield",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "divine_shield",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 642, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 1020, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [25771] = {
      name = "Forbearance",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "forbearance",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 25771, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10310] = {
      name = "Lay on Hands",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "lay_on_hands",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 633, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 2800, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10310, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [5573] = {
      name = "Divine Protection",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "divine_protection",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 498, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 5573, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
  },
  ["druid"] = {
    [5487] = {
      name = "Bear Form",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "bear_form",
      hasFade = true,
      isStanceSpell = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 5487, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [9634] = {
      name = "Dire Bear Form",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "dire_bear_form",
      hasFade = true,
      isStanceSpell = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 9634, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [768] = {
      name = "Cat Form",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "cat_form",
      hasFade = true,
      isStanceSpell = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 768, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [783] = {
      name = "Travel Form",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "travel_form",
      hasFade = true,
      isStanceSpell = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 783, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [1066] = {
      name = "Aquatic Form",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "aquatic_form",
      hasFade = true,
      isStanceSpell = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 1066, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [24858] = {
      name = "Moonkin Form",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "moonkin_form",
      hasFade = true,
      isStanceSpell = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 24858, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [22812] = {
      name = "Barkskin",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "barkskin",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 22812, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [17329] = {
      name = "Nature's Grasp",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "natures_grasp",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 16689, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 16810, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 16811, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 16812, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 16813, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 17329, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [8983] = {
      name = "Bash",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "bash",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 5211, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6798, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8983, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [16979] = {
      name = "Feral Charge",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "feral_charge",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 16979, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [22896] = {
      name = "Frenzied Regeneration",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "frenzied_regeneration",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 22842, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 22895, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 22896, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [2893] = {
      name = "Abolish Poison",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "abolish_poison",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 2893, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [29166] = {
      name = "Innervate",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "innervate",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 29166, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [17116] = {
      name = "Nature's Swiftness",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "natures_swiftness",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 17116, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [9907] = {
      name = "Faerie Fire",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "faerie_fire",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 770, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 778, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 9749, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 9907, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [17392] = {
      name = "Faerie Fire (Feral)",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "faerie_fire",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 16857, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 17390, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 17391, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 17392, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
  },
  ["shaman"] = {
    [16166] = {
      name = "Elemental Mastery",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "elemental_mastery",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 16166, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [16188] = {
      name = "Nature's Swiftness",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "natures_swiftness",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 16188, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      },
    },
    [8143] = {
      name = "Tremor Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "tremor_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 8143, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      },
    },
    [8166] = {
      name = "Poison Cleansing Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "poison_cleansing_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 8166, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      },
    },
    [8177] = {
      name = "Grounding Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "grounding_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 8177, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10538] = {
      name = "Fire Resistance Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "fire_resistance_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 8184, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10537, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10538, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10479] = {
      name = "Frost Resistance Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "frost_resistance_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 8181, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10478, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10479, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10601] = {
      name = "Nature Resistance Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "nature_resistance_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 10595, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10600, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10601, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [16387] = {
      name = "Flametongue Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "flametongue_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 8227, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8249, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10526, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 16387, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [25359] = {
      name = "Grace of Air Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "grace_of_air_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 8835, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10627, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 25359, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10408] = {
      name = "Stoneskin Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "stoneskin_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 8071, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8154, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8155, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10406, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10407, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10408, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [25361] = {
      name = "Strength of Earth Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "strength_of_earth_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 8075, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8160, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8161, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10442, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 25361, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10614] = {
      name = "Windfury Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "windfury_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 8512, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10613, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10614, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [15112] = {
      name = "Windwall Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "windwall_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 15107, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 15111, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 15112, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [2484] = {
      name = "Earthbind Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "earthbind_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 2484, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [11315] = {
      name = "Fire Nova Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "fire_nova_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 1535, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8498, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8499, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 11314, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 11315, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10587] = {
      name = "Magma Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "magma_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 8190, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10585, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10586, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10587, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10438] = {
      name = "Searing Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "searing_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 3599, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6363, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6364, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6365, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10437, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10438, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10428] = {
      name = "Stoneclaw Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "stoneclaw_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 5730, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6390, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6391, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6392, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10427, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10428, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10463] = {
      name = "Healing Stream Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "healing_stream_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 5394, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6375, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6377, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10462, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10463, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [8170] = {
      name = "Disease Cleansing Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "disease_cleansing_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 8170, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10497] = {
      name = "Mana Spring Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "mana_spring_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 5675, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10495, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10496, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10497, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [17359] = {
      name = "Mana Tide Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "mana_tide_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 16190, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 17354, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 17359, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [25908] = {
      name = "Tranquil Air Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "tranquil_air_totem",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 25908, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
  },
  ["racials"] = {
    [20600] = {
      name = "Perception",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "perception",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 20600, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [7744] = {
      name = "Will of the Forsaken",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "will_of_the_forsaken",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 7744, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [20594] = {
      name = "Stoneform",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "stoneform",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 20594, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [20589] = {
      name = "Escape Artist",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "escape_artist",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 20589, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [20549] = {
      name = "War Stomp",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "war_stomp",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 20549, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [20554] = { -- mana
      name = "Berserking",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "berserking",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 20554, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 26296, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 26297, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [20580] = {
      name = "Shadowmeld",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shadowmeld",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 20580, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    --[[
      This spell is very special and does not work like a traditional buff.
      Instead a serverside script is doing all the work. Because of this only
      SPELL_CAST_SUCCESS can be tracked
    ]]--
    [20572] = {
      name = "Blood Fury",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blood_fury",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 20572, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    }
  },
  ["items"] = {
    [23271] = {
      name = "Talisman of Ephemeral Power",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "talisman_of_ephemeral_power",
      soundText = "Ephemeral power",
      itemId = 18820,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 23271, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [23097] = {
      name = "Hyper-Radiant Flame Reflector",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "hyper_radiant_flame_reflector",
      soundText = "Fire reflect",
      itemId = 18638,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 23097, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [23131] = {
      name = "Gyrofreeze Ice Reflector",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "gyrofreeze_ice_reflector",
      soundText = "Frost reflect",
      itemId = 18634,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 23131, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [23132] = {
      name = "Ultra-Flash Shadow Reflector",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "ultra_flash_shadow_reflector",
      soundText = "Shadow reflect",
      itemId = 18639,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 23132, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [5024] = {
      name = "Skull of Impending Doom",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "skull_of_impending_doom",
      soundText = "Flee",
      itemId = 4984,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 5024, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [9774] = {
      name = "Spider Belt",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "spider_belt",
      itemId = 4328,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 9774, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [22641] = {
      name = "Goblin Rocket Helmet",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "goblin_rocket_helmet",
      soundText = "Rocket helmet",
      itemId = 10588,
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 22641, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [13120] = {
      name = "Gnomish Net-o-Matic Projector",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "gnomish_netomatic_projector",
      soundText = "Net-o-Matic",
      itemId = 10720,
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 13120, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [835] = {
      name = "Tidal Charm",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "tidal_charm",
      itemId = 1404,
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 835, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [13180] = {
      name = "Gnomish Mind Control Cap",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "gnomish_mind_control_cap",
      soundText = "Mind control cap",
      itemId = 10726,
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 13180, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [13141] = {
      name = "Gnomish Rocket Boots",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "gnomish_rocket_boots",
      soundText = "Rocket boots",
      itemId = 10724,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 13141, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [8892] = {
      name = "Goblin Rocket Boots",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "goblin_rocket_boots",
      soundText = "Rocket boots",
      itemId = 7189,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 8892, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [14530] = {
      name = "Nifty Stopwatch",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "nifty_stopwatch",
      soundText = "Stopwatch",
      itemId = 2820,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 14530, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [23075] = {
      name = "Mithril Mechanical Dragonling",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "mithril_mechanical_dragonling",
      soundText = "Mithril dragonling",
      itemId = 10576,
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 23075, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [5579] = {
      name = "Insignia Warrior/Hunter/Shaman",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "insignia",
      soundText = "Insignia",
      itemId = (function()
        if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
          return 18834
        else
          return 18854
        end
      end)(),
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 5579, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [23273] = {
      name = "Insignia Warlock/Rogue",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "insignia",
      soundText = "Insignia",
      itemId = (function()
        if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
          return 18852
        else
          return 18858
        end
      end)(),
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 23273, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [23274] = {
      name = "Insignia Mage",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "insignia",
      soundText = "Insignia",
      itemId = (function()
        if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
          return 18850
        else
          return 18859
        end
      end)(),
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 23274, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [23276] = {
      name = "Insignia Priest/Paladin",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "insignia",
      soundText = "Insignia",
      itemId = (function()
        if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
          return 18851
        else
          return 18862
        end
      end)(),
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 23276, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [23277] = {
      name = "Insignia Druid",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "insignia",
      soundText = "Insignia",
      itemId = (function()
        if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
          return 18853
        else
          return 18863
        end
      end)(),
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 23277, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [23506] = {
      name = "Arena Grand Master",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "arena_grand_master",
      itemId = 19024,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 23506, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [17330] = {
      name = "Smolderweb's Eye",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "smolderwebs_eye",
      soundText = "Smolderwebs poison",
      itemId = 228576,
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 17330, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
  },
  ["misc"] = {
    [9512] = {
      name = "Thistle Tea",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "thistle_tea",
      itemId = 7676,
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 9512, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [17528] = {
      name = "Mighty Rage Potion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "mighty_rage_potion",
      itemId = 13442,
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 17528, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [18610] = {
      name = "First Aid",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "first_aid",
      itemId = 14530,
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 746, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE }, -- Linen Bandage
        { spellId = 1159, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE }, -- Heavy Linen Bandage
        { spellId = 3267, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE }, -- Wool Bandage
        { spellId = 3268, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE }, -- Heavy Wool Bandage
        { spellId = 7926, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE }, -- Silk Bandage
        { spellId = 7927, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE }, -- Heavy Silk Bandage
        { spellId = 10838, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE }, -- Mageweave Bandage
        { spellId = 10839, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE }, -- Heavy Mageweave Bandage
        { spellId = 18608, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE }, -- Runecloth Bandage
        { spellId = 18610, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE }, -- Heavy Runecloth Bandage
      }
    },
    [17548] = {
      name = "Greater Shadow Protection Potion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "greater_shadow_protection_potion",
      soundText = "Shadow protection",
      itemId = 13459,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 17548, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [17544] = {
      name = "Greater Frost Protection Potion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "greater_frost_protection_potion",
      soundText = "Frost protection",
      itemId = 13456,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 17544, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [17543] = {
      name = "Greater Fire Protection Potion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "greater_fire_protection_potion",
      soundText = "Fire protection",
      itemId = 13457,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 17543, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [17546] = {
      name = "Greater Nature Protection Potion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "greater_nature_protection_potion",
      soundText = "Nature protection",
      itemId = 13458,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 17546, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [17549] = {
      name = "Greater Arcane Protection Potion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "greater_arcane_protection_potion",
      soundText = "Arcane protection",
      itemId = 13461,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 17549, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [11359] = {
      name = "Restorative Potion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "restorative_potion",
      itemId = 9030,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 11359, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [24364] = {
      name = "Living Action Potion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "living_action_potion",
      soundText = "Living action",
      itemId = 20008,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 24364, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [6615] = {
      name = "Free Action Potion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "free_action_potion",
      soundText = "Free action",
      itemId = 5634,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 6615, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [3169] = {
      name = "Limited Invulnerability Potion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "limited_invulnerability_potion",
      soundText = "Invulnerability potion",
      itemId = 3387,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 3169, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [11392] = {
      name = "Invisibility Potion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "invisibility_potion",
      itemId = 9172,
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 11392, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [3680] = {
      name = "Lesser Invisibility Potion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "lesser_invisibility_potion",
      soundText = "Invisibility potion",
      itemId = 3823,
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 3680, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [12608] = {
      name = "Catseye Elixir",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "catseye_elixir",
      soundText ="Cats eye elixir",
      itemId = 10592,
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 12608, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [26677] = {
      name = "Elixir of Poison Resistance",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "elixir_of_poison_resistance",
      soundText ="Cure poison",
      itemId = 3386,
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 26677, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
  }
}

--[[
  Get the raw base spellMap. Callers are expected to clone before mutating;
  the assembler clones when building the assembled map.

  @return {table}
    The base spellMap
]]--
function me.GetMap()
  return spellMap
end
