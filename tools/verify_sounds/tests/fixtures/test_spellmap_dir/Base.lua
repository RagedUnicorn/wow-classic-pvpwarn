--[[
  Test SpellMap/Base.lua for verify_sounds tool testing - base + overlay layout.
]]--

local mod = rgpvpw
local me = {}
mod.spellMapBase = me

me.tag = "TestSpellMapBase"

local spellMap = {
  ["warrior"] = {
    [1] = {
      name = "Battle Shout",
      soundFileName = "battle_shout",
      spellId = 6673,
      hasFade = true
    },
    [2] = {
      name = "Charge",
      soundFileName = "charge",
      spellId = 100
    }
  },
  ["priest"] = {
    [1] = {
      name = "Shadow Word: Pain",
      soundFileName = "shadow_word_pain",
      spellId = 589,
      hasFade = true
    },
    [2] = {
      name = "Mind Control",
      soundFileName = "mind_control",
      spellId = 605,
      hasCast = true
    }
  },
  ["mage"] = {
    [1] = {
      name = "Polymorph",
      soundFileName = "polymorph",
      spellId = 118,
      hasCast = true,
      hasFade = true
    }
  }
}

function me.GetMap()
  return spellMap
end
