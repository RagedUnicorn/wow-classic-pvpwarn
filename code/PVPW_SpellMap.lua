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
