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
mod.hunterProfile = me

me.tag = "HunterProfile"

local profileHelper = mod.profileHelper
local createSpellConfig = profileHelper.CreateSpellConfig

local SPELL_TYPES = RGPVPW_CONSTANTS.SPELL_TYPE

-- Spell profile configuration
local defaultSpellProfileHunter = {
  ["warrior"] = {
    [1719] = createSpellConfig(true, true, true, RGPVPW_COLORS.BROWN)     -- Recklessness
  },
  ["priest"] = {
    [10890] = createSpellConfig(true, true, false, RGPVPW_COLORS.WHITE)   -- Psychic Scream
  },
  ["rogue"] = {
    [11305] = createSpellConfig(true, true, true, RGPVPW_COLORS.YELLOW),   -- Sprint
    [5277] = createSpellConfig(true, true, true, RGPVPW_COLORS.YELLOW),    -- Evasion
    [13750] = createSpellConfig(true, true, true, RGPVPW_COLORS.YELLOW),   -- Adrenaline Rush
    [13877] = createSpellConfig(true, true, true, RGPVPW_COLORS.YELLOW),   -- Blade Flurry
    [14177] = createSpellConfig(true, true, false, RGPVPW_COLORS.YELLOW)   -- Cold Blood
  },
  ["mage"] = {
    [11958] = createSpellConfig(true, true, true, RGPVPW_COLORS.LIGHT_BLUE),   -- Ice Block
    [12042] = createSpellConfig(true, true, true, RGPVPW_COLORS.LIGHT_BLUE),   -- Arcane Power
    [12043] = createSpellConfig(true, true, true, RGPVPW_COLORS.LIGHT_BLUE)    -- Presence of Mind
  },
  ["hunter"] = {
    [3045] = createSpellConfig(true, true, true, RGPVPW_COLORS.GREEN),     -- Rapid Fire
    [19263] = createSpellConfig(true, true, true, RGPVPW_COLORS.GREEN)     -- Deterrence
  },
  ["warlock"] = {
    [18288] = createSpellConfig(true, true, false, RGPVPW_COLORS.VIOLET)   -- Amplify Curse
  },
  ["paladin"] = {
    [10278] = createSpellConfig(true, true, true, RGPVPW_COLORS.PINK),     -- Blessing of Protection
    [1044] = createSpellConfig(true, true, true, RGPVPW_COLORS.PINK),      -- Blessing of Freedom
    [642] = createSpellConfig(true, true, true, RGPVPW_COLORS.PINK)        -- Divine Shield
  },
  ["druid"] = {
    [22812] = createSpellConfig(true, true, true, RGPVPW_COLORS.ORANGE),   -- Barkskin
    [17329] = createSpellConfig(true, true, true, RGPVPW_COLORS.ORANGE),   -- Nature's Grasp
    [17116] = createSpellConfig(true, true, true, RGPVPW_COLORS.ORANGE)    -- Nature's Swiftness
  },
  ["shaman"] = {
    [16166] = createSpellConfig(true, true, true, RGPVPW_COLORS.BLUE),     -- Elemental Mastery
    [16188] = createSpellConfig(true, true, true, RGPVPW_COLORS.BLUE)      -- Nature's Swiftness
  },
  ["racials"] = {},
  ["items"] = {
    [5024] = createSpellConfig(true, true, true, RGPVPW_COLORS.RED),       -- Skull of Impending Doom
    [9774] = createSpellConfig(true, true, false, RGPVPW_COLORS.RED),      -- Spider Belt
    [5579] = createSpellConfig(true, true, false, RGPVPW_COLORS.RED),      -- PvP Trinket (Warrior/Hunter/Shaman)
    [23273] = createSpellConfig(true, true, false, RGPVPW_COLORS.RED),     -- PvP Trinket (Warlock/Rogue)
    [23274] = createSpellConfig(true, true, false, RGPVPW_COLORS.RED),     -- PvP Trinket (Mage)
    [23276] = createSpellConfig(true, true, false, RGPVPW_COLORS.RED)      -- PvP Trinket (Priest/Paladin)
  },
  ["misc"] = {}
}

-- Empty profile tables (could be populated later)
local defaultSpellSelfAvoidProfileHunter = {}
local defaultSpellEnemyAvoidProfileHunter = {}

--[[
  Returns a clone of the requested spell profile

  @param {string} spellType - The type of spell profile to retrieve
  @return {table | nil} - Cloned spell profile or nil if invalid type
]]--
function me.GetSpellProfile(spellType)
  local profiles = {
    [SPELL_TYPES.SPELL] = defaultSpellProfileHunter,
    [SPELL_TYPES.SPELL_SELF_AVOID] = defaultSpellSelfAvoidProfileHunter,
    [SPELL_TYPES.SPELL_ENEMY_AVOID] = defaultSpellEnemyAvoidProfileHunter
  }

  return profileHelper.GetSpellProfile(profiles, spellType, me.tag)
end
