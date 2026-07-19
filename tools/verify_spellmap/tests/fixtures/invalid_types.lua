-- SpellMap with invalid type properties
local spellMap = {
  ["warrior"] = {
    [12323] = {
      name = "Piercing Howl",
      -- Missing type property
      soundFileName = "piercing_howl",
    },
    [18499] = {
      name = "Berserker Rage",
      type = "", -- Empty type
      soundFileName = "berserker_rage",
    },
    [20230] = {
      name = "Retaliation",
      type = "INVALID_TYPE", -- Invalid type value
      soundFileName = "retaliation",
    },
    [25275] = {
      name = "Intercept",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_INVALID, -- Invalid constant
      soundFileName = "intercept",
    },
    [1719] = {
      name = "Recklessness",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE, -- Valid type
      soundFileName = "recklessness",
    }
  }
}
