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
  Headless spec for profiles/Profile.lua (rgpvpw.profile): the validation rules that guard the
  PVPWarnProfiles store (name length, duplicate names, the profile count cap, the reserved
  Default name) on the create, rename and import paths, and the live active profile model - the
  mirror into the active profile (SaveActiveProfile), the switch that mirrors first, the
  login adoption (EnsureDefaultProfile / EnsureActiveProfile), the reset to the class factory
  lists and the delete-active fallback to Default.

  The name-length guard counts utf-8 characters rather than bytes, which is exactly the kind of
  rule that looks right and silently truncates a localized name -- so both an ASCII and a
  multibyte name are pinned at the boundary.

  Loading mechanics: Profile.lua makes no WoW calls at load time, so a plain dofile suffices.
  At call time it reaches C_AddOns.GetAddOnMetadata (stamping the addon version onto a profile),
  UnitClass / strlower (seeding the class factory profile) and table.wipe (the store wipe of
  InitializeDefaultProfile), stubbed through WowStubs or as plain globals per test. The
  real localization strings are loaded by dofile'ing localization/enUS.lua rather than faking
  rgpvpw.L, so a removed or renamed key fails here too; rgpvpw.L is a deep field of the shared
  rgpvpw table that busted's file insulation does not roll back, so the original is restored
  after each test. The logger print path reaches mod.filter and C_AddOns which do not exist
  headlessly, so PrintUserError is replaced with a capturing stub and the Log* levels with no-ops.

  mod.configuration is not loaded by the bootstrap and is stubbed with a GetSpellConfiguration
  that hands back a clone of the live list, and mod.warriorProfile with a GetSpellProfile that
  hands back a recognizable factory list per spell type - so what a created profile snapshots,
  what a reset restores and what the mirror writes can each be told apart.
]]--

-- busted extends `assert` with .same / .equal / etc. at runtime; luacheck
-- cannot verify those fields statically. Suppress warning 143 (accessing
-- undefined field of a global variable) for this file.
-- luacheck: globals describe it before_each after_each table.wipe
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
  local originalTableWipe
  local DEFAULT

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

  --[[
    @param {string} name
    @param {string} marker
      the value every list of the stored profile carries, defaults to the name

    @return {table}
      a stored profile whose three lists are recognizable by the marker
  ]]--
  local function storedProfile(name, marker)
    marker = marker or name

    return {
      name = name,
      version = ADDON_VERSION,
      spellConfiguration = { stored = marker },
      spellSelfAvoidConfiguration = { stored = marker },
      spellEnemyAvoidConfiguration = { stored = marker }
    }
  end

  --[[
    @param {string} marker

    @return {table}
      the three live lists of a PVPWarnConfiguration, recognizable by the marker
  ]]--
  local function liveLists(marker)
    return {
      spellList = { live = marker },
      spellSelfAvoidList = { live = marker },
      spellEnemyAvoidList = { live = marker }
    }
  end

  --[[
    @param {string} name

    @return {table | nil}
      the stored profile with that name
  ]]--
  local function findStored(name)
    for i = 1, #PVPWarnProfiles do
      if PVPWarnProfiles[i].name == name then
        return PVPWarnProfiles[i]
      end
    end

    return nil
  end

  before_each(function()
    restoreGlobals = wowStubs.install({
      GetLocale = wowStubs.stubs.GetLocale("enUS"),
      C_AddOns = wowStubs.stubs.C_AddOns({ Version = ADDON_VERSION }),
      UnitClass = function()
        return "Warrior", "WARRIOR"
      end,
      -- WoW's global alias of string.lower, used to derive the class profile module name
      strlower = string.lower
    })

    -- WoW's table.wipe, reached by InitializeDefaultProfile
    originalTableWipe = table.wipe
    table.wipe = function(t)
      for key in pairs(t) do
        t[key] = nil
      end

      return t
    end

    originalLocalization = rgpvpw.L
    dofile("localization/enUS.lua")

    dofile("profiles/Profile.lua")
    profile = rgpvpw.profile
    DEFAULT = RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME

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
        return rgpvpw.common.Clone(PVPWarnConfiguration[spellType])
      end
    }
    rgpvpw.warriorProfile = {
      GetSpellProfile = function(spellType)
        return { factory = spellType }
      end
    }

    _G.PVPWarnConfiguration = liveLists("initial")
    _G.PVPWarnProfiles = { storedProfile(DEFAULT), activeProfile = DEFAULT }
  end)

  after_each(function()
    rgpvpw.logger.PrintUserError = originalPrintUserError
    rgpvpw.logger.LogWarn = originalLogWarn
    rgpvpw.logger.LogInfo = originalLogInfo
    rgpvpw.configuration = nil
    rgpvpw.warriorProfile = nil
    rgpvpw.profile = nil
    rgpvpw.L = originalLocalization
    _G.PVPWarnConfiguration = nil
    _G.PVPWarnProfiles = nil
    table.wipe = originalTableWipe
    restoreGlobals()
  end)

  describe("GetMaxProfileNameLength", function()
    it("returns the 30 character limit shared with the other addons", function()
      assert.are.equal(30, profile.GetMaxProfileNameLength())
    end)
  end)

  describe("CreateProfile", function()
    it("stores a snapshot of the live configuration and activates the new profile", function()
      assert.is_true(profile.CreateProfile("Arena"))

      assert.are.equal(2, #PVPWarnProfiles)
      assert.are.same({
        name = "Arena",
        version = ADDON_VERSION,
        spellConfiguration = { live = "initial" },
        spellSelfAvoidConfiguration = { live = "initial" },
        spellEnemyAvoidConfiguration = { live = "initial" }
      }, PVPWarnProfiles[2])
      assert.are.equal("Arena", PVPWarnProfiles.activeProfile)
    end)

    it("mirrors the live configuration into the profile that was active first", function()
      PVPWarnConfiguration.spellList.edited = true

      profile.CreateProfile("Arena")

      assert.are.same({ live = "initial", edited = true }, findStored(DEFAULT).spellConfiguration)
    end)

    it("stores nothing for an empty name", function()
      assert.is_false(profile.CreateProfile(""))

      assert.are.equal(1, #PVPWarnProfiles)
    end)

    it("accepts a name of exactly the maximum length", function()
      profile.CreateProfile(nameOfLength(profile.GetMaxProfileNameLength()))

      assert.are.equal(2, #PVPWarnProfiles)
      assert.are.same({}, userErrors)
    end)

    it("refuses a name one character over the maximum and stores nothing", function()
      assert.is_false(profile.CreateProfile(nameOfLength(profile.GetMaxProfileNameLength() + 1)))

      assert.are.equal(1, #PVPWarnProfiles)
      assert.are.equal(1, #userErrors)
      assert.are.equal(
        string.format(rgpvpw.L["user_message_profile_name_too_long"], profile.GetMaxProfileNameLength()),
        userErrors[1]
      )
    end)

    it("leaves the active profile untouched when it refuses an overlong name", function()
      profile.CreateProfile(nameOfLength(profile.GetMaxProfileNameLength() + 1))

      assert.are.equal(DEFAULT, PVPWarnProfiles.activeProfile)
    end)

    it("counts characters not bytes - a maximum length multibyte name is accepted", function()
      local name = nameOfLength(profile.GetMaxProfileNameLength(), MULTIBYTE_CHAR)

      -- twice as many bytes as the limit, so a byte count would reject this name
      assert.are.equal(profile.GetMaxProfileNameLength() * 2, #name)

      profile.CreateProfile(name)

      assert.are.equal(2, #PVPWarnProfiles)
      assert.are.equal(name, PVPWarnProfiles[2].name)
    end)

    it("refuses a multibyte name that is one character over the maximum", function()
      profile.CreateProfile(nameOfLength(profile.GetMaxProfileNameLength() + 1, MULTIBYTE_CHAR))

      assert.are.equal(1, #PVPWarnProfiles)
      assert.are.equal(1, #userErrors)
    end)

    it("refuses a duplicate name", function()
      profile.CreateProfile("Arena")
      assert.is_false(profile.CreateProfile("Arena"))

      assert.are.equal(2, #PVPWarnProfiles)
      assert.are.equal(rgpvpw.L["user_message_select_profile_already_exists"], userErrors[1])
    end)

    it("refuses the reserved default name like any taken name", function()
      assert.is_false(profile.CreateProfile(DEFAULT))

      assert.are.equal(1, #PVPWarnProfiles)
      assert.are.equal(rgpvpw.L["user_message_select_profile_already_exists"], userErrors[1])
    end)

    it("refuses to create more than the maximum number of profiles", function()
      for index = 1, MAX_PROFILES - 1 do
        profile.CreateProfile("Profile" .. index)
      end

      assert.is_false(profile.CreateProfile("OneTooMany"))

      assert.are.equal(MAX_PROFILES, #PVPWarnProfiles)
      assert.are.equal(
        string.format(rgpvpw.L["user_message_add_new_profile_max_reached"], MAX_PROFILES),
        userErrors[1]
      )
    end)
  end)

  describe("RenameProfile", function()
    before_each(function()
      table.insert(PVPWarnProfiles, storedProfile("Arena"))
      table.insert(PVPWarnProfiles, storedProfile("Battleground"))
    end)

    it("renames the profile in place and keeps its spot in the list", function()
      assert.is_true(profile.RenameProfile("Arena", "Duel"))

      assert.are.equal("Duel", PVPWarnProfiles[2].name)
      assert.are.same({ stored = "Arena" }, PVPWarnProfiles[2].spellConfiguration)
      assert.are.equal("Battleground", PVPWarnProfiles[3].name)
      assert.are.same({}, userErrors)
    end)

    it("moves the active profile name along when the active profile is renamed", function()
      PVPWarnProfiles.activeProfile = "Arena"

      profile.RenameProfile("Arena", "Duel")

      assert.are.equal("Duel", PVPWarnProfiles.activeProfile)
    end)

    it("leaves the active profile name alone when another profile is renamed", function()
      PVPWarnProfiles.activeProfile = "Battleground"

      profile.RenameProfile("Arena", "Duel")

      assert.are.equal("Battleground", PVPWarnProfiles.activeProfile)
    end)

    it("accepts the unchanged name as a no-op", function()
      assert.is_true(profile.RenameProfile("Arena", "Arena"))

      assert.are.equal("Arena", PVPWarnProfiles[2].name)
      assert.are.same({}, userErrors)
    end)

    it("refuses an empty name and changes nothing", function()
      assert.is_false(profile.RenameProfile("Arena", ""))

      assert.are.equal("Arena", PVPWarnProfiles[2].name)
    end)

    it("refuses a name over the maximum with the localized message", function()
      assert.is_false(profile.RenameProfile("Arena", nameOfLength(profile.GetMaxProfileNameLength() + 1)))

      assert.are.equal("Arena", PVPWarnProfiles[2].name)
      assert.are.equal(
        string.format(rgpvpw.L["user_message_profile_name_too_long"], profile.GetMaxProfileNameLength()),
        userErrors[1]
      )
    end)

    it("accepts a name of exactly the maximum length", function()
      assert.is_true(profile.RenameProfile("Arena", nameOfLength(profile.GetMaxProfileNameLength())))

      assert.are.same({}, userErrors)
    end)

    it("refuses a name another profile carries", function()
      assert.is_false(profile.RenameProfile("Arena", "Battleground"))

      assert.are.equal("Arena", PVPWarnProfiles[2].name)
      assert.are.equal(rgpvpw.L["user_message_select_profile_already_exists"], userErrors[1])
    end)

    it("refuses to rename the default profile", function()
      assert.is_false(profile.RenameProfile(DEFAULT, "Home"))

      assert.are.equal(DEFAULT, PVPWarnProfiles[1].name)
      assert.are.equal(rgpvpw.L["user_message_default_profile_cannot_be_renamed"], userErrors[1])
    end)

    it("refuses to rename a profile onto the default name", function()
      assert.is_false(profile.RenameProfile("Arena", DEFAULT))

      assert.are.equal("Arena", PVPWarnProfiles[2].name)
      assert.are.equal(rgpvpw.L["user_message_default_profile_cannot_be_renamed"], userErrors[1])
    end)

    it("returns false for an unknown profile", function()
      assert.is_false(profile.RenameProfile("Nope", "Duel"))

      assert.are.equal(3, #PVPWarnProfiles)
    end)
  end)

  describe("SaveActiveProfile", function()
    it("copies the live lists into the active profile and stamps the version", function()
      table.insert(PVPWarnProfiles, storedProfile("Arena"))
      PVPWarnProfiles[2].version = "v0.0.1"
      PVPWarnProfiles.activeProfile = "Arena"
      PVPWarnConfiguration.spellList.edited = true

      assert.are.equal("Arena", profile.SaveActiveProfile())

      assert.are.same({ live = "initial", edited = true }, PVPWarnProfiles[2].spellConfiguration)
      assert.are.same({ live = "initial" }, PVPWarnProfiles[2].spellSelfAvoidConfiguration)
      assert.are.same({ live = "initial" }, PVPWarnProfiles[2].spellEnemyAvoidConfiguration)
      assert.are.equal(ADDON_VERSION, PVPWarnProfiles[2].version)
      -- the default profile was not the active one and keeps its stored copy
      assert.are.same({ stored = DEFAULT }, PVPWarnProfiles[1].spellConfiguration)
    end)

    it("clones the lists so later live edits do not reach the stored copy", function()
      profile.SaveActiveProfile()
      PVPWarnConfiguration.spellList.edited = true

      assert.are.same({ live = "initial" }, PVPWarnProfiles[1].spellConfiguration)
    end)

    it("repairs a dangling active name to the default profile before it mirrors", function()
      PVPWarnProfiles.activeProfile = "Gone"

      assert.are.equal(DEFAULT, profile.SaveActiveProfile())

      assert.are.equal(DEFAULT, PVPWarnProfiles.activeProfile)
      assert.are.same({ live = "initial" }, PVPWarnProfiles[1].spellConfiguration)
    end)

    it("repairs a missing active name to the default profile", function()
      PVPWarnProfiles.activeProfile = nil

      assert.are.equal(DEFAULT, profile.SaveActiveProfile())

      assert.are.equal(DEFAULT, PVPWarnProfiles.activeProfile)
    end)

    it("seeds the default profile when the store has none at all", function()
      _G.PVPWarnProfiles = { activeProfile = "Gone" }

      assert.are.equal(DEFAULT, profile.SaveActiveProfile())

      assert.are.equal(1, #PVPWarnProfiles)
      assert.are.equal(DEFAULT, PVPWarnProfiles[1].name)
      assert.are.same({ live = "initial" }, PVPWarnProfiles[1].spellConfiguration)
    end)
  end)

  describe("SwitchProfile", function()
    before_each(function()
      table.insert(PVPWarnProfiles, storedProfile("Arena"))
    end)

    it("mirrors the live lists into the active profile, loads the target and activates it", function()
      PVPWarnConfiguration.spellList.edited = true

      assert.is_true(profile.SwitchProfile("Arena"))

      assert.are.same({ live = "initial", edited = true }, PVPWarnProfiles[1].spellConfiguration)
      assert.are.same({ stored = "Arena" }, PVPWarnConfiguration.spellList)
      assert.are.same({ stored = "Arena" }, PVPWarnConfiguration.spellSelfAvoidList)
      assert.are.same({ stored = "Arena" }, PVPWarnConfiguration.spellEnemyAvoidList)
      assert.are.equal("Arena", PVPWarnProfiles.activeProfile)
    end)

    it("clones the target lists so live edits do not reach the stored copy", function()
      profile.SwitchProfile("Arena")
      PVPWarnConfiguration.spellList.edited = true

      assert.are.same({ stored = "Arena" }, PVPWarnProfiles[2].spellConfiguration)
    end)

    it("is a no-op for the active profile", function()
      PVPWarnConfiguration.spellList.edited = true

      assert.is_false(profile.SwitchProfile(DEFAULT))

      assert.are.same({ live = "initial", edited = true }, PVPWarnConfiguration.spellList)
      assert.are.same({ stored = DEFAULT }, PVPWarnProfiles[1].spellConfiguration)
    end)

    it("returns false for an unknown or empty name and changes nothing", function()
      assert.is_false(profile.SwitchProfile("Nope"))
      assert.is_false(profile.SwitchProfile(""))
      assert.is_false(profile.SwitchProfile(nil))

      assert.are.same({ live = "initial" }, PVPWarnConfiguration.spellList)
      assert.are.equal(DEFAULT, PVPWarnProfiles.activeProfile)
    end)

    it("keeps LoadProfile as an alias for the macro bridge", function()
      assert.are.equal(profile.SwitchProfile, profile.LoadProfile)
    end)
  end)

  describe("EnsureDefaultProfile", function()
    it("leaves an existing default profile alone", function()
      PVPWarnProfiles[1].spellConfiguration.edited = true

      profile.EnsureDefaultProfile()

      assert.are.equal(1, #PVPWarnProfiles)
      assert.are.same({ stored = DEFAULT, edited = true }, PVPWarnProfiles[1].spellConfiguration)
    end)

    it("seeds a missing default profile from the class factory lists at the top of the list", function()
      _G.PVPWarnProfiles = { storedProfile("Arena"), activeProfile = "Arena" }

      profile.EnsureDefaultProfile()

      assert.are.equal(2, #PVPWarnProfiles)
      assert.are.same({
        name = DEFAULT,
        version = ADDON_VERSION,
        spellConfiguration = { factory = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL },
        spellSelfAvoidConfiguration = { factory = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID },
        spellEnemyAvoidConfiguration = { factory = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID }
      }, PVPWarnProfiles[1])
      assert.are.equal("Arena", PVPWarnProfiles[2].name)
      -- seeding does not touch the live configuration or the active profile
      assert.are.same({ live = "initial" }, PVPWarnConfiguration.spellList)
      assert.are.equal("Arena", PVPWarnProfiles.activeProfile)
    end)

    it("creates the store when the saved variable is missing", function()
      _G.PVPWarnProfiles = nil

      profile.EnsureDefaultProfile()

      assert.are.equal(1, #PVPWarnProfiles)
      assert.are.equal(DEFAULT, PVPWarnProfiles[1].name)
    end)
  end)

  describe("EnsureActiveProfile", function()
    before_each(function()
      table.insert(PVPWarnProfiles, storedProfile("Arena"))
    end)

    it("keeps the active profile that names a stored profile and mirrors into it", function()
      PVPWarnProfiles.activeProfile = "Arena"

      profile.EnsureActiveProfile()

      assert.are.equal("Arena", PVPWarnProfiles.activeProfile)
      assert.are.same({ live = "initial" }, PVPWarnProfiles[2].spellConfiguration)
      assert.are.same({ stored = DEFAULT }, PVPWarnProfiles[1].spellConfiguration)
    end)

    it("keeps the active profile of a store whose retired modified flag was false and drops the flag", function()
      PVPWarnProfiles.activeProfile = "Arena"
      PVPWarnProfiles.modified = false

      profile.EnsureActiveProfile()

      assert.are.equal("Arena", PVPWarnProfiles.activeProfile)
      assert.is_nil(PVPWarnProfiles.modified)
    end)

    it("falls back to the default profile when the retired modified flag was true and drops the flag", function()
      PVPWarnProfiles.activeProfile = "Arena"
      PVPWarnProfiles.modified = true

      profile.EnsureActiveProfile()

      assert.are.equal(DEFAULT, PVPWarnProfiles.activeProfile)
      assert.is_nil(PVPWarnProfiles.modified)
      -- the live lists became the default profile's; Arena keeps its own stored copy
      assert.are.same({ live = "initial" }, PVPWarnProfiles[1].spellConfiguration)
      assert.are.same({ stored = "Arena" }, PVPWarnProfiles[2].spellConfiguration)
    end)

    it("repairs a dangling active name to the default profile", function()
      PVPWarnProfiles.activeProfile = "Gone"

      profile.EnsureActiveProfile()

      assert.are.equal(DEFAULT, PVPWarnProfiles.activeProfile)
      assert.are.same({ live = "initial" }, PVPWarnProfiles[1].spellConfiguration)
    end)

    it("repairs a missing active name to the default profile", function()
      PVPWarnProfiles.activeProfile = nil

      profile.EnsureActiveProfile()

      assert.are.equal(DEFAULT, PVPWarnProfiles.activeProfile)
    end)

    it("never touches the live configuration", function()
      PVPWarnProfiles.activeProfile = "Gone"

      profile.EnsureActiveProfile()

      assert.are.same({ live = "initial" }, PVPWarnConfiguration.spellList)
    end)
  end)

  describe("ResetActiveProfile", function()
    it("writes the class factory lists into the live configuration and mirrors them", function()
      table.insert(PVPWarnProfiles, storedProfile("Arena"))
      PVPWarnProfiles.activeProfile = "Arena"

      profile.ResetActiveProfile()

      assert.are.same({ factory = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL }, PVPWarnConfiguration.spellList)
      assert.are.same({ factory = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID },
        PVPWarnConfiguration.spellSelfAvoidList)
      assert.are.same({ factory = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID },
        PVPWarnConfiguration.spellEnemyAvoidList)
      assert.are.same({ factory = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL }, PVPWarnProfiles[2].spellConfiguration)
      assert.are.equal("Arena", PVPWarnProfiles.activeProfile)
      -- the default profile is not the active one and keeps its stored copy
      assert.are.same({ stored = DEFAULT }, PVPWarnProfiles[1].spellConfiguration)
    end)

    it("resets the default profile itself when it is the active one", function()
      profile.ResetActiveProfile()

      assert.are.same({ factory = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL }, PVPWarnProfiles[1].spellConfiguration)
      assert.are.equal(DEFAULT, PVPWarnProfiles.activeProfile)
    end)
  end)

  describe("InitializeDefaultProfile", function()
    it("wipes the store, seeds the class default profile and loads it into the live configuration", function()
      table.insert(PVPWarnProfiles, storedProfile("Arena"))
      PVPWarnProfiles.activeProfile = "Arena"
      PVPWarnProfiles.modified = true

      profile.InitializeDefaultProfile()

      assert.are.equal(1, #PVPWarnProfiles)
      assert.are.equal(DEFAULT, PVPWarnProfiles[1].name)
      assert.are.equal(ADDON_VERSION, PVPWarnProfiles[1].version)
      assert.are.equal(DEFAULT, PVPWarnProfiles.activeProfile)
      assert.is_nil(PVPWarnProfiles.modified)
      assert.are.same({ factory = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL }, PVPWarnConfiguration.spellList)
      assert.are.same({ factory = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID },
        PVPWarnConfiguration.spellEnemyAvoidList)
    end)
  end)

  describe("DeleteProfile", function()
    before_each(function()
      table.insert(PVPWarnProfiles, storedProfile("Arena"))
      table.insert(PVPWarnProfiles, storedProfile("Battleground"))
    end)

    it("removes a profile that is not the active one and leaves the live configuration alone", function()
      local deleted, fellBack = profile.DeleteProfile("Arena")

      assert.is_true(deleted)
      assert.is_false(fellBack)
      assert.are.equal(2, #PVPWarnProfiles)
      assert.is_nil(findStored("Arena"))
      assert.are.equal(DEFAULT, PVPWarnProfiles.activeProfile)
      assert.are.same({ live = "initial" }, PVPWarnConfiguration.spellList)
    end)

    it("falls back to the default profile when the active profile is deleted, with no mirror", function()
      PVPWarnProfiles.activeProfile = "Arena"
      PVPWarnConfiguration.spellList.edited = true

      local deleted, fellBack = profile.DeleteProfile("Arena")

      assert.is_true(deleted)
      assert.is_true(fellBack)
      assert.is_nil(findStored("Arena"))
      assert.are.equal(DEFAULT, PVPWarnProfiles.activeProfile)
      assert.are.same({ stored = DEFAULT }, PVPWarnConfiguration.spellList)
      -- the default profile's stored copy was applied, not overwritten by the deleted profile's edits
      assert.are.same({ stored = DEFAULT }, PVPWarnProfiles[1].spellConfiguration)
    end)

    it("refuses to delete the default profile", function()
      local deleted, fellBack = profile.DeleteProfile(DEFAULT)

      assert.is_false(deleted)
      assert.is_false(fellBack)
      assert.are.equal(3, #PVPWarnProfiles)
    end)

    it("returns false for an unknown or empty name", function()
      assert.is_false(profile.DeleteProfile("Nope"))
      assert.is_false(profile.DeleteProfile(""))

      assert.are.equal(3, #PVPWarnProfiles)
    end)
  end)

  describe("AddImportedProfile", function()
    it("stores the imported payload without activating the profile", function()
      assert.is_true(profile.AddImportedProfile("Imported", importPayload()))

      assert.are.equal(2, #PVPWarnProfiles)
      assert.are.same({
        name = "Imported",
        version = ADDON_VERSION,
        spellConfiguration = { imported = "spellList" },
        spellSelfAvoidConfiguration = { imported = "spellSelfAvoidList" },
        spellEnemyAvoidConfiguration = { imported = "spellEnemyAvoidList" }
      }, PVPWarnProfiles[2])
      assert.are.equal(DEFAULT, PVPWarnProfiles.activeProfile)
    end)

    it("accepts a name of exactly the maximum length", function()
      assert.is_true(
        profile.AddImportedProfile(nameOfLength(profile.GetMaxProfileNameLength()), importPayload())
      )

      assert.are.equal(2, #PVPWarnProfiles)
      assert.are.same({}, userErrors)
    end)

    it("refuses an envelope name over the maximum and stores nothing", function()
      assert.is_false(
        profile.AddImportedProfile(nameOfLength(profile.GetMaxProfileNameLength() + 1), importPayload())
      )

      assert.are.equal(1, #PVPWarnProfiles)
      assert.are.equal(1, #userErrors)
      assert.are.equal(
        string.format(rgpvpw.L["user_message_profile_name_too_long"], profile.GetMaxProfileNameLength()),
        userErrors[1]
      )
    end)

    it("counts characters not bytes - a maximum length multibyte name is accepted", function()
      local name = nameOfLength(profile.GetMaxProfileNameLength(), MULTIBYTE_CHAR)

      assert.is_true(profile.AddImportedProfile(name, importPayload()))

      assert.are.equal(name, PVPWarnProfiles[2].name)
    end)

    it("refuses a duplicate name", function()
      profile.CreateProfile("Arena")

      assert.is_false(profile.AddImportedProfile("Arena", importPayload()))
      assert.are.equal(2, #PVPWarnProfiles)
      assert.are.equal(rgpvpw.L["user_message_select_profile_already_exists"], userErrors[1])
    end)

    it("clones the payload so the stored profile does not alias the envelope", function()
      local payload = importPayload()

      profile.AddImportedProfile("Imported", payload)
      payload.spellConfiguration.imported = "mutated"

      assert.are.equal("spellList", PVPWarnProfiles[2].spellConfiguration.imported)
    end)
  end)
end)
