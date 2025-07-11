--[[
  Test SpellAvoidMap for verify_sounds tool testing
]]--
local mod = {}
local me = {}
mod.spellAvoidMap = me

me.tag = "SpellAvoidMap"

-- Test categories
local categories = {
  WARRIOR = "warrior",
  ROGUE = "rogue",
  MAGE = "mage"
}

-- Initialize spell avoid maps
local spellAvoidMap = {}
for _, category in pairs(categories) do
  spellAvoidMap[category] = {}
end

-- Warrior spells
spellAvoidMap[categories.WARRIOR][1] = {
  name = "Hamstring",
  soundFileName = "hamstring",
  spellId = 1715,
  self_avoid = true,   -- Should require self_avoid/you_avoided_hamstring.mp3
  enemy_avoid = true   -- Should require enemy_avoid/enemy_avoided_hamstring.mp3
}

-- Rogue spells
spellAvoidMap[categories.ROGUE][1] = {
  name = "Cheap Shot",
  soundFileName = "cheap_shot",
  spellId = 1833,
  self_avoid = true    -- Should require self_avoid/you_avoided_cheap_shot.mp3
}

spellAvoidMap[categories.ROGUE][2] = {
  name = "Blind",
  soundFileName = "blind",
  spellId = 2094,
  enemy_avoid = true   -- Should require enemy_avoid/enemy_avoided_blind.mp3
}

-- Mage spells
spellAvoidMap[categories.MAGE][1] = {
  name = "Frost Nova",
  soundFileName = "frost_nova",
  spellId = 122,
  self_avoid = true,   -- Should require self_avoid/you_avoided_frost_nova.mp3
  enemy_avoid = true   -- Should require enemy_avoid/enemy_avoided_frost_nova.mp3
}
