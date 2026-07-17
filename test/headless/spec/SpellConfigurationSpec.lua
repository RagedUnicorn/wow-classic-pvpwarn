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
  Headless spec for code/SpellConfiguration.lua (rgpvpw.spellConfiguration). The logger print path
  reaches mod.filter and C_AddOns which do not exist headlessly, so LogError/LogInfo/LogDebug are
  replaced with capturing stubs per test. mod.profile and mod.spellMap are not loaded by the
  bootstrap and are stubbed with a SetModified counter and a controllable GetSpellMetadata result.

  RGPVPW_ENVIRONMENT.TEST stays false (bootstrap default) so IsOptionActive does not short-circuit
  to true; the short-circuit itself is pinned in a dedicated test. Argument-validation tests assert
  on the throw behavior only, not on the exact assert message text.
]]--

-- busted extends `assert` with .same / .equal / etc. at runtime; luacheck
-- cannot verify those fields statically. Suppress warning 143 (accessing
-- undefined field of a global variable) for this file.
-- luacheck: globals describe it before_each after_each
-- luacheck: ignore 143

local SPELL_LISTS = { "spellList", "spellSelfAvoidList", "spellEnemyAvoidList" }

describe("spellConfiguration", function()
  local spellConfiguration
  local loggedErrors
  local setModifiedCount
  local spellMetadataResult
  local originalLogError
  local originalLogInfo
  local originalLogDebug

  before_each(function()
    _G.PVPWarnConfiguration = {
      spellList = {},
      spellSelfAvoidList = {},
      spellEnemyAvoidList = {}
    }

    dofile("code/SpellConfiguration.lua")
    spellConfiguration = rgpvpw.spellConfiguration

    loggedErrors = {}
    originalLogError = rgpvpw.logger.LogError
    originalLogInfo = rgpvpw.logger.LogInfo
    originalLogDebug = rgpvpw.logger.LogDebug
    rgpvpw.logger.LogError = function(tag, message)
      table.insert(loggedErrors, { tag = tag, message = message })
    end
    rgpvpw.logger.LogInfo = function() end
    rgpvpw.logger.LogDebug = function() end

    setModifiedCount = 0
    rgpvpw.profile = {
      SetModified = function()
        setModifiedCount = setModifiedCount + 1
      end
    }

    spellMetadataResult = nil
    rgpvpw.spellMap = {
      GetSpellMetadata = function()
        return spellMetadataResult
      end
    }
  end)

  after_each(function()
    rgpvpw.logger.LogError = originalLogError
    rgpvpw.logger.LogInfo = originalLogInfo
    rgpvpw.logger.LogDebug = originalLogDebug
    rgpvpw.profile = nil
    rgpvpw.spellMap = nil
    _G.PVPWarnConfiguration = nil
  end)

  describe("GetDefaultSpellConfiguration", function()
    it("returns the default option trio with the default color", function()
      local spellConfig = spellConfiguration.GetDefaultSpellConfiguration()

      assert.are.same({
        spellActive = false,
        soundWarningActive = false,
        visualWarningColor = RGPVPW_CONSTANTS.DEFAULT_COLOR
      }, spellConfig)
    end)

    it("returns a fresh table on every call", function()
      assert.are_not.equal(
        spellConfiguration.GetDefaultSpellConfiguration(),
        spellConfiguration.GetDefaultSpellConfiguration()
      )
    end)
  end)

  describe("SetupPrerequisiteForOptionEntry", function()
    it("creates list, category and spell levels with the default config in every spell list", function()
      for _, spellList in ipairs(SPELL_LISTS) do
        PVPWarnConfiguration[spellList] = nil

        spellConfiguration.SetupPrerequisiteForOptionEntry(spellList, "priest", 8122)

        assert.are.same(
          spellConfiguration.GetDefaultSpellConfiguration(),
          PVPWarnConfiguration[spellList].priest[8122]
        )
      end
    end)

    it("adds soundFadeWarningActive when the spell metadata has hasFade", function()
      spellMetadataResult = { hasFade = true }

      spellConfiguration.SetupPrerequisiteForOptionEntry("spellList", "priest", 8122)

      local spell = PVPWarnConfiguration.spellList.priest[8122]

      assert.is_false(spell.soundFadeWarningActive)
      assert.is_nil(spell.soundStartWarningActive)
    end)

    it("adds soundStartWarningActive when the spell metadata has hasCast", function()
      spellMetadataResult = { hasCast = true }

      spellConfiguration.SetupPrerequisiteForOptionEntry("spellList", "priest", 8122)

      local spell = PVPWarnConfiguration.spellList.priest[8122]

      assert.is_false(spell.soundStartWarningActive)
      assert.is_nil(spell.soundFadeWarningActive)
    end)

    it("adds both extras when the spell metadata has hasFade and hasCast", function()
      spellMetadataResult = { hasFade = true, hasCast = true }

      spellConfiguration.SetupPrerequisiteForOptionEntry("spellList", "priest", 8122)

      local spell = PVPWarnConfiguration.spellList.priest[8122]

      assert.is_false(spell.soundFadeWarningActive)
      assert.is_false(spell.soundStartWarningActive)
    end)

    it("does not overwrite an already existing spell entry", function()
      PVPWarnConfiguration.spellList.priest = {
        [8122] = { spellActive = true, soundWarningActive = true, visualWarningColor = 3 }
      }

      spellConfiguration.SetupPrerequisiteForOptionEntry("spellList", "priest", 8122)

      assert.are.same(
        { spellActive = true, soundWarningActive = true, visualWarningColor = 3 },
        PVPWarnConfiguration.spellList.priest[8122]
      )
    end)
  end)

  describe("GetSpellEntry", function()
    it("returns nil when list, category or spell is missing", function()
      assert.is_nil(spellConfiguration.GetSpellEntry("spellList", "priest", 8122))

      PVPWarnConfiguration.spellList.priest = {}

      assert.is_nil(spellConfiguration.GetSpellEntry("spellList", "priest", 8122))
    end)

    it("returns the stored entry when present", function()
      spellConfiguration.SetupPrerequisiteForOptionEntry("spellList", "priest", 8122)

      assert.are.equal(
        PVPWarnConfiguration.spellList.priest[8122],
        spellConfiguration.GetSpellEntry("spellList", "priest", 8122)
      )
    end)

    it("throws on a non-number spellId", function()
      assert.has_error(function()
        spellConfiguration.GetSpellEntry("spellList", "priest", "8122")
      end)
    end)
  end)

  describe("ToggleOption", function()
    it("creates the entry and flips the option back and forth", function()
      spellConfiguration.ToggleOption("spellList", "priest", 8122, "Psychic Scream", "spellActive")

      assert.is_true(PVPWarnConfiguration.spellList.priest[8122].spellActive)

      spellConfiguration.ToggleOption("spellList", "priest", 8122, "Psychic Scream", "spellActive")

      assert.is_false(PVPWarnConfiguration.spellList.priest[8122].spellActive)
      assert.are.equal(2, setModifiedCount)
      assert.are.equal(0, #loggedErrors)
    end)

    it("logs and skips without throwing when the option is not a boolean", function()
      spellConfiguration.ToggleOption("spellList", "priest", 8122, "Psychic Scream", "bogusOption")

      assert.are.equal(1, #loggedErrors)
      assert.matches("Option 'bogusOption' is not a boolean", loggedErrors[1].message)
      assert.are.equal(0, setModifiedCount)
      assert.is_nil(PVPWarnConfiguration.spellList.priest[8122].bogusOption)
    end)
  end)

  describe("IsOptionActive", function()
    it("returns false for a missing spell entry", function()
      assert.is_false(spellConfiguration.IsOptionActive("spellList", "priest", 8122, "spellActive"))
    end)

    it("reflects the stored boolean state", function()
      spellConfiguration.ToggleOption("spellList", "priest", 8122, "Psychic Scream", "spellActive")

      assert.is_true(spellConfiguration.IsOptionActive("spellList", "priest", 8122, "spellActive"))
      assert.is_false(spellConfiguration.IsOptionActive("spellList", "priest", 8122, "soundWarningActive"))
    end)

    it("throws on a non-number spellId", function()
      assert.has_error(function()
        spellConfiguration.IsOptionActive("spellList", "priest", "8122", "spellActive")
      end)
    end)

    it("short-circuits to true when RGPVPW_ENVIRONMENT.TEST is set", function()
      RGPVPW_ENVIRONMENT.TEST = true

      local active = spellConfiguration.IsOptionActive("spellList", "priest", 8122, "spellActive")

      RGPVPW_ENVIRONMENT.TEST = false

      assert.is_true(active)
    end)
  end)

  describe("visual warning color", function()
    it("falls back to the default color for a missing spell entry", function()
      assert.are.equal(
        RGPVPW_CONSTANTS.DEFAULT_COLOR,
        spellConfiguration.GetVisualWarningColor("spellList", "priest", 8122)
      )
    end)

    it("throws on a non-number spellId", function()
      assert.has_error(function()
        spellConfiguration.GetVisualWarningColor("spellList", "priest", "8122")
      end)
    end)

    it("updates the color, creates the prerequisite entry and marks the profile modified", function()
      spellConfiguration.UpdateVisualWarningColor("spellSelfAvoidList", "priest", 8122, "Psychic Scream", 3)

      assert.are.equal(3, PVPWarnConfiguration.spellSelfAvoidList.priest[8122].visualWarningColor)
      assert.are.equal(1, setModifiedCount)
      assert.are.equal(3, spellConfiguration.GetVisualWarningColor("spellSelfAvoidList", "priest", 8122))
    end)

    it("reports the visual warning inactive for a missing entry or the default color", function()
      assert.is_false(spellConfiguration.IsVisualWarningActive("spellList", "priest", 8122))

      spellConfiguration.SetupPrerequisiteForOptionEntry("spellList", "priest", 8122)

      assert.is_false(spellConfiguration.IsVisualWarningActive("spellList", "priest", 8122))
    end)

    it("reports the visual warning active for a non-default color", function()
      spellConfiguration.UpdateVisualWarningColor("spellList", "priest", 8122, "Psychic Scream", 3)

      assert.is_true(spellConfiguration.IsVisualWarningActive("spellList", "priest", 8122))
    end)
  end)

  describe("option wrappers", function()
    it("ToggleSpellState and IsSpellActive target spellActive", function()
      spellConfiguration.ToggleSpellState("spellList", "priest", 8122, "Psychic Scream")

      assert.is_true(PVPWarnConfiguration.spellList.priest[8122].spellActive)
      assert.is_true(spellConfiguration.IsSpellActive("spellList", "priest", 8122))
    end)

    it("ToggleSoundWarning and IsSoundWarningActive target soundWarningActive", function()
      spellConfiguration.ToggleSoundWarning("spellSelfAvoidList", "priest", 8122, "Psychic Scream")

      assert.is_true(PVPWarnConfiguration.spellSelfAvoidList.priest[8122].soundWarningActive)
      assert.is_true(spellConfiguration.IsSoundWarningActive("spellSelfAvoidList", "priest", 8122))
    end)

    it("ToggleSoundFadeWarning and IsSoundFadeWarningActive target soundFadeWarningActive", function()
      spellMetadataResult = { hasFade = true }

      spellConfiguration.ToggleSoundFadeWarning("spellEnemyAvoidList", "priest", 8122, "Psychic Scream")

      assert.is_true(PVPWarnConfiguration.spellEnemyAvoidList.priest[8122].soundFadeWarningActive)
      assert.is_true(spellConfiguration.IsSoundFadeWarningActive("spellEnemyAvoidList", "priest", 8122))
    end)

    it("ToggleSoundStartWarning and IsSoundStartWarningActive target soundStartWarningActive", function()
      spellMetadataResult = { hasCast = true }

      spellConfiguration.ToggleSoundStartWarning("spellList", "mage", 116, "Frostbolt")

      assert.is_true(PVPWarnConfiguration.spellList.mage[116].soundStartWarningActive)
      assert.is_true(spellConfiguration.IsSoundStartWarningActive("spellList", "mage", 116))
    end)
  end)
end)
