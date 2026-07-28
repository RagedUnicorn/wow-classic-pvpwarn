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
  Headless spec for profiles/Profile.lua (rgpvpw.profile), covering the validation rules that
  guard the PVPWarnProfiles store: name length, duplicate names and the profile count cap, on
  both the create path (me.CreateProfile) and the import path (me.AddImportedProfile).

  The name-length guard is the reason this spec exists. It counts utf-8 characters rather than
  bytes, which is exactly the kind of rule that looks right and silently truncates a localized
  name -- so both an ASCII and a multibyte name are pinned at the boundary.

  Loading mechanics: Profile.lua makes no WoW calls at load time, so a plain dofile suffices.
  At call time it reaches C_AddOns.GetAddOnMetadata (stamping the addon version onto a profile),
  which comes from WowStubs. The real localization strings are loaded by dofile'ing
  localization/enUS.lua rather than faking rgpvpw.L, so a removed or renamed key fails here too;
  rgpvpw.L is a deep field of the shared rgpvpw table that busted's file insulation does not roll
  back, so the original is restored after each test. The logger print path reaches mod.filter and
  C_AddOns which do not exist headlessly, so PrintUserError is replaced with a capturing stub and
  the Log* levels with no-ops.

  mod.configuration is not loaded by the bootstrap and is stubbed with a GetSpellConfiguration
  that hands back a recognizable per-spell-list table, so the snapshot a created profile takes
  can be asserted without a real configuration.
]]--

-- busted extends `assert` with .same / .equal / etc. at runtime; luacheck
-- cannot verify those fields statically. Suppress warning 143 (accessing
-- undefined field of a global variable) for this file.
-- luacheck: globals describe it before_each after_each
-- luacheck: ignore 143

local wowStubs = require("WowStubs")

local ADDON_VERSION = "0.0.0-test"
local MAX_PROFILES = 10

--[[
  A two-byte utf-8 character ("ä"), built from its bytes so the assertions do not depend on the
  encoding this source file happens to be saved in. A name made of these has twice as many bytes
  as characters, which is what separates a character count from a byte count.
]]--
local MULTIBYTE_CHAR = string.char(195, 164)

describe("profile", function()
  local profile
  local userErrors
  local restoreGlobals
  local originalLocalization
  local originalPrintUserError
  local originalLogWarn
  local originalLogInfo

  --[[
    @param {number} length
    @param {string} char
      the character to repeat, defaults to "a"

    @return {string}
      a profile name of exactly `length` characters
  ]]--
  local function nameOfLength(length, char)
    return string.rep(char or "a", length)
  end

  --[[
    @return {table}
      a payload shaped like the one carried inside a validated import envelope
  ]]--
  local function importPayload()
    return {
      spellConfiguration = { imported = "spellList" },
      spellSelfAvoidConfiguration = { imported = "spellSelfAvoidList" },
      spellEnemyAvoidConfiguration = { imported = "spellEnemyAvoidList" }
    }
  end

  before_each(function()
    restoreGlobals = wowStubs.install({
      GetLocale = wowStubs.stubs.GetLocale("enUS"),
      C_AddOns = wowStubs.stubs.C_AddOns({ Version = ADDON_VERSION })
    })

    originalLocalization = rgpvpw.L
    dofile("localization/enUS.lua")

    dofile("profiles/Profile.lua")
    profile = rgpvpw.profile

    userErrors = {}
    originalPrintUserError = rgpvpw.logger.PrintUserError
    originalLogWarn = rgpvpw.logger.LogWarn
    originalLogInfo = rgpvpw.logger.LogInfo
    rgpvpw.logger.PrintUserError = function(message)
      table.insert(userErrors, message)
    end
    rgpvpw.logger.LogWarn = function() end
    rgpvpw.logger.LogInfo = function() end

    rgpvpw.configuration = {
      GetSpellConfiguration = function(spellType)
        return { live = spellType }
      end
    }

    _G.PVPWarnProfiles = { activeProfile = RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME, modified = false }
  end)

  after_each(function()
    rgpvpw.logger.PrintUserError = originalPrintUserError
    rgpvpw.logger.LogWarn = originalLogWarn
    rgpvpw.logger.LogInfo = originalLogInfo
    rgpvpw.configuration = nil
    rgpvpw.profile = nil
    rgpvpw.L = originalLocalization
    _G.PVPWarnProfiles = nil
    restoreGlobals()
  end)

  describe("GetMaxProfileNameLength", function()
    it("returns the 30 character limit shared with the other addons", function()
      assert.are.equal(30, profile.GetMaxProfileNameLength())
    end)
  end)

  describe("CreateProfile", function()
    it("stores a snapshot of the live configuration and activates the new profile", function()
      profile.CreateProfile("Arena")

      assert.are.equal(1, #PVPWarnProfiles)
      assert.are.same({
        name = "Arena",
        version = ADDON_VERSION,
        spellConfiguration = { live = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL },
        spellSelfAvoidConfiguration = { live = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID },
        spellEnemyAvoidConfiguration = { live = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID }
      }, PVPWarnProfiles[1])
      assert.are.equal("Arena", PVPWarnProfiles.activeProfile)
      assert.is_false(PVPWarnProfiles.modified)
    end)

    it("stores nothing for an empty name", function()
      profile.CreateProfile("")

      assert.are.equal(0, #PVPWarnProfiles)
    end)

    it("accepts a name of exactly the maximum length", function()
      profile.CreateProfile(nameOfLength(profile.GetMaxProfileNameLength()))

      assert.are.equal(1, #PVPWarnProfiles)
      assert.are.same({}, userErrors)
    end)

    it("refuses a name one character over the maximum and stores nothing", function()
      profile.CreateProfile(nameOfLength(profile.GetMaxProfileNameLength() + 1))

      assert.are.equal(0, #PVPWarnProfiles)
      assert.are.equal(1, #userErrors)
      assert.are.equal(
        string.format(rgpvpw.L["user_message_profile_name_too_long"], profile.GetMaxProfileNameLength()),
        userErrors[1]
      )
    end)

    it("leaves the active profile untouched when it refuses an overlong name", function()
      profile.CreateProfile(nameOfLength(profile.GetMaxProfileNameLength() + 1))

      assert.are.equal(RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME, PVPWarnProfiles.activeProfile)
    end)

    it("counts characters not bytes - a maximum length multibyte name is accepted", function()
      local name = nameOfLength(profile.GetMaxProfileNameLength(), MULTIBYTE_CHAR)

      -- twice as many bytes as the limit, so a byte count would reject this name
      assert.are.equal(profile.GetMaxProfileNameLength() * 2, #name)

      profile.CreateProfile(name)

      assert.are.equal(1, #PVPWarnProfiles)
      assert.are.equal(name, PVPWarnProfiles[1].name)
    end)

    it("refuses a multibyte name that is one character over the maximum", function()
      profile.CreateProfile(nameOfLength(profile.GetMaxProfileNameLength() + 1, MULTIBYTE_CHAR))

      assert.are.equal(0, #PVPWarnProfiles)
      assert.are.equal(1, #userErrors)
    end)

    it("refuses a duplicate name", function()
      profile.CreateProfile("Arena")
      profile.CreateProfile("Arena")

      assert.are.equal(1, #PVPWarnProfiles)
      assert.are.equal(rgpvpw.L["user_message_select_profile_already_exists"], userErrors[1])
    end)

    it("refuses to create more than the maximum number of profiles", function()
      for index = 1, MAX_PROFILES do
        profile.CreateProfile("Profile" .. index)
      end

      profile.CreateProfile("OneTooMany")

      assert.are.equal(MAX_PROFILES, #PVPWarnProfiles)
      assert.are.equal(
        string.format(rgpvpw.L["user_message_add_new_profile_max_reached"], MAX_PROFILES),
        userErrors[1]
      )
    end)
  end)

  describe("AddImportedProfile", function()
    it("stores the imported payload without activating the profile", function()
      assert.is_true(profile.AddImportedProfile("Imported", importPayload()))

      assert.are.equal(1, #PVPWarnProfiles)
      assert.are.same({
        name = "Imported",
        version = ADDON_VERSION,
        spellConfiguration = { imported = "spellList" },
        spellSelfAvoidConfiguration = { imported = "spellSelfAvoidList" },
        spellEnemyAvoidConfiguration = { imported = "spellEnemyAvoidList" }
      }, PVPWarnProfiles[1])
      assert.are.equal(RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME, PVPWarnProfiles.activeProfile)
    end)

    it("accepts a name of exactly the maximum length", function()
      assert.is_true(
        profile.AddImportedProfile(nameOfLength(profile.GetMaxProfileNameLength()), importPayload())
      )

      assert.are.equal(1, #PVPWarnProfiles)
      assert.are.same({}, userErrors)
    end)

    it("refuses an envelope name over the maximum and stores nothing", function()
      assert.is_false(
        profile.AddImportedProfile(nameOfLength(profile.GetMaxProfileNameLength() + 1), importPayload())
      )

      assert.are.equal(0, #PVPWarnProfiles)
      assert.are.equal(1, #userErrors)
      assert.are.equal(
        string.format(rgpvpw.L["user_message_profile_name_too_long"], profile.GetMaxProfileNameLength()),
        userErrors[1]
      )
    end)

    it("counts characters not bytes - a maximum length multibyte name is accepted", function()
      local name = nameOfLength(profile.GetMaxProfileNameLength(), MULTIBYTE_CHAR)

      assert.is_true(profile.AddImportedProfile(name, importPayload()))

      assert.are.equal(name, PVPWarnProfiles[1].name)
    end)

    it("refuses a duplicate name", function()
      profile.CreateProfile("Arena")

      assert.is_false(profile.AddImportedProfile("Arena", importPayload()))
      assert.are.equal(1, #PVPWarnProfiles)
      assert.are.equal(rgpvpw.L["user_message_select_profile_already_exists"], userErrors[1])
    end)

    it("clones the payload so the stored profile does not alias the envelope", function()
      local payload = importPayload()

      profile.AddImportedProfile("Imported", payload)
      payload.spellConfiguration.imported = "mutated"

      assert.are.equal("spellList", PVPWarnProfiles[1].spellConfiguration.imported)
    end)
  end)
end)
