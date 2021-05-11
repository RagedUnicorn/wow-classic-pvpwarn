--[[
  MIT License

  Copyright (c) 2021 Michael Wiesendanger

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

-- luacheck: globals GetLocale

local mod = rgpvpw
local me = {}
mod.spellAvoidMap = me

me.tag = "SpellAvoidMap"

--[[

]]--
local spellAvoidMap

if (GetLocale() == "deDE") then
  spellAvoidMap = {
    ["warrior"] = {

    },
    ["priest"] = {

    },
    ["rogue"] = {

    },
    ["mage"] = {

    },
    ["hunter"] = {

    },
    ["warlock"] = {

    },
    ["paladin"] = {

    },
    ["druid"] = {

    },
    ["shaman"] = {

    },
    ["racials"] = {

    },
    ["items"] = {

    },
    ["misc"] = {

    }
  }
else
  spellAvoidMap = {
    ["warrior"] = {
      ["charge_stun"] = {
        ["name"] = "Charge Stun",
        ["spellId"] = 7922,
        ["spellIcon"] = "ability_warrior_charge",
        ["soundFileName"] = "charge",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["intercept_stun"] = {
        ["name"] = "Intercept Stun",
        ["spellId"] = 20615, -- rank 3
        ["spellIcon"] = "ability_rogue_sprint",
        ["soundFileName"] = "intercept",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["hamstring"] = {
        ["name"] = "Hamstring",
        ["spellId"] = 7373, -- rank 3
        ["spellIcon"] = "ability_shockwave",
        ["soundFileName"] = "hamstring",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["mortal_strike"] = {
        ["name"] = "Mortal Strike",
        ["spellId"] = 21553, -- rank 4
        ["spellIcon"] = "ability_warrior_savageblow",
        ["soundFileName"] = "mortal_strike",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["intimidating_shout"] = {
        ["name"] = "Intimidating Shout",
        ["spellId"] = 5246,
        ["spellIcon"] = "ability_golemthunderclap",
        ["soundFileName"] = "intimidating_shout",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["pummel"] = {
        ["name"] = "Pummel",
        ["spellId"] = 6554, -- rank 2
        ["spellIcon"] = "inv_gauntlets_04",
        ["soundFileName"] = "pummel",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["disarm"] = {
        ["name"] = "Disarm",
        ["spellId"] = 676,
        ["spellIcon"] = "ability_warrior_disarm",
        ["soundFileName"] = "disarm",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["priest"] = {
      ["devouring_plague"] = {
        ["name"] = "Devouring Plague",
        ["spellId"] = 19280, -- rank 6
        ["spellIcon"] = "spell_shadow_blackplague",
        ["soundFileName"] = "devouring_plague",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["blackout"] = {
        ["name"] = "Blackout",
        ["spellId"] = 15326, -- rank 5 (skillpoints)
        ["spellIcon"] = "spell_shadow_gathershadows",
        ["soundFileName"] = "blackout",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["mana_burn"] = {
        ["name"] = "Mana Burn",
        ["spellId"] = 10876, -- rank 5
        ["spellIcon"] = "spell_shadow_manaburn",
        ["soundFileName"] = "mana_burn",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["mind_control"] = {
        ["name"] = "Mind Control",
        ["spellId"] = 10912, -- rank 3
        ["spellIcon"] = "spell_shadow_shadowworddominate",
        ["soundFileName"] = "mind_control",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["psychic_scream"] = {
        ["name"] = "Psychic Scream",
        ["spellId"] = 10890,
        ["spellIcon"] = "spell_shadow_psychicscream",
        ["soundFileName"] = "psychic_scream",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["shadow_word_pain"] = {
        ["name"] = "Shadow Word: Pain",
        ["spellId"] = 10894, -- rank 8
        ["spellIcon"] = "spell_shadow_shadowwordpain",
        ["soundFileName"] = "shadow_word_pain",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["silence"] = {
        ["name"] = "Silence",
        ["spellId"] = 15487,
        ["spellIcon"] = "spell_shadow_impphaseshift",
        ["soundFileName"] = "silence",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["vampiric_embrace"] = {
        ["name"] = "Vampiric Embrace",
        ["spellId"] = 15286,
        ["spellIcon"] = "spell_shadow_unsummonbuilding",
        ["soundFileName"] = "vampiric_embrace",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["rogue"] = {
      ["kick"] = {
        ["name"] = "Kick",
        ["spellId"] = 1769,
        ["spellIcon"] = "ability_kick",
        ["soundFileName"] = "kick",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["cheap_shot"] = {
        ["name"] = "Cheap Shot",
        ["spellId"] = 1833,
        ["spellIcon"] = "ability_cheapshot",
        ["soundFileName"] = "cheap_shot",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["gouge"] = {
        ["name"] = "Gouge",
        ["spellId"] = 11286,
        ["spellIcon"] = "ability_gouge",
        ["soundFileName"] = "gouge",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["kidney_shot"] = {
        ["name"] = "Kidney Shot",
        ["spellId"] = 8643,
        ["spellIcon"] = "ability_rogue_kidneyshot",
        ["soundFileName"] = "kidney_shot",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["blind"] = {
        ["name"] = "Blind",
        ["spellId"] = 2094,
        ["spellIcon"] = "spell_shadow_mindsteal",
        ["soundFileName"] = "blind",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["ghostly_strike"] = {
        ["name"] = "Ghostly Strike",
        ["spellId"] = 14278,
        ["spellIcon"] = "spell_shadow_curse",
        ["soundFileName"] = "ghostly_strike",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["sap"] = {
        ["name"] = "Sap",
        ["spellId"] = 11297, -- rank 3
        ["spellIcon"] = "ability_sap",
        ["soundFileName"] = "sap",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["distract"] = {
        ["name"] = "Distract",
        ["spellId"] = 1725,
        ["spellIcon"] = "ability_rogue_distract",
        ["soundFileName"] = "distract",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["expose_armor"] = {
        ["name"] = "Expose Armor",
        ["spellId"] = 11198, -- rank 5
        ["spellIcon"] = "ability_warrior_riposte",
        ["soundFileName"] = "expose_armor",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["garrote"] = {
        ["name"] = "Garrote",
        ["spellId"] = 11290, -- rank 6
        ["spellIcon"] = "ability_rogue_garrote",
        ["soundFileName"] = "garrote",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["rupture"] = {
        ["name"] = "Rupture",
        ["spellId"] = 11275, -- rank 6
        ["spellIcon"] = "ability_rogue_rupture",
        ["soundFileName"] = "rupture",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["mage"] = {
      ["counterspell"] = {
        ["name"] = "Counterspell",
        ["spellId"] = 2139,
        ["spellIcon"] = "spell_frost_iceshock",
        ["soundFileName"] = "silence",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["counterspell_silenced"] = {
        ["name"] = "Counterspell - Silenced",
        ["spellId"] = 2139,
        ["spellIcon"] = "spell_frost_iceshock",
        ["soundFileName"] = "silence",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = false, -- immune event is only happening for counterspell
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["polymorph"] = {
        ["name"] = "Polymorph",
        ["spellId"] = 12826,
        ["spellIcon"] = "spell_nature_polymorph",
        ["soundFileName"] = "polymorph",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["frost_nova"] = {
        ["name"] = "Frost Nova",
        ["spellId"] = 10230, -- rank 4
        ["spellIcon"] = "spell_frost_frostnova",
        ["soundFileName"] = "frost_nova",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["cone_of_cold"] = {
        ["name"] = "Cone of Cold",
        ["spellId"] = 10161, -- rank 5
        ["spellIcon"] = "spell_frost_glacier",
        ["soundFileName"] = "cone_of_cold",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["hunter"] = {
      ["concussive_shot"] = {
        ["name"] = "Concussive Shot",
        ["spellId"] = 5116,
        ["spellIcon"] = "spell_frost_stun",
        ["soundFileName"] = "concussive_shot",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["scatter_shot"] = {
        ["name"] = "Scatter Shot",
        ["spellId"] = 19503,
        ["spellIcon"] = "ability_golemstormbolt",
        ["soundFileName"] = "scatter_shot",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["serpent_sting"] = {
        ["name"] = "Serpent Sting",
        ["spellId"] = 13555, -- rank 8
        ["spellIcon"] = "ability_hunter_quickshot",
        ["soundFileName"] = "serpent_sting",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["viper_sting"] = {
        ["name"] = "Viper Sting",
        ["spellId"] = 14280, -- rank 3
        ["spellIcon"] = "ability_hunter_aimedshot",
        ["soundFileName"] = "viper_sting",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["freezing_trap_effect"] = {
        ["name"] = "Freezing Trap Effect",
        ["spellId"] = 27753, -- rank 3
        ["spellIcon"] = "spell_frost_chainsofice",
        ["soundFileName"] = "freezing_trap",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["wing_clip"] = {
        ["name"] = "Wing Clip",
        ["spellId"] = 14268, -- rank 3
        ["spellIcon"] = "ability_rogue_trip",
        ["soundFileName"] = "wing_clip",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["warlock"] = {
      ["curse_of_tongues"] = {
        ["name"] = "Curse of Tongues",
        ["spellId"] = 11719, -- rank 2
        ["spellIcon"] = "spell_shadow_curseoftounges",
        ["soundFileName"] = "curse_of_tongues",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["death_coil"] = {
        ["name"] = "Death Coil",
        ["spellId"] = 17926, -- rank 3
        ["spellIcon"] = "spell_shadow_deathcoil",
        ["soundFileName"] = "death_coil",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["fear"] = {
        ["name"] = "Fear",
        ["spellId"] = 6215, -- rank 3
        ["spellIcon"] = "spell_shadow_possession",
        ["soundFileName"] = "fear",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["howl_of_terror"] = {
        ["name"] = "Howl of Terror",
        ["spellId"] = 17928, -- rank 2
        ["spellIcon"] = "spell_shadow_deathscream",
        ["soundFileName"] = "howl_of_terror",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["paladin"] = {
      ["hammer_of_wrath"] = {
        ["name"] = "Hammer of Wrath",
        ["spellId"] = 24239, -- rank 3
        ["spellIcon"] = "ability_thunderclap",
        ["soundFileName"] = "hammer_of_wrath",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["hammer_of_justice"] = {
        ["name"] = "Hammer of Justice",
        ["spellId"] = 10308, -- rank 4
        ["spellIcon"] = "spell_holy_sealofmight",
        ["soundFileName"] = "hammer_of_justice",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["druid"] = {
      ["entangling_roots"] = {
        ["name"] = "Entangling Roots",
        ["spellId"] = 19970, -- rank 6
        ["spellIcon"] = "spell_nature_stranglevines",
        ["soundFileName"] = "entangling_roots",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["faerie_fire"] = {
        ["name"] = "Faerie Fire",
        ["spellId"] = 9907, -- rank 4
        ["spellIcon"] = "spell_nature_faeriefire",
        ["soundFileName"] = "faerie_fire",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["faerie_fire_feral"] = {
        ["name"] = "Farie Fire (Feral)",
        ["spellId"] = 17392, -- rank 4
        ["spellIcon"] = "spell_nature_faeriefire",
        ["soundFileName"] = "faerie_fire",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["bash"] = {
        ["name"] = "Bash",
        ["spellId"] = 8983, -- rank 3
        ["spellIcon"] = "ability_druid_bash",
        ["soundFileName"] = "bash",
        ["dodge"] = true,
        ["parry"] = true,
        ["immune"] = true,
        ["miss"] = true,
        ["block"] = true,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["feral_charge_effect"] = {
        ["name"] = "Feral Charge Effect",
        ["spellId"] = 16979,
        ["spellIcon"] = "ability_hunter_pet_bear",
        ["soundFileName"] = "feral_charge",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    },
    ["shaman"] = {
      ["earth_shock"] = {
        ["name"] = "Earth Shock",
        ["spellId"] = 10414, -- rank 7
        ["spellIcon"] = "spell_nature_earthshock",
        ["soundFileName"] = "earth_shock",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["flame_shock"] = {
        ["name"] = "Flame Shock",
        ["spellId"] = 29228, -- rank 6
        ["spellIcon"] = "spell_fire_flameshock",
        ["soundFileName"] = "flame_shock",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["frost_shock"] = {
        ["name"] = "Frost Shock",
        ["spellId"] = 10473, -- rank 4
        ["spellIcon"] = "spell_frost_frostshock",
        ["soundFileName"] = "frost_shock",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      }
    }
  }
end

--[[
  NEVER returning the original list we dont want to give anyone the option to modify it

  @return {table}
   A clone of the spellMap
]]--
function me.GetSpellConfiguration()
  return mod.common.Clone(spellAvoidMap)
end

--[[
  Search the spellmap for a specific spell by its name

  @param {string} name

  @return ({string} {table}) | {nil}
]]--
function me.SearchByName(name)
  if not name then return nil end

  local spellName = mod.common.NormalizeSpellname(name)

  mod.logger.LogDebug(me.tag, string.format("Searching for %s in spellAvoidMap", spellName))

  for category, _ in pairs(spellAvoidMap) do
    for spellEntry, _ in pairs(spellAvoidMap[category]) do
      if spellEntry == spellName then
        mod.logger.LogDebug(me.tag, string.format("Found spell - %s - in spellAvoidMap", spellName))

        local clonedSpell = mod.common.Clone(spellAvoidMap[category][spellEntry])
        clonedSpell.normalizedSpellName = spellEntry -- add normalizedSpellName that would get lost otherwise

        return category, clonedSpell
      end
    end
  end

  return nil
end

--[[
  Get map for a certain category

  @param {string} category

  @return {table}
    Map for the passed category
]]--
function me.GetAllForCategory(category)
  if not category then return nil end

  local spellAvoidList = {}

  for normalizedSpellName, spell in pairs(spellAvoidMap[category]) do
    local clonedSpell = mod.common.Clone(spell)
    clonedSpell.normalizedSpellName = normalizedSpellName
    table.insert(spellAvoidList, clonedSpell)
  end

  return spellAvoidList
end
