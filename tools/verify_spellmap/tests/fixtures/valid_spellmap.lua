-- Valid SpellMap with all required properties
local spellMap = {
  ["warrior"] = {
    [12323] = {
      name = "Piercing Howl",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "piercing_howl",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = {
        { spellId = 12323, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    [18499] = {
      name = "Berserker Rage",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "berserker_rage",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 18499, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    }
  },
  ["mage"] = {
    [12042] = {
      name = "Arcane Power",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "arcane_power",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = {
        { spellId = 12042, type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE },
      }
    },
    -- Reference to warrior spell with different ID
    [99999] = {
      refId = 18499
    }
  }
}
