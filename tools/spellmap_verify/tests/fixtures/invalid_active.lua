-- Fixture for testing invalid active property scenarios
local spellMap = {
  ["warrior"] = {
    -- Missing active property
    [100] = {
      name = "Charge",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "charge",
      spellIcon = "ability_warrior_charge",
      hasFade = false,
      -- active is missing
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = { 100 }
    },

    -- active is a string instead of boolean
    [871] = {
      name = "Shield Wall",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shield_wall",
      spellIcon = "ability_warrior_shieldwall",
      hasFade = true,
      active = "true",  -- Should be boolean true, not string
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = { 871 }
    },

    -- active is a number instead of boolean
    [2565] = {
      name = "Shield Block",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "shield_block",
      spellIcon = "ability_defend",
      hasFade = true,
      active = 1,  -- Should be boolean true, not number
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = { 2565 }
    },

    -- active is nil (Lua nil)
    [676] = {
      name = "Disarm",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "disarm",
      spellIcon = "ability_warrior_disarm",
      hasFade = false,
      active = nil,  -- nil is not a valid boolean
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = { 676 }
    },

    -- active is a table instead of boolean
    [5246] = {
      name = "Intimidating Shout",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "intimidating_shout",
      spellIcon = "spell_shadow_deathscream",
      hasFade = false,
      active = {},  -- Should be boolean, not table
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = { 5246 }
    }
  }
}
