-- SpellMap with invalid trackedEvents properties
local spellMap = {
  ["warrior"] = {
    [12323] = {
      name = "Piercing Howl",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "piercing_howl",
      spellIcon = "spell_shadow_deathscream",
      -- Missing trackedEvents property
    },
    [18499] = {
      name = "Berserker Rage",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "berserker_rage",
      spellIcon = "spell_nature_ancestralguardian",
      trackedEvents = {} -- Empty array
    },
    [20230] = {
      name = "Retaliation",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "retaliation",
      spellIcon = "ability_warrior_challange",
      trackedEvents = "SPELL_CAST_SUCCESS" -- Not an array
    },
    [25275] = {
      name = "Intercept",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "intercept",
      spellIcon = "ability_rogue_sprint",
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
      spellIcon = "ability_criticalstrike",
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
      spellIcon = "spell_nature_lightning",
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
      spellIcon = "spell_frost_frost",
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
