--[[
  MIT License

  Copyright (c) 2025 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
]]--

-- luacheck: globals C_Seasons Enum WOW_PROJECT_ID WOW_PROJECT_BURNING_CRUSADE_CLASSIC

local mod = rgpvpw
local me = {}
mod.season = me

me.tag = "Season"

--[[
  Test if Season of Discovery is active

  Enum.SeasonID.Placeholder = Season of Discovery 2
  Enum.SeasonID.Hardcore = Hardcore 3

  @return {boolean}
    true if SOD is active
    false if SOD is not active
]]--
function me.IsSodActive()
  if C_Seasons.HasActiveSeason() and C_Seasons.GetActiveSeason() == Enum.SeasonID.Placeholder then
    return true
  end

  return false
end

--[[
  Test if the Burning Crusade Classic (TBC Anniversary) client is active

  @return {boolean}
    true if TBC is active
    false if TBC is not active
]]--
function me.IsTbcActive()
  if WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC then
    return true
  end

  return false
end

--[[
  Determine the active spell-data branch. In test sessions the branch is controlled by the
  test helper instead of the running client.

  @return {string}
    "classic", "sod" or "tbc"
]]--
function me.GetActiveBranch()
  if RGPVPW_ENVIRONMENT.TEST then
    return mod.testHelper.GetActiveBranch()
  end

  if me.IsTbcActive() then return "tbc" end
  if me.IsSodActive() then return "sod" end

  return "classic"
end
