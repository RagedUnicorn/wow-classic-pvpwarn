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
mod.spellAvoidMapBase = me

me.tag = "SpellAvoidMapBase"

local spellAvoidMap = {
  ["warrior"] = {
    [7922] = {
      name = "Charge",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "charge",
      spellIcon = "ability_warrior_charge",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 7922, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [20615] = {
      name = "Intercept",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "intercept",
      spellIcon = "ability_rogue_sprint",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 20253, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 20614, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 20615, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      },
    },
    [20253] = { refId = 20615 },
    [20614] = { refId = 20615 },
    [7373] = {
      name = "Hamstring",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "hamstring",
      spellIcon = "ability_shockwave",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 7372, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 7373, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 25212, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [7372] = { refId = 7373 },
    [25212] = { refId = 7373 },
    [21553] = {
      name = "Mortal Strike",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "mortal_strike",
      spellIcon = "ability_warrior_savageblow",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 12294, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 21551, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 21552, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 21553, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [12294] = { refId = 21553 },
    [21551] = { refId = 21553 },
    [21552] = { refId = 21553 },
    [5246] = {
      name = "Intimidating Shout",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "intimidating_shout",
      spellIcon = "ability_golemthunderclap",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 5246, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [6554] = {
      name = "Pummel",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "pummel",
      spellIcon = "inv_gauntlets_04",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 6552, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6554, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [6552] = { refId = 6554 },
    [676] = {
      name = "Disarm",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "disarm",
      spellIcon = "ability_warrior_disarm",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 676, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    }
  },
  ["priest"] = {
    [19280] = {
      name = "Devouring Plague",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "devouring_plague",
      spellIcon = "spell_shadow_blackplague",
      self_avoid = true,
      enemy_avoid = true,
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
    [15326] = {
      name = "Blackout",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blackout",
      spellIcon = "spell_shadow_gathershadows",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 15268, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 15323, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 15324, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 15325, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 15326, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [15268] = { refId = 15326 },
    [15323] = { refId = 15326 },
    [15324] = { refId = 15326 },
    [15325] = { refId = 15326 },
    [10876] = {
      name = "Mana Burn",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "mana_burn",
      spellIcon = "spell_shadow_manaburn",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 8129, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8131, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10874, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10875, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10876, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [8129] = { refId = 10876 },
    [8131] = { refId = 10876 },
    [10874] = { refId = 10876 },
    [10875] = { refId = 10876 },
    [10912] = {
      name = "Mind Control",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "mind_control",
      spellIcon = "spell_shadow_shadowworddominate",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 605, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10911, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10912, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [605] = { refId = 10912 },
    [10911] = { refId = 10912 },
    [10890] = {
      name = "Psychic Scream",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "psychic_scream",
      spellIcon = "spell_shadow_psychicscream",
      self_avoid = true,
      enemy_avoid = true,
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
    [10894] = {
      name = "Shadow Word: Pain",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shadow_word_pain",
      soundText = "Shadowword pain",
      spellIcon = "spell_shadow_shadowwordpain",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 589, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 594, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 970, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 992, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 2767, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10892, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10893, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10894, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [589] = { refId = 10894 },
    [594] = { refId = 10894 },
    [970] = { refId = 10894 },
    [992] = { refId = 10894 },
    [2767] = { refId = 10894 },
    [10892] = { refId = 10894 },
    [10893] = { refId = 10894 },
    [15487] = {
      name = "Silence",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "silence",
      spellIcon = "spell_shadow_impphaseshift",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 15487, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [15286] = {
      name = "Vampiric Embrace",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "vampiric_embrace",
      spellIcon = "spell_shadow_unsummonbuilding",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 15286, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    }
  },
  ["rogue"] = {
    [1769] = {
      name = "Kick",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "kick",
      spellIcon = "ability_kick",
      self_avoid = true,
      enemy_avoid = true,
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
    [1833] = {
      name = "Cheap Shot",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "cheap_shot",
      spellIcon = "ability_cheapshot",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 1833, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [11286] = {
      name = "Gouge",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "gouge",
      spellIcon = "ability_gouge",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 1776, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 1777, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8629, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 11285, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 11286, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [1776] = { refId = 11286 },
    [1777] = { refId = 11286 },
    [8629] = { refId = 11286 },
    [11285] = { refId = 11286 },
    [8643] = {
      name = "Kidney Shot",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "kidney_shot",
      spellIcon = "ability_rogue_kidneyshot",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 408, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8643, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [408] = { refId = 8643 },
    [2094] = {
      name = "Blind",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blind",
      spellIcon = "spell_shadow_mindsteal",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 2094, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [14278] = {
      name = "Ghostly Strike",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "ghostly_strike",
      spellIcon = "spell_shadow_curse",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 14278, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [11297] = {
      name = "Sap",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "sap",
      spellIcon = "ability_sap",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 6770, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 2070, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 11297, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [6770] = { refId = 11297 },
    [2070] = { refId = 11297 },
    [1725] = {
      name = "Distract",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "distract",
      spellIcon = "ability_rogue_distract",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 1725, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [11198] = {
      name = "Expose Armor",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "expose_armor",
      soundText = "Ex-pose armor",
      spellIcon = "ability_warrior_riposte",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 8647, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8649, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8650, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 11197, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 11198, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [8647] = { refId = 11198 },
    [8649] = { refId = 11198 },
    [8650] = { refId = 11198 },
    [11197] = { refId = 11198 },
    [11290] = {
      name = "Garrote",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "garrote",
      spellIcon = "ability_rogue_garrote",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 703, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8631, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8632, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8633, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 11289, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 11290, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [703] = { refId = 11290 },
    [8631] = { refId = 11290 },
    [8632] = { refId = 11290 },
    [8633] = { refId = 11290 },
    [11289] = { refId = 11290 },
    [11275] = {
      name = "Rupture",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "rupture",
      spellIcon = "ability_rogue_rupture",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 1943, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8639, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8640, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 11273, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 11274, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 11275, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [1943] = { refId = 11275 },
    [8639] = { refId = 11275 },
    [8640] = { refId = 11275 },
    [11273] = { refId = 11275 },
    [11274] = { refId = 11275 }
  },
  ["mage"] = {
    [2139] = {
      name = "Counterspell",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "counterspell",
      spellIcon = "spell_frost_iceshock",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 2139, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [12826] = {
      name = "Polymorph",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "polymorph",
      spellIcon = "spell_nature_polymorph",
      self_avoid = true,
      enemy_avoid = true,
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
    [10230] = {
      name = "Frost Nova",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "frost_nova",
      spellIcon = "spell_frost_frostnova",
      self_avoid = true,
      enemy_avoid = true,
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
    [10161] = {
      name = "Cone of Cold",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "cone_of_cold",
      spellIcon = "spell_frost_glacier",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 120, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8492, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10159, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10160, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10161, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [120] = { refId = 10161 },
    [8492] = { refId = 10161 },
    [10159] = { refId = 10161 },
    [10160] = { refId = 10161 }
  },
  ["hunter"] = {
    [5116] = {
      name = "Concussive Shot",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "concussive_shot",
      spellIcon = "spell_frost_stun",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 5116, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [19503] = {
      name = "Scatter Shot",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "scatter_shot",
      spellIcon = "ability_golemstormbolt",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 19503, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [13555] = {
      name = "Serpent Sting",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "serpent_sting",
      spellIcon = "ability_hunter_quickshot",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 1978, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 13549, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 13550, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 13551, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 13552, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 13553, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 13554, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 13555, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [1978] = { refId = 13555 },
    [13549] = { refId = 13555 },
    [13550] = { refId = 13555 },
    [13551] = { refId = 13555 },
    [13552] = { refId = 13555 },
    [13553] = { refId = 13555 },
    [13554] = { refId = 13555 },
    [14280] = {
      name = "Viper Sting",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "viper_sting",
      spellIcon = "ability_hunter_aimedshot",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 3034, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14279, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14280, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [3034] = { refId = 14280 },
    [14279] = { refId = 14280 },
    [14308] = {
      name = "Freezing Trap", -- freezing trap effect
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "freezing_trap",
      spellIcon = "spell_frost_chainsofice",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 3355, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14308, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [3355] = { refId = 14308 },
    [14268] = {
      name = "Wing Clip",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "wing_clip",
      spellIcon = "ability_rogue_trip",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 2974, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14267, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 14268, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [2974] = { refId = 14268 },
    [14267] = { refId = 14268 },
  },
  ["warlock"] = {
    [11719] = {
      name = "Curse of Tongues",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "curse_of_tongues",
      spellIcon = "spell_shadow_curseoftounges",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 1714, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 11719, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [1714] = { refId = 11719 },
    [17926] = {
      name = "Death Coil",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "death_coil",
      spellIcon = "spell_shadow_deathcoil",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 6789, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 17925, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 17926, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [6789] = { refId = 17926 },
    [17925] = { refId = 17926 },
    [6215] = {
      name = "Fear",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "fear",
      spellIcon = "spell_shadow_possession",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 5782, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6213, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6215, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [5782] = { refId = 6215 },
    [6213] = { refId = 6215 },
    [17928] = {
      name = "Howl of Terror",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "howl_of_terror",
      spellIcon = "spell_shadow_deathscream",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 5484, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 17928, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [5484] = { refId = 17928 }
  },
  ["paladin"] = {
    [24239] = {
      name = "Hammer of Wrath",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "hammer_of_wrath",
      spellIcon = "ability_thunderclap",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 24239, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [10308] = {
      name = "Hammer of Justice",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "hammer_of_justice",
      spellIcon = "spell_holy_sealofmight",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 853, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 5588, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 5589, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10308, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [853] = { refId = 10308 },
    [5588] = { refId = 10308 },
    [5589] = { refId = 10308 }
  },
  ["druid"] = {
    [19970] = {
      name = "Entangling Roots",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "entangling_roots",
      spellIcon = "spell_nature_stranglevines",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 339, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 1062, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 5195, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 5196, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 9852, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 19970, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [339] = { refId = 19970 },
    [1062] = { refId = 19970 },
    [5195] = { refId = 19970 },
    [5196] = { refId = 19970 },
    [9852] = { refId = 19970 },
    [9907] = {
      name = "Faerie Fire",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "faerie_fire",
      spellIcon = "spell_nature_faeriefire",
      self_avoid = true,
      enemy_avoid = true,
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
      self_avoid = true,
      enemy_avoid = true,
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
    [8983] = {
      name = "Bash",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "bash",
      spellIcon = "ability_druid_bash",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 5211, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 6798, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8983, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [5211] = { refId = 8983 },
    [6798] = { refId = 8983 },
    [19675] = {
      name = "Feral Charge Effect",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "feral_charge",
      spellIcon = "ability_hunter_pet_bear",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 19675, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    }
  },
  ["shaman"] = {
    [10414] = {
      name = "Earth Shock",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "earth_shock",
      spellIcon = "spell_nature_earthshock",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 8042, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8044, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8045, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8046, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10412, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10413, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10414, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [8042] = { refId = 10414 },
    [8044] = { refId = 10414 },
    [8045] = { refId = 10414 },
    [8046] = { refId = 10414 },
    [10412] = { refId = 10414 },
    [10413] = { refId = 10414 },
    [29228] = {
      name = "Flame Shock",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "flame_shock",
      spellIcon = "spell_fire_flameshock",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 8050, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8052, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8053, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10447, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10448, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 29228, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [8050] = { refId = 29228 },
    [8052] = { refId = 29228 },
    [8053] = { refId = 29228 },
    [10447] = { refId = 29228 },
    [10448] = { refId = 29228 },
    [10473] = {
      name = "Frost Shock",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "frost_shock",
      spellIcon = "spell_frost_frostshock",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = {
        { spellId = 8056, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 8058, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10472, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 10473, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [8056] = { refId = 10473 },
    [8058] = { refId = 10473 },
    [10472] = { refId = 10473 },
  }
}
--[[
  Get the raw base spellAvoidMap. Callers are expected to clone before mutating;
  the assembler clones when building the assembled map.

  @return {table}
    The base spellAvoidMap
]]--
function me.GetMap()
  return spellAvoidMap
end
