-- Invalid overlay: adds a spellId that already exists in the base.

local mod = rgpvpw
local me = {}
mod.spellMapOverlaySod = me

function me.GetOverlay()
  return {
    warrior = {
      add = {
        [12323] = { -- Piercing Howl already in base
          name = "Piercing Howl (duplicated)",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "piercing_howl",
          hasFade = false,
          active = true,
          trackedEvents = { "SPELL_CAST_SUCCESS" },
          allRanks = {
            { spellId = 12323, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
      },
    },
  }
end
