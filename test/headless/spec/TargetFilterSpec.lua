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
  Headless spec for the target filter: ShouldWarnForTarget in code/CombatLog.lua (the
  combat-log gate) and code/TargetFilter.lua (the enemy-gated target tracker). CombatLog
  keeps a file-local cached player GUID and TargetFilter a file-local target GUID, so both
  modules are re-dofile'd in before_each. The configuration mode getter is a stub driven
  by a plain local; UnitGUID/UnitIsEnemy come from the WowStubs registry as ad-hoc stubs.
  CLEU varargs are built with index 4 = sourceGUID and index 8 = destGUID, matching the
  real combat log event payload.
]]--

-- busted extends `assert` with .same / .equal / etc. at runtime; luacheck
-- cannot verify those fields statically. Suppress warning 143 (accessing
-- undefined field of a global variable) for this file.
-- luacheck: globals describe it before_each after_each
-- luacheck: ignore 143

local wowStubs = require("WowStubs")

local PLAYER_GUID = "Player-1-PLAYER00"
local TARGET_GUID = "Player-1-TARGET00"
local OTHER_GUID = "Player-1-OTHER000"
local THIRD_GUID = "Player-1-THIRD000"

describe("target filter combat log gate", function()
  local combatLog
  local warnMode
  local currentTargetGuid
  local restoreGlobals
  local originalLogDebug

  --[[
    Build CLEU varargs shaped like the real payload: index 4 = sourceGUID, 8 = destGUID.
  ]]--
  local function ShouldWarn(sourceGuid, destGuid)
    return combatLog.ShouldWarnForTarget(
      1234567890.123,        -- 1 timestamp
      "SPELL_CAST_SUCCESS",  -- 2 event
      false,                 -- 3 hideCaster
      sourceGuid,            -- 4 sourceGUID
      "Enemyplayer",         -- 5 sourceName
      0x548,                 -- 6 sourceFlags
      0,                     -- 7 sourceRaidFlags
      destGuid,              -- 8 destGUID
      "Destplayer",          -- 9 destName
      0x511,                 -- 10 destFlags
      0,                     -- 11 destRaidFlags
      12345,                 -- 12 spellId
      "Polymorph",           -- 13 spellName
      64                     -- 14 spellSchool
    )
  end

  before_each(function()
    restoreGlobals = wowStubs.install({
      UnitGUID = function()
        return PLAYER_GUID
      end
    })

    dofile("code/CombatLog.lua")
    combatLog = rgpvpw.combatLog

    originalLogDebug = rgpvpw.logger.LogDebug
    rgpvpw.logger.LogDebug = function() end

    warnMode = RGPVPW_CONSTANTS.TARGET_FILTER_MODE_WARN_ALL
    rgpvpw.configuration = {
      GetTargetFilterMode = function()
        return warnMode
      end
    }

    currentTargetGuid = TARGET_GUID
    rgpvpw.targetFilter = {
      GetCurrentTargetGuid = function()
        return currentTargetGuid
      end
    }
  end)

  after_each(function()
    restoreGlobals()
    rgpvpw.logger.LogDebug = originalLogDebug
  end)

  it("passes every event through in warnAll mode", function()
    assert.is_true(ShouldWarn(OTHER_GUID, THIRD_GUID))
  end)

  it("suppresses an event unrelated to the current target in currentTarget mode", function()
    warnMode = RGPVPW_CONSTANTS.TARGET_FILTER_MODE_CURRENT_TARGET

    assert.is_false(ShouldWarn(OTHER_GUID, THIRD_GUID))
  end)

  it("passes an event whose source is the current target in currentTarget mode", function()
    warnMode = RGPVPW_CONSTANTS.TARGET_FILTER_MODE_CURRENT_TARGET

    assert.is_true(ShouldWarn(TARGET_GUID, OTHER_GUID))
  end)

  it("passes an event whose destination is the current target in currentTarget mode", function()
    warnMode = RGPVPW_CONSTANTS.TARGET_FILTER_MODE_CURRENT_TARGET

    assert.is_true(ShouldWarn(OTHER_GUID, TARGET_GUID))
  end)

  it("always passes an event cast at the player in currentTarget mode", function()
    warnMode = RGPVPW_CONSTANTS.TARGET_FILTER_MODE_CURRENT_TARGET

    assert.is_true(ShouldWarn(OTHER_GUID, PLAYER_GUID))
  end)

  it("fails open for an event with an empty source in currentTarget mode", function()
    warnMode = RGPVPW_CONSTANTS.TARGET_FILTER_MODE_CURRENT_TARGET

    assert.is_true(ShouldWarn("", OTHER_GUID))
  end)

  it("fails open for an event with a nil source in currentTarget mode", function()
    warnMode = RGPVPW_CONSTANTS.TARGET_FILTER_MODE_CURRENT_TARGET

    -- nil source built by hand: SelectMultiple's unpack cannot carry a nil hole,
    -- so only the destination index (8) is populated after the gap
    assert.is_true(combatLog.ShouldWarnForTarget(
      1234567890.123, "SPELL_CAST_SUCCESS", false, nil, nil, 0x548, 0, OTHER_GUID
    ))
  end)

  it("suppresses an unrelated event when no enemy target is selected", function()
    warnMode = RGPVPW_CONSTANTS.TARGET_FILTER_MODE_CURRENT_TARGET
    currentTargetGuid = nil

    assert.is_false(ShouldWarn(OTHER_GUID, THIRD_GUID))
  end)

  it("still passes a spell cast at the player when no enemy target is selected", function()
    warnMode = RGPVPW_CONSTANTS.TARGET_FILTER_MODE_CURRENT_TARGET
    currentTargetGuid = nil

    assert.is_true(ShouldWarn(OTHER_GUID, PLAYER_GUID))
  end)

  it("never treats a nil target as matching a nil-adjacent guid", function()
    warnMode = RGPVPW_CONSTANTS.TARGET_FILTER_MODE_CURRENT_TARGET
    currentTargetGuid = nil

    -- empty source still fails open, so use a known unrelated source with an empty dest
    assert.is_false(ShouldWarn(OTHER_GUID, ""))
  end)
end)

describe("target filter tracker", function()
  local targetFilter
  local isEnemy
  local targetGuid
  local restoreGlobals
  local originalLogDebug

  before_each(function()
    isEnemy = false
    targetGuid = nil
    restoreGlobals = wowStubs.install({
      UnitIsEnemy = function()
        return isEnemy
      end,
      UnitGUID = function()
        return targetGuid
      end
    })

    dofile("code/TargetFilter.lua")
    targetFilter = rgpvpw.targetFilter

    originalLogDebug = rgpvpw.logger.LogDebug
    rgpvpw.logger.LogDebug = function() end
  end)

  after_each(function()
    restoreGlobals()
    rgpvpw.logger.LogDebug = originalLogDebug
  end)

  it("starts with no tracked target", function()
    assert.is_nil(targetFilter.GetCurrentTargetGuid())
  end)

  it("records the target guid when the target is an enemy", function()
    isEnemy = true
    targetGuid = TARGET_GUID

    targetFilter.UpdateCurrentTarget()

    assert.equal(TARGET_GUID, targetFilter.GetCurrentTargetGuid())
  end)

  it("does not record a friendly target", function()
    isEnemy = false
    targetGuid = OTHER_GUID

    targetFilter.UpdateCurrentTarget()

    assert.is_nil(targetFilter.GetCurrentTargetGuid())
  end)

  it("clears the tracked guid when the enemy target is dropped", function()
    isEnemy = true
    targetGuid = TARGET_GUID
    targetFilter.UpdateCurrentTarget()

    isEnemy = false
    targetGuid = nil
    targetFilter.UpdateCurrentTarget()

    assert.is_nil(targetFilter.GetCurrentTargetGuid())
  end)
end)
