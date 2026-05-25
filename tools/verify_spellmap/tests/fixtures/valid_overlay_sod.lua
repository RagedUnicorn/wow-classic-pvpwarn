-- Valid SoD overlay aligned with tests/fixtures/valid_spellmap.lua's base content.
-- Mirrors the shape produced by `function me.GetOverlay()` in code/SpellMap/Overlay/Sod.lua.

local mod = rgpvpw
local me = {}
mod.spellMapOverlaySod = me

me.tag = "SpellMapOverlaySod"

function me.GetOverlay()
  return {
    warrior = {
      remove = { 12323 }, -- remove Piercing Howl from base
      add = {
        [402911] = { -- pure SoD addition
          name = "Raging Blow",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "raging_blow",
          spellIcon = "ability_hunter_swiftstrike",
          hasFade = false,
          active = true,
          trackedEvents = { "SPELL_CAST_SUCCESS" },
          allRanks = {
            { spellId = 402911, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
      },
    },
    mage = {
      replace = {
        [12042] = { -- replace Classic Arcane Power
          name = "Arcane Power",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "arcane_power",
          spellIcon = "spell_nature_lightning",
          hasFade = true,
          active = true,
          trackedEvents = { "SPELL_AURA_APPLIED", "SPELL_AURA_REMOVED" },
          allRanks = {
            { spellId = 12042, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
      },
    },
  }
end
