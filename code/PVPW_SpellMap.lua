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
      ["canCrit"] = false,
        {boolean} optional field, default false if field is missing
      ["links"] = { 0000 },
        {table} optional field, link to other spells by their spellId. Spells that are linked together
        share their configuration. The can't have a different configuration from eachother
      ["active"] = false,
        -- {boolean} Whether the spell is active or inactive
      ["trackedEvents"] = {
        "CHAT_MSG_SPELL_AURA_GONE_OTHER",
        "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE",
        "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF",
        "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS".
        "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
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
    ["warrior"] = {

    },
    ["priest"] = {
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
        -- TODO spell verified
      },
      ["silence"] = {
        ["name"] = "Silence",
        ["soundFileName"] = "silence",
        ["spellId"] = 15487,
        ["spellIcon"] = "spell_shadow_impphaseshift",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["power_infusion"] = {
        ["name"] = "Power Infusion",
        ["soundFileName"] = "power_infusion",
        ["spellId"] = 10060,
        ["spellIcon"] = "spell_holy_powerinfusion",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["inner_fire"] = {
        ["name"] = "Inner Fire",
        ["soundFileName"] = "inner_fire",
        ["spellId"] = 10952, -- rank 6
        ["spellIcon"] = "spell_holy_innerfire",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["vampiric_embrace"] = {
        ["name"] = "Vampiric Embrace",
        ["soundFileName"] = "vampiric_embrace",
        ["spellId"] = 15286,
        ["spellIcon"] = "spell_shadow_unsummonbuilding",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["desperate_prayer"] = {
        ["name"] = "Desperate Prayer",
        ["soundFileName"] = "desperate_prayer",
        ["spellId"] = 19243, -- rank 7
        ["spellIcon"] = "spell_holy_restoration",
        ["hasFade"] = false,
        ["canCrit"] = true,
        ["active"] = true
      },
      ["devouring_plague"] = {
        ["name"] = "Devouring Plague",
        ["soundFileName"] = "devouring_plague",
        ["spellId"] = 19280, -- rank 6
        ["spellIcon"] = "spell_shadow_blackplague",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE",
          "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF"
        }
      },
      ["touch_of_weakness"] = {
        ["name"] = "Touch of Weakness",
        ["soundFileName"] = "touch_of_weakness",
        ["spellId"] = 19266, -- rank 6
        ["spellIcon"] = "spell_shadow_deadofnight",
        ["hasFade"] = true,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["fear_ward"] = {
        ["name"] = "Fear Ward",
        ["soundFileName"] = "fear_ward",
        ["spellId"] = 6346,
        ["spellIcon"] = "spell_holy_excorcism",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["elunes_grace"] = {
        ["name"] = "Elune's Grace",
        ["soundFileName"] = "elunes_grace",
        ["spellId"] = 19293, -- rank 5
        ["spellIcon"] = "spell_holy_elunesgrace",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["starshards"] = {
        ["name"] = "Starshards",
        ["soundFileName"] = "starshards",
        ["spellId"] = 19305, -- rank 7
        ["spellIcon"] = "spell_arcane_starfire",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["hex_of_weakness"] = {
        ["name"] = "Hex of Weakness",
        ["soundFileName"] = "hex_of_weakness",
        ["spellId"] = 19285, -- rank 6
        ["spellIcon"] = "spell_shadow_fingerofdeath",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      }
    },
    ["rogue"] = {
      ["blind"] = {
        ["name"] = "Blind",
        ["soundFileName"] = "blind",
        ["spellId"] = 2094,
        ["spellIcon"] = "spell_shadow_mindsteal",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["kick"] = {
        ["name"] = "Kick",
        ["soundFileName"] = "kick",
        ["spellId"] = 1769,
        ["spellIcon"] = "ability_kick",
        ["hasFade"] = false,
        ["canCrit"] = true,
        ["active"] = true
      },
      ["kick_silenced"] = {
        ["name"] = "Kick - Silenced",
        ["soundFileName"] = "kick",
        ["spellId"] = 13867,
        ["spellIcon"] = "ability_kick",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["sprint"] = {
        ["name"] = "Sprint",
        ["soundFileName"] = "sprint",
        ["spellId"] = 11305, -- rank 3
        ["spellIcon"] = "ability_rogue_sprint",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["evasion"] = {
        ["name"] = "Evasion",
        ["soundFileName"] = "evasion",
        ["spellId"] = 5277,
        ["spellIcon"] = "spell_shadow_shadowward",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["kidney_shot"] = {
        ["name"] = "Kidney Shot",
        ["soundFileName"] = "kidney_shot",
        ["spellId"] = 8643,
        ["spellIcon"] = "ability_rogue_kidneyshot",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["cheap_shot"] = {
        ["name"] = "Cheap Shot",
        ["soundFileName"] = "cheap_shot",
        ["spellId"] = 1833,
        ["spellIcon"] = "ability_cheapshot",
        ["hasFade"] = false,
        ["active"] = true,
        ["ignoreEvents"] = {
          "CHAT_MSG_SPELL_AURA_GONE_OTHER",
          "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"
        }
      },
      ["adrenaline_rush"] = {
        ["name"] = "Adrenaline Rush",
        ["soundFileName"] = "adrenaline_rush",
        ["spellId"] = 13750,
        ["spellIcon"] = "spell_shadow_shadowworddominate",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["blade_flurry"] = {
        ["name"] = "Blade Flurry",
        ["soundFileName"] = "blade_flurry",
        ["spellId"] = 13877,
        ["spellIcon"] = "ability_warrior_punishingblow",
        ["hasFade"] = true,
        ["active"] = true
      },
      ["cold_blood"] = {
        ["name"] = "Cold Blood",
        ["soundFileName"] = "cold_blood",
        ["spellId"] = 14177,
        ["spellIcon"] = "spell_ice_lament",
        ["hasFade"] = true,
        ["active"] = true
      }
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
  if not name then return nil end

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

  return mod.common.Clone(spellMap[category])
end
