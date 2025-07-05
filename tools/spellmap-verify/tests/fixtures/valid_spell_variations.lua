-- Valid spell entries with various naming patterns for testing validators
local spellMap = {
  ["test"] = {
    -- Simple valid entries
    [1] = {
      name = "Simple Name",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "simple",
      spellIcon = "simple",
      active = true,
      trackedEvents = { "SPELL_CAST_SUCCESS" },
      allRanks = { 1 }
    },
    -- With underscores
    [2] = {
      name = "Name With Underscores",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "with_underscores",
      spellIcon = "with_underscores",
      active = true,
      trackedEvents = { "SPELL_CAST_SUCCESS" },
      allRanks = { 2 }
    },
    -- With numbers (only valid in spellIcon)
    [3] = {
      name = "Name With Numbers",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "without_numbers",
      spellIcon = "with_numbers_123",
      active = false,
      trackedEvents = { "SPELL_CAST_SUCCESS" },
      allRanks = { 3 }
    },
    -- Complex valid icon name
    [4] = {
      name = "Complex Icon Name",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "complex_sound",
      spellIcon = "inv_1h_haremmatron_d_01",
      active = true,
      trackedEvents = { "SPELL_CAST_SUCCESS" },
      allRanks = { 4 }
    },
    -- Leading underscore
    [5] = {
      name = "Leading Underscore",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "_leading_underscore",
      spellIcon = "_leading_underscore",
      active = false,
      trackedEvents = { "SPELL_CAST_SUCCESS" },
      allRanks = { 5 }
    },
    -- Multiple underscores and numbers
    [6] = {
      name = "Multiple Parts",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "multiple_underscores_allowed",
      spellIcon = "ability_druid_ferociousbite_01",
      active = true,
      trackedEvents = { "SPELL_CAST_SUCCESS" },
      allRanks = { 6 }
    },
    -- Single character
    [7] = {
      name = "Single Char",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "a",
      spellIcon = "a",
      active = true,
      trackedEvents = { "SPELL_CAST_SUCCESS" },
      allRanks = { 7 }
    },
    -- All allowed tracked events
    [8] = {
      name = "All Events",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "all_events",
      spellIcon = "all_events",
      active = false,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED",
        "SPELL_CAST_SUCCESS",
        "SPELL_AURA_REFRESH",
        "SPELL_CAST_START"
      },
      allRanks = { 8 }
    },
    -- Using SPELL_TYPE_SOD
    [9] = {
      name = "SOD Type",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "sod_spell",
      spellIcon = "sod_spell_icon",
      active = true,
      trackedEvents = { "SPELL_CAST_SUCCESS" },
      allRanks = { 9 }
    }
  }
}
