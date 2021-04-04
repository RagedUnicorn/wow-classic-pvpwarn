--[[
  MIT License

  Copyright (c) 2021 Michael Wiesendanger

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
mod.spellAvoidMap = me

me.tag = "SpellAvoidMap"

--[[

]]--
local spellAvoidMap

if (GetLocale() == "deDE") then
  spellAvoidMap = {
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
  spellAvoidMap = {
    ["mage"] = {
      ["counterspell"] = {
        ["name"] = "Counterspell",
        ["spellId"] = 2139,
        ["spellIcon"] = "spell_frost_iceshock",
        ["soundFileName"] = "silence",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = false,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["counterspell_silenced"] = {
        ["name"] = "Counterspell - Silenced",
        ["spellId"] = 2139,
        ["spellIcon"] = "spell_frost_iceshock",
        ["soundFileName"] = "silence",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = false,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["polymorph"] = {
        ["name"] = "Polymorph",
        ["spellId"] = 12826,
        ["spellIcon"] = "spell_nature_polymorph",
        ["soundFileName"] = "polymorph",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["frost_nova"] = {
        ["name"] = "Frost Nova",
        ["spellId"] = 10230, -- rank 4
        ["spellIcon"] = "spell_frost_frostnova",
        ["soundFileName"] = "frost_nova",
        ["dodge"] = false,
        ["parry"] = false,
        ["immune"] = true,
        ["miss"] = false,
        ["block"] = false,
        ["resist"] = true,
        ["self_avoid"] = true,
        ["enemy_avoid"] = true
      },
      ["cone_of_cold"] = {
       ["name"] = "Cone of Cold",
       ["spellId"] = 10161, -- rank 5
       ["spellIcon"] = "spell_frost_glacier",
       ["soundFileName"] = "cone_of_cold",
       ["dodge"] = false,
       ["parry"] = false,
       ["immune"] = true,
       ["miss"] = false,
       ["block"] = false,
       ["resist"] = true,
       ["self_avoid"] = true,
       ["enemy_avoid"] = true
     }
    }
  }
end

function me.SearchByName(name)
  if not name then return nil end -- TODO improve this make it more safe

  local spellName = mod.common.NormalizeSpellname(name)

  mod.logger.LogDebug(me.tag, string.format("Searching for %s in spellAvoidMap", spellName))

  for category, _ in pairs(spellAvoidMap) do
    for spellEntry, spellData in pairs(spellAvoidMap[category]) do
      if spellEntry == spellName then
        mod.logger.LogDebug(me.tag, string.format("Found spell - %s - in spellAvoidMap", spellName))

        local clonedSpell = mod.common.Clone(spellAvoidMap[category][spellEntry])
        clonedSpell.normalizedSpellName = spellEntry -- add normalizedSpellName that would get lost otherwise

        return category, clonedSpell
      end
    end
  end

  return nil
end
