-- Valid SpellMap with all required properties
local spellMap = {
  ["warrior"] = {
    [12323] = {
      name = "Piercing Howl",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "piercing_howl",
      spellIcon = "spell_shadow_deathscream",
      hasFade = false,
      active = true,
      trackedEvents = {
        "SPELL_CAST_SUCCESS"
      },
      allRanks = { 12323 }
    },
    [18499] = {
      name = "Berserker Rage",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "berserker_rage",
      spellIcon = "spell_nature_ancestralguardian",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = { 18499 }
    }
  },
  ["mage"] = {
    [12042] = {
      name = "Arcane Power",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "arcane_power",
      spellIcon = "spell_nature_lightning",
      hasFade = true,
      active = true,
      trackedEvents = {
        "SPELL_AURA_APPLIED",
        "SPELL_AURA_REMOVED"
      },
      allRanks = { 12042 }
    },
    -- Reference to warrior spell with different ID
    [99999] = {
      refId = 18499
    }
  }
}
