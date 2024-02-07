--[[
  MIT License

  Copyright (c) 2024 Michael Wiesendanger

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
mod.mageProfile = me

me.tag = "MageProfile"

--[[
  ["type"] = {
    -- e.g. paladin, racials
    ["spellName"] = {
      -- e.g. lay_on_hands as found in SpellMap
      ["spellActive"] = false,
        -- default false
      ["soundWarningActive"] = false,
        -- default false
      ["visualWarningActive"] = false,
        -- default false
      ["visualWarningColor"] = [number] -- e.g. blue, orange see RGPVPW_CONSTANTS.TEXTURES
        -- default color in RGPVPW_CONSTANTS.DEFAULT_COLOR
    }
  }
]]--
local defaultSpellProfileMage = {
  ["warrior"] = {
    ["recklessness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.brown.colorValue
    }
  },
  ["priest"] = {
    ["psychic_scream"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.white.colorValue
    },
    ["silence"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.white.colorValue
    }
  },
  ["rogue"] = {
    ["sprint"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.yellow.colorValue
    },
    ["adrenaline_rush"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.yellow.colorValue
    },
    ["blade_flurry"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.yellow.colorValue
    },
    ["cold_blood"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.yellow.colorValue
    }
  },
  ["mage"] = {
    ["ice_block"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.light_blue.colorValue
    },
    ["arcane_power"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.light_blue.colorValue
    },
    ["presence_of_mind"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.light_blue.colorValue
    },
    ["fire_ward"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.light_blue.colorValue
    },
    ["frost_ward"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.light_blue.colorValue
    },
    ["counterspell"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.light_blue.colorValue
    }
  },
  ["hunter"] = {
    ["concussive_shot"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.green.colorValue
    },
    ["rapid_fire"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.green.colorValue
    }
  },
  ["warlock"] = {
    ["amplify_curse"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.violet.colorValue
    }
  },
  ["paladin"] = {
    ["blessing_of_freedom"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.pink.colorValue
    },
    ["divine_shield"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.pink.colorValue
    }
  },
  ["druid"] = {
    ["barkskin"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.orange.colorValue
    },
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.orange.colorValue
    }
  },
  ["shaman"] = {
    ["elemental_mastery"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.blue.colorValue
    },
    ["natures_swiftness"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.blue.colorValue
    },
    ["grounding_totem"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.blue.colorValue
    }
  },
  ["racials"] = {},
  ["items"] = {
    ["frost_reflector"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.red.colorValue
    },
    ["fire_reflector"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.red.colorValue
    },
    ["flee"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.red.colorValue
    },
    ["immune_root_snare_stun"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.red.colorValue
    },
    ["immune_charm_fear_polymorph"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.red.colorValue
    },
    ["immune_fear_polymorph_snare"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.red.colorValue
    },
    ["immune_fear_polymorph_stun"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.red.colorValue
    },
    ["immune_charm_fear_stun"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.red.colorValue
    }
  },
  ["misc"] = {}
}

local defaultSpellSelfAvoidProfileMage = {}

local defaultSpellEnemyAvoidProfileMage = {}

--[[
  @param {string} spellType

  @return {table | nil}
]]--
function me.GetSpellProfile(spellType)
  if spellType == RGPVPW_CONSTANTS.SPELL_TYPE.SPELL then
    return mod.common.Clone(defaultSpellProfileMage)
  elseif spellType == RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID then
    return mod.common.Clone(defaultSpellSelfAvoidProfileMage)
  elseif spellType == RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID then
    return mod.common.Clone(defaultSpellEnemyAvoidProfileMage)
  else
    mod.logger.LogError(me.tag, "Invalid spellType")
    return nil
  end
end
