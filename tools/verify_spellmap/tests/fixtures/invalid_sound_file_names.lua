-- SpellMap with invalid soundFileName properties
local spellMap = {
  ["warrior"] = {
    [12323] = {
      name = "Piercing Howl",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      -- Missing soundFileName property
      trackedEvents = { "SPELL_CAST_SUCCESS" }
    },
    [18499] = {
      name = "Berserker Rage",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "", -- Empty sound file name
      trackedEvents = { "SPELL_AURA_APPLIED" }
    },
    [20230] = {
      name = "Retaliation",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = 12345, -- Not a string
      trackedEvents = { "SPELL_CAST_SUCCESS" }
    },
    [25275] = {
      name = "Intercept",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "Intercept_Sound", -- Capital letters not allowed
      trackedEvents = { "SPELL_CAST_SUCCESS" }
    },
    [1719] = {
      name = "Recklessness",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "recklessness-sound", -- Hyphens not allowed
      trackedEvents = { "SPELL_CAST_SUCCESS" }
    }
  },
  ["mage"] = {
    [12042] = {
      name = "Arcane Power",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "arcane power", -- Spaces not allowed
      trackedEvents = { "SPELL_AURA_APPLIED" }
    },
    [11958] = {
      name = "Ice Block",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "ice_block!", -- Special characters not allowed
      trackedEvents = { "SPELL_AURA_APPLIED" }
    },
    [1953] = {
      name = "Blink",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blink_sound", -- Valid sound file name
      trackedEvents = { "SPELL_CAST_SUCCESS" }
    },
    -- Reference entry should be skipped
    [99999] = {
      refId = 12042
    }
  },
  ["rogue"] = {
    [1856] = {
      name = "Vanish",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "vanish123", -- Numbers not allowed
      trackedEvents = { "SPELL_CAST_SUCCESS" }
    },
    [5277] = {
      name = "Evasion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "évasion", -- Non-ASCII characters not allowed
      trackedEvents = { "SPELL_AURA_APPLIED" }
    }
  }
}
