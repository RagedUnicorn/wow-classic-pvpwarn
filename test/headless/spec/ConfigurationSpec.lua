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
  Headless spec for the combatState / stanceState configuration blocks in
  code/Configuration.lua - their defaults, the per-sub-key backfill and the one-time lift of
  the pre-v2.0.0 flat top-level keys.

  code/Configuration.lua assigns the PVPWarnConfiguration literal at load time, so the module
  is re-dofile'd in before_each and a spec that needs a "saved" table overwrites
  _G.PVPWarnConfiguration afterwards - which is what the SavedVariables load does in game.
  SetupConfiguration reaches C_AddOns through SetAddonVersion; the stub returns the same
  version the spec stores in addonVersion, so SetAddonVersion returns early and the unrelated
  profile upgrade paths stay out of the way. mod.combatState / mod.stanceState are not loaded
  by the bootstrap and are stubbed for the two accessors that notify them.
]]--

-- busted extends `assert` with .same / .equal / etc. at runtime; luacheck
-- cannot verify those fields statically. Suppress warning 143 (accessing
-- undefined field of a global variable) for this file.
-- luacheck: globals describe it before_each after_each
-- luacheck: ignore 143

local wowStubs = require("WowStubs")

local ADDON_VERSION = "v2.0.0"
local FIXTURE_V1_2_8 = "test/manual/fixtures/TC-SV-02-pvpwarn-v1.2.8.lua"

describe("configuration state blocks", function()
  local configuration
  local restoreGlobals
  local originalLogInfo
  local originalLogDebug

  --[[
    Replace the freshly loaded literal with a table shaped like a SavedVariables file that has
    already been through an earlier version, so only the keys under test are interesting.

    @param {table} overrides
      Keys written on top of the baseline

    @return {table}
      The installed PVPWarnConfiguration
  ]]--
  local function InstallSavedVariables(overrides)
    local saved = {
      spellList = {},
      spellSelfAvoidList = {},
      spellEnemyAvoidList = {},
      addonZoneConfiguration = {},
      frames = {},
      activeVoicePack = "default",
      lastNotifiedVersion = "",
      addonVersion = ADDON_VERSION
    }

    for key, value in pairs(overrides or {}) do
      saved[key] = value
    end

    _G.PVPWarnConfiguration = saved

    return saved
  end

  before_each(function()
    restoreGlobals = wowStubs.install({
      C_AddOns = {
        GetAddOnMetadata = function()
          return ADDON_VERSION
        end
      }
    })

    dofile("code/Configuration.lua")
    configuration = rgpvpw.configuration

    originalLogInfo = rgpvpw.logger.LogInfo
    originalLogDebug = rgpvpw.logger.LogDebug
    rgpvpw.logger.LogInfo = function() end
    rgpvpw.logger.LogDebug = function() end

    rgpvpw.combatState = {
      DisableCombatStateTracking = function() end
    }
    rgpvpw.stanceState = {
      EnableStanceStateTracking = function() end,
      DisableStanceStateTracking = function() end
    }
  end)

  after_each(function()
    rgpvpw.logger.LogInfo = originalLogInfo
    rgpvpw.logger.LogDebug = originalLogDebug
    restoreGlobals()
  end)

  describe("fresh install", function()
    it("ships a combatState block holding its documented sub-keys", function()
      assert.same(
        { enabled = true, locked = true },
        _G.PVPWarnConfiguration.combatState
      )
    end)

    it("ships a stanceState block holding its documented sub-keys", function()
      assert.same(
        { enabled = true, locked = true, hideUnknown = false },
        _G.PVPWarnConfiguration.stanceState
      )
    end)

    it("clones the defaults so a runtime write does not leak into the next load", function()
      _G.PVPWarnConfiguration.combatState.enabled = false
      _G.PVPWarnConfiguration.stanceState.hideUnknown = true

      dofile("code/Configuration.lua")

      assert.is_true(_G.PVPWarnConfiguration.combatState.enabled)
      assert.is_false(_G.PVPWarnConfiguration.stanceState.hideUnknown)
    end)
  end)

  describe("legacy flat key migration", function()
    it("lifts non-default flat values into the blocks", function()
      InstallSavedVariables({
        enableCombatStateTracking = false,
        lockCombatStateFrame = false,
        enableStanceStateTracking = false,
        lockStanceStateFrame = false,
        hideUnknownStance = true
      })

      configuration.SetupCombatStateConfiguration()
      configuration.SetupStanceStateConfiguration()

      assert.same(
        { enabled = false, locked = false },
        _G.PVPWarnConfiguration.combatState
      )
      assert.same(
        { enabled = false, locked = false, hideUnknown = true },
        _G.PVPWarnConfiguration.stanceState
      )
    end)

    it("removes the five flat keys once SetupConfiguration ran", function()
      InstallSavedVariables({
        enableCombatStateTracking = true,
        lockCombatStateFrame = false,
        enableStanceStateTracking = true,
        lockStanceStateFrame = false,
        hideUnknownStance = true
      })

      configuration.SetupConfiguration()

      assert.is_nil(_G.PVPWarnConfiguration.enableCombatStateTracking)
      assert.is_nil(_G.PVPWarnConfiguration.lockCombatStateFrame)
      assert.is_nil(_G.PVPWarnConfiguration.enableStanceStateTracking)
      assert.is_nil(_G.PVPWarnConfiguration.lockStanceStateFrame)
      assert.is_nil(_G.PVPWarnConfiguration.hideUnknownStance)
    end)

    it("keeps the value already in the block and still clears the flat key", function()
      InstallSavedVariables({
        combatState = { enabled = false, locked = false },
        enableCombatStateTracking = true,
        lockCombatStateFrame = true
      })

      configuration.SetupCombatStateConfiguration()

      assert.is_false(_G.PVPWarnConfiguration.combatState.enabled)
      assert.is_false(_G.PVPWarnConfiguration.combatState.locked)
      assert.is_nil(_G.PVPWarnConfiguration.enableCombatStateTracking)
      assert.is_nil(_G.PVPWarnConfiguration.lockCombatStateFrame)
    end)

    it("carries the v1.2.8 fixture across without resetting its values", function()
      dofile(FIXTURE_V1_2_8)
      _G.PVPWarnConfiguration.addonVersion = ADDON_VERSION

      --[[ the fixture predates the blocks entirely - both flat keys, no combatState ]]--
      assert.is_nil(_G.PVPWarnConfiguration.combatState)

      configuration.SetupCombatStateConfiguration()
      configuration.SetupStanceStateConfiguration()

      assert.is_true(_G.PVPWarnConfiguration.combatState.enabled)
      assert.is_true(_G.PVPWarnConfiguration.combatState.locked)
      assert.is_nil(_G.PVPWarnConfiguration.enableCombatStateTracking)
      assert.is_nil(_G.PVPWarnConfiguration.lockCombatStateFrame)
      --[[ the fixture carries no stance keys at all - the block lands on its defaults ]]--
      assert.same(
        { enabled = true, locked = true, hideUnknown = false },
        _G.PVPWarnConfiguration.stanceState
      )
    end)
  end)

  describe("per sub-key backfill", function()
    it("restores a single deleted sub-key and leaves the others untouched", function()
      InstallSavedVariables({
        stanceState = { enabled = false, hideUnknown = true }
      })

      configuration.SetupStanceStateConfiguration()

      assert.same(
        { enabled = false, locked = true, hideUnknown = true },
        _G.PVPWarnConfiguration.stanceState
      )
    end)

    it("creates the block when it is missing entirely", function()
      InstallSavedVariables({})

      configuration.SetupCombatStateConfiguration()

      assert.same(
        { enabled = true, locked = true },
        _G.PVPWarnConfiguration.combatState
      )
    end)
  end)

  describe("accessors", function()
    before_each(function()
      InstallSavedVariables({})
      configuration.SetupCombatStateConfiguration()
      configuration.SetupStanceStateConfiguration()
    end)

    it("reads and writes combat state tracking through the block", function()
      configuration.DisableCombatStateTracking()

      assert.is_false(_G.PVPWarnConfiguration.combatState.enabled)
      assert.is_false(configuration.IsCombatStateTrackingEnabled())

      configuration.EnableCombatStateTracking()

      assert.is_true(_G.PVPWarnConfiguration.combatState.enabled)
      assert.is_true(configuration.IsCombatStateTrackingEnabled())
    end)

    it("reads and writes the combat state frame lock through the block", function()
      configuration.UnlockCombatStateFrame()

      assert.is_false(_G.PVPWarnConfiguration.combatState.locked)
      assert.is_false(configuration.IsCombatStateFrameLocked())

      configuration.LockCombatStateFrame()

      assert.is_true(_G.PVPWarnConfiguration.combatState.locked)
      assert.is_true(configuration.IsCombatStateFrameLocked())
    end)

    it("reads and writes stance state tracking through the block", function()
      configuration.DisableStanceStateTracking()

      assert.is_false(_G.PVPWarnConfiguration.stanceState.enabled)
      assert.is_false(configuration.IsStanceStateTrackingEnabled())

      configuration.EnableStanceStateTracking()

      assert.is_true(_G.PVPWarnConfiguration.stanceState.enabled)
      assert.is_true(configuration.IsStanceStateTrackingEnabled())
    end)

    it("reads and writes the stance state frame lock through the block", function()
      configuration.UnlockStanceStateFrame()

      assert.is_false(_G.PVPWarnConfiguration.stanceState.locked)
      assert.is_false(configuration.IsStanceStateFrameLocked())

      configuration.LockStanceStateFrame()

      assert.is_true(_G.PVPWarnConfiguration.stanceState.locked)
      assert.is_true(configuration.IsStanceStateFrameLocked())
    end)

    it("reads and writes hide unknown stance through the block", function()
      configuration.EnableHideUnknownStance()

      assert.is_true(_G.PVPWarnConfiguration.stanceState.hideUnknown)
      assert.is_true(configuration.IsHideUnknownStanceEnabled())

      configuration.DisableHideUnknownStance()

      assert.is_false(_G.PVPWarnConfiguration.stanceState.hideUnknown)
      assert.is_false(configuration.IsHideUnknownStanceEnabled())
    end)
  end)
end)
