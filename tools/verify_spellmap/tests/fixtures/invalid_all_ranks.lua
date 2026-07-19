-- Fixture for testing invalid allRanks scenarios
local spellMap = {
  ["warrior"] = {
    -- Missing allRanks property
    [100] = {
      name = "Charge",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "charge",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      }
      -- allRanks is missing
    },

    -- allRanks is not a list
    [6178] = {
      name = "Charge",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "charge",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = "not a list"
    },

    -- Empty allRanks list
    [11578] = {
      name = "Charge",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "charge",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {}
    },

    -- allRanks contains non-numeric values
    [2565] = {
      name = "Shield Block",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shield_block",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = { "not", "a", "number" }
    },

    -- allRanks missing the spell's own ID
    [871] = {
      name = "Shield Wall",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shield_wall",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 1672, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 1671, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      } -- Missing 871
    },

    -- Shield Bash Rank 1
    [72] = {
      name = "Shield Bash",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shield_bash",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 72, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      } -- Missing 1671 and 1672
    },

    -- Shield Bash Rank 2 - references Rank 1
    [1671] = {
      refId = 72
    },

    -- Shield Bash Rank 3 - references Rank 1
    [1672] = {
      refId = 72
    },

    -- allRanks contains unexpected IDs
    [676] = {
      name = "Disarm",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "disarm",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 676, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
        { spellId = 99999, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      } -- 99999 is not a valid reference
    }
  }
}
