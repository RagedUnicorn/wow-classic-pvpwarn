-- Fixture for testing invalid hasFade property scenarios
local spellMap = {
  ["warrior"] = {
    -- Missing hasFade property
    [100] = {
      name = "Charge",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "charge",
      -- hasFade is missing
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 100, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },

    -- hasFade is a string instead of boolean
    [871] = {
      name = "Shield Wall",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shield_wall",
      hasFade = "true",  -- Should be boolean true, not string
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 871, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },

    -- hasFade is a number instead of boolean
    [2565] = {
      name = "Shield Block",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shield_block",
      hasFade = 1,  -- Should be boolean true, not number
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 2565, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },

    -- hasFade is nil (Lua nil)
    [676] = {
      name = "Disarm",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "disarm",
      hasFade = nil,  -- nil is not a valid boolean
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 676, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },

    -- hasFade is a table instead of boolean
    [5246] = {
      name = "Intimidating Shout",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "intimidating_shout",
      hasFade = {},  -- Should be boolean, not table
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 5246, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    }
  }
}
