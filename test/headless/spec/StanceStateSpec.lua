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
  Headless spec for the stance tracker in code/StanceState.lua. The tracker is a file-local table
  keyed by target guid, so the module is re-dofile'd in before_each for an empty tracker. The
  collaborators are plain fakes on the namespace: mod.configuration and mod.target drive the
  gating, mod.stanceFrame records every paint so a case can assert both what was shown and that
  nothing was shown at all. GetTime comes from the WowStubs registry as a mutable clock (the
  expiry sweep advances it); UnitIsPlayer, UnitIsEnemy and GetSpellInfo are ad-hoc stubs -
  GetSpellInfo must return three values because UpdateStanceState reads the icon via select(3, ...).

  The tracker table itself is not reachable from the spec, so what it holds is asserted through the
  only window onto it: what UpdateStanceState paints for a given guid (see PaintedIconFor).

  Spell arguments are the minimal shape the tracker reads - the real ones are enriched clones from
  mod.spellMapHelper.SearchBySpellId, but only name and spellId are ever touched here.
]]--

-- busted extends `assert` with .same / .equal / etc. at runtime; luacheck
-- cannot verify those fields statically. Suppress warning 143 (accessing
-- undefined field of a global variable) for this file.
-- luacheck: globals describe it before_each after_each
-- luacheck: ignore 143

local wowStubs = require("WowStubs")

local TARGET_GUID = "Player-1-TARGET00"
local OTHER_GUID = "Player-1-OTHER000"

local CAT_FORM = { name = "Cat Form", spellId = 768 }
local BEAR_FORM = { name = "Bear Form", spellId = 5487 }
local DRUID_CATEGORY = "druid"

-- icon ids GetSpellInfo hands back per stance spell, distinct so a paint identifies the stance
local CAT_FORM_ICON = 132115
local BEAR_FORM_ICON = 132276
local SPELL_ICONS = {
  [CAT_FORM.spellId] = CAT_FORM_ICON,
  [BEAR_FORM.spellId] = BEAR_FORM_ICON
}

describe("stance state tracker", function()
  local stanceState
  local clock
  local restoreGlobals
  local frameCalls
  local currentTargetGuid
  local currentTargetClass
  local hideUnknownStance
  local originalLogDebug
  local originalLogInfo

  local function LastFrameCall()
    return frameCalls[#frameCalls]
  end

  --[[
    Repaint the frame for `guid` and report what it was told to show. Restores the previously
    selected target so a case can inspect a guid that is not the current target without
    disturbing the tracking path under test.

    @param {string} guid
    @return {table} the recorded frame call, e.g. { action = "update", iconId = 132115 }
  ]]--
  local function PaintedIconFor(guid)
    local previousTargetGuid = currentTargetGuid

    currentTargetGuid = guid
    frameCalls = {}
    stanceState.UpdateStanceState()
    currentTargetGuid = previousTargetGuid

    return LastFrameCall()
  end

  before_each(function()
    clock = { now = 100 }
    restoreGlobals = wowStubs.install({
      GetTime = wowStubs.stubs.GetTime(clock),
      UnitIsPlayer = function()
        return true
      end,
      UnitIsEnemy = function()
        return true
      end,
      -- name, rank, icon - UpdateStanceState pulls the icon out with select(3, ...)
      GetSpellInfo = function(spellId)
        return "Stance", "", SPELL_ICONS[spellId]
      end
    })

    dofile("code/StanceState.lua")
    stanceState = rgpvpw.stanceState

    originalLogDebug = rgpvpw.logger.LogDebug
    originalLogInfo = rgpvpw.logger.LogInfo
    rgpvpw.logger.LogDebug = function() end
    rgpvpw.logger.LogInfo = function() end

    hideUnknownStance = false
    rgpvpw.configuration = {
      IsStanceStateTrackingEnabled = function()
        return true
      end,
      IsHideUnknownStanceEnabled = function()
        return hideUnknownStance
      end
    }

    currentTargetGuid = TARGET_GUID
    currentTargetClass = "DRUID"
    rgpvpw.target = {
      GetCurrentTargetGuid = function()
        return currentTargetGuid
      end,
      GetCurrentTargetClass = function()
        return currentTargetClass
      end
    }

    frameCalls = {}
    rgpvpw.stanceFrame = {
      UpdateStanceStateUi = function(iconId)
        table.insert(frameCalls, { action = "update", iconId = iconId })
      end,
      HideStanceState = function()
        table.insert(frameCalls, { action = "hide" })
      end
    }
  end)

  after_each(function()
    restoreGlobals()
    rgpvpw.logger.LogDebug = originalLogDebug
    rgpvpw.logger.LogInfo = originalLogInfo
  end)

  it("tracks an applied stance and repaints for the current target", function()
    stanceState.TrackStanceApplied(CAT_FORM, TARGET_GUID, DRUID_CATEGORY)

    assert.same({ action = "update", iconId = CAT_FORM_ICON }, LastFrameCall())
  end)

  it("tracks an applied stance for another target without repainting", function()
    stanceState.TrackStanceApplied(CAT_FORM, OTHER_GUID, DRUID_CATEGORY)

    assert.equal(0, #frameCalls)
    assert.same({ action = "update", iconId = CAT_FORM_ICON }, PaintedIconFor(OTHER_GUID))
  end)

  it("ignores an application without a target or spell", function()
    stanceState.TrackStanceApplied(CAT_FORM, nil, DRUID_CATEGORY)
    stanceState.TrackStanceApplied(nil, TARGET_GUID, DRUID_CATEGORY)

    assert.equal(0, #frameCalls)
  end)

  it("clears the tracked stance on its removal and repaints", function()
    stanceState.TrackStanceApplied(CAT_FORM, TARGET_GUID, DRUID_CATEGORY)
    frameCalls = {}

    stanceState.TrackStanceRemoved(CAT_FORM, TARGET_GUID)

    assert.same(
      { action = "update", iconId = RGPVPW_CONSTANTS.STANCE_STATE_UNKNOWN_STANCE_ICON_ID },
      LastFrameCall()
    )
  end)

  --[[
    The PW-0054 guard. An unconditional clear here wiped the freshly applied stance of a swap;
    an early return that still repainted would flicker the icon, hence the no-frame-call assert.
  ]]--
  it("leaves the tracked stance and the frame alone on the removal of another stance", function()
    stanceState.TrackStanceApplied(CAT_FORM, TARGET_GUID, DRUID_CATEGORY)
    frameCalls = {}

    stanceState.TrackStanceRemoved(BEAR_FORM, TARGET_GUID)

    assert.equal(0, #frameCalls)
    assert.same({ action = "update", iconId = CAT_FORM_ICON }, PaintedIconFor(TARGET_GUID))
  end)

  it("does nothing on the removal of a stance for an untracked target", function()
    stanceState.TrackStanceRemoved(CAT_FORM, TARGET_GUID)

    assert.equal(0, #frameCalls)
  end)

  it("ends a swap on the new stance when the application arrives first", function()
    stanceState.TrackStanceApplied(CAT_FORM, TARGET_GUID, DRUID_CATEGORY)
    stanceState.TrackStanceApplied(BEAR_FORM, TARGET_GUID, DRUID_CATEGORY)
    stanceState.TrackStanceRemoved(CAT_FORM, TARGET_GUID)

    assert.same({ action = "update", iconId = BEAR_FORM_ICON }, PaintedIconFor(TARGET_GUID))
  end)

  it("ends a swap on the new stance when the removal arrives first", function()
    stanceState.TrackStanceApplied(CAT_FORM, TARGET_GUID, DRUID_CATEGORY)
    stanceState.TrackStanceRemoved(CAT_FORM, TARGET_GUID)
    stanceState.TrackStanceApplied(BEAR_FORM, TARGET_GUID, DRUID_CATEGORY)

    assert.same({ action = "update", iconId = BEAR_FORM_ICON }, PaintedIconFor(TARGET_GUID))
  end)

  it("drops expired tracked stances and keeps the fresh ones", function()
    stanceState.TrackStanceApplied(CAT_FORM, TARGET_GUID, DRUID_CATEGORY)
    clock.now = clock.now + 60
    stanceState.TrackStanceApplied(BEAR_FORM, OTHER_GUID, DRUID_CATEGORY)

    -- cat form is now 160s old (past the 120s timeout), bear form only 100s
    clock.now = clock.now + 100
    stanceState.CleanExpiredTrackedStances()

    assert.same(
      { action = "update", iconId = RGPVPW_CONSTANTS.STANCE_STATE_UNKNOWN_STANCE_ICON_ID },
      PaintedIconFor(TARGET_GUID)
    )
    assert.same({ action = "update", iconId = BEAR_FORM_ICON }, PaintedIconFor(OTHER_GUID))
  end)
end)
