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
  Key-set parity across PVPWarn's localization files (localization/*.lua), ported from Pulse's
  lfs glob-discovering variant with GearMenu's placeholder comparison on top.

  The recurring bug this pins down: a string added to enUS but not mirrored to the other locales
  (or vice versa). The locale set is glob-discovered (lfs over localization/) rather than
  hard-coded, so a future locale file is picked up automatically.

  Loading mechanics: enUS.lua sets rgpvpw.L unconditionally, while deDE.lua / ruRU.lua wrap their
  assignments in `if (GetLocale() == "<locale>")`. So each file is dofile'd with GetLocale()
  stubbed to return that file's own locale (derived from its basename); every file's `version`
  string also reads C_AddOns.GetAddOnMetadata at load time, so C_AddOns is stubbed too. Both stubs
  come from WowStubs and are restored after each load. rgpvpw.L is a deep field of the shared
  rgpvpw table that busted's file insulation does not roll back, so the original (nil) is restored
  once loading is done.

  enUS is the declared source of truth: every other locale is compared against it and must have
  exactly the same key set. On top of key parity, each shared key's string.format placeholder set
  is compared as a sorted multiset -- a translator may legitimately reorder placeholders, but a
  count/type change would crash the formatting call at runtime.
]]--

-- busted extends `assert` with .same / .equal / etc. at runtime; luacheck cannot verify those
-- fields statically. Suppress warning 143 (accessing undefined field of a global variable).
-- luacheck: globals describe it
-- luacheck: ignore 143

local lfs = require("lfs")
local wowStubs = require("WowStubs")

local REFERENCE_LOCALE = "enUS"

--[[
  Glob localization/*.lua (cwd is the addon repo root, as for every spec) and return
  { { path = "localization/enUS.lua", locale = "enUS" }, ... } sorted by locale, so the locale set
  is never hard-coded.

  @return {table}
]]--
local function discoverLocaleFiles()
  local files = {}

  for entry in lfs.dir("localization") do
    local locale = entry:match("^(%w+)%.lua$")

    if locale then
      files[#files + 1] = { path = "localization/" .. entry, locale = locale }
    end
  end

  table.sort(files, function(a, b) return a.locale < b.locale end)

  return files
end

--[[
  dofile a single locale file with GetLocale / C_AddOns stubbed and return a shallow copy of its
  rgpvpw.L table (key -> string). Restores the globals it touched so nothing leaks across loads.

  @param {table} file
    { path, locale }
  @return {table}
]]--
local function loadLocaleStrings(file)
  local restore = wowStubs.install({
    GetLocale = wowStubs.stubs.GetLocale(file.locale),
    C_AddOns = wowStubs.stubs.C_AddOns({ Version = "0.0.0-test" })
  })

  rgpvpw.L = nil
  dofile(file.path)

  local loaded = rgpvpw.L
  rgpvpw.L = nil
  restore()

  assert(
    type(loaded) == "table",
    file.path .. " did not populate rgpvpw.L when GetLocale() == '" .. tostring(file.locale) .. "'"
  )

  local strings = {}
  for key, value in pairs(loaded) do
    strings[key] = value
  end

  return strings
end

--[[
  Return the key set (key -> true) of a locale's string table.

  @param {table} strings
  @return {table}
]]--
local function keySet(strings)
  local keys = {}
  for key in pairs(strings) do
    keys[key] = true
  end

  return keys
end

--[[
  Return the keys present in `a` but absent from `b`, sorted for a stable failure message.

  @param {table} a
  @param {table} b
  @return {table}
]]--
local function difference(a, b)
  local missing = {}
  for key in pairs(a) do
    if not b[key] then
      missing[#missing + 1] = key
    end
  end
  table.sort(missing)

  return missing
end

--[[
  Extract the string.format placeholders from a localized string as a sorted list, so two strings
  can be compared as a multiset (a reorder by a translator is allowed, a count/type change is not).

  Escaped "%%" (a literal percent) is stripped first so it is not mistaken for a placeholder. The
  remaining specifiers are matched as "%" + optional positional index ("1$") + optional
  flags/width/precision + a conversion letter, covering plain ("%s"), typed ("%d") and positional
  ("%1$s") forms.

  @param {string} value
  @return {table}
]]--
local function extractPlaceholders(value)
  local specifiers = {}

  for spec in value:gsub("%%%%", ""):gmatch("%%[%d%$%-%+ #%.]*[diouxXeEfgGqcsaA]") do
    specifiers[#specifiers + 1] = spec
  end
  table.sort(specifiers)

  return specifiers
end

describe("localization parity", function()
  local originalL = rgpvpw.L

  local localeFiles = discoverLocaleFiles()

  local localeStrings = {}
  for _, file in ipairs(localeFiles) do
    localeStrings[file.locale] = loadLocaleStrings(file)
  end

  -- restore the deep field the loads above clobbered (bootstrap never set rgpvpw.L)
  rgpvpw.L = originalL

  it("auto-discovers the localization files via glob (not a hard-coded list)", function()
    local discovered = {}
    for _, file in ipairs(localeFiles) do
      discovered[file.locale] = true
    end

    assert.is_true(discovered.enUS)
    assert.is_true(discovered.deDE)
    assert.is_true(discovered.ruRU)
  end)

  it("loads a non-empty key set for every discovered locale", function()
    for locale, strings in pairs(localeStrings) do
      assert.is_true(next(strings) ~= nil, locale .. " registered no keys")
    end
  end)

  for _, file in ipairs(localeFiles) do
    if file.locale ~= REFERENCE_LOCALE then
      it("locale " .. file.locale .. " has the same keys as " .. REFERENCE_LOCALE, function()
        local reference = keySet(localeStrings[REFERENCE_LOCALE])
        local locale = keySet(localeStrings[file.locale])

        local missing = difference(reference, locale) -- in reference, absent from this locale
        local extra = difference(locale, reference)   -- in this locale, absent from reference

        assert.is_true(
          #missing == 0,
          file.locale .. " is missing keys present in " .. REFERENCE_LOCALE .. ": "
            .. table.concat(missing, ", ")
        )
        assert.is_true(
          #extra == 0,
          file.locale .. " has keys not present in " .. REFERENCE_LOCALE .. ": "
            .. table.concat(extra, ", ")
        )
      end)

      it("locale " .. file.locale .. " has the same format placeholders as " .. REFERENCE_LOCALE, function()
        local reference = localeStrings[REFERENCE_LOCALE]
        local locale = localeStrings[file.locale]

        local sharedKeys = {}
        for key in pairs(reference) do
          if locale[key] ~= nil then
            sharedKeys[#sharedKeys + 1] = key
          end
        end
        table.sort(sharedKeys)

        local mismatches = {}
        for _, key in ipairs(sharedKeys) do
          local referenceSpecs = extractPlaceholders(reference[key])
          local localeSpecs = extractPlaceholders(locale[key])

          if table.concat(referenceSpecs, ",") ~= table.concat(localeSpecs, ",") then
            mismatches[#mismatches + 1] = string.format(
              "%s (%s expects [%s], %s has [%s])",
              key,
              REFERENCE_LOCALE, table.concat(referenceSpecs, ","),
              file.locale, table.concat(localeSpecs, ",")
            )
          end
        end

        assert.is_true(
          #mismatches == 0,
          file.locale .. " has format-placeholder mismatches vs " .. REFERENCE_LOCALE .. ": "
            .. table.concat(mismatches, "; ")
        )
      end)
    end
  end

  it("flags missing and extra keys (parity checker self-test)", function()
    local reference = { addon_name = true, help = true, version = true }
    local locale = { addon_name = true, help = true, stray_key = true }

    assert.are.same({ "version" }, difference(reference, locale))
    assert.are.same({ "stray_key" }, difference(locale, reference))
  end)

  it("flags placeholder count and type changes but allows reorders (extractor self-test)", function()
    assert.are.same({ "%d", "%s" }, extractPlaceholders("%s of %d"))
    assert.are.same({ "%d", "%s" }, extractPlaceholders("%d von %s"))
    assert.are.same({ "%s" }, extractPlaceholders("100%% of %s"))
    assert.are.same({}, extractPlaceholders("no placeholders at 100%%"))
  end)
end)
