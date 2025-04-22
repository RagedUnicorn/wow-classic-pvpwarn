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
mod.spellMap = me

me.tag = "SpellMap"

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
      allRanks = {18499}
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
      allRanks = {1719}
    },
    [12292] = {
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
      allRanks = {12292}
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
      allRanks = {2457}
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
      allRanks = {2458}
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
      allRanks = {71}
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
      allRanks = {20252, 20616, 20617}
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
      allRanks = {676}
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
      allRanks = {12809}
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
      allRanks = {2687}
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
      allRanks = {6552, 6554}
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
      allRanks = {100, 6178, 11578 }
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
      allRanks = {5246}
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
      allRanks = {2565}
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
      allRanks = {23922, 23923, 23924, 23925}
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
      allRanks = {871}
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
      allRanks = {12975}
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
      allRanks = {72, 1671, 1672}
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
      allRanks = {20230}
    },
    [402877] = {
      name = "Flagellation",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "flagellation",
      spellIcon = "inv-mace-1h-stratholme-d-01",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {402877}
    },
    [402911] = {
      name = "Raging Blow",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "raging_blow",
      spellIcon = "ability-hunter-swiftstrike",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {402911}
    },
    [425418] = {
      name = "Consumed by Rage",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "consumed_by_rage",
      spellIcon = "spell-nature-shamanrage",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {425418}
    },
    [429765] = {
      name = "Quick Strike",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "quick_strike",
      spellIcon = "inv_axe_03",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {429765}
    },
    [402913] = {
      name = "Enraged Regeneration",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "enraged_regeneration",
      spellIcon = "ability_hunter_harass",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {402913}
    },
    [426490] = {
      name = "Rallying Cry",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "rallying_cry",
      spellIcon = "ability_warrior_commandingshout",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {426490}
    },
    [403338] = {
      name = "Intervene",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "intervene",
      spellIcon = "ability_warrior_victoryrush",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {403338}
    },
    [403215] = {
      name = "Commanding Shout",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "commanding_shout",
      spellIcon = "ability_warrior_rallyingcry",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {403215}
    },
    [426940] = {
      name = "Rampage",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "rampage",
      spellIcon = "ability_warrior_rampage",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {426940}
    },
    [403228] = {
      name = "Meathook",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "meathook",
      spellIcon = "inv_belt_18",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {403228}
    },
    [440488] = {
      name = "Shockwave",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "shockwave",
      spellIcon = "ability_warrior_shockwave",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {440488}
    },
    [440113] = {
      name = "Sudden Death",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "sudden_death",
      spellIcon = "ability_warrior_improveddisciplines",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {440113}
    },
    [461475] = {
      name = "Valor of Azeroth",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "valor_of_azeroth",
      spellIcon = "ability_warrior_innerrage",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {461475}
    },
    [402927] = {
      name = "Victory Rush",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "victory_rush",
      spellIcon = "ability_warrior_devastate",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {402927}
    },
    [412513] = {
      name = "Gladiator Stance",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "gladiator_stance",
      spellIcon = "achievement_featsofstrength_gladiator_08",
      hasFade = false,
      isStanceSpell = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED"
      },
      allRanks = {412513}
    }
  },
  ["priest"] = {
    [10890] = {
      name = "Psychic Scream",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "psychic_scream",
      spellIcon = "spell_shadow_psychicscream",
      hasFade = false,
      active = true,
      trackedEvents = { "SPELL_CAST_SUCCESS" },
      allRanks = { 8122, 8124, 10888, 10890 }
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
      allRanks = { 15487 }
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
      allRanks = { 10060 }
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
      allRanks = { 588, 7128, 602, 1006, 10951, 10952 }
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
      allRanks = { 15286 }
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
      allRanks = { 2944, 19276, 19277, 19278, 19279, 19280 }
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
      allRanks = { 2652, 19261, 19262, 19264, 19265, 19266 }
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
      allRanks = { 6346 }
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
      allRanks = { 13908, 19238, 19240, 19241, 19242, 19243 }
    },
    [13908] = { refId = 19243 },
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
      allRanks = { 9035, 19281, 19282, 19283, 19284, 19285 }
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
      allRanks = { 18137, 19308, 19309, 19310, 19311, 19312 }
    },
    [19308] = { refId = 18137 },
    [19309] = { refId = 18137 },
    [19310] = { refId = 18137 },
    [19311] = { refId = 18137 },
    [19312] = { refId = 18137 },
    [402174] = {
      name = "Penance",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "penance",
      spellIcon = "spell_holy_penance",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = { 402174 }
    },
    [401946] = {
      name = "Circle of Healing",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "circle_of_healing",
      spellIcon = "spell_holy_circleofrenewal",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = { 401946 }
    },
    [401955] = {
      name = "Shadow Word: Death",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "shadow_word_death",
      spellIcon = "spell_shadow_demonicfortitude",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = { 401955 }
    },
    [402799] = {
      name = "Homunculi",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "homunculi",
      spellIcon = "spell_shadow_twistedfaith",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = { 402799 }
    },
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
      allRanks = { 425294 }
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
      allRanks = { 402004 }
    },
    [401977] = {
      name = "Shadowfiend",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "shadowfiend",
      spellIcon = "spell_shadow_shadowfiend",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = { 401977 }
    },
    [401859] = {
      name = "Prayer of Mending",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "prayer_of_mending",
      spellIcon = "spell_holy_prayerofmendingtga",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = { 401859 }
    },
    [425204] = {
      name = "Void Plague",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "void_plague",
      spellIcon = "spell_deathknight_bloodplague",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = { 425204 }
    },
    [431655] = {
      name = "Mind Spike",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "mind_spike",
      spellIcon = "spell_shadow_painspike",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = { 431655 }
    },
    [402789] = {
      name = "Eye of the Void",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "eye_of_the_void",
      spellIcon = "inv_misc_eye_03",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = { 402789 }
    },
    [431681] = {
      name = "Void Zone",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "void_zone",
      spellIcon = "inv_enchant_voidsphere",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = { 431681 }
    },
    [402668] = {
      name = "Vampiric Touch",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "vampiric_touch",
      spellIcon = "spell_holy_stoicism",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = { 402668 }
    },
    [425284] = {
      name = "Spirit of the Redeemer",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "spirit_of_the_redeemer",
      spellIcon = "inv_enchant_essenceeternallarge",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = { 425284 }
    },
    [431664] = {
      name = "Surge of Light",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "surge_of_light",
      spellIcon = "spell_holy_surgeoflight",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = { 431664 }
    },
    [413248] = {
      name = "Serendipity",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "serendipity",
      spellIcon = "spell_holy_serendipity",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED",
        "SPELL_AURA_REFRESH"
      },
      allRanks = { 413248 }
    }
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
      allRanks = {2094}
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
      allRanks = {1766, 1767, 1768, 1769}
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
      allRanks = {2983, 8696, 11305}
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
      allRanks = {5277}
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
      allRanks = {408, 8643}
    },
    [408] = { refId = 8643 },
    [1833] = {
      name = "Cheap Shot",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "cheap_shot",
      spellIcon = "ability_cheapshot",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {1833}
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
      allRanks = {13750}
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
      allRanks = {13877}
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
      allRanks = {14177}
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
      allRanks = {14185}
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
      allRanks = {1856, 1857}
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
      allRanks = {1784, 1785, 1786, 1787}
    },
    [1784] = { refId = 1787 },
    [1785] = { refId = 1787 },
    [1786] = { refId = 1787 },
    [398196] = {
      name = "Quick Draw",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "quick_draw",
      spellIcon = "inv_musket_02",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {398196}
    },
    [400009] = {
      name = "Between the Eyes",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "between_the_eyes",
      spellIcon = "inv_weapon_rifle_01",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {400009}
    },
    [400012] = {
      name = "Blade Dance",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "blade_dance",
      spellIcon = "ability_warrior_punishingblow",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {400012}
    },
    [399960] = {
      name = "Mutilate",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "mutilate",
      spellIcon = "ability_rogue_shadowstrikes",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {399960}
    },
    [399985] = {
      name = "Shadowstrike",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "shadowstrike",
      spellIcon = "ability_rogue_envelopingshadows",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {399985}
    },
    [424785] = {
      name = "Saber Slash",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "saber_slash",
      spellIcon = "inv_1h_haremmatron_d_01",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {424785}
    },
    [400029] = {
      name = "Shadowstep",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "shadowstep",
      spellIcon = "ability_rogue_shadowstep",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {400029}
    },
    [425012] = {
      name = "Poisoned Knife",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "poisoned_knife",
      spellIcon = "ability_rogue_deadlybrew",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {425012}
    },
    [399986] = {
      name = "Shuriken Toss",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "shuriken_toss",
      spellIcon = "ability_upgrademoonglaive",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {399986}
    },
    [399963] = {
      name = "Envenom",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "envenom",
      spellIcon = "ability_rogue_disembowel",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {399963}
    },
    [424919] = {
      name = "Main Gauche",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "main_gauche",
      spellIcon = "spell_deathknight_spelldeflection",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {424919}
    },
    [425096] = {
      name = "Master of Subtlety",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "master_of_subtlety",
      spellIcon = "ability_rogue_masterofsubtlety",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {425096}
    },
    [462708] = {
      name = "Cutthroat",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "cutthroat",
      spellIcon = "ability_rogue_slaughterfromtheshadows",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {462708}
    },
    [436610] = {
      name = "Blunderbuss",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "blunderbuss",
      spellIcon = "inv_musket_04",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {436610}
    },
    [412096] = {
      name = "Crimson Tempest",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "crimson_tempest",
      spellIcon = "inv_sword_17",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {412096}
    },
    [409240] = {
      name = "Fan of Knives",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "fan_of_knives",
      spellIcon = "ability_rogue_fanofknives",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {409240}
    }
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
      allRanks = {118, 12824, 12825, 12826, 28271, 28272}
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
      allRanks = {543, 8457, 8458, 10223, 10225}
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
      allRanks = {6143, 8461, 8462, 10177, 28609}
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
      }
    },
    [10193] = {
      name = "Mana Shield",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "mana_shield",
      spellIcon = "spell_shadow_detectlesserinvisibility",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED",
        "SPELL_AURA_REFRESH"
      },
      allRanks = {1463, 8494, 8495, 10191, 10192, 10193}
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
      allRanks = {11426, 13031, 13032, 13033}
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
      allRanks = {122, 865, 6131, 10230}
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
      }
    },
    [13021] = {
      name = "Blast Wave",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blast_wave",
      spellIcon = "spell_holy_excorcism_02",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {11113, 13018, 13019, 13020, 13021}
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
      }
    },
    [400647] = {
      name = "Fingers of Frost",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "fingers_of_frost",
      spellIcon = "ability_mage_wintersgrasp",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      }
    },
    [425121] = {
      name = "Icy Veins",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "icy_veins",
      spellIcon = "spell_frost_coldhearted",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      }
    },
    [425124] = {
      name = "Arcane Surge",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "arcane_surge",
      spellIcon = "spell_arcane_arcanetorrent",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      }
    },
    [400613] = {
      name = "Living Bomb",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "living_bomb",
      spellIcon = "ability_mage_livingbomb",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      }
    },
    [436516] = {
      name = "Chronostatic Preservation",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "chronostatic_preservation",
      spellIcon = "spell_arcane_arcane02",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      }
    },
    [401556] = {
      name = "Living Flame",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "living_flame",
      spellIcon = "spell_fire_masterofelements",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      }
    },
    [400640] = {
      name = "Ice Lance",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "ice_lance",
      spellIcon = "spell_frost_frostblast",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      }
    },
    [428739] = {
      name = "Deep Freeze",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "deep_freeze",
      spellIcon = "ability_mage_deepfreeze",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      }
    },
    [401502] = {
      name = "Frostfire Bolt",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "frostfire_bolt",
      spellIcon = "ability_mage_frostfirebolt",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      }
    },
    [412532] = {
      name = "Spellfrost Bolt",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "spellfrost_bolt",
      spellIcon = "spell_fire_blueflamebolt",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      }
    },
    [428878] = {
      name = "Balefire Bolt",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "balefire_bolt",
      spellIcon = "spell_fire_firebolt",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      }
    },
    [400624] = {
      name = "Hot Streak",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "hot_streak",
      spellIcon = "ability_mage_hotstreak",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      }
    },
    [400731] = {
      name = "Brain Freeze",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "brain_freeze",
      spellIcon = "ability_mage_brainfreeze",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      }
    },
    [440802] = {
      name = "Frozen Orb",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "frozen_orb",
      spellIcon = "spell_frost_frozencore",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      }
    }
  }
}

--[[
  Get the spellMap

  @return {table}
    The spellMap
]]--
function me.GetSpellMap()
  return mod.common.Clone(spellMap)
end

--[[
  Get spellMap for a certain category

  @param {string} category

  @return {table}
    Map for the passed category
]]--
function me.GetSpellMapByCategory(category)
  if not category or not spellMap[category] then
    mod.logger.LogError(me.tag, "Unable to retrieve spellMap for category: "
      .. category)

    return nil
  end

  return mod.common.Clone(spellMap[category])
end
