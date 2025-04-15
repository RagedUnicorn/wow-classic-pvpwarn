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
      name = "Charge Stun",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "charge",
      spellIcon = "ability_warrior_charge",
      allRanks = {7922},
      self_avoid = true,
      enemy_avoid = true
    },
    [20615] = {
      name = "Intercept Stun",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "intercept",
      spellIcon = "ability_rogue_sprint",
      allRanks = {20253, 20614, 20615},
      self_avoid = true,
      enemy_avoid = true
    },
    [20253] = { refId = 20615 },
    [20614] = { refId = 20615 },
    [7373] = {
      name = "Hamstring",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "hamstring",
      spellIcon = "ability_shockwave",
      allRanks = {7372, 7373, 25212},
      self_avoid = true,
      enemy_avoid = true
    },
    [7372] = { refId = 7373 },
    [25212] = { refId = 7373 },
    [21553] = {
      name = "Mortal Strike",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "mortal_strike",
      spellIcon = "ability_warrior_savageblow",
      allRanks = {12294, 21551, 21552, 21553},
      self_avoid = true,
      enemy_avoid = true
    },
    [12294] = { refId = 21553 },
    [21551] = { refId = 21553 },
    [21552] = { refId = 21553 },
    [5246] = {
      name = "Intimidating Shout",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "intimidating_shout",
      spellIcon = "ability_golemthunderclap",
      allRanks = {5246},
      self_avoid = true,
      enemy_avoid = true
    },
    [6554] = {
      name = "Pummel",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "pummel",
      spellIcon = "inv_gauntlets_04",
      allRanks = {6552, 6554},
      self_avoid = true,
      enemy_avoid = true
    },
    [6552] = { refId = 6554 },
    [676] = {
      name = "Disarm",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "disarm",
      spellIcon = "ability_warrior_disarm",
      allRanks = {676},
      self_avoid = true,
      enemy_avoid = true
    }
  },
  ["priest"] = {
    [19280] = {
      name = "Devouring Plague",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "devouring_plague",
      spellIcon = "spell_shadow_blackplague",
      allRanks = {2944, 19276, 19277, 19278, 19279, 19280},
      self_avoid = true,
      enemy_avoid = true
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
      allRanks = {15268, 15323, 15324, 15325, 15326},
      self_avoid = true,
      enemy_avoid = true
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
      allRanks = {8129, 8131, 10874, 10875, 10876},
      self_avoid = true,
      enemy_avoid = true
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
      allRanks = {605, 10911, 10912},
      self_avoid = true,
      enemy_avoid = true
    },
    [605] = { refId = 10912 },
    [10911] = { refId = 10912 },
    [10890] = {
      name = "Psychic Scream",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "psychic_scream",
      spellIcon = "spell_shadow_psychicscream",
      allRanks = {8122, 8124, 10888, 10890},
      self_avoid = true,
      enemy_avoid = true
    },
    [8122] = { refId = 10890 },
    [8124] = { refId = 10890 },
    [10888] = { refId = 10890 },
    [10894] = {
      name = "Shadow Word: Pain",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shadow_word_pain",
      spellIcon = "spell_shadow_shadowwordpain",
      allRanks = {589, 594, 970, 992, 2767, 10892, 10893, 10894},
      self_avoid = true,
      enemy_avoid = true
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
      allRanks = {15487},
      self_avoid = true,
      enemy_avoid = true
    },
    [15286] = {
      name = "Vampiric Embrace",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "vampiric_embrace",
      spellIcon = "spell_shadow_unsummonbuilding",
      allRanks = {15286},
      self_avoid = true,
      enemy_avoid = true
    }
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
