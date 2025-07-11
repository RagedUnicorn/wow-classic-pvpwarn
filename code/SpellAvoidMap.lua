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
mod.spellAvoidMap = me

me.tag = "SpellAvoidMap"

local spellAvoidMap = {
  ["warrior"] = {
    [7922] = {
      name = "Charge",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "charge",
      spellIcon = "ability_warrior_charge",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = { 7922 }
    },
    [20615] = {
      name = "Intercept",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "intercept",
      spellIcon = "ability_rogue_sprint",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = { 20253, 20614, 20615 },
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
      allRanks = { 7372, 7373, 25212 }
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
      allRanks = { 12294, 21551, 21552, 21553 }
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
      allRanks = { 5246 }
    },
    [6554] = {
      name = "Pummel",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "pummel",
      spellIcon = "inv_gauntlets_04",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = { 6552, 6554 }
    },
    [6552] = { refId = 6554 },
    [676] = {
      name = "Disarm",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "disarm",
      spellIcon = "ability_warrior_disarm",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = { 676 }
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
      allRanks = { 2944, 19276, 19277, 19278, 19279, 19280 }
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
      allRanks = { 15268, 15323, 15324, 15325, 15326 }
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
      allRanks = { 8129, 8131, 10874, 10875, 10876 }
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
      allRanks = { 605, 10911, 10912 }
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
      allRanks = { 8122, 8124, 10888, 10890 }
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
      allRanks = { 589, 594, 970, 992, 2767, 10892, 10893, 10894 }
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
      allRanks = { 15487 }
    },
    [15286] = {
      name = "Vampiric Embrace",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "vampiric_embrace",
      spellIcon = "spell_shadow_unsummonbuilding",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = { 15286 }
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
      allRanks = { 1766, 1767, 1768, 1769 }
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
      allRanks = { 1833 }
    },
    [11286] = {
      name = "Gouge",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "gouge",
      spellIcon = "ability_gouge",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = { 1776, 1777, 8629, 11285, 11286 }
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
      allRanks = { 408, 8643 }
    },
    [408] = { refId = 8643 },
    [2094] = {
      name = "Blind",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blind",
      spellIcon = "spell_shadow_mindsteal",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = { 2094 }
    },
    [14278] = {
      name = "Ghostly Strike",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "ghostly_strike",
      spellIcon = "spell_shadow_curse",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = { 14278 }
    },
    [11297] = {
      name = "Sap",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "sap",
      spellIcon = "ability_sap",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = { 6770, 2070, 11297 }
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
      allRanks = { 1725 }
    },
    [11198] = {
      name = "Expose Armor",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "expose_armor",
      soundText = "Ex-pose armor",
      spellIcon = "ability_warrior_riposte",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = { 8647, 8649, 8650, 11197, 11198 }
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
      allRanks = { 703, 8631, 8632, 8633, 11289, 11290 }
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
      allRanks = { 1943, 8639, 8640, 11273, 11274, 11275 }
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
      allRanks = { 2139 }
    },
    [12826] = {
      name = "Polymorph",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "polymorph",
      spellIcon = "spell_nature_polymorph",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = { 118, 12824, 12825, 12826, 28271, 28272 }
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
      allRanks = { 122, 865, 6131, 10230 }
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
      allRanks = { 120, 8492, 10159, 10160, 10161 }
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
      allRanks = { 5116 }
    },
    [19503] = {
      name = "Scatter Shot",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "scatter_shot",
      spellIcon = "ability_golemstormbolt",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = { 19503 }
    },
    [13555] = {
      name = "Serpent Sting",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "serpent_sting",
      spellIcon = "ability_hunter_quickshot",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = { 1978, 13549, 13550, 13551, 13552, 13553, 13554, 13555 }
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
      allRanks = { 3034, 14279, 14280 }
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
      allRanks = { 3355, 14308 }
    },
    [3355] = { refId = 14308 },
    [14268] = {
      name = "Wing Clip",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "wing_clip",
      spellIcon = "ability_rogue_trip",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = { 2974, 14267, 14268 }
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
      allRanks = { 1714, 11719 }
    },
    [1714] = { refId = 11719 },
    [17926] = {
      name = "Death Coil",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "death_coil",
      spellIcon = "spell_shadow_deathcoil",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = { 6789, 17925, 17926 }
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
      allRanks = { 5782, 6213, 6215 }
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
      allRanks = { 5484, 17928 }
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
      allRanks = { 24239 }
    },
    [10308] = {
      name = "Hammer of Justice",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "hammer_of_justice",
      spellIcon = "spell_holy_sealofmight",
      self_avoid = true,
      enemy_avoid = true,
      allRanks = { 853, 5588, 5589, 10308 }
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
      allRanks = { 339, 1062, 5195, 5196, 9852, 19970 }
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
      allRanks = { 770, 778, 9749, 9907 }
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
      allRanks = { 16857, 17390, 17391, 17392 }
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
      allRanks = { 5211, 6798, 8983 }
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
      allRanks = { 19675 }
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
      allRanks = { 8042, 8044, 8045, 8046, 10412, 10413, 10414 }
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
      allRanks = { 8050, 8052, 8053, 10447, 10448, 29228 }
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
      allRanks = { 8056, 8058, 10472, 10473 }
    },
    [8056] = { refId = 10473 },
    [8058] = { refId = 10473 },
    [10472] = { refId = 10473 },
  }
}
--[[
  Get the spellAvoidMap

  @return {table}
    The spellAvoidMap
]]--
function me.GetSpellAvoidMap()
  return mod.common.Clone(spellAvoidMap)
end

--[[
  Get spellAvoidMap for a certain category

  @param {string} category

  @return {table}
    Map for the passed category
]]--
function me.GetSpellAvoidMapByCategory(category)
  if not category or not spellAvoidMap[category] then
    mod.logger.LogError(me.tag, "Unable to retrieve spellMap for category: "
        .. category)

    return nil
  end

  return mod.common.Clone(spellAvoidMap[category])
end
