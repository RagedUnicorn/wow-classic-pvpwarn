-- Fixture for testing invalid allRanks scenarios
local spellMap = {
  ["warrior"] = {
    -- Missing allRanks property
    [100] = {
      name = "Charge",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "charge",
      spellIcon = "ability_warrior_charge",
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
      spellIcon = "ability_warrior_charge",
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
      spellIcon = "ability_warrior_charge",
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
      spellIcon = "ability_defend",
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
      spellIcon = "ability_warrior_shieldwall",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = { 1672, 1671 } -- Missing 871
    },

    -- Shield Bash Rank 1
    [72] = {
      name = "Shield Bash",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shield_bash",
      spellIcon = "ability_warrior_shieldbash",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = { 72 } -- Missing 1671 and 1672
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
      spellIcon = "ability_warrior_disarm",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = { 676, 99999 } -- 99999 is not a valid reference
    }
  }
}
