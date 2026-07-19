-- SpellMap with missing name properties
local spellMap = {
  ["warrior"] = {
    [12323] = {
      -- Missing name property
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "piercing_howl",
    },
    [18499] = {
      name = "", -- Empty name
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "berserker_rage",
    },
    [20230] = {
      name = "Retaliation",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "retaliation",
    }
  }
}
