--[[
  Test SpellAvoidMap/Base.lua for verify_sounds tool testing - base + overlay layout.
]]--

local mod = rgpvpw
local me = {}
mod.spellAvoidMapBase = me

me.tag = "TestSpellAvoidMapBase"

local spellAvoidMap = {
  ["warrior"] = {
    [1] = {
      name = "Hamstring",
      soundFileName = "hamstring",
      spellId = 1715,
      self_avoid = true,
      enemy_avoid = true
    }
  },
  ["rogue"] = {
    [1] = {
      name = "Cheap Shot",
      soundFileName = "cheap_shot",
      spellId = 1833,
      self_avoid = true
    },
    [2] = {
      name = "Blind",
      soundFileName = "blind",
      spellId = 2094,
      enemy_avoid = true
    }
  },
  ["mage"] = {
    [1] = {
      name = "Frost Nova",
      soundFileName = "frost_nova",
      spellId = 122,
      enemy_avoid = true
    }
  }
}

function me.GetMap()
  return spellAvoidMap
end
