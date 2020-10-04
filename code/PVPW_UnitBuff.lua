--[[
  MIT License

  Copyright (c) 2020 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--

-- luacheck: globals UnitIsPlayer UnitIsEnemy UnitIsPVP UnitAffectingCombat

local mod = rgpvpw
local me = {}
mod.unitBuff = me

me.tag = "UnitBuff"

local trackBuffs = {}

function me.AcquiredTarget()
  mod.logger.LogError(me.tag, "Aquired target")

  -- local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId = UnitAura(RGPVPW_CONSTANTS.UNIT_ID_TARGET, 0)


  test = { UnitBuff("Deshlol", 1) }
  test1 = { UnitBuff(RGPVPW_CONSTANTS.UNIT_ID_TARGET, 0) }
  test2 = { UnitBuff(RGPVPW_CONSTANTS.UNIT_ID_TARGET, 2) }
  -- mod.logger.LogError(me.tag, "Name: " .. name)

end


function me.TrackBuff()

end
