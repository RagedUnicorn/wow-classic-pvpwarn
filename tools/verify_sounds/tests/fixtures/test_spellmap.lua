--[[
  Test SpellMap for verify_sounds tool testing
]]--
local mod = {}
local me = {}
mod.spellMap = me

me.tag = "SpellMap"

-- Test categories
local categories = {
  WARRIOR = "warrior",
  PRIEST = "priest",
  MAGE = "mage"
}

-- Initialize spell maps
local spellMap = {}
for _, category in pairs(categories) do
  spellMap[category] = {}
end

-- Warrior spells
spellMap[categories.WARRIOR][1] = {
  name = "Battle Shout",
  soundFileName = "battle_shout",
  spellId = 6673,
  hasFade = true  -- Should require battle_shout_down.mp3
}

spellMap[categories.WARRIOR][2] = {
  name = "Charge",
  soundFileName = "charge",
  spellId = 100
}

-- Priest spells
spellMap[categories.PRIEST][1] = {
  name = "Shadow Word: Pain",
  soundFileName = "shadow_word_pain",
  spellId = 589,
  hasFade = true  -- Should require shadow_word_pain_down.mp3
}

spellMap[categories.PRIEST][2] = {
  name = "Mind Control",
  soundFileName = "mind_control",
  spellId = 605,
  hasCast = true  -- Should require mind_control_cast.mp3
}

-- Mage spells
spellMap[categories.MAGE][1] = {
  name = "Polymorph",
  soundFileName = "polymorph",
  spellId = 118,
  hasCast = true,  -- Should require polymorph_cast.mp3
  hasFade = true   -- Should require polymorph_down.mp3
}
