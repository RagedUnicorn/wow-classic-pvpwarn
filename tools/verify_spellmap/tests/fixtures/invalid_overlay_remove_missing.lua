-- Invalid overlay: removes a spellId that doesn't exist in the base.

local mod = rgpvpw
local me = {}
mod.spellMapOverlaySod = me

function me.GetOverlay()
  return {
    warrior = {
      remove = { 99999 }, -- not present in valid_spellmap.lua warrior
    },
  }
end
