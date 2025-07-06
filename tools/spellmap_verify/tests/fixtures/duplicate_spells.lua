-- SpellMap with duplicate spell IDs
local spellMap = {
  ["warrior"] = {
    [18499] = {
      name = "Berserker Rage",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "berserker_rage",
      spellIcon = "spell_nature_ancestralguardian"
    },
    -- Duplicate in same category - will overwrite the first one
    [18499] = {
      name = "Berserker Rage Duplicate",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "berserker_rage_2",
      spellIcon = "spell_nature_ancestralguardian"
    },
    [12323] = {
      name = "Piercing Howl",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "piercing_howl",
      spellIcon = "spell_shadow_deathscream"
    }
  },
  ["items"] = {
    -- Cross-category duplicate
    [12323] = {
      name = "Piercing Howl Item",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "piercing_howl_item",
      spellIcon = "spell_shadow_deathscream"
    }
  },
  ["mage"] = {
    -- Another cross-category duplicate
    [12323] = {
      refId = 12323  -- Reference entry
    }
  }
}
