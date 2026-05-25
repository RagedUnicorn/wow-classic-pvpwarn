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
      spellIcon = "spell_nature_ancestralguardian",
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
      spellIcon = "ability_criticalstrike",
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
      spellIcon = "spell_shadow_deathpact",
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
      spellIcon = "ability_rogue_slicedice",
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
      spellIcon = "ability_warrior_offensivestance",
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
      spellIcon = "ability_racial_avatar",
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
      spellIcon = "ability_warrior_defensivestance",
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
      spellIcon = "ability_rogue_sprint",
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
    [20616] = { refId = 20252 },
    [20617] = { refId = 20252 },
    [676] = {
      name = "Disarm",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "disarm",
      spellIcon = "ability_warrior_disarm",
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
      spellIcon = "ability_thunderbolt",
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
      spellIcon = "ability_racial_bloodrage",
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
      spellIcon = "inv_gauntlets_04",
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
    [6554] = { refId = 6552 },
    [100] = {
      name = "Charge",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "charge",
      spellIcon = "ability_warrior_charge",
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
    [6178] = { refId = 100 },
    [11578] = { refId = 100 },
    [5246] = {
      name = "Intimidating Shout",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "intimidating_shout",
      spellIcon = "ability_golemthunderclap",
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
      spellIcon = "ability_defend",
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
      spellIcon = "inv_shield_05",
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
    [23923] = { refId = 23922 },
    [23924] = { refId = 23922 },
    [23925] = { refId = 23922 },
    [871] = {
      name = "Shield Wall",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shield_wall",
      spellIcon = "ability_warrior_shieldwall",
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
      spellIcon = "spell_holy_ashestoashes",
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
      spellIcon = "ability_warrior_shieldbash",
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
    [1671] = { refId = 72 },
    [1672] = { refId = 72 },
    [20230] = {
      name = "Retaliation",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "retaliation",
      spellIcon = "ability_warrior_challange",
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
      spellIcon = "spell_shadow_shadowform",
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
      spellIcon = "spell_shadow_psychicscream",
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
    [8122] = { refId = 10890 },
    [8124] = { refId = 10890 },
    [10888] = { refId = 10890 },
    [15487] = {
      name = "Silence",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "silence",
      spellIcon = "spell_shadow_impphaseshift",
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
      spellIcon = "spell_holy_powerinfusion",
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
      spellIcon = "spell_holy_innerfire",
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
    [588] = { refId = 10952 },
    [7128] = { refId = 10952 },
    [602] = { refId = 10952 },
    [1006] = { refId = 10952 },
    [10951] = { refId = 10952 },
    [15286] = {
      name = "Vampiric Embrace",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "vampiric_embrace",
      spellIcon = "spell_shadow_unsummonbuilding",
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
      spellIcon = "spell_shadow_blackplague",
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
    [2944] = { refId = 19280 },
    [19276] = { refId = 19280 },
    [19277] = { refId = 19280 },
    [19278] = { refId = 19280 },
    [19279] = { refId = 19280 },
    [19266] = {
      name = "Touch of Weakness",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "touch_of_weakness",
      spellIcon = "spell_shadow_deadofnight",
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
    [2652] = { refId = 19266 },
    [19261] = { refId = 19266 },
    [19262] = { refId = 19266 },
    [19264] = { refId = 19266 },
    [19265] = { refId = 19266 },
    [6346] = {
      name = "Fear Ward",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "fear_ward",
      spellIcon = "spell_holy_excorcism",
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
      spellIcon = "spell_holy_restoration",
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
    [13908] = { refId = 19243 },
    [19236] = { refId = 19243 },
    [19238] = { refId = 19243 },
    [19240] = { refId = 19243 },
    [19241] = { refId = 19243 },
    [19242] = { refId = 19243 },
    [9035] = {
      name = "Hex of Weakness",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "hex_of_weakness",
      spellIcon = "spell_shadow_fingerofdeath",
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
    [19281] = { refId = 9035 },
    [19282] = { refId = 9035 },
    [19283] = { refId = 9035 },
    [19284] = { refId = 9035 },
    [19285] = { refId = 9035 },
    [18137] = {
      name = "Shadowguard",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shadowguard",
      spellIcon = "spell_nature_lightningshield",
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
    [19308] = { refId = 18137 },
    [19309] = { refId = 18137 },
    [19310] = { refId = 18137 },
    [19311] = { refId = 18137 },
    [19312] = { refId = 18137 },
    [425294] = {
      name = "Dispersion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "dispersion",
      spellIcon = "spell_shadow_dispersion",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 425294, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [402004] = {
      name = "Pain Suppression",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "pain_suppression",
      spellIcon = "spell_holy_painsupression",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 402004, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
  },
  ["rogue"] = {
    [2094] = {
      name = "Blind",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blind",
      spellIcon = "spell_shadow_mindsteal",
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
      spellIcon = "ability_kick",
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
    [1766] = { refId = 1769 },
    [1767] = { refId = 1769 },
    [1768] = { refId = 1769 },
    [11305] = {
      name = "Sprint",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "sprint",
      spellIcon = "ability_rogue_sprint",
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
    [2983] = { refId = 11305 },
    [8696] = { refId = 11305 },
    [5277] = {
      name = "Evasion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "evasion",
      spellIcon = "spell_shadow_shadowward",
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
      spellIcon = "ability_rogue_kidneyshot",
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
    [408] = { refId = 8643 },
    [1833] = {
      name = "Cheap Shot",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "cheap_shot",
      soundText = "Cheapshot",
      spellIcon = "ability_cheapshot",
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
      spellIcon = "spell_shadow_shadowworddominate",
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
      spellIcon = "ability_warrior_punishingblow",
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
      spellIcon = "spell_ice_lament",
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
      spellIcon = "spell_shadow_antishadow",
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
      spellIcon = "ability_vanish",
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
    [1856] = { refId = 1857 },
    [1787] = {
      name = "Stealth",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "stealth",
      spellIcon = "ability_stealth",
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
    [1784] = { refId = 1787 },
    [1785] = { refId = 1787 },
    [1786] = { refId = 1787 },
  },
  ["mage"] = {
    [11958] = {
      name = "Ice Block",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "ice_block",
      spellIcon = "spell_frost_frost",
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
      spellIcon = "spell_nature_polymorph",
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
    [118] = { refId = 12826 },
    [12824] = { refId = 12826 },
    [12825] = { refId = 12826 },
    [28271] = { refId = 12826 },
    [28272] = { refId = 12826 },
    [1953] = {
      name = "Blink",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blink",
      spellIcon = "spell_arcane_blink",
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
      spellIcon = "spell_fire_firearmor",
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
    [543] = { refId = 10225 },
    [8457] = { refId = 10225 },
    [8458] = { refId = 10225 },
    [10223] = { refId = 10225 },
    [28609] = {
      name = "Frost Ward",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "frost_ward",
      spellIcon = "spell_frost_frostward",
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
    [6143] = { refId = 28609 },
    [8461] = { refId = 28609 },
    [8462] = { refId = 28609 },
    [10177] = { refId = 28609 },
    [2139] = {
      name = "Counterspell",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "counterspell",
      spellIcon = "spell_frost_iceshock",
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
      spellIcon = "spell_shadow_detectlesserinvisibility",
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
    [1463] = { refId = 10193 },
    [8494] = { refId = 10193 },
    [8495] = { refId = 10193 },
    [10191] = { refId = 10193 },
    [10192] = { refId = 10193 },
    [13033] = {
      name = "Ice Barrier",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "ice_barrier",
      spellIcon = "spell_ice_lament",
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
    [11426] = { refId = 13033 },
    [13031] = { refId = 13033 },
    [13032] = { refId = 13033 },
    [10230] = {
      name = "Frost Nova",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "frost_nova",
      spellIcon = "spell_frost_frostnova",
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
    [122] = { refId = 10230 },
    [865] = { refId = 10230 },
    [6131] = { refId = 10230 },
    [12042] = {
      name = "Arcane Power",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "arcane_power",
      spellIcon = "spell_nature_lightning",
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
      spellIcon = "spell_nature_purge",
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
      spellIcon = "spell_nature_enchantarmor",
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
      spellIcon = "spell_fire_sealoffire",
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
      spellIcon = "spell_holy_excorcism_02",
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
    [11113] = { refId = 13021 },
    [13018] = { refId = 13021 },
    [13019] = { refId = 13021 },
    [13020] = { refId = 13021 },
    [12472] = {
      name = "Cold Snap",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "cold_snap",
      spellIcon = "spell_frost_wizardmark",
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
      spellIcon = "spell_frost_stun",
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
      spellIcon = "ability_hunter_aspectofthemonkey",
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
      spellIcon = "spell_nature_ravenform",
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
    [13165] = { refId = 25296 },
    [14318] = { refId = 25296 },
    [14319] = { refId = 25296 },
    [14320] = { refId = 25296 },
    [14321] = { refId = 25296 },
    [14322] = { refId = 25296 },
    [13159] = {
      name = "Aspect of the Pack",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "aspect_of_the_pack",
      spellIcon = "ability_mount_whitetiger",
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
      spellIcon = "ability_mount_jungletiger",
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
      spellIcon = "spell_nature_protectionformnature",
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
    [20043] = { refId = 20190 },
    [13161] = {
      name = "Aspect of the Beast",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "aspect_of_the_beast",
      spellIcon = "ability_mount_pinktiger",
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
    [469145] = {
      name = "Aspect of the Falcon",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "aspect_of_the_falcon",
      spellIcon = "ability_hunter_pet_dragonhawk",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 469145, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [415423] = {
      name = "Aspect of the Viper",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "aspect_of_the_viper",
      spellIcon = "ability_hunter_aspectoftheviper",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 415423, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [3045] = {
      name = "Rapid Fire",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "rapid_fire",
      spellIcon = "ability_hunter_runningshot",
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
      spellIcon = "spell_fire_selfdestruct",
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
    [13813] = { refId = 14317 },
    [14316] = { refId = 14317 },
    [14311] = {
      name = "Freezing Trap",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "freezing_trap",
      spellIcon = "spell_frost_chainsofice",
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
    [1499] = { refId = 14311 },
    [14310] = { refId = 14311 },
    [14305] = {
      name = "Immolation Trap",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "immolation_trap",
      spellIcon = "spell_fire_flameshock",
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
    [13795] = { refId = 14305 },
    [14302] = { refId = 14305 },
    [14303] = { refId = 14305 },
    [14304] = { refId = 14305 },
    [13809] = {
      name = "Frost Trap",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "frost_trap",
      spellIcon = "spell_frost_freezingbreath",
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
      spellIcon = "ability_hunter_aimedshot",
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
    [3034] = { refId = 14280 },
    [14279] = { refId = 14280 },
    [19503] = {
      name = "Scatter Shot",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "scatter_shot",
      spellIcon = "ability_golemstormbolt",
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
      spellIcon = "spell_fire_flare",
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
      spellIcon = "ability_devour",
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
      spellIcon = "ability_druid_ferociousbite",
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
      spellIcon = "ability_whirlwind",
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
      spellIcon = "spell_shadow_possession",
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
    [5782] = { refId = 6215 },
    [6213] = { refId = 6215 },
    [18871] = {
      name = "Shadowburn",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shadowburn",
      spellIcon = "spell_shadow_scourgebuild",
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
    [17877] = { refId = 18871 },
    [18867] = { refId = 18871 },
    [18868] = { refId = 18871 },
    [18869] = { refId = 18871 },
    [18870] = { refId = 18871 },
    [28610] = {
      name = "Shadow Ward",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shadow_ward",
      spellIcon = "spell_shadow_antishadow",
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
    [6229] = { refId = 28610 },
    [11739] = { refId = 28610 },
    [11740] = { refId = 28610 },
    [17928] = {
      name = "Howl of Terror",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "howl_of_terror",
      spellIcon = "spell_shadow_deathscream",
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
    [5484] = { refId = 17928 },
    [17926] = {
      name = "Death Coil",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "death_coil",
      spellIcon = "spell_shadow_deathcoil",
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
    [6789] = { refId = 17926 },
    [17925] = { refId = 17926 },
    [18288] = {
      name = "Amplify Curse",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "amplify_curse",
      spellIcon = "spell_shadow_contagion",
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
      spellIcon = "spell_shadow_mindrot",
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
    [19244] = { refId = 19647 },
    [19028] = {
      name = "Soul Link",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "soul_link",
      spellIcon = "spell_shadow_gathershadows",
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
      spellIcon = "spell_nature_removecurse",
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
      spellIcon = "spell_holy_devotionaura",
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
    [465] = { refId = 10293 },
    [10290] = { refId = 10293 },
    [643] = { refId = 10293 },
    [10291] = { refId = 10293 },
    [1032] = { refId = 10293 },
    [10292] = { refId = 10293 },
    [10301] = {
      name = "Retribution Aura",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "retribution_aura",
      spellIcon = "spell_holy_auraoflight",
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
    [7294] = { refId = 10301 },
    [10298] = { refId = 10301 },
    [10299] = { refId = 10301 },
    [10300] = { refId = 10301 },
    [19746] = {
      name = "Concentration Aura",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "concentration_aura",
      spellIcon = "spell_holy_mindsooth",
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
      spellIcon = "spell_shadow_sealofkings",
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
    [19876] = { refId = 19896 },
    [19895] = { refId = 19896 },
    [19898] = {
      name = "Frost Resistance Aura",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "frost_resistance_aura",
      spellIcon = "spell_frost_wizardmark",
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
    [19888] = { refId = 19898 },
    [19897] = { refId = 19898 },
    [19900] = {
      name = "Fire Resistance Aura",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "fire_resistance_aura",
      spellIcon = "spell_fire_sealoffire",
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
    [19891] = { refId = 19900 },
    [19899] = { refId = 19900 },
    [10278] = {
      name = "Blessing of Protection",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blessing_of_protection",
      spellIcon = "spell_holy_sealofprotection",
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
    [1022] = { refId = 10278 },
    [5599] = { refId = 10278 },
    [1044] = {
      name = "Blessing of Freedom",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blessing_of_freedom",
      spellIcon = "spell_holy_sealofvalor",
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
      spellIcon = "spell_holy_sealofsacrifice",
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
    [6940] = { refId = 20729 },
    [10308] = {
      name = "Hammer of Justice",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "hammer_of_justice",
      spellIcon = "spell_holy_sealofmight",
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
    [853] = { refId = 10308 },
    [5588] = { refId = 10308 },
    [5589] = { refId = 10308 },
    [20066] = {
      name = "Repentance",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "repentance",
      spellIcon = "spell_holy_prayerofhealing",
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
      spellIcon = "spell_holy_divineintervention",
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
    [642] = { refId = 1020 },
    [25771] = {
      name = "Forbearance",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "forbearance",
      spellIcon = "spell_holy_removecurse",
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
      spellIcon = "spell_holy_layonhands",
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
    [633] = { refId = 10310 },
    [2800] = { refId = 10310 },
    [5573] = {
      name = "Divine Protection",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "divine_protection",
      spellIcon = "spell_holy_restoration",
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
    [498] = { refId = 5573 },
  },
  ["druid"] = {
    [5487] = {
      name = "Bear Form",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "bear_form",
      spellIcon = "ability_racial_bearform",
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
      spellIcon = "ability_racial_bearform",
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
      spellIcon = "ability_druid_catform",
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
      spellIcon = "ability_druid_travelform",
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
      spellIcon = "ability_druid_aquaticform",
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
      spellIcon = "spell_nature_forceofnature",
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
      spellIcon = "spell_nature_stoneclawtotem",
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
      spellIcon = "spell_nature_natureswrath",
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
    [16689] = { refId = 17329 },
    [16810] = { refId = 17329 },
    [16811] = { refId = 17329 },
    [16812] = { refId = 17329 },
    [16813] = { refId = 17329 },
    [8983] = {
      name = "Bash",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "bash",
      spellIcon = "ability_druid_bash",
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
    [5211] = { refId = 8983 },
    [6798] = { refId = 8983 },
    [16979] = {
      name = "Feral Charge",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "feral_charge",
      spellIcon = "ability_hunter_pet_bear",
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
      spellIcon = "ability_bullrush",
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
    [22842] = { refId = 22896 },
    [22895] = { refId = 22896 },
    [2893] = {
      name = "Abolish Poison",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "abolish_poison",
      spellIcon = "spell_nature_nullifypoison_02",
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
      spellIcon = "spell_nature_lightning",
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
      spellIcon = "spell_nature_ravenform",
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
      spellIcon = "spell_nature_faeriefire",
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
    [770] = { refId = 9907 },
    [778] = { refId = 9907 },
    [9749] = { refId = 9907 },
    [17392] = {
      name = "Faerie Fire (Feral)",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "faerie_fire",
      spellIcon = "spell_nature_faeriefire",
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
    [16857] = { refId = 17392 },
    [17390] = { refId = 17392 },
    [17391] = { refId = 17392 },
  },
  ["shaman"] = {
    [16166] = {
      name = "Elemental Mastery",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "elemental_mastery",
      spellIcon = "spell_nature_wispheal",
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
      spellIcon = "spell_nature_ravenform",
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
      spellIcon = "spell_nature_tremortotem",
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
      spellIcon = "spell_nature_poisoncleansingtotem",
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
      spellIcon = "spell_nature_groundingtotem",
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
      spellIcon = "spell_fireresistancetotem_01",
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
    [8184] = { refId = 10538 },
    [10537] = { refId = 10538 },
    [10479] = {
      name = "Frost Resistance Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "frost_resistance_totem",
      spellIcon = "spell_frostresistancetotem_01",
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
    [8181] = { refId = 10479 },
    [10478] = { refId = 10479 },
    [10601] = {
      name = "Nature Resistance Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "nature_resistance_totem",
      spellIcon = "spell_nature_natureresistancetotem",
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
    [10595] = { refId = 10601 },
    [10600] = { refId = 10601 },
    [16387] = {
      name = "Flametongue Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "flametongue_totem",
      spellIcon = "spell_nature_guardianward",
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
    [8227] = { refId = 16387 },
    [8249] = { refId = 16387 },
    [10526] = { refId = 16387 },
    [25359] = {
      name = "Grace of Air Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "grace_of_air_totem",
      spellIcon = "spell_nature_invisibilitytotem",
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
    [8835] = { refId = 25359 },
    [10627] = { refId = 25359 },
    [10408] = {
      name = "Stoneskin Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "stoneskin_totem",
      spellIcon = "spell_nature_stoneskintotem",
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
    [8071] = { refId = 10408 },
    [8154] = { refId = 10408 },
    [8155] = { refId = 10408 },
    [10406] = { refId = 10408 },
    [10407] = { refId = 10408 },
    [25361] = {
      name = "Strength of Earth Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "strength_of_earth_totem",
      spellIcon = "spell_nature_earthbindtotem",
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
    [8075] = { refId = 25361 },
    [8160] = { refId = 25361 },
    [8161] = { refId = 25361 },
    [10442] = { refId = 25361 },
    [10614] = {
      name = "Windfury Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "windfury_totem",
      spellIcon = "spell_nature_windfury",
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
    [8512] = { refId = 10614 },
    [10613] = { refId = 10614 },
    [15112] = {
      name = "Windwall Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "windwall_totem",
      spellIcon = "spell_nature_earthbind",
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
    [15107] = { refId = 15112 },
    [15111] = { refId = 15112 },
    [2484] = {
      name = "Earthbind Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "earthbind_totem",
      spellIcon = "spell_nature_strengthofearthtotem02",
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
      spellIcon = "spell_fire_sealoffire",
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
    [1535] = { refId = 11315 },
    [8498] = { refId = 11315 },
    [8499] = { refId = 11315 },
    [11314] = { refId = 11315 },
    [10587] = {
      name = "Magma Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "magma_totem",
      spellIcon = "spell_fire_selfdestruct",
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
    [8190] = { refId = 10587 },
    [10585] = { refId = 10587 },
    [10586] = { refId = 10587 },
    [10438] = {
      name = "Searing Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "searing_totem",
      spellIcon = "spell_fire_searingtotem",
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
    [3599] = { refId = 10438 },
    [6363] = { refId = 10438 },
    [6364] = { refId = 10438 },
    [6365] = { refId = 10438 },
    [10437] = { refId = 10438 },
    [10428] = {
      name = "Stoneclaw Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "stoneclaw_totem",
      spellIcon = "spell_nature_stoneclawtotem",
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
    [5730] = { refId = 10428 },
    [6390] = { refId = 10428 },
    [6391] = { refId = 10428 },
    [6392] = { refId = 10428 },
    [10427] = { refId = 10428 },
    [10463] = {
      name = "Healing Stream Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "healing_stream_totem",
      spellIcon = "inv_spear_04",
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
    [5394] = { refId = 10463 },
    [6375] = { refId = 10463 },
    [6377] = { refId = 10463 },
    [10462] = { refId = 10463 },
    [8170] = {
      name = "Disease Cleansing Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "disease_cleansing_totem",
      spellIcon = "spell_nature_diseasecleansingtotem",
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
      spellIcon = "spell_nature_manaregentotem",
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
    [5675] = { refId = 10497 },
    [10495] = { refId = 10497 },
    [10496] = { refId = 10497 },
    [17359] = {
      name = "Mana Tide Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "mana_tide_totem",
      spellIcon = "spell_frost_summonwaterelemental",
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
    [16190] = { refId = 17359 },
    [17354] = { refId = 17359 },
    [25908] = {
      name = "Tranquil Air Totem",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "tranquil_air_totem",
      spellIcon = "spell_nature_brilliance",
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
      spellIcon = "spell_nature_sleep",
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
      spellIcon = "spell_shadow_raisedead",
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
      spellIcon = "spell_shadow_unholystrength",
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
      spellIcon = "ability_rogue_trip",
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
      spellIcon = "ability_warstomp",
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
      spellIcon = "racial_troll_berserk",
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
    [26297] = { refId = 20554 }, -- energy
    [26296] = { refId = 20554 }, -- rage
    [20580] = {
      name = "Shadowmeld",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shadowmeld",
      spellIcon = "ability_ambush",
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
      spellIcon = "racial_orc_berserkerstrength",
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
      spellIcon = "inv_misc_stonetablet_11",
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
      spellIcon = "inv_misc_enggizmos_04",
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
      spellIcon = "inv_misc_enggizmos_02",
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
      spellIcon = "inv_misc_enggizmos_16",
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
      spellIcon = "inv_misc_bone_elfskull_01",
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
      spellIcon = "inv_belt_25",
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
      spellIcon = "inv_helmet_49",
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
      spellIcon = "ability_ensnare",
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
      spellIcon = "inv_misc_rune_01",
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
      spellIcon = "inv_helmet_49",
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
      spellIcon = "inv_boots_02",
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
      spellIcon = "inv_gizmo_rocketboot_01",
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
      spellIcon = "inv_misc_pocketwatch_01",
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
      spellIcon = "inv_misc_head_dragon_01",
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
      spellIcon = (function()
        if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
          return "inv_jewelry_trinketpvp_02"
        else
          return "inv_jewelry_trinketpvp_01"
        end
      end)(),
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
      spellIcon = (function()
        if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
          return "inv_jewelry_trinketpvp_02"
        else
          return "inv_jewelry_trinketpvp_01"
        end
      end)(),
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
      spellIcon = (function()
        if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
          return "inv_jewelry_trinketpvp_02"
        else
          return "inv_jewelry_trinketpvp_01"
        end
      end)(),
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
      spellIcon = (function()
        if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
          return "inv_jewelry_trinketpvp_02"
        else
          return "inv_jewelry_trinketpvp_01"
        end
      end)(),
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
      spellIcon = (function()
        if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
          return "inv_jewelry_trinketpvp_02"
        else
          return "inv_jewelry_trinketpvp_01"
        end
      end)(),
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
      spellIcon = "inv_misc_armorkit_04",
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
      spellIcon = "inv_misc_gem_pearl_01",
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
      spellIcon = "inv_drink_milk_05",
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
      spellIcon = "inv_potion_41",
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
      spellIcon = "inv_misc_bandage_12",
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
    [746] = { refId = 18610 },
    [1159] = { refId = 18610 },
    [3267] = { refId = 18610 },
    [3268] = { refId = 18610 },
    [7926] = { refId = 18610 },
    [7927] = { refId = 18610 },
    [10838] = { refId = 18610 },
    [10839] = { refId = 18610 },
    [18608] = { refId = 18610 },
    [17548] = {
      name = "Greater Shadow Protection Potion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "greater_shadow_protection_potion",
      soundText = "Shadow protection",
      spellIcon = "inv_potion_23",
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
      spellIcon = "inv_potion_20",
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
      spellIcon = "inv_potion_24",
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
      spellIcon = "inv_potion_22",
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
      spellIcon = "inv_potion_83",
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
      spellIcon = "inv_potion_01",
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
      spellIcon = "inv_potion_07",
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
      spellIcon = "inv_potion_04",
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
      spellIcon = "inv_potion_62",
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
      spellIcon = "inv_potion_25",
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
      spellIcon = "inv_potion_18",
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
      spellIcon = "inv_potion_36",
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
      spellIcon = "inv_potion_12",
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
