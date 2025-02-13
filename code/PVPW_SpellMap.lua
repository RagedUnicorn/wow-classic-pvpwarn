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

-- luacheck: globals GetLocale UnitFactionGroup

local mod = rgpvpw
local me = {}
mod.spellMap = me

me.tag = "SpellMap"

--[[
  ["category"] = {
    e.g warrior, misc etc.
    ["spell_name"] = {
      ["name"] = "Spell Name",
        {string} spell name in in game format
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
        share their configuration. The can't have a different configuration from each other
      ["isStanceSpell"] = true,
        {boolean} Whether the spell is considered a stance spell and might be tracked by stance state feature
      ["active"] = false,
        {boolean} Whether the spell is active or inactive
      ["trackedEvents"] = {
        {string} An event such as SPELL_AURA_APPLIED that should be tracked. If a spell is found
        but no matching trackedEvent the spell is ignored and no warning is generated
      },
      ["ignorePet"] = true
        {boolean} Whether the event should be ignore if it was detected on a pet
        E.g if the target of the spell is Pet-0-4908-1-223-417-00001A2950. This is used for spells
        such as soul link
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
    ["warrior"] = {
      ["berserker_rage"] = {
        ["name"] = "Berserker Rage",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "berserker_rage",
        ["spellId"] = 18499,
        ["spellIcon"] = "spell_nature_ancestralguardian",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["recklessness"] = {
        ["name"] = "Recklessness",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "recklessness",
        ["spellId"] = 1719,
        ["spellIcon"] = "ability_criticalstrike",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["death_wish"] = {
        ["name"] = "Death Wish",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "death_wish",
        ["spellId"] = 12292,
        ["spellIcon"] = "spell_shadow_deathpact",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["battle_stance"] = {
        ["name"] = "Battle Stance",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "battle_stance",
        ["spellId"] = 2457,
        ["spellIcon"] = "ability_warrior_offensivestance",
        ["hasFade"] = false,
        ["isStanceSpell"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED"
        }
      },
      ["berserker_stance"] = {
        ["name"] = "Berserker Stance",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "berserker_stance",
        ["spellId"] = 2458,
        ["spellIcon"] = "ability_racial_avatar",
        ["hasFade"] = false,
        ["isStanceSpell"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED"
        }
      },
      ["defensive_stance"] = {
        ["name"] = "Defensive Stance",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "defensive_stance",
        ["spellId"] = 71,
        ["spellIcon"] = "ability_warrior_defensivestance",
        ["hasFade"] = false,
        ["isStanceSpell"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED"
        }
      },
      ["intercept"] = {
        ["name"] = "Intercept",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "shield_slam",
        ["spellId"] = 23925, -- rank 4
        ["spellIcon"] = "inv_shield_05",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["shield_wall"] = {
        ["name"] = "Shield Wall",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "shield_wall",
        ["spellId"] = 871,
        ["spellIcon"] = "ability_warrior_shieldwall",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["last_stand"] = {
        ["name"] = "Last Stand",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "last_stand",
        ["spellId"] = 12975,
        ["spellIcon"] = "spell_holy_ashestoashes",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["shield_bash"] = {
        ["name"] = "Shield Bash",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "shield_bash",
        ["spellId"] = 1672, -- rank 3
        ["spellIcon"] = "ability_warrior_shieldbash",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["retaliation"] = {
        ["name"] = "Retaliation",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "retaliation",
        ["spellId"] = 20230,
        ["spellIcon"] = "ability_warrior_challange",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["flagellation"] = {
        ["name"] = "Flagellation",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "flagellation",
        ["spellId"] = 402877,
        ["spellIcon"] = "inv-mace-1h-stratholme-d-01",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["raging_blow"] = {
        ["name"] = "Raging Blow",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "raging_blow",
        ["spellId"] = 402911,
        ["spellIcon"] = "ability-hunter-swiftstrike",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["consumed_by_rage"] = {
        ["name"] = "Consumed by Rage",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "consumed_by_rage",
        ["spellId"] = 425418,
        ["spellIcon"] = "spell-nature-shamanrage",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["quick_strike"] = {
        ["name"] = "Quick Strike",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "quick_strike",
        ["spellId"] = 429765,
        ["spellIcon"] = "inv_axe_03",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["enraged_regeneration"] = {
        ["name"] = "Enraged Regeneration",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "enraged_regeneration",
        ["spellId"] = 402913,
        ["spellIcon"] = "ability_warrior_focusedrage",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["rallying_cry"] = {
        ["name"] = "Rallying Cry",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "rallying_cry",
        ["spellId"] = 426490,
        ["spellIcon"] = "ability_warrior_commandingshout",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["intervene"] = {
        ["name"] = "Intervene",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "intervene",
        ["spellId"] = 403338,
        ["spellIcon"] = "ability_warrior_victoryrush",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["commanding_shout"] = {
        ["name"] = "Commanding Shout",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "commanding_shout",
        ["spellId"] = 403215,
        ["spellIcon"] = "ability_warrior_rallyingcry",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["rampage"] = {
        ["name"] = "Rampage",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "rampage",
        ["spellId"] = 426940,
        ["spellIcon"] = "ability_warrior_rampage",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["meathook"] = {
        ["name"] = "Meathook",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "meathook",
        ["spellId"] = 403228,
        ["spellIcon"] = "inv_belt_18",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["shockwave"] = {
        ["name"] = "Shockwave",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "shockwave",
        ["spellId"] = 440488,
        ["spellIcon"] = "ability_warrior_shockwave",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["sudden_death"] = {
        ["name"] = "Sudden Death",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "sudden_death",
        ["spellId"] = 440113,
        ["spellIcon"] = "ability_warrior_improveddisciplines",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["valor_of_azeroth"] = {
        ["name"] = "Valor of Azeroth",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "valor_of_azeroth",
        ["spellId"] = 461475,
        ["spellIcon"] = "ability_warrior_innerrage",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["victory_rush"] = {
        ["name"] = "Victory Rush",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "victory_rush",
        ["spellId"] = 402927,
        ["spellIcon"] = "ability_warrior_devastate",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["gladiator_stance"] = {
        ["name"] = "Gladiator Stance",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "gladiator_stance",
        ["spellId"] = 412513,
        ["spellIcon"] = "achievement_featsofstrength_gladiator_08",
        ["hasFade"] = false,
        ["isStanceSpell"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED"
        }
      }
    },
    ["priest"] = {
      ["psychic_scream"] = {
        ["name"] = "Psychic Scream",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "vampiric_embrace",
        ["spellId"] = 15286,
        ["spellIcon"] = "spell_shadow_unsummonbuilding",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED"
        }
      },
      ["devouring_plague"] = {
        ["name"] = "Devouring Plague",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
      ["desperate_prayer"] = {
        ["name"] = "Desperate Prayer",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "desperate_prayer",
        ["spellId"] = 19243, -- rank 7
        ["spellIcon"] = "spell_holy_restoration",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["hex_of_weakness"] = {
        ["name"] = "Hex of Weakness",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "hex_of_weakness",
        ["spellId"] = 9035, -- rank 1
        ["spellIcon"] = "spell_shadow_fingerofdeath",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["shadowguard"] = {
        ["name"] = "Shadowguard",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "shadowguard",
        ["spellId"] = 19312, -- rank 6
        ["spellIcon"] = "spell_nature_lightningshield",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED",
          "SPELL_AURA_REFRESH"
        }
      },
      ["penance"] = {
        ["name"] = "Penance",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "penance",
        ["spellId"] = 402174,
        ["spellIcon"] = "spell_holy_penance",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["circle_of_healing"] = {
        ["name"] = "Circle of Healing",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "circle_of_healing",
        ["spellId"] = 401946,
        ["spellIcon"] = "spell_holy_circleofrenewal",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["shadow_word_death"] = {
        ["name"] = "Shadow Word: Death",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "shadow_word_death",
        ["spellId"] = 401955,
        ["spellIcon"] = "spell_shadow_demonicfortitude",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["homunculi"] = {
        ["name"] = "Homunculi",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "homunculi",
        ["spellId"] = 402799,
        ["spellIcon"] = "spell_shadow_twistedfaith",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["dispersion"] = {
        ["name"] = "Dispersion",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "dispersion",
        ["spellId"] = 425294,
        ["spellIcon"] = "spell_shadow_dispersion",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["pain_suppression"] = {
        ["name"] = "Pain Suppression",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "pain_suppression",
        ["spellId"] = 402004,
        ["spellIcon"] = "spell_holy_painsupression",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["shadowfiend"] = {
        ["name"] = "Shadowfiend",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "shadowfiend",
        ["spellId"] = 401977,
        ["spellIcon"] = "spell_shadow_shadowfiend",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["prayer_of_mending"] = {
        ["name"] = "Prayer of Mending",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "prayer_of_mending",
        ["spellId"] = 401859,
        ["spellIcon"] = "spell_holy_prayerofmendingtga",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["void_plague"] = {
        ["name"] = "Void Plague",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "void_plague",
        ["spellId"] = 425204,
        ["spellIcon"] = "spell_deathknight_bloodplague",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["mind_spike"] = {
        ["name"] = "Mind Spike",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "mind_spike",
        ["spellId"] = 431655,
        ["spellIcon"] = "spell_shadow_painspike",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["eye_of_the_void"] = {
        ["name"] = "Eye of the Void",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "eye_of_the_void",
        ["spellId"] = 402789,
        ["spellIcon"] = "inv_misc_eye_03",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["void_zone"] = {
        ["name"] = "Void Zone",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "void_zone",
        ["spellId"] = 431681,
        ["spellIcon"] = "inv_enchant_voidsphere",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["vampiric_touch"] = {
        ["name"] = "Vampiric Touch",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "vampiric_touch",
        ["spellId"] = 402668,
        ["spellIcon"] = "spell_holy_stoicism",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["spirit_of_the_redeemer"] = {
        ["name"] = "Spirit of the Redeemer",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "spirit_of_the_redeemer",
        ["spellId"] = 425284,
        ["spellIcon"] = "inv_enchant_essenceeternallarge",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["surge_of_light"] = {
        ["name"] = "Surge of Light",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "surge_of_light",
        ["spellId"] = 431664,
        ["spellIcon"] = "spell_holy_surgeoflight",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["serendipity"] = {
        ["name"] = "Serendipity",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "serendipity",
        ["spellId"] = 413248,
        ["spellIcon"] = "spell_holy_serendipity",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED",
          "SPELL_AURA_REFRESH"
        }
      }
    },
    ["rogue"] = {
      ["blind"] = {
        ["name"] = "Blind",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "sprint",
        ["spellId"] = 11305, -- rank 3
        ["spellIcon"] = "ability_rogue_sprint",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["evasion"] = {
        ["name"] = "Evasion",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "cold_blood",
        ["spellId"] = 14177,
        ["spellIcon"] = "spell_ice_lament",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["preparation"] = {
        ["name"] = "Preparation",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "preparation",
        ["spellId"] = 14185,
        ["spellIcon"] = "spell_shadow_antishadow",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["vanish"] = {
        ["name"] = "Vanish",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "vanish",
        ["spellId"] = 1857, -- rank 2
        ["spellIcon"] = "ability_vanish",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["stealth"] = {
        ["name"] = "Stealth",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "stealth",
        ["spellId"] = 1787, -- rank 4
        ["spellIcon"] = "ability_stealth",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["quick_draw"] = {
        ["name"] = "Quick Draw",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "quick_draw",
        ["spellId"] = 398196,
        ["spellIcon"] = "inv_musket_02",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["between_the_eyes"] = {
        ["name"] = "Between the Eyes",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "between_the_eyes",
        ["spellId"] = 400009,
        ["spellIcon"] = "inv_weapon_rifle_01",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["blade_dance"] = {
        ["name"] = "Blade Dance",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "blade_dance",
        ["spellId"] = 400012,
        ["spellIcon"] = "ability_warrior_punishingblow",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["mutilate"] = {
        ["name"] = "Mutilate",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "mutilate",
        ["spellId"] = 399960,
        ["spellIcon"] = "ability_rogue_shadowstrikes",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["shadowstrike"] = {
        ["name"] = "Shadowstrike",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "shadowstrike",
        ["spellId"] = 399985,
        ["spellIcon"] = "ability_rogue_envelopingshadows",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["saber_slash"] = {
        ["name"] = "Saber Slash",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "saber_slash",
        ["spellId"] = 424785,
        ["spellIcon"] = "inv_1h_haremmatron_d_01",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["shadowstep"] = {
        ["name"] = "Shadowstep",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "shadowstep",
        ["spellId"] = 400029,
        ["spellIcon"] = "ability_rogue_shadowstep",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["poisoned_knife"] = {
        ["name"] = "Poisoned Knife",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "poisoned_knife",
        ["spellId"] = 425012,
        ["spellIcon"] = "ability_rogue_deadlybrew",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["shuriken_toss"] = {
        ["name"] = "Shuriken Toss",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "shuriken_toss",
        ["spellId"] = 399986,
        ["spellIcon"] = "ability_upgrademoonglaive",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["envenom"] = {
        ["name"] = "Envenom",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "envenom",
        ["spellId"] = 399963,
        ["spellIcon"] = "ability_rogue_disembowel",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["main_gauche"] = {
        ["name"] = "Main Gauche",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "main_gauche",
        ["spellId"] = 424919,
        ["spellIcon"] = "spell_deathknight_spelldeflection",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["master_of_subtlety"] = {
        ["name"] = "Master of Subtlety",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "master_of_subtlety",
        ["spellId"] = 425096,
        ["spellIcon"] = "ability_rogue_masterofsubtlety",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["cutthroat"] = {
        ["name"] = "Cutthroat",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "cutthroat",
        ["spellId"] = 462708,
        ["spellIcon"] = "ability_rogue_slaughterfromtheshadows",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["blunderbuss"] = {
        ["name"] = "Blunderbuss",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "blunderbuss",
        ["spellId"] = 436610,
        ["spellIcon"] = "inv_musket_04",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["crimson_tempest"] = {
        ["name"] = "Crimson Tempest",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "crimson_tempest",
        ["spellId"] = 412096,
        ["spellIcon"] = "inv_sword_17",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["fan_of_knives"] = {
        ["name"] = "Fan of Knives",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "fan_of_knives",
        ["spellId"] = 409240,
        ["spellIcon"] = "ability_rogue_fanofknives",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      }
    },
    ["mage"] = {
      ["ice_block"] = {
        ["name"] = "Ice Block",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "polymorph",
        ["spellId"] = 12826,
        ["spellIcon"] = "spell_nature_polymorph",
        ["hasFade"] = false,
        ["hasCast"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS",
          "SPELL_CAST_START"
        }
      },
      ["blink"] = {
        ["name"] = "Blink",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "blast_wave",
        ["spellId"] = 13021, -- rank 5
        ["spellIcon"] = "spell_holy_excorcism_02",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["cold_snap"] = {
        ["name"] = "Cold Snap",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "cold_snap",
        ["spellId"] = 12472,
        ["spellIcon"] = "spell_frost_wizardmark",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["fingers_of_frost"] = {
        ["name"] = "Fingers of Frost",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "fingers_of_frost",
        ["spellId"] = 400647,
        ["spellIcon"] = "ability_mage_wintersgrasp",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["icy_veins"] = {
        ["name"] = "Icy Veins",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "icy_veins",
        ["spellId"] = 425121,
        ["spellIcon"] = "spell_frost_coldhearted",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["arcane_surge"] = {
        ["name"] = "Arcane Surge",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "arcane_surge",
        ["spellId"] = 425124,
        ["spellIcon"] = "spell_arcane_arcanetorrent",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["living_bomb"] = {
        ["name"] = "Living Bomb",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "living_bomb",
        ["spellId"] = 400613,
        ["spellIcon"] = "ability_mage_livingbomb",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["chronostatic_preservation"] = {
        ["name"] = "Chronostatic Preservation",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "chronostatic_preservation",
        ["spellId"] = 436516,
        ["spellIcon"] = "spell_arcane_arcane02",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["living_flame"] = {
        ["name"] = "Living Flame",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "living_flame",
        ["spellId"] = 401556,
        ["spellIcon"] = "spell_fire_masterofelements",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["ice_lance"] = {
        ["name"] = "Ice Lance",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "ice_lance",
        ["spellId"] = 400640,
        ["spellIcon"] = "spell_frost_frostblast",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["deep_freeze"] = {
        ["name"] = "Deep Freeze",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "deep_freeze",
        ["spellId"] = 428739,
        ["spellIcon"] = "ability_mage_deepfreeze",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["frostfire_bolt"] = {
        ["name"] = "Frostfire Bolt",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "frostfire_bolt",
        ["spellId"] = 401502,
        ["spellIcon"] = "ability_mage_frostfirebolt",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["spellfrost_bolt"] = {
        ["name"] = "Spellfrost Bolt",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "spellfrost_bolt",
        ["spellId"] = 412532,
        ["spellIcon"] = "spell_fire_blueflamebolt",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["balefire_bolt"] = {
        ["name"] = "Balefire Bolt",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "balefire_bolt",
        ["spellId"] = 428878,
        ["spellIcon"] = "spell_fire_firebolt",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["hot_streak"] = {
        ["name"] = "Hot Streak",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "hot_streak",
        ["spellId"] = 400624,
        ["spellIcon"] = "ability_mage_hotstreak",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["fireball"] = {
        ["name"] = "Brain Freeze",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "brain_freeze",
        ["spellId"] = 400731,
        ["spellIcon"] = "ability_mage_brainfreeze",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["frozen_orb"] = {
        ["name"] = "Frozen Orb",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "frozen_orb",
        ["spellId"] = 440802,
        ["spellIcon"] = "spell_frost_frozencore",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      }
    },
    ["hunter"] = {
      ["concussive_shot"] = {
        ["name"] = "Concussive Shot",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "bestial_wrath",
        ["spellId"] = 19574,
        ["spellIcon"] = "ability_druid_ferociousbite",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["deterrence"] = {
        ["name"] = "Deterrence",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "deterrence",
        ["spellId"] = 19263,
        ["spellIcon"] = "ability_whirlwind",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["sniper_training"] = {
        ["name"] = "Sniper Training",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "sniper_training",
        ["spellId"] = 415399,
        ["spellIcon"] = "ability_hunter_snipershot",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["kill_shot"] = {
        ["name"] = "Kill Shot",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "kill_shot",
        ["spellId"] = 409974,
        ["spellIcon"] = "ability_hunter_assassinate2",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["flanking_strike"] = {
        ["name"] = "Flanking Strike",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "flanking_strike",
        ["spellId"] = 415320,
        ["spellIcon"] = "ability_hunter_harass",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["chimera_shot"] = {
        ["name"] = "Chimera Shot",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "chimera_shot",
        ["spellId"] = 409433,
        ["spellIcon"] = "ability_hunter_chimerashot2",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["explosive_shot"] = {
        ["name"] = "Explosive Shot",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "explosive_shot",
        ["spellId"] = 409552,
        ["spellIcon"] = "ability_hunter_explosiveshot",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["lock_and_load"] = {
        ["name"] = "Lock and Load",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "lock_and_load",
        ["spellId"] = 415413,
        ["spellIcon"] = "ability_hunter_lockandload",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["hit_and_run"] = {
        ["name"] = "Hit and Run",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "hit_and_run",
        ["spellId"] = 440533,
        ["spellIcon"] = "ability_hunter_displacement",
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "soul_link",
        ["spellId"] = 19028,
        ["spellIcon"] = "spell_shadow_gathershadows",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        },
        ["ignorePet"] = true
      },
      ["fel_domination"] = {
        ["name"] = "Fel Domination",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "fel_domination",
        ["spellId"] = 18708,
        ["spellIcon"] = "spell_nature_removecurse",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["demonic_grace"] = {
        ["name"] = "Demonic Grace",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "demonic_grace",
        ["spellId"] = 425463,
        ["spellIcon"] = "ability_warlock_demonicpower",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["haunt"] = {
        ["name"] = "Haunt",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "haunt",
        ["spellId"] = 403501,
        ["spellIcon"] = "ability_warlock_haunt",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["vengeance"] = {
        ["name"] = "Vengeance",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "vengeance",
        ["spellId"] = 426195,
        ["spellIcon"] = "ability_warlock_improveddemonictactics",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["immolation_aura"] = {
        ["name"] = "Immolation Aura",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "immolation_aura",
        ["spellId"] = 427726,
        ["spellIcon"] = "spell_fire_felimmolation",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["unstable_affliction"] = {
        ["name"] = "Unstable Affliction",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "unstable_affliction",
        ["spellId"] = 427717,
        ["spellIcon"] = "spell_shadow_unstableaffliction_3",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["backdraft"] = {
        ["name"] = "Backdraft",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "backdraft",
        ["spellId"] = 427713,
        ["spellIcon"] = "ability_warlock_backdraft",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["infernal_armor"] = {
        ["name"] = "Infernal Armor",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "infernal_armor",
        ["spellId"] = 440882,
        ["spellIcon"] = "achievement_boss_kiljaedan",
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "devotion_aura",
        ["spellId"] = 10293, -- rank 7
        ["spellIcon"] = "spell_holy_devotionaura",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["retribution_aura"] = {
        ["name"] = "Retribution Aura",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "retribution_aura",
        ["spellId"] = 10301, -- rank 5
        ["spellIcon"] = "spell_holy_auraoflight",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["concentration_aura"] = {
        ["name"] = "Concentration Aura",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "concentration_aura",
        ["spellId"] = 19746,
        ["spellIcon"] = "spell_holy_mindsooth",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["shadow_resistance_aura"] = {
        ["name"] = "Shadow Resistance Aura",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "shadow_resistance_aura",
        ["spellId"] = 19896,
        ["spellIcon"] = "spell_shadow_sealofkings",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["frost_resistance_aura"] = {
        ["name"] = "Frost Resistance Aura",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "frost_resistance_aura",
        ["spellId"] = 19898, -- rank 3
        ["spellIcon"] = "spell_frost_wizardmark",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["fire_resistance_aura"] = {
        ["name"] = "Fire Resistance Aura",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "fire_resistance_aura",
        ["spellId"] = 19900, -- rank 3
        ["spellIcon"] = "spell_fire_sealoffire",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["blessing_of_protection"] = {
        ["name"] = "Blessing of Protection",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "forbearance",
        ["spellId"] = 25771,
        ["spellIcon"] = "spell_holy_removecurse",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["lay_on_hands"] = {
        ["name"] = "Lay on Hands",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "lay_on_hands",
        ["spellId"] = 633,
        ["spellIcon"] = "spell_holy_layonhands",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["divine_protection"] = {
        ["name"] = "Divine Protection",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "divine_protection",
        ["spellId"] = 5573,
        ["spellIcon"] = "spell_holy_restoration",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["aegis"] = {
        ["name"] = "Aegis",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "aegis",
        ["spellId"] = 425589,
        ["spellIcon"] = "inv_shield_48",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["divine_sacrifice"] = {
        ["name"] = "Divine Sacrifice",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "divine_sacrifice",
        ["spellId"] = 407804,
        ["spellIcon"] = "spell_holy_powerwordbarrier",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["inspiration_exemplar"] = {
        ["name"] = "Inspiration Exemplar",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "inspiration_exemplar",
        ["spellId"] = 407880,
        ["spellIcon"] = "spell_holy_power",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["avengers_shield"] = {
        ["name"] = "Avenger's Shield",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "avengers_shield",
        ["spellId"] = 407669,
        ["spellIcon"] = "spell_holy_avengersshield",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["rebuke"] = {
        ["name"] = "Rebuke",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "rebuke",
        ["spellId"] = 425609,
        ["spellIcon"] = "inv_relics_totemofrage",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["crusader_strike"] = {
        ["name"] = "Crusader Strike",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "crusader_strike",
        ["spellId"] = 407676,
        ["spellIcon"] = "spell_holy_crusaderstrike",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["divine_storm"] = {
        ["name"] = "Divine Storm",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "divine_storm",
        ["spellId"] = 407778,
        ["spellIcon"] = "ability_paladin_divinestorm",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["divine_steed"] = {
        ["name"] = "Divine Steed",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "divine_steed",
        ["spellId"] = 461607,
        ["spellIcon"] = "spell_holy_crusaderaura",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["hand_of_sacrifice"] = {
        ["name"] = "Hand of Sacrifice",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "hand_of_sacrifice",
        ["spellId"] = 462853,
        ["spellIcon"] = "spell_holy_sealofsacrifice",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["divine_light"] = {
        ["name"] = "Divine Light",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "divine_light",
        ["spellId"] = 409925,
        ["spellIcon"] = "spell_holy_surgeoflight",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["avenging_wrath"] = {
        ["name"] = "Avenging Wrath",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "avenging_wrath",
        ["spellId"] = 407788,
        ["spellIcon"] = "spell_holy_avenginewrath",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      }
    },
    ["druid"] = {
      ["dire_bear_form"] = {
        ["name"] = "Dire Bear Form",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "dire_bear_form",
        ["spellId"] = 9634,
        ["spellIcon"] = "ability_racial_bearform",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["cat_form"] = {
        ["name"] = "Cat Form",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "cat_form",
        ["spellId"] = 768,
        ["spellIcon"] = "ability_druid_catform",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["travel_form"] = {
        ["name"] = "Travel Form",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "travel_form",
        ["spellId"] = 783,
        ["spellIcon"] = "ability_druid_travelform",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["aquatic_form"] = {
        ["name"] = "Aquatic Form",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "aquatic_form",
        ["spellId"] = 1066,
        ["spellIcon"] = "ability_druid_aquaticform",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["moonkin_form"] = {
        ["name"] = "Moonkin Form",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "moonkin_form",
        ["spellId"] = 24858,
        ["spellIcon"] = "spell_nature_forceofnature",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["barkskin"] = {
        ["name"] = "Barkskin",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "natures_swiftness",
        ["spellId"] = 17116,
        ["spellIcon"] = "spell_nature_ravenform",
        ["hasFade"] = true,
        ["links"] = {
          16188
        },
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["faerie_fire"] = {
        ["name"] = "Faerie Fire",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
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
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "faerie_fire",
        ["spellId"] = 17392, -- rank 4
        ["spellIcon"] = "spell_nature_faeriefire",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["skull_bash"] = {
        ["name"] = "Skull Bash",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "skull_bash",
        ["spellId"] = 410176,
        ["spellIcon"] = "inv_misc_bone_taurenskull_01",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["savage_roar"] = {
        ["name"] = "Savage Roar",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "savage_roar",
        ["spellId"] = 407988,
        ["spellIcon"] = "ability_druid_skinteeth",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["lacerate"] = {
        ["name"] = "Lacerate",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "lacerate",
        ["spellId"] = 414644,
        ["spellIcon"] = "ability_druid_lacerate",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["wild_growth"] = {
        ["name"] = "Wild Growth",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "wild_growth",
        ["spellId"] = 408120,
        ["spellIcon"] = "ability_druid_flourish",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["mangle"] = {
        ["name"] = "Mangle",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "mangle",
        ["spellId"] = 407995,
        ["spellIcon"] = "ability_druid_mangle2",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["berserk"] = {
        ["name"] = "Berserk",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "berserk",
        ["spellId"] = 417141,
        ["spellIcon"] = "ability_druid_berserk",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["survival_instincts"] = {
        ["name"] = "Survival Instincts",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "survival_instincts",
        ["spellId"] = 408024,
        ["spellIcon"] = "ability_mount_whitedirewolf",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["tree_of_life"] = {
        ["name"] = "Tree of Life",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "tree_of_life",
        ["spellId"] = 439733,
        ["spellIcon"] = "ability_druid_treeoflife",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["fury_of_stormrage"] = {
        ["name"] = "Fury of Stormrage",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "fury_of_stormrage",
        ["spellId"] = 414799,
        ["spellIcon"] = "inv_staff_90",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["eclipse_solar"] = {
        ["name"] = "Eclipse: Solar",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "eclipse_solar",
        ["spellId"] = 408250,
        ["spellIcon"] = "ability_druid_eclipseorange",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["eclipse_lunar"] = {
        ["name"] = "Eclipse: Lunar",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "eclipse_lunar",
        ["spellId"] = 441260,
        ["spellIcon"] = "ability_druid_eclipse",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      }
    },
    ["shaman"] = {
      ["elemental_mastery"] = {
        ["name"] = "Elemental Mastery",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "elemental_mastery",
        ["spellId"] = 16166,
        ["spellIcon"] = "spell_nature_wispheal",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["natures_swiftness"] = {
        ["name"] = "Nature's Swiftness",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "natures_swiftness",
        ["spellId"] = 16188,
        ["spellIcon"] = "spell_nature_ravenform",
        ["hasFade"] = true,
        ["links"] = {
          17116
        },
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["tremor_totem"] = {
        ["name"] = "Tremor Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "tremor_totem",
        ["spellId"] = 8143,
        ["spellIcon"] = "spell_nature_tremortotem",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["poison_cleansing_totem"] = {
        ["name"] = "Poison Cleansing Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "poison_cleansing_totem",
        ["spellId"] = 8166,
        ["spellIcon"] = "spell_nature_poisoncleansingtotem",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["grounding_totem"] = {
        ["name"] = "Grounding Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "grounding_totem",
        ["spellId"] = 8177,
        ["spellIcon"] = "spell_nature_groundingtotem",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["fire_resistance_totem"] = {
        ["name"] = "Fire Resistance Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "fire_resistance_totem",
        ["spellId"] = 10538, -- rank 3
        ["spellIcon"] = "spell_fireresistancetotem_01",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["frost_resistance_totem"] = {
        ["name"] = "Frost Resistance Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "frost_resistance_totem",
        ["spellId"] = 10479, -- rank 3
        ["spellIcon"] = "spell_frostresistancetotem_01",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["nature_resistance_totem"] = {
        ["name"] = "Nature Resistance Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "nature_resistance_totem",
        ["spellId"] = 10601, -- rank 3
        ["spellIcon"] = "spell_nature_natureresistancetotem",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["flametongue_totem"] = {
        ["name"] = "Flametongue Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "flametongue_totem",
        ["spellId"] = 16387, -- rank 4
        ["spellIcon"] = "spell_nature_guardianward",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["grace_of_air_totem"] = {
        ["name"] = "Grace of Air Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "grace_of_air_totem",
        ["spellId"] = 25359, -- rank 3
        ["spellIcon"] = "spell_nature_invisibilitytotem",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["stoneskin_totem"] = {
        ["name"] = "Stoneskin Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "stoneskin_totem",
        ["spellId"] = 10408, -- rank 6
        ["spellIcon"] = "spell_nature_stoneskintotem",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["strength_of_earth_totem"] = {
        ["name"] = "Strength of Earth Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "strength_of_earth_totem",
        ["spellId"] = 25361, -- rank 5
        ["spellIcon"] = "spell_nature_earthbindtotem",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["windfury_totem"] = {
        ["name"] = "Windfury Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "windfury_totem",
        ["spellId"] = 10610, -- rank 3
        ["spellIcon"] = "spell_nature_windfury",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["windwall_totem"] = {
        ["name"] = "Windwall Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "windwall_totem",
        ["spellId"] = 15112, -- rank 3
        ["spellIcon"] = "spell_nature_earthbind",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["earthbind_totem"] = {
        ["name"] = "Earthbind Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "earthbind_totem",
        ["spellId"] = 2484,
        ["spellIcon"] = "spell_nature_strengthofearthtotem02",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["fire_nova_totem"] = {
        ["name"] = "Fire Nova Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "fire_nova_totem",
        ["spellId"] = 11315, -- rank 5
        ["spellIcon"] = "spell_fire_sealoffire",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["magma_totem"] = {
        ["name"] = "Magma Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "magma_totem",
        ["spellId"] = 10587, -- rank 4
        ["spellIcon"] = "spell_fire_selfdestruct",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["searing_totem"] = {
        ["name"] = "Searing Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "searing_totem",
        ["spellId"] = 10438, -- rank 6
        ["spellIcon"] = "spell_fire_searingtotem",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["stoneclaw_totem"] = {
        ["name"] = "Stoneclaw Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "stoneclaw_totem",
        ["spellId"] = 10428, -- rank 6
        ["spellIcon"] = "spell_nature_stoneclawtotem",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["healing_stream_totem"] = {
        ["name"] = "Healing Stream Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "healing_stream_totem",
        ["spellId"] = 10463, -- rank 5
        ["spellIcon"] = "inv_spear_04",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["disease_cleansing_totem"] = {
        ["name"] = "Disease Cleansing Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "disease_cleansing_totem",
        ["spellId"] = 8170,
        ["spellIcon"] = "spell_nature_diseasecleansingtotem",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["mana_spring_totem"] = {
        ["name"] = "Mana Spring Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "mana_spring_totem",
        ["spellId"] = 10497, -- rank 4
        ["spellIcon"] = "spell_nature_manaregentotem",
        ["active"] = true,
        ["hasFade"] = false,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["mana_tide_totem"] = {
        ["name"] = "Mana Tide Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "mana_tide_totem",
        ["spellId"] = 17359, -- rank 3
        ["spellIcon"] = "spell_frost_summonwaterelemental",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["tranquil_air_totem"] = {
        ["name"] = "Tranquil Air Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "tranquil_air_totem",
        ["spellId"] = 25908,
        ["spellIcon"] = "spell_nature_brilliance",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["healing_rain"] = {
        ["name"] = "Healing Rain",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "healing_rain",
        ["spellId"] = 415236,
        ["spellIcon"] = "spell_nature_tranquility",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["ancestral_guidance"] = {
        ["name"] = "Ancestral Guidance",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "ancestral_guidance",
        ["spellId"] = 409324,
        ["spellIcon"] = "ability_druid_lunarguidance",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["earth_shield"] = {
        ["name"] = "Earth Shield",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "earth_shield",
        ["spellId"] = 408514,
        ["spellIcon"] = "spell_nature_skinofearth",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["water_shield"] = {
        ["name"] = "Water Shield",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "water_shield",
        ["spellId"] = 408510,
        ["spellIcon"] = "ability_shaman_watershield",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["decoy_totem"] = {
        ["name"] = "Decoy Totem",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "decoy_totem",
        ["spellId"] = 425874,
        ["spellIcon"] = "inv_misc_toy_04",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["totemic_projection"] = {
        ["name"] = "Totemic Projection",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "totemic_projection",
        ["spellId"] = 437009,
        ["spellIcon"] = "spell_shaman_totemrecall",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["maelstrom_weapon"] = {
        ["name"] = "Maelstrom Weapon",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "maelstrom_weapon",
        ["spellId"] = 408498,
        ["spellIcon"] = "spell_shaman_maelstromweapon",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["tidal_waves"] = {
        ["name"] = "Tidal Waves",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "tidal_waves",
        ["spellId"] = 432042,
        ["spellIcon"] = "spell_shaman_tidalwaves",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["riptide"] = {
        ["name"] = "Riptide",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "riptide",
        ["spellId"] = 409954,
        ["spellIcon"] = "spell_nature_riptide",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["power_surge"] = {
        ["name"] = "Power Surge",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "power_surge",
        ["spellId"] = 415100,
        ["spellIcon"] = "inv_misc_orb_05",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["feral_spirit"] = {
        ["name"] = "Feral Spirit",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "feral_spirit",
        ["spellId"] = 440580,
        ["spellIcon"] = "spell_shaman_feralspirit",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      }
    },
    ["racials"] = {
      ["perception"] = {
        ["name"] = "Perception",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "perception",
        ["spellId"] = 20600,
        ["spellIcon"] = "spell_nature_sleep",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["will_of_the_forsaken"] = {
        ["name"] = "Will of the Forsaken",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "will_of_the_forsaken",
        ["spellId"] = 7744,
        ["spellIcon"] = "spell_shadow_raisedead",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["stoneform"] = {
        ["name"] = "Stoneform",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "stoneform",
        ["spellId"] = 20594,
        ["spellIcon"] = "spell_shadow_unholystrength",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["escape_artist"] = {
        ["name"] = "Escape Artist",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "escape_artist",
        ["spellId"] = 20589,
        ["spellIcon"] = "ability_rogue_trip",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["war_stomp"] = {
        ["name"] = "War Stomp",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "war_stomp",
        ["spellId"] = 20549,
        ["spellIcon"] = "ability_warstomp",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["berserking"] = {
        ["name"] = "Berserking",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "berserking",
        ["spellId"] = 26296, -- depending on mana, rage, energy
        ["spellIcon"] = "racial_troll_berserk",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["shadowmeld"] = {
        ["name"] = "Shadowmeld",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "shadowmeld",
        ["spellId"] = 20580,
        ["spellIcon"] = "ability_ambush",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      --[[
        This spell is very special and does not work like a traditional buff.
        Instead a serverside script is doing all the work. Because of this only
        SPELL_CAST_SUCCESS can be tracked
      ]]--
      ["blood_fury"] = {
        ["name"] = "Blood Fury",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "blood_fury",
        ["spellId"] = 20572,
        ["spellIcon"] = "racial_orc_berserkerstrength",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      }
    },
    ["items"] = {
      ["ephemeral_power"] = {
        ["name"] = "Ephemeral Power",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "ephemeral_power",
        ["itemId"] = 18820,
        ["spellId"] = 23271,
        ["spellIcon"] = "inv_misc_stonetablet_11",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["fire_reflector"] = {
        ["name"] = "Fire Reflector",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "fire_reflector",
        ["itemId"] = 18638,
        ["spellId"] = 23097,
        ["spellIcon"] = "inv_misc_enggizmos_04",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["frost_reflector"] = {
        ["name"] = "Frost Reflector",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "frost_reflector",
        ["itemId"] = 18634,
        ["spellId"] = 23131,
        ["spellIcon"] = "inv_misc_enggizmos_02",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["shadow_reflector"] = {
        ["name"] = "Shadow Reflector",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "shadow_reflector",
        ["itemId"] = 18639,
        ["spellId"] = 23132,
        ["spellIcon"] = "inv_misc_enggizmos_16",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["flee"] = {
        ["name"] = "Skull of Impending Doom",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "flee",
        ["itemId"] = 4984,
        ["spellId"] = 5024,
        ["spellIcon"] = "inv_misc_bone_elfskull_01",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["immune_root"] = {
        ["name"] = "Spider Belt",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "immune_root",
        ["itemId"] = 4328,
        ["spellId"] = 9774,
        ["spellIcon"] = "inv_belt_25",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["reckless_charge"] = {
        ["name"] = "Goblin Rocket Helmet",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "rocket_helmet",
        ["itemId"] = 10588,
        ["spellId"] = 22641,
        ["spellIcon"] = "inv_helmet_49",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["net_o_matic"] = {
        ["name"] = "Net-o-Matic",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "net_o_matic",
        ["itemId"] = 10720,
        ["spellId"] = 13120,
        ["spellIcon"] = "ability_ensnare",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["tidal_charm"] = {
        ["name"] = "Tidal Charm",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "tidal_charm",
        ["itemId"] = 1404,
        ["spellId"] = 835,
        ["spellIcon"] = "inv_misc_rune_01",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["gnomish_mind_control_cap"] = {
        ["name"] = "Gnomish Mind Control Cap",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "mind_control_cap",
        ["itemId"] = 10726,
        ["spellId"] = 13180,
        ["spellIcon"] = "inv_helmet_49",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["gnomish_rocket_boots"] = {
        ["name"] = "Gnomish Rocket Boots",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "gnomish_rocket_boots",
        ["itemId"] = 10724,
        ["spellId"] = 13141,
        ["spellIcon"] = "inv_boots_02",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["goblin_rocket_boots"] = {
        ["name"] = "Goblin Rocket Boots",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "goblin_rocket_boots",
        ["itemId"] = 7189,
        ["spellId"] = 8892,
        ["spellIcon"] = "inv_gizmo_rocketboot_01",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["speed"] = {
        ["name"] = "Speed",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "nifty_stopwatch",
        ["itemId"] = 2820,
        ["spellId"] = 14530,
        ["spellIcon"] = "inv_misc_pocketwatch_01",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["mithril_mechanical_dragonling"] = {
        ["name"] = "Mithril Mechanical Dragonling",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "mithril_dragonling",
        ["itemId"] = 10576,
        ["spellId"] = 23075,
        ["spellIcon"] = "inv_misc_head_dragon_01",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["immune_root_snare_stun"] = {
        ["name"] = "Insignia Warrior/Hunter/Shaman",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "insignia",
        ["itemId"] = (function()
          if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
            return 18834 -- horde warrior
          else
            return 18854 -- alliance warrior
          end
        end)(),
        ["spellId"] = 5579,
        ["spellIcon"] = (function()
          if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
            return "inv_jewelry_trinketpvp_02" -- horde
          else
            return "inv_jewelry_trinketpvp_01" -- alliance
          end
        end)(),
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["immune_charm_fear_polymorph"] = {
        ["name"] = "Insignia Warlock/Rogue",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "insignia",
        ["itemId"] = (function()
          if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
            return 18852 -- horde warlock
          else
            return 18858 -- alliance warlock
          end
        end)(),
        ["spellId"] = 23273,
        ["spellIcon"] = (function()
          if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
            return "inv_jewelry_trinketpvp_02" -- horde
          else
            return "inv_jewelry_trinketpvp_01" -- alliance
          end
        end)(),
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["immune_fear_polymorph_snare"] = {
        ["name"] = "Insignia Mage",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "insignia",
        ["itemId"] = (function()
          if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
            return 18850 -- horde mage
          else
            return 18859 -- alliance mage
          end
        end)(),
        ["spellId"] = 23274,
        ["spellIcon"] = (function()
          if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
            return "inv_jewelry_trinketpvp_02" -- horde
          else
            return "inv_jewelry_trinketpvp_01" -- alliance
          end
        end)(),
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["immune_fear_polymorph_stun"] = {
        ["name"] = "Insignia Priest/Paladin",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "insignia",
        ["itemId"] = (function()
          if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
            return 18851 -- horde priest
          else
            return 18862 -- alliance priest
          end
        end)(),
        ["spellId"] = 23276,
        ["spellIcon"] = (function()
          if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
            return "inv_jewelry_trinketpvp_02" -- horde
          else
            return "inv_jewelry_trinketpvp_01" -- alliance
          end
        end)(),
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["immune_charm_fear_stun"] = {
        ["name"] = "Insignia Druid",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "insignia",
        ["itemId"] = (function()
          if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
            return 18853 -- horde druid
          else
            return 18863 -- alliance druid
          end
        end)(),
        ["spellId"] = 23277,
        ["spellIcon"] = (function()
          if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
            return "inv_jewelry_trinketpvp_02" -- horde
          else
            return "inv_jewelry_trinketpvp_01" -- alliance
          end
        end)(),
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["pvp_trinket"] = {
        ["name"] = (function()
          if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
            return "Greater Insignia of the Horde"
          else
            return "Greater Insignia of the Alliance"
          end
        end)(),
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "insignia",
        ["itemId"] = (function()
          if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
            return 216939 -- horde
          else
            return 216938 -- alliance
          end
        end)(),
        ["spellId"] = 438273,
        ["spellIcon"] = (function()
          if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
            return "inv_jewelry_trinketpvp_02" -- horde
          else
            return "inv_jewelry_trinketpvp_01" -- alliance
          end
        end)(),
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["aura_of_protection"] = {
        ["name"] = "Arena Grand Master",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "arena_grand_master",
        ["itemId"] = 19024,
        ["spellId"] = 23506,
        ["spellIcon"] = "inv_misc_armorkit_04",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["poison"] = {
        ["name"] = "Smolderweb's Eye",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "smolderwebs_poison",
        ["itemId"] = 228576,
        ["spellId"] = 17330,
        ["spellIcon"] = "inv_misc_gem_pearl_01",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["void_madness"] = {
        ["name"] = "Void-Touched Leather Gauntlets/Gloves",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "void_madness",
        ["itemId"] = 211502, -- or 211423 can't differentiate between the two
        ["spellId"] = 429868, -- or 429867 can't differentiate between the two
        ["spellIcon"] = "inv_gauntlets_24",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["planar_shift"] = {
        ["name"] = "Extraplanar Spidersilk Boots",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "planar_shift",
        ["itemId"] = 210795,
        ["spellId"] = 428489,
        ["spellIcon"] = "inv_boots_05",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["charged_inspiration"] = {
        ["name"] = "Gneuro-Linked Arcano-Filament Monocle",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "charged_inspiration",
        ["itemId"] = 215111,
        ["spellId"] = 437327,
        ["spellIcon"] = "inv_misc_enggizmos_27",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["gneuro_logical_shock"] = {
        ["name"] = "Glowing Gneuro-Linked Cowl",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "gneuro_logical_shock",
        ["itemId"] = 215166,
        ["spellId"] = 437349,
        ["spellIcon"] = "inv_helmet_15",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["intense_concentration"] = {
        ["name"] = "Tempered Interference-Negating Helmet",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "intense_concentration",
        ["itemId"] = 215161,
        ["spellId"] = 437377,
        ["spellIcon"] = "inv_helmet_49",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["gneuromantic_meditation"] = {
        ["name"] = "Gneuro-Conductive Channeler's Hood",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "gneuromantic_meditation",
        ["itemId"] = 215381,
        ["spellId"] = 437357,
        ["spellIcon"] = "inv_helmet_42",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["reinforced_willpower"] = {
        ["name"] = "Reflective Truesilver Braincage",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "reinforced_willpower",
        ["itemId"] = 215167,
        ["spellId"] = 437382,
        ["spellIcon"] = "inv_helmet_49",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["radical_rad_resistance"] = {
        ["name"] = "Reflective Truesilver Braincage",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "radical_rad_resistance",
        ["itemId"] = 215382,
        ["spellId"] = 437340,
        ["spellIcon"] = "inv_helmet_41",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["hyperconductive_shock"] = {
        ["name"] = "Glowing Hyperconductive Scale Coif",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "hyperconductive_shock",
        ["itemId"] = 215114,
        ["spellId"] = 437362,
        ["spellIcon"] = "inv_helmet_43",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["coin_flip"] = {
        ["name"] = "Hyperconductive Goldwrap",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "coin_flip",
        ["itemId"] = 215115,
        ["spellId"] = 437368, -- trigger spell 437699 or 437698
        ["spellIcon"] = "inv_belt_32",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["haste"] = {
        ["name"] = "Catnip",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "haste",
        ["itemId"] = 213407,
        ["spellId"] = 13494,
        ["spellIcon"] = "inv_misc_plant_01",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["domesticated_attack_chicken"] = {
        ["name"] = "Domesticated Attack Chicken",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "domesticated_attack_chicken",
        ["itemId"] = 215461,
        ["spellId"] = 436069,
        ["spellIcon"] = "spell_magic_polymorphchicken",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["gniodine_dispel"] = {
        ["name"] = "Gniodine Pill Bottle",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "gniodine_dispel",
        ["itemId"] = 213349,
        ["spellId"] = 435895,
        ["spellIcon"] = "inv_valentinecolognebottle",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["hardened_to_the_core"] = {
        ["name"] = "Wirdal's Hardened Core",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "hardened_to_the_core",
        ["itemId"] = 213350,
        ["spellId"] = 435359,
        ["spellIcon"] = "inv_gizmo_khoriumpowercore",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["extinguish_fire"] = {
        ["name"] = "Miniaturized Fire Extinguisher",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "extinguish_fire",
        ["itemId"] = 228084,
        ["spellId"] = 461231,
        ["spellIcon"] = "inv_misc_enggizmos_essencedistiller",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["moonstalker_fury"] = {
        ["name"] = "Woodcarved Moonstalker",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "moonstalker_fury",
        ["itemId"] = 228089,
        ["spellId"] = 461235,
        ["spellIcon"] = "inv_jewelcrafting_blackpearlpanther",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["guardian_of_nature"] = {
        ["name"] = "Germinating Poisonseed",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "guardian_of_nature",
        ["itemId"] = 228081,
        ["spellId"] = 461227,
        ["spellIcon"] = "inv_misc_herb_nightmareseed",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["demon_tainted_blood"] = {
        ["name"] = "Accursed Chalice",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "demon_tainted_blood",
        ["itemId"] = 228078,
        ["spellId"] = 461224,
        ["spellIcon"] = "inv_offhand_pvealliance_d_01",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["marlis_brain_infestors"] = {
        ["name"] = "Mar'li's Eye",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "marlis_eye",
        ["itemId"] = 230920,
        ["spellId"] = 467720,
        ["spellIcon"] = "inv_zulgurubtrinket",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["shadowflame_fury"] = {
        ["name"] = "Shadowflame Sword",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
        ["soundFileName"] = "shadowflame_fury",
        ["itemId"] = 228143,
        ["spellId"] = 461253,
        ["spellIcon"] = "inv_sword_35",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      }
    },
    ["misc"] = {
      ["restore_energy"] = {
        ["name"] = "Thistle Tea",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "thistle_tea",
        ["itemId"] = 7676,
        ["spellId"] = 9512,
        ["spellIcon"] = "inv_drink_milk_05",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["mighty_rage_potion"] = {
        ["name"] = "Mighty Rage Potion",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "mighty_rage_potion",
        ["itemId"] = 13442,
        ["spellId"] = 17528,
        ["spellIcon"] = "inv_potion_41",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["first_aid"] = {
        ["name"] = "First Aid",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "first_aid",
        ["itemId"] = 14530, -- depending on what bandage was used
        ["spellId"] = 18610, -- rank 10
        ["spellIcon"] = "inv_misc_bandage_12",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["shadow_protection"] = {
        ["name"] = "Greater Shadow Protection Potion",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "shadow_protection",
        ["itemId"] = 13459,
        ["spellId"] = 17548,
        ["spellIcon"] = "inv_potion_23",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["frost_protection"] = {
        ["name"] = "Greater Frost Protection Potion",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "frost_protection",
        ["itemId"] = 13456,
        ["spellId"] = 17544,
        ["spellIcon"] = "inv_potion_20",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["fire_protection"] = {
        ["name"] = "Greater Fire Protection Potion",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "fire_protection",
        ["itemId"] = 13457,
        ["spellId"] = 17543,
        ["spellIcon"] = "inv_potion_24",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["nature_protection"] = {
        ["name"] = "Greater Nature Protection Potion",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "nature_protection",
        ["itemId"] = 13458,
        ["spellId"] = 17546,
        ["spellIcon"] = "inv_potion_22",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["arcane_protection"] = {
        ["name"] = "Greater Arcane Protection Potion",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "arcane_protection",
        ["itemId"] = 13461,
        ["spellId"] = 17549,
        ["spellIcon"] = "inv_potion_83",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["restoration"] = {
        ["name"] = "Restorative Potion",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "restorative_potion",
        ["itemId"] = 9030,
        ["spellId"] = 11359,
        ["spellIcon"] = "inv_potion_01",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["living_free_action"] = {
        ["name"] = "Living Free Action",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "living_free_action_potion",
        ["itemId"] = 20008,
        ["spellId"] = 24364,
        ["spellIcon"] = "inv_potion_07",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["free_action"] = {
        ["name"] = "Free Action Potion",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "free_action_potion",
        ["itemId"] = 5634,
        ["spellId"] = 6615,
        ["spellIcon"] = "inv_potion_04",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["invulnerability"] = {
        ["name"] = "Limited Invulnerability Potion",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "invulnerability_potion",
        ["itemId"] = 3387,
        ["spellId"] = 3169,
        ["spellIcon"] = "inv_potion_62",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["invisibility"] = {
        ["name"] = "Invisibility Potion",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "invisibility_potion",
        ["itemId"] = 9172,
        ["spellId"] = 11392,
        ["spellIcon"] = "inv_potion_25",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["lesser_invisibility"] = {
        ["name"] = "Lesser Invisibility Potion",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "lesser_invisibility_potion",
        ["itemId"] = 3823,
        ["spellId"] = 3680,
        ["spellIcon"] = "inv_potion_18",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      },
      ["stealth_detection"] = {
        ["name"] = "Catseye Elixir",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "catseye_elixir",
        ["itemId"] = 10592,
        ["spellId"] = 12608,
        ["spellIcon"] = "inv_potion_36",
        ["hasFade"] = true,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_AURA_APPLIED",
          "SPELL_AURA_REMOVED"
        }
      },
      ["cure_poison"] = {
        ["name"] = "Elixir of Poison Resistance",
        ["type"] = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
        ["soundFileName"] = "cure_poison",
        ["itemId"] = 3386,
        ["spellId"] = 26677,
        ["spellIcon"] = "inv_potion_12",
        ["hasFade"] = false,
        ["active"] = true,
        ["trackedEvents"] = {
          "SPELL_CAST_SUCCESS"
        }
      }
    }
  }
end


--[[
  Retrieve the spellMap filtered to the version of WoW running. There are base spells present
  in all versions marked with RGPVPW_CONSTANTS.SPELL_TYPE_BASE. Spells that are only available
  in Season of Discovery are marked with RGPVPW_CONSTANTS.SPELL_TYPE_SOD

  @return {table}
    The filtered spellMap
]]--
function me.GetFilteredSpellMap()
  local filteredSpellMap = {}

  for category, _ in pairs(spellMap) do
    filteredSpellMap[category] = {}

    for spellName, spellData in pairs(spellMap[category]) do
      if spellData.type == RGPVPW_CONSTANTS.SPELL_TYPE_SOD and mod.season.IsSodActive() or RGPVPW_ENVIRONMENT.TEST then
        filteredSpellMap[category][spellName] = spellData
      end

      if spellData.type == RGPVPW_CONSTANTS.SPELL_TYPE_BASE then
        filteredSpellMap[category][spellName] = spellData
      end
    end
  end

  return filteredSpellMap
end

--[[
  Retrieve a spell from the spellMap by name and tracked event. Certain spellnames might show up in different events
  that we don't want to track. Each spell in the spellmap defines when it should be considered a valid target

  @param {string} name
  @param {string} event

  @return ({string} {table}) | {nil}
]]--
function me.SearchByName(name, event)
  if not name then return nil end

  local spellName = mod.common.NormalizeSpellname(name)

  mod.logger.LogDebug(me.tag, string.format("Searching for %s in spellMap", name))

  local filteredSpellMap = me.GetFilteredSpellMap()

  for category, _ in pairs(filteredSpellMap) do
    for spellEntry, spellData in pairs(filteredSpellMap[category]) do
      if spellEntry == spellName then
        mod.logger.LogDebug(me.tag, string.format("Found spell - %s - in spellMap", spellName))
        -- check if the passed event is a valid tracked one for the found spell
        for _, trackedEvent in pairs(spellData.trackedEvents) do
          if trackedEvent == event then
            mod.logger.LogDebug(me.tag, string.format("Found matching tracked event %s for spell %s", event, spellName))

            local clonedSpell = mod.common.Clone(filteredSpellMap[category][spellEntry])
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
  local filteredSpellMap = me.GetFilteredSpellMap()

  for normalizedSpellName, spell in pairs(filteredSpellMap[category]) do
    local clonedSpell = mod.common.Clone(spell)
    clonedSpell.normalizedSpellName = normalizedSpellName
    table.insert(spellList, clonedSpell)
  end

  return spellList
end

--[[
  NEVER returning the original list we dont want to give anyone the option to modify it

  @return {table}
   A clone of the spellMap
]]--
function me.GetSpellConfiguration()
  return mod.common.Clone(me.GetFilteredSpellMap())
end

--[[
  Get all spellLinks for a certain spell and category

  @param {string} category
  @param {string} spellName

  @return {boolean, table}
    boolean
      true - if the spell has a link to at least one other spell
      false - if the spell has no link to other spells
    table
      table - The data of the spell that was matching category and spellName
      nil - If no spell was found
]]--
function me.GetSpellLinks(category, spellName)
  local filteredSpellMap = me.GetFilteredSpellMap()

  for categoryName, _ in pairs(filteredSpellMap) do
    for _, spellData in pairs(filteredSpellMap[category]) do
      if category == categoryName and spellName == spellData.name and spellData.links ~= nil then
        return true, spellData
      end
    end
  end

  return false, nil
end

--[[
  Search for a spell in the spellMap by its id

  @param {number} spellId

  @return {table | nil}
    table - if the spell was found
    nil - if no spell was found
]]--
function me.GetSpellById(spellId)
  local filteredSpellMap = me.GetFilteredSpellMap()

  for category, _ in pairs(filteredSpellMap) do
    for _, spellData in pairs(filteredSpellMap[category]) do
      if spellData.spellId == spellId then
        spellData.category = category
        return spellData
      end
    end
  end

  return nil
end

--[[
  Get the data of all linked spells

  @param {table} spellData

  @return {table}
    A table with all spells that where linked to the passed spell
]]--
function me.GetLinkedSpells(spellData)
  local linkedSpellsData = {}

  for i = 1, #spellData.links do
    local foundSpell = me.GetSpellById(spellData.links[i])
    table.insert(linkedSpellsData, foundSpell)
  end

  return linkedSpellsData
end
