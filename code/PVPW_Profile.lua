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
mod.profile = me

me.tag = "Profile"

--[[
  ["type"] = {
    -- e.g. paladin, racials
    ["spellName"] = {
      -- e.g. lay_on_hands as found in SpellMap
      ["spellActive"] = false,
        -- default false
      ["soundWarningActive"] = false,
        -- default false
      ["soundFadeWarningActive"] = false,
        -- default false
      ["visualWarningActive"] = false,
        -- default false
      ["visualWarningColor"] = [number] -- e.g. blue, orange see PVPW_CONSTANTS.TEXTURES
        -- default color in PVPW_CONSTANTS.DEFAULT_COLOR
    }
  }
]]--
local defaultProfile = {}

--[[
  Default profiles consider the class from the player that uses the addon. As an
  example lets assume the player is a warrior. What are the spells a warrior absolutely
  needs to know of. Depending on the class a spells importance might greatly differ
  from very important to not interested in all.
]]--

local defaultProfileWarrior
local defaultProfilePriest
local defaultProfileRogue
local defaultProfileMage
local defaultProfileHunter
local defaultProfileWarlock
local defaultProfilePaladin
local defaultProfileDruid
local defaultProfileShaman

defaultProfileWarrior = {
  ["warrior"] = {
    ["recklessness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["shield_wall"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["last_stand"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["death_wish"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    }
  },
  ["priest"] = {
    ["power_infusion"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 8
    },
    ["inner_fire"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 8
    }
  },
  ["rogue"] = {
    ["sprint"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    },
    ["adrenaline_rush"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    },
    ["blade_flurry"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    }
  },
  ["mage"] = {
    ["ice_block"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["arcane_power"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["presence_of_mind"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_cow"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_pig"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_turtle"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["blink"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    }
  },
  ["hunter"] = {
    ["freezing_trap"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    },
    ["frost_trap"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    },
    ["deterrence"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    }
  },
  ["warlock"] = {
    ["fear"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    }
  },
  ["paladin"] = {
    ["lay_on_hands"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["blessing_of_protection"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["divine_shield"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_wrath"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["blessing_of_freedom"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_justice"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["repentance"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    }
  },
  ["druid"] = {
    ["barkskin"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    },
    ["natures_grasp"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    },
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["shaman"] = {
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["racials"] = {

  },
  ["items"] = {
    ["immune_root"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["mind_quickening"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["net_o_matic"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    }
  },
  ["misc"] = {
    ["first_aid"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["iron_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["thorium_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["invulnerability"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["free_action"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    }
  }
}

defaultProfilePriest = {
  ["warrior"] = {
    ["recklessness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["shield_wall"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["last_stand"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["death_wish"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["berserker_rage"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    }
  },
  ["priest"] = {
    ["power_infusion"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 8
    },
    ["fear_ward"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 8
    }
  },
  ["rogue"] = {
    ["sprint"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    },
    ["adrenaline_rush"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    },
    ["blade_flurry"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    }
  },
  ["mage"] = {
    ["ice_block"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["arcane_power"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["presence_of_mind"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_cow"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_pig"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_turtle"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    }
  },
  ["hunter"] = {
    ["freezing_trap"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    },
    ["frost_trap"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    }
  },
  ["warlock"] = {
    ["fear"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    },
    ["fel_domination"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    },
    ["shadow_ward"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    }
  },
  ["paladin"] = {
    ["lay_on_hands"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["divine_shield"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_wrath"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["blessing_of_freedom"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_justice"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["repentance"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    }
  },
  ["druid"] = {
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    },
    ["innervate"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["shaman"] = {
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    },
    ["grounding_totem"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    },
    ["tremor_totem"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["racials"] = {
  },
  ["items"] = {
    ["shadow_reflector"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    }
  },
  ["misc"] = {
    ["first_aid"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["iron_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["thorium_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["shadow_protection"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    }
  }
}

defaultProfileRogue = {
  ["warrior"] = {
    ["recklessness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["shield_wall"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["last_stand"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["death_wish"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    }
  },
  ["priest"] = {
    ["power_infusion"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 8
    },
    ["inner_fire"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 8
    }
  },
  ["rogue"] = {
    ["sprint"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    },
    ["adrenaline_rush"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    },
    ["blade_flurry"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    }
  },
  ["mage"] = {
    ["ice_block"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["arcane_power"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["presence_of_mind"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_cow"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_pig"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_turtle"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["blink"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    }
  },
  ["hunter"] = {
    ["freezing_trap"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    },
    ["frost_trap"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    },
    ["deterrence"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    },
    ["flare"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    }
  },
  ["warlock"] = {
    ["fear"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    }
  },
  ["paladin"] = {
    ["lay_on_hands"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["blessing_of_protection"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["divine_shield"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_wrath"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["blessing_of_freedom"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_justice"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["repentance"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    }
  },
  ["druid"] = {
    ["barkskin"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    },
    ["natures_grasp"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    },
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["shaman"] = {
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["racials"] = {
  },
  ["items"] = {
    ["immune_root"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["mind_quickening"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["net_o_matic"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["flee"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    }
  },
  ["misc"] = {
    ["first_aid"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["iron_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["thorium_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["invulnerability"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["free_action"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    }
  }
}

defaultProfileMage = {
  ["warrior"] = {
    ["recklessness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["shield_wall"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["last_stand"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["death_wish"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    }
  },
  ["priest"] = {
    ["power_infusion"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 8
    }
  },
  ["rogue"] = {
    ["sprint"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    }
  },
  ["mage"] = {
    ["ice_block"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["arcane_power"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["presence_of_mind"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_cow"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_pig"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_turtle"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    }
  },
  ["hunter"] = {
    ["freezing_trap"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    },
    ["frost_trap"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    }
  },
  ["warlock"] = {
    ["fear"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    }
  },
  ["paladin"] = {
    ["lay_on_hands"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["divine_shield"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_wrath"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["blessing_of_freedom"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_justice"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["repentance"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    }
  },
  ["druid"] = {
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["shaman"] = {
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    },
    ["tremor_totem"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["racials"] = {
  },
  ["items"] = {
    ["fire_reflector"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["frost_reflector"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["immune_root"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    }
  },
  ["misc"] = {
    ["first_aid"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["iron_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["thorium_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["free_action"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["frost_protection"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["fire_protection"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    }
  }
}

defaultProfileHunter = {
  ["warrior"] = {
    ["recklessness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["shield_wall"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["last_stand"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["death_wish"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    }
  },
  ["priest"] = {
    ["power_infusion"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 8
    }
  },
  ["rogue"] = {
    ["sprint"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    },
    ["adrenaline_rush"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    },
    ["blade_flurry"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    }
  },
  ["mage"] = {
    ["ice_block"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["arcane_power"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["presence_of_mind"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_cow"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_pig"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_turtle"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["blink"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    }
  },
  ["hunter"] = {
    ["freezing_trap"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    },
    ["frost_trap"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    }
  },
  ["warlock"] = {
    ["fear"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    }
  },
  ["paladin"] = {
    ["lay_on_hands"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["divine_shield"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["blessing_of_protection"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_wrath"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["blessing_of_freedom"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_justice"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["repentance"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    }
  },
  ["druid"] = {
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    },
    ["barkskin"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    },
    ["innervate"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["shaman"] = {
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["racials"] = {
  },
  ["items"] = {
    ["flee"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["immune_root"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    }
  },
  ["misc"] = {
    ["first_aid"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["iron_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["thorium_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["free_action"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["invulnerability"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    }
  }
}

defaultProfileWarlock = {
  ["warrior"] = {
    ["recklessness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["shield_wall"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["last_stand"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["death_wish"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["berserker_rage"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    }
  },
  ["priest"] = {
    ["power_infusion"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 8
    },
    ["fear_ward"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 8
    }
  },
  ["rogue"] = {
    ["sprint"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    },
    ["adrenaline_rush"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    },
    ["blade_flurry"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    }
  },
  ["mage"] = {
    ["ice_block"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["arcane_power"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["presence_of_mind"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_cow"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_pig"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_turtle"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    }
  },
  ["hunter"] = {
    ["freezing_trap"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    },
    ["frost_trap"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    }
  },
  ["warlock"] = {
    ["fear"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    },
    ["shadow_ward"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    }
  },
  ["paladin"] = {
    ["lay_on_hands"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["divine_shield"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_wrath"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_justice"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["repentance"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    }
  },
  ["druid"] = {
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["shaman"] = {
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    },
    ["tremor_totem"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    },
    ["grounding_totem"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["racials"] = {
  },
  ["items"] = {
    ["fire_reflector"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["shadow_reflector"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    }
  },
  ["misc"] = {
    ["first_aid"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["iron_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["thorium_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["shadow_protection"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["fire_protection"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    }
  }
}

defaultProfilePaladin = {
  ["warrior"] = {
    ["recklessness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["shield_wall"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["last_stand"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["death_wish"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    }
  },
  ["priest"] = {
    ["power_infusion"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 8
    }
  },
  ["rogue"] = {
    ["sprint"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    },
    ["adrenaline_rush"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    },
    ["blade_flurry"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    }
  },
  ["mage"] = {
    ["ice_block"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["arcane_power"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["presence_of_mind"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_cow"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_pig"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_turtle"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    }
  },
  ["hunter"] = {
    ["freezing_trap"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    },
    ["frost_trap"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    }
  },
  ["warlock"] = {
    ["fear"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    }
  },
  ["paladin"] = {
    ["lay_on_hands"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["divine_shield"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_wrath"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_justice"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["repentance"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    }
  },
  ["druid"] = {
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["shaman"] = {
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    },
    ["grounding_totem"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["racials"] = {
  },
  ["items"] = {

  },
  ["misc"] = {
    ["first_aid"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["iron_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["thorium_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["invulnerability"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    }
  }
}

defaultProfileDruid = {
  ["warrior"] = {
    ["recklessness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["shield_wall"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["last_stand"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["death_wish"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    }
  },
  ["priest"] = {
    ["power_infusion"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 8
    },
    ["vampiric_embrace"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 8
    }
  },
  ["rogue"] = {
    ["sprint"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    },
    ["adrenaline_rush"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    },
    ["blade_flurry"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    }
  },
  ["mage"] = {
    ["ice_block"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["arcane_power"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["presence_of_mind"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_cow"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_pig"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_turtle"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    }
  },
  ["hunter"] = {
    ["freezing_trap"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    },
    ["frost_trap"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    }
  },
  ["warlock"] = {
    ["fear"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    },
    ["amplify_curse"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    }
  },
  ["paladin"] = {
    ["lay_on_hands"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["divine_shield"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_wrath"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["blessing_of_freedom"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_justice"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["repentance"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    }
  },
  ["druid"] = {
    ["barkskin"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    },
    ["natures_grasp"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    },
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["shaman"] = {
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    },
    ["totem_des_erdstosses"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    },
    ["tremor_totem"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["racials"] = {

  },
  ["items"] = {
    ["immune_root"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    }
  },
  ["misc"] = {
    ["first_aid"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["iron_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["thorium_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["invulnerability"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["free_action"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    }
  }
}

defaultProfileShaman = {
  ["warrior"] = {
    ["recklessness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["shield_wall"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["last_stand"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    },
    ["death_wish"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 7
    }
  },
  ["priest"] = {
    ["power_infusion"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 8
    }
  },
  ["rogue"] = {
    ["sprint"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    },
    ["adrenaline_rush"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    },
    ["blade_flurry"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 1
    }
  },
  ["mage"] = {
    ["ice_block"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["arcane_power"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["presence_of_mind"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_cow"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_pig"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    },
    ["polymorph_turtle"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 10
    }
  },
  ["hunter"] = {
    ["freezing_trap"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 5
    }
  },
  ["warlock"] = {
    ["fear"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 2
    }
  },
  ["paladin"] = {
    ["lay_on_hands"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["divine_shield"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["blessing_of_protection"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_wrath"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["blessing_of_freedom"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["hammer_of_justice"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    },
    ["repentance"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 9
    }
  },
  ["druid"] = {
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    },
    ["barkskin"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["shaman"] = {
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    },
    ["grounding_totem"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 6
    }
  },
  ["racials"] = {
  },
  ["items"] = {
  },
  ["misc"] = {
    ["first_aid"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["iron_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["thorium_grenade"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    },
    ["free_action"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningActive"] = true,
      ["visualWarningColor"] = 3
    }
  }
}
