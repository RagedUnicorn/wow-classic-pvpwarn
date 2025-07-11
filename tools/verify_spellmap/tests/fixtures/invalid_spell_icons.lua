-- SpellMap with invalid spellIcon properties
local spellMap = {
  ["warrior"] = {
    [12323] = {
      name = "Piercing Howl",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "piercing_howl",
      -- Missing spellIcon property
      trackedEvents = { "SPELL_CAST_SUCCESS" }
    },
    [18499] = {
      name = "Berserker Rage",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "berserker_rage",
      spellIcon = "", -- Empty spell icon
      trackedEvents = { "SPELL_AURA_APPLIED" }
    },
    [20230] = {
      name = "Retaliation",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "retaliation",
      spellIcon = 12345, -- Not a string
      trackedEvents = { "SPELL_CAST_SUCCESS" }
    },
    [25275] = {
      name = "Intercept",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "intercept",
      spellIcon = "Ability_Warrior_Charge", -- Capital letters not allowed
      trackedEvents = { "SPELL_CAST_SUCCESS" }
    },
    [1719] = {
      name = "Recklessness",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "recklessness",
      spellIcon = "ability-criticalstrike", -- Hyphens not allowed
      trackedEvents = { "SPELL_CAST_SUCCESS" }
    }
  },
  ["mage"] = {
    [12042] = {
      name = "Arcane Power",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "arcane_power",
      spellIcon = "spell nature lightning", -- Spaces not allowed
      trackedEvents = { "SPELL_AURA_APPLIED" }
    },
    [11958] = {
      name = "Ice Block",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "ice_block",
      spellIcon = "spell_frost_frost!", -- Special characters not allowed
      trackedEvents = { "SPELL_AURA_APPLIED" }
    },
    [1953] = {
      name = "Blink",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "blink_sound",
      spellIcon = "spell_arcane_blink", -- Valid spell icon
      trackedEvents = { "SPELL_CAST_SUCCESS" }
    },
    -- Reference entry should be skipped
    [99999] = {
      refId = 12042
    }
  },
  ["rogue"] = {
    [1856] = {
      name = "Vanish",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "vanish",
      spellIcon = "spell_magic_lesserinvisibilty", -- Valid (lowercase with underscore)
      trackedEvents = { "SPELL_CAST_SUCCESS" }
    },
    [5277] = {
      name = "Evasion",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "evasion",
      spellIcon = "spell_shadow_shadowward#1", -- Hash symbol not allowed
      trackedEvents = { "SPELL_AURA_APPLIED" }
    }
  },
  ["hunter"] = {
    [5384] = {
      name = "Feign Death",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "feign_death",
      spellIcon = "ability_rogue_feigndeath", -- Valid 
      trackedEvents = { "SPELL_CAST_SUCCESS" }
    },
    [19574] = {
      name = "Bestial Wrath",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "bestial_wrath",
      spellIcon = "ability_druid_ferociousbite_01", -- Valid (with numbers)
      trackedEvents = { "SPELL_AURA_APPLIED" }
    },
    [3045] = {
      name = "Rapid Fire",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "rapid_fire",
      spellIcon = "inv_1h_haremmatron_d_01", -- Valid (example from user)
      trackedEvents = { "SPELL_CAST_SUCCESS" }
    }
  }
}