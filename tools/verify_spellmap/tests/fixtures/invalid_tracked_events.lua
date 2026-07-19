-- SpellMap with invalid trackedEvents properties
local spellMap = {
  ["warrior"] = {
    [12323] = {
      name = "Piercing Howl",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "piercing_howl",
      -- Missing trackedEvents property
    },
    [18499] = {
      name = "Berserker Rage",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "berserker_rage",
      trackedEvents = {} -- Empty array
    },
    [20230] = {
      name = "Retaliation",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "retaliation",
      trackedEvents = "SPELL_CAST_SUCCESS" -- Not an array
    },
    [25275] = {
      name = "Intercept",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "intercept",
      trackedEvents = {
        "SPELL_CAST_SUCCESS",
        "INVALID_EVENT", -- Invalid event
        "SPELL_AURA_APPLIED"
      }
    },
    [1719] = {
      name = "Recklessness",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "recklessness",
      trackedEvents = {
        "SPELL_CAST_SUCCESS",
        123, -- Not a string
        "SPELL_AURA_REMOVED"
      }
    }
  },
  ["mage"] = {
    [12042] = {
      name = "Arcane Power",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "arcane_power",
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED",
        "SPELL_AURA_REFRESH" -- Valid events
      }
    },
    [11958] = {
      name = "Ice Block",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "ice_block",
      trackedEvents = {
        "SPELL_DAMAGE", -- Invalid event
        "SPELL_MISSED", -- Invalid event
      }
    },
    -- Reference entry should be skipped
    [99999] = {
      refId = 12042
    }
  }
}
