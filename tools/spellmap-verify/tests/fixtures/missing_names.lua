-- SpellMap with missing name properties
local spellMap = {
  ["warrior"] = {
    [12323] = {
      -- Missing name property
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "piercing_howl",
      spellIcon = "spell_shadow_deathscream"
    },
    [18499] = {
      name = "", -- Empty name
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "berserker_rage",
      spellIcon = "spell_nature_ancestralguardian"
    },
    [20230] = {
      name = "Retaliation",
      type = RGPVPW_CONSTANTS.SPELL_TYPE_BASE,
      soundFileName = "retaliation",
      spellIcon = "ability_warrior_challange"
    }
  },
  ["items"] = {
    -- Dynamic faction-specific name
    [438273] = {
      name = (function()
        return UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde"
          and "Greater Insignia of the Horde"
          or "Greater Insignia of the Alliance"
      end)(),
      type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
      soundFileName = "pvp_trinket",
      spellIcon = "inv_jewelry_trinketpvp_01"
    }
  }
}
