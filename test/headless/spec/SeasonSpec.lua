--[[
  MIT License

  Copyright (c) 2026 Michael Wiesendanger

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

--[[
  Headless spec for code/Season.lua (rgpvpw.season): the Season of Discovery and TBC client checks
  and GetActiveBranch, which picks the spell-data branch (classic / sod / tbc) every spell map
  lookup is assembled for.

  The client is described through stubbed C_Seasons, Enum, WOW_PROJECT_ID and
  WOW_PROJECT_BURNING_CRUSADE_CLASSIC globals. RGPVPW_ENVIRONMENT.TEST routes GetActiveBranch to the
  in-game test helper; it is flipped for one test and put back in after_each.
]]--

-- the test-session case flips RGPVPW_ENVIRONMENT.TEST
-- luacheck: globals RGPVPW_ENVIRONMENT

local wowStubs = require("WowStubs")

-- the client's Enum.SeasonID values Season.lua compares against
local SEASON_ID_HARDCORE = 3
local SEASON_ID_SOD = 2
-- the client's WOW_PROJECT_ID values
local PROJECT_CLASSIC = 2
local PROJECT_BURNING_CRUSADE_CLASSIC = 5

describe("Season", function()
  local season
  local restoreGlobals
  local originalSeason = rgpvpw.season
  local originalTestHelper = rgpvpw.testHelper
  local originalTest = RGPVPW_ENVIRONMENT.TEST

  --[[
    @param {number | nil} activeSeason
      the active season id, nil for a client without an active season
    @param {number} projectId
  ]]--
  local function installClient(activeSeason, projectId)
    restoreGlobals = wowStubs.install({
      C_Seasons = {
        HasActiveSeason = function() return activeSeason ~= nil end,
        GetActiveSeason = function() return activeSeason end
      },
      Enum = { SeasonID = { Placeholder = SEASON_ID_SOD, Hardcore = SEASON_ID_HARDCORE } },
      WOW_PROJECT_ID = projectId,
      WOW_PROJECT_BURNING_CRUSADE_CLASSIC = PROJECT_BURNING_CRUSADE_CLASSIC
    })
  end

  before_each(function()
    dofile("code/Season.lua")
    season = rgpvpw.season
  end)

  after_each(function()
    if restoreGlobals then
      restoreGlobals()
      restoreGlobals = nil
    end

    RGPVPW_ENVIRONMENT.TEST = originalTest
    rgpvpw.season = originalSeason
    rgpvpw.testHelper = originalTestHelper
  end)

  it("reports Season of Discovery on a client with the SoD season active", function()
    installClient(SEASON_ID_SOD, PROJECT_CLASSIC)

    assert.is_true(season.IsSodActive())
    assert.is_false(season.IsTbcActive())
    assert.are.equal("sod", season.GetActiveBranch())
  end)

  it("does not mistake the hardcore season for Season of Discovery", function()
    installClient(SEASON_ID_HARDCORE, PROJECT_CLASSIC)

    assert.is_false(season.IsSodActive())
    assert.are.equal("classic", season.GetActiveBranch())
  end)

  it("reports classic on a client without an active season", function()
    installClient(nil, PROJECT_CLASSIC)

    assert.is_false(season.IsSodActive())
    assert.is_false(season.IsTbcActive())
    assert.are.equal("classic", season.GetActiveBranch())
  end)

  it("reports tbc on the Burning Crusade Classic client", function()
    installClient(nil, PROJECT_BURNING_CRUSADE_CLASSIC)

    assert.is_true(season.IsTbcActive())
    assert.are.equal("tbc", season.GetActiveBranch())
  end)

  it("lets the test helper pick the branch while a test session is active", function()
    installClient(nil, PROJECT_CLASSIC)
    RGPVPW_ENVIRONMENT.TEST = true
    rgpvpw.testHelper = { GetActiveBranch = function() return "tbc" end }

    assert.are.equal("tbc", season.GetActiveBranch())
  end)
end)
