--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

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

--[[
  ["category"] = {
    e.g warrior, misc etc.
    ["spell_name"] = {
      ["name"] = "Spell Name",
        {string} spellname in ingame format
      ["soundFileName"] = "",
        {string} name of the soundfile
      ["itemId"] = 0000,
        {number} optional item id
      ["spellId"] = 0000,
        {number} id of the spell
      ["spellIcon"] = "some_icon",
        {string} asset name of the icon
      ["hasFade"] = false,
        {boolean} if set to true means there is a sound file to announce Aura down/fade
        {boolean} optional field, default false if field is missing
      ["links"] = { 0000 },
        {table} optional field, link to other spells by their spellId. Spells that are linked together
        share their configuration. The can't have a different configuration from eachother
      ["active"] = false,
        -- {boolean} Whether the spell is active or inactive
      ["trackedEvents"] = {
        TODO add all possible spell events
      }
        {table} marks events that are tracked for this spell

        Ignoring events: TODO this is different in classic TODO
          CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
            -- helps ignoring the periodic damage from dots
          CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF
            -- helps ignoring heal from debug e.g. from Devouring Plague
          CHAT_MSG_SPELL_AURA_GONE_OTHER
            - helps to ignore the fading of the debuff
          CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS
            - helps ignoring bloodrage ticks
    }
  }
]]--
local spellMap

if (GetLocale() == "deDE") then
  spellMap = {
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
  spellMap = {
    ["warrior"] = { -- completely verified
      ["berserker_rage"] = {
        ["name"] = "Berserker Rage",
        ["soundFileName"] = "berserker_rage",
        ["spellId"] = 18499,
        ["spellIcon"] = "spell_nature_ancestralguardian",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED",
        }
      },
      ["recklessness"] = {
        ["name"] = "Recklessness",
        ["soundFileName"] = "recklessness",
        ["spellId"] = 1719,
        ["spellIcon"] = "ability_criticalstrike",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED",
        }
      },
      ["death_wish"] = {
        ["name"] = "Death Wish",
        ["soundFileName"] = "death_wish",
        ["spellId"] = 12328,
        ["spellIcon"] = "spell_shadow_deathpact",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED",
        }
      },
      ["battle_stance"] = {
        ["name"] = "Battle Stance",
        ["soundFileName"] = "battle_stance",
        ["spellId"] = 2457,
        ["spellIcon"] = "ability_warrior_offensivestance",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
        }
      },
      ["berserker_stance"] = {
        ["name"] = "Berserker Stance",
        ["soundFileName"] = "berserker_stance",
        ["spellId"] = 2458,
        ["spellIcon"] = "ability_racial_avatar",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
        }
      },
      ["defensive_stance"] = {
        ["name"] = "Defensive Stance",
        ["soundFileName"] = "defensive_stance",
        ["spellId"] = 71,
        ["spellIcon"] = "ability_warrior_defensivestance",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
        }
      },
      ["intercept"] = {
        ["name"] = "Intercept",
        ["soundFileName"] = "intercept",
        ["spellId"] = 20252,
        ["spellIcon"] = "ability_rogue_sprint",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["disarm"] = {
        ["name"] = "Disarm",
        ["soundFileName"] = "disarm",
        ["spellId"] = 676,
        ["spellIcon"] = "ability_warrior_disarm",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["concussion_blow"] = {
        ["name"] = "Concussion Blow",
        ["soundFileName"] = "concussion_blow",
        ["spellId"] = 12809,
        ["spellIcon"] = "ability_thunderbolt",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["bloodrage"] = {
        ["name"] = "Bloodrage",
        ["soundFileName"] = "bloodrage",
        ["spellId"] = 2687,
        ["spellIcon"] = "ability_racial_bloodrage",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["pummel"] = {
        ["name"] = "Pummel",
        ["soundFileName"] = "pummel",
        ["spellId"] = 6552,
        ["spellIcon"] = "inv_gauntlets_04",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["charge"] = {
        ["name"] = "Charge",
        ["soundFileName"] = "charge",
        ["spellId"] = 11578,
        ["spellIcon"] = "ability_warrior_charge",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["intimidating_shout"] = {
        ["name"] = "Intimidating Shout",
        ["soundFileName"] = "intimidating_shout",
        ["spellId"] = 29544,
        ["spellIcon"] = "ability_golemthunderclap",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["shield_block"] = {
        ["name"] = "Shield Block",
        ["soundFileName"] = "shield_block",
        ["spellId"] = 2565,
        ["spellIcon"] = "ability_defend",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["shield_slam"] = {
        ["name"] = "Shield Slam",
        ["soundFileName"] = "shield_slam",
        ["spellId"] = 23925, -- rank 4
        ["spellIcon"] = "inv_shield_05",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      }
    },
    ["priest"] = { -- completely verified
      ["psychic_scream"] = {
        ["name"] = "Psychic Scream",
        ["soundFileName"] = "psychic_scream",
        ["spellId"] = 10890,
        ["spellIcon"] = "spell_shadow_psychicscream",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["silence"] = {
        ["name"] = "Silence",
        ["soundFileName"] = "silence",
        ["spellId"] = 15487,
        ["spellIcon"] = "spell_shadow_impphaseshift",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["power_infusion"] = {
        ["name"] = "Power Infusion",
        ["soundFileName"] = "power_infusion",
        ["spellId"] = 10060,
        ["spellIcon"] = "spell_holy_powerinfusion",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED",
          "SPELL_AURA_REFRESH"
        }
      },
      ["inner_fire"] = {
        ["name"] = "Inner Fire",
        ["soundFileName"] = "inner_fire",
        ["spellId"] = 10952, -- rank 6
        ["spellIcon"] = "spell_holy_innerfire",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED",
          "SPELL_AURA_REFRESH"
        }
      },
      ["vampiric_embrace"] = {
        ["name"] = "Vampiric Embrace",
        ["soundFileName"] = "vampiric_embrace",
        ["spellId"] = 15286,
        ["spellIcon"] = "spell_shadow_unsummonbuilding",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REFRESH"
        }
      },
      ["devouring_plague"] = {
        ["name"] = "Devouring Plague",
        ["soundFileName"] = "devouring_plague",
        ["spellId"] = 19280, -- rank 6
        ["spellIcon"] = "spell_shadow_blackplague",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["touch_of_weakness"] = {
        ["name"] = "Touch of Weakness",
        ["soundFileName"] = "touch_of_weakness",
        ["spellId"] = 19266, -- rank 6
        ["spellIcon"] = "spell_shadow_deadofnight",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED",
          "SPELL_AURA_REFRESH"
        }
      },
      ["fear_ward"] = {
        ["name"] = "Fear Ward",
        ["soundFileName"] = "fear_ward",
        ["spellId"] = 6346,
        ["spellIcon"] = "spell_holy_excorcism",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED",
          "SPELL_AURA_REFRESH"
        }
      },
    },
    ["rogue"] = { -- completely verified
      ["blind"] = {
        ["name"] = "Blind",
        ["soundFileName"] = "blind",
        ["spellId"] = 2094,
        ["spellIcon"] = "spell_shadow_mindsteal",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REFRESH"
        }
      },
      ["kick"] = {
        ["name"] = "Kick",
        ["soundFileName"] = "kick",
        ["spellId"] = 1769,
        ["spellIcon"] = "ability_kick",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["sprint"] = {
        ["name"] = "Sprint",
        ["soundFileName"] = "sprint",
        ["spellId"] = 11305, -- rank 3
        ["spellIcon"] = "ability_rogue_sprint",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED",
        }
      },
      ["evasion"] = {
        ["name"] = "Evasion",
        ["soundFileName"] = "evasion",
        ["spellId"] = 5277,
        ["spellIcon"] = "spell_shadow_shadowward",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["kidney_shot"] = {
        ["name"] = "Kidney Shot",
        ["soundFileName"] = "kidney_shot",
        ["spellId"] = 8643,
        ["spellIcon"] = "ability_rogue_kidneyshot",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["cheap_shot"] = {
        ["name"] = "Cheap Shot",
        ["soundFileName"] = "cheap_shot",
        ["spellId"] = 1833,
        ["spellIcon"] = "ability_cheapshot",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["adrenaline_rush"] = {
        ["name"] = "Adrenaline Rush",
        ["soundFileName"] = "adrenaline_rush",
        ["spellId"] = 13750,
        ["spellIcon"] = "spell_shadow_shadowworddominate",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },

      ["blade_flurry"] = {
        ["name"] = "Blade Flurry",
        ["soundFileName"] = "blade_flurry",
        ["spellId"] = 13877,
        ["spellIcon"] = "ability_warrior_punishingblow",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["cold_blood"] = {
        ["name"] = "Cold Blood",
        ["soundFileName"] = "cold_blood",
        ["spellId"] = 14177,
        ["spellIcon"] = "spell_ice_lament",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      }
    },
    ["mage"] = { -- completely verified
      ["ice_block"] = {
        ["name"] = "Ice Block",
        ["soundFileName"] = "ice_block",
        ["spellId"] = 11958,
        ["spellIcon"] = "spell_frost_frost",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["polymorph"] = {
        ["name"] = "Polymorph",
        ["soundFileName"] = "polymorph",
        ["spellId"] = 12826,
        ["spellIcon"] = "spell_nature_polymorph",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["blink"] = {
        ["name"] = "Blink",
        ["soundFileName"] = "blink",
        ["spellId"] = 1953,
        ["spellIcon"] = "spell_arcane_blink",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["fire_ward"] = {
        ["name"] = "Fire Ward",
        ["soundFileName"] = "fire_ward",
        ["spellId"] = 10226, -- rank 5
        ["spellIcon"] = "spell_fire_firearmor",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["frost_ward"] = {
        ["name"] = "Frost Ward",
        ["soundFileName"] = "frost_ward",
        ["spellId"] = 28609, -- rank 5
        ["spellIcon"] = "spell_frost_frostward",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["counterspell"] = {
        ["name"] = "Counterspell",
        ["soundFileName"] = "counterspell",
        ["spellId"] = 2139,
        ["spellIcon"] = "spell_frost_iceshock",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["mana_shield"] = {
        ["name"] = "Mana Shield",
        ["soundFileName"] = "mana_shield",
        ["spellId"] = 10193, -- rank 6
        ["spellIcon"] = "spell_shadow_detectlesserinvisibility",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED",
          "SPELL_AURA_REFRESH"
        }
      },
      ["ice_barrier"] = {
        ["name"] = "Ice Barrier",
        ["soundFileName"] = "ice_barrier",
        ["spellId"] = 13033, -- rank 4
        ["spellIcon"] = "spell_ice_lament",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED",
          "SPELL_AURA_REFRESH"
        }
      },
      ["frost_nova"] = {
        ["name"] = "Frost Nova",
        ["soundFileName"] = "frost_nova",
        ["spellId"] = 10230, -- rank 4
        ["spellIcon"] = "spell_frost_frostnova",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["arcane_power"] = {
        ["name"] = "Arcane Power",
        ["soundFileName"] = "arcane_power",
        ["spellId"] = 12042,
        ["spellIcon"] = "spell_nature_lightning",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["evocation"] = {
        ["name"] = "Evocation",
        ["soundFileName"] = "evocation",
        ["spellId"] = 12051,
        ["spellIcon"] = "spell_nature_purge",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["presence_of_mind"] = {
        ["name"] = "Presence of Mind",
        ["soundFileName"] = "presence_of_mind",
        ["spellId"] = 12043,
        ["spellIcon"] = "spell_nature_enchantarmor",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["combustion"] = {
        ["name"] = "Combustion",
        ["soundFileName"] = "combustion",
        ["spellId"] = 11129,
        ["spellIcon"] = "spell_fire_sealoffire",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["blast_wave"] = {
        ["name"] = "Blast Wave",
        ["soundFileName"] = "blast_wave",
        ["spellId"] = 13021, -- rank 5
        ["spellIcon"] = "spell_holy_excorcism_02",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      }
    },
    ["hunter"] = { -- completely verified
      ["concussive_shot"] = {
        ["name"] = "Concussive Shot",
        ["soundFileName"] = "concussive_shot",
        ["spellId"] = 5116,
        ["spellIcon"] = "spell_frost_stun",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["aspect_of_the_monkey"] = {
        ["name"] = "Aspect of the Monkey",
        ["soundFileName"] = "aspect_of_the_monkey",
        ["spellId"] = 13163,
        ["spellIcon"] = "ability_hunter_aspectofthemonkey",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["aspect_of_the_hawk"] = {
        ["name"] = "Aspect of the Hawk",
        ["soundFileName"] = "aspect_of_the_hawk",
        ["spellId"] = 25296, -- rank 7
        ["spellIcon"] = "spell_nature_ravenform",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["rapid_fire"] = {
        ["name"] = "Rapid Fire",
        ["soundFileName"] = "rapid_fire",
        ["spellId"] = 3045,
        ["spellIcon"] = "ability_hunter_runningshot",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["explosive_trap"] = {
        ["name"] = "Explosive Trap",
        ["soundFileName"] = "explosive_trap",
        ["spellId"] = 14317, -- rank 3
        ["spellIcon"] = "spell_fire_selfdestruct",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["freezing_trap"] = {
        ["name"] = "Freezing Trap",
        ["soundFileName"] = "freezing_trap",
        ["spellId"] = 27753, -- rank 3
        ["spellIcon"] = "spell_frost_chainsofice",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["immolation_trap"] = {
        ["name"] = "Immolation Trap",
        ["soundFileName"] = "immolation_trap",
        ["spellId"] = 14305, -- rank 5
        ["spellIcon"] = "spell_fire_flameshock",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["frost_trap"] = {
        ["name"] = "Frost Trap",
        ["soundFileName"] = "frost_trap",
        ["spellId"] = 13809,
        ["spellIcon"] = "spell_frost_freezingbreath",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["viper_sting"] = {
        ["name"] = "Viper Sting",
        ["soundFileName"] = "viper_sting",
        ["spellId"] = 14280, -- rank 3
        ["spellIcon"] = "ability_hunter_aimedshot",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["scatter_shot"] = {
        ["name"] = "Scatter Shot",
        ["soundFileName"] = "scatter_shot",
        ["spellId"] = 19503,
        ["spellIcon"] = "ability_golemstormbolt",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["flare"] = {
        ["name"] = "Flare",
        ["soundFileName"] = "flare",
        ["spellId"] = 1543,
        ["spellIcon"] = "spell_fire_flare",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["intimidation"] = {
        ["name"] = "Intimidation",
        ["soundFileName"] = "intimidation",
        ["spellId"] = 24394,
        ["spellIcon"] = "ability_devour",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["bestial_wrath"] = {
        ["name"] = "Bestial Wrath",
        ["soundFileName"] = "bestial_wrath",
        ["spellId"] = 19574,
        ["spellIcon"] = "ability_druid_ferociousbite",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      }
    },
    ["warlock"] = {
      ["fear"] = {
        ["name"] = "Fear",
        ["soundFileName"] = "fear",
        ["spellId"] = 6215, -- rank 3
        ["spellIcon"] = "spell_shadow_possession",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },

      ["shadowburn"] = {
        ["name"] = "Shadowburn",
        ["soundFileName"] = "shadowburn",
        ["spellId"] = 18871, -- rank 6
        ["spellIcon"] = "spell_shadow_scourgebuild",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["shadow_ward"] = {
        ["name"] = "Shadow Ward",
        ["soundFileName"] = "shadow_ward",
        ["spellId"] = 28610, -- rank 4
        ["spellIcon"] = "spell_shadow_antishadow",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["howl_of_terror"] = {
        ["name"] = "Howl of Terror",
        ["soundFileName"] = "howl_of_terror",
        ["spellId"] = 17928, -- rank 2
        ["spellIcon"] = "spell_shadow_deathscream",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["death_coil"] = {
        ["name"] = "Death Coil",
        ["soundFileName"] = "death_coil",
        ["spellId"] = 17926,
        ["spellIcon"] = "spell_shadow_deathcoil",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["amplify_curse"] = {
        ["name"] = "Amplify Curse",
        ["soundFileName"] = "amplify_curse",
        ["spellId"] = 18288,
        ["spellIcon"] = "spell_shadow_contagion",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["spell_lock"] = {
        ["name"] = "Spell Lock",
        ["soundFileName"] = "spell_lock",
        ["spellId"] = 19647,
        ["spellIcon"] = "spell_shadow_mindrot",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["soul_link"] = {
        ["name"] = "Soul Link",
        ["soundFileName"] = "soul_link",
        ["spellId"] = 19028,
        ["spellIcon"] = "spell_shadow_gathershadows",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      }
    },
    ["paladin"] = {
      ["devotion_aura"] = {
        ["name"] = "Devotion Aura",
        ["soundFileName"] = "devotion_aura",
        ["spellId"] = 10293, -- rank 7
        ["spellIcon"] = "spell_holy_devotionaura",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED"
        }
      },
      ["retribution_aura"] = {
        ["name"] = "Retribution Aura",
        ["soundFileName"] = "retribution_aura",
        ["spellId"] = 10301, -- rank 5
        ["spellIcon"] = "spell_holy_auraoflight",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED"
        }
      },
      ["concentration_aura"] = {
        ["name"] = "Concentration Aura",
        ["soundFileName"] = "concentration_aura",
        ["spellId"] = 19746,
        ["spellIcon"] = "spell_holy_mindsooth",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED"
        }
      },
      ["shadow_resistance_aura"] = {
        ["name"] = "Shadow Resistance Aura",
        ["soundFileName"] = "shadow_resistance_aura",
        ["spellId"] = 19896,
        ["spellIcon"] = "spell_shadow_sealofkings",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED"
        }
      },
      ["frost_resistance_aura"] = {
        ["name"] = "Frost Resistance Aura",
        ["soundFileName"] = "frost_resistance_aura",
        ["spellId"] = 19898, -- rank 3
        ["spellIcon"] = "spell_frost_wizardmark",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED"
        }
      },
      ["fire_resistance_aura"] = {
        ["name"] = "Fire Resistance Aura",
        ["soundFileName"] = "fire_resistance_aura",
        ["spellId"] = 19900, -- rank 3
        ["spellIcon"] = "spell_fire_sealoffire",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED"
        }
      },
      ["blessing_of_protection"] = {
        ["name"] = "Blessing of Protection",
        ["soundFileName"] = "blessing_of_protection",
        ["spellId"] = 10278, -- rank 3
        ["spellIcon"] = "spell_holy_sealofprotection",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["blessing_of_freedom"] = {
        ["name"] = "Blessing of Freedom",
        ["soundFileName"] = "blessing_of_freedom",
        ["spellId"] = 1044,
        ["spellIcon"] = "spell_holy_sealofvalor",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["blessing_of_sacrifice"] = {
        ["name"] = "Blessing of Sacrifice",
        ["soundFileName"] = "blessing_of_sacrifice",
        ["spellId"] = 20729,
        ["spellIcon"] = "spell_holy_sealofsacrifice",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["hammer_of_justice"] = {
        ["name"] = "Hammer of Justice",
        ["soundFileName"] = "hammer_of_justice",
        ["spellId"] = 10308,
        ["spellIcon"] = "spell_holy_sealofmight",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["repentance"] = {
        ["name"] = "Repentance",
        ["soundFileName"] = "repentance",
        ["spellId"] = 20066,
        ["spellIcon"] = "spell_holy_prayerofhealing",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["divine_shield"] = {
        ["name"] = "Divine Shield",
        ["soundFileName"] = "divine_shield",
        ["spellId"] = 642, -- rank 2
        ["spellIcon"] = "spell_holy_divineintervention",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["forbearance"] = {
        ["name"] = "Forbearance",
        ["soundFileName"] = "forbearance",
        ["spellId"] = 25771,
        ["spellIcon"] = "spell_holy_removecurse",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      }
    },
    ["druid"] = {
      ["barkskin"] = {
        ["name"] = "Barkskin",
        ["soundFileName"] = "barkskin",
        ["spellId"] = 22812,
        ["spellIcon"] = "spell_nature_stoneclawtotem",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["natures_grasp"] = {
        ["name"] = "Nature's Grasp",
        ["soundFileName"] = "natures_grasp",
        ["spellId"] = 17329, -- rank 6
        ["spellIcon"] = "spell_nature_natureswrath",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["bash"] = {
        ["name"] = "Bash",
        ["soundFileName"] = "bash",
        ["spellId"] = 8983, -- rank 3
        ["spellIcon"] = "ability_druid_bash",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["feral_charge"] = {
        ["name"] = "Feral Charge",
        ["soundFileName"] = "feral_charge",
        ["spellId"] = 16979,
        ["spellIcon"] = "ability_hunter_pet_bear",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["frenzied_regeneration"] = {
        ["name"] = "Frenzied Regeneration",
        ["soundFileName"] = "frenzied_regeneration",
        ["spellId"] = 22896, -- rank 3
        ["spellIcon"] = "ability_bullrush",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["abolish_poison"] = {
        ["name"] = "Abolish Poison",
        ["soundFileName"] = "abolish_poison",
        ["spellId"] = 2893,
        ["spellIcon"] = "spell_nature_nullifypoison_02",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["innervate"] = {
        ["name"] = "Innervate",
        ["soundFileName"] = "innervate",
        ["spellId"] = 29166,
        ["spellIcon"] = "spell_nature_lightning",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["natures_swiftness"] = {
        ["name"] = "Nature's Swiftness",
        ["soundFileName"] = "natures_swiftness",
        ["spellId"] = 17116,
        ["spellIcon"] = "spell_nature_ravenform",
        ["hasFade"] = true,
        ["links"] = { 16188 }, -- TODO how to handle "links"
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["faerie_fire"] = {
        ["name"] = "Faerie Fire",
        ["soundFileName"] = "faerie_fire",
        ["spellId"] = 9907, -- rank 4
        ["spellIcon"] = "spell_nature_faeriefire",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["faerie_fire_feral"] = {
        ["name"] = "Faerie Fire (Feral)",
        ["soundFileName"] = "faerie_fire",
        ["spellId"] = 17392, -- rank 4
        ["spellIcon"] = "spell_nature_faeriefire",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      }
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
end

-- TODO create or modify to allow also for search with an event parameter
-- we might only work with certain events but the spellname might be showing up in different events
--[[
  Retrieve a spell from the spellMap by name and tracked event. Certain spellnames might show up in different events
  that we don't want to track. Each spell in the spellmap defines when it should be considered a valid target

  @param {string} name
  @param {string} event
  @return ({string} {table}) | {nil}
]]--
function me.SearchByName(name, event)
  if not name then return nil end -- TODO improve this make it more safe

  local spellName = mod.common.NormalizeSpellname(name)

  mod.logger.LogDebug(me.tag, string.format("Searching for %s in spellMap", spellName))

  for category, _ in pairs(spellMap) do
    for spellEntry, spellData in pairs(spellMap[category]) do
      if spellEntry == spellName then
        mod.logger.LogDebug(me.tag, string.format("Found spell - %s - in spellMap", spellName))
        -- check if the passed event is a valid tracked one for the found spell
        for _, trackedEvent in pairs(spellData.trackedEvents) do
          if trackedEvent == event then
            mod.logger.LogDebug(me.tag, string.format("Found matching tracked event %s for spell %s", event, spellName))

            local clonedSpell = mod.common.Clone(spellMap[category][spellEntry])
            clonedSpell.normalizedSpellName = spellEntry -- add normalizedSpellName that would get lost otherwise

            return category, clonedSpell
          end
        end

        return nil
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

  local spellList = {}

  for _, spell in pairs(spellMap[category]) do
    table.insert(spellList, mod.common.Clone(spell))
  end

  return spellList
end
