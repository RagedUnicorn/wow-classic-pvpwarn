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
mod.warlockProfile = me

me.tag = "WarlockProfile"

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
      ["visualWarningColor"] = [number] -- e.g. blue, orange see RGPVPW_CONSTANTS.TEXTURES
        -- default color in RGPVPW_CONSTANTS.DEFAULT_COLOR
    }
  }
]]--
local defaultSpellProfileWarlock = {
  ["warrior"] = {
    ["berserker_rage"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.brown.colorValue
    },
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
      ["soundFadeWarningActive"] = false,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.white.colorValue
    },
    ["silence"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
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
      ["soundFadeWarningActive"] = false,
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
    ["silence"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.light_blue.colorValue
    }
  },
  ["hunter"] = {
    ["viper_sting"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
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
    ["shadow_ward"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = true,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.violet.colorValue
    },
    ["amplify_curse"] = {
      ["spellActive"] = true,
      ["soundWarningActive"] = true,
      ["soundFadeWarningActive"] = false,
      ["visualWarningColor"] = RGPVPW_CONSTANTS.TEXTURES.violet.colorValue
    }
  },
  ["paladin"] = {
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
    ["tremor_totem"] = {
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
  ["items"] = {},
  ["misc"] = {}
}

local defaultSpellSelfAvoidProfileWarlock = {}

local defaultSpellEnemyAvoidProfileWarlock = {}

--[[
  @param {string} spellType

  @return {table | nil}
]]--
function me.GetSpellProfile(spellType)
  if spellType == RGPVPW_CONSTANTS.SPELL_TYPE.SPELL then
    return mod.common.Clone(defaultSpellProfileWarlock)
  elseif spellType == RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID then
    return mod.common.Clone(defaultSpellSelfAvoidProfileWarlock)
  elseif spellType == RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID then
    return mod.common.Clone(defaultSpellEnemyAvoidProfileWarlock)
  else
    mod.logger.LogError(me.tag, "Invalid spellType")
    return nil
  end
end
