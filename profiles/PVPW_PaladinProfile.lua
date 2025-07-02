--[[
  MIT License

  Copyright (c) 2025 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--

local mod = rgpvpw
local me = {}
mod.paladinProfile = me

me.tag = "PaladinProfile"

local profileHelper = mod.profileHelper
local createSpellConfig = profileHelper.CreateSpellConfig

local COLORS = RGPVPW_CONSTANTS.TEXTURES
local SPELL_TYPES = RGPVPW_CONSTANTS.SPELL_TYPE

-- Spell profile configuration
local defaultSpellProfilePaladin = {
  ["warrior"] = {
    [1719] = createSpellConfig(true, true, true, COLORS.brown.colorValue)     -- Recklessness
  },
  ["priest"] = {
    [10890] = createSpellConfig(true, true, false, COLORS.white.colorValue),   -- Psychic Scream
    [15487] = createSpellConfig(true, true, false, COLORS.white.colorValue)    -- Silence
  },
  ["rogue"] = {
    [11305] = createSpellConfig(true, true, true, COLORS.yellow.colorValue),   -- Sprint
    [5277] = createSpellConfig(true, true, true, COLORS.yellow.colorValue),    -- Evasion
    [13750] = createSpellConfig(true, true, true, COLORS.yellow.colorValue),   -- Adrenaline Rush
    [13877] = createSpellConfig(true, true, true, COLORS.yellow.colorValue),   -- Blade Flurry
    [14177] = createSpellConfig(true, true, false, COLORS.yellow.colorValue)   -- Cold Blood
  },
  ["mage"] = {
    [11958] = createSpellConfig(true, true, true, COLORS.light_blue.colorValue),   -- Ice Block
    [12042] = createSpellConfig(true, true, true, COLORS.light_blue.colorValue),   -- Arcane Power
    [12043] = createSpellConfig(true, true, true, COLORS.light_blue.colorValue),   -- Presence of Mind
    [2139] = createSpellConfig(true, true, false, COLORS.light_blue.colorValue)    -- Counterspell
  },
  ["hunter"] = {
    [3045] = createSpellConfig(true, true, true, COLORS.green.colorValue),     -- Rapid Fire
    [14280] = createSpellConfig(true, true, false, COLORS.green.colorValue)    -- Viper Sting
  },
  ["warlock"] = {
    [18288] = createSpellConfig(true, true, false, COLORS.violet.colorValue)   -- Amplify Curse
  },
  ["paladin"] = {
    [10278] = createSpellConfig(true, true, true, COLORS.pink.colorValue),     -- Blessing of Protection
    [1044] = createSpellConfig(true, true, true, COLORS.pink.colorValue),      -- Blessing of Freedom
    [642] = createSpellConfig(true, true, true, COLORS.pink.colorValue)        -- Divine Shield
  },
  ["druid"] = {
    [22812] = createSpellConfig(true, true, true, COLORS.orange.colorValue),   -- Barkskin
    [17116] = createSpellConfig(true, true, true, COLORS.orange.colorValue)    -- Nature's Swiftness
  },
  ["shaman"] = {
    [16166] = createSpellConfig(true, true, true, COLORS.blue.colorValue),     -- Elemental Mastery
    [16188] = createSpellConfig(true, true, true, COLORS.blue.colorValue),     -- Nature's Swiftness
    [8177] = createSpellConfig(true, true, true, COLORS.blue.colorValue)       -- Grounding Totem
  },
  ["racials"] = {},
  ["items"] = {
    [9774] = createSpellConfig(true, true, false, COLORS.red.colorValue),      -- Spider Belt
    [5579] = createSpellConfig(true, true, false, COLORS.red.colorValue),      -- PvP Trinket (Warrior/Hunter/Shaman)
    [23273] = createSpellConfig(true, true, false, COLORS.red.colorValue),     -- PvP Trinket (Warlock/Rogue)
    [23274] = createSpellConfig(true, true, false, COLORS.red.colorValue),     -- PvP Trinket (Mage)
    [23276] = createSpellConfig(true, true, false, COLORS.red.colorValue)      -- PvP Trinket (Priest/Paladin)
  },
  ["misc"] = {}
}

-- Empty profile tables (could be populated later)
local defaultSpellSelfAvoidProfilePaladin = {}
local defaultSpellEnemyAvoidProfilePaladin = {}

--[[
  Returns a clone of the requested spell profile

  @param {string} spellType - The type of spell profile to retrieve

  @return {table | nil} - Cloned spell profile or nil if invalid type
]]--
function me.GetSpellProfile(spellType)
  local profiles = {
    [SPELL_TYPES.SPELL] = defaultSpellProfilePaladin,
    [SPELL_TYPES.SPELL_SELF_AVOID] = defaultSpellSelfAvoidProfilePaladin,
    [SPELL_TYPES.SPELL_ENEMY_AVOID] = defaultSpellEnemyAvoidProfilePaladin
  }

  return profileHelper.GetSpellProfile(profiles, spellType, me.tag)
end
