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
  Headless test bootstrap (busted helper, wired via the `helper` key in `.busted`).

  PVPWarn modules have no package system: each file does `local mod = rgpvpw; local me = {};
  mod.<name> = me` and is executed in `PVPWarn.toc` load order. This bootstrap reproduces the
  minimal slice of that environment so the pure / lightly-stubbed modules load with no WoW client
  present:

    1. the `rgpvpw` namespace table (normally created by code/Core.lua),
    2. RGPVPW_ENVIRONMENT, shimmed directly here (mirrors the *development* code/Environment.lua) so
       tests do not depend on `mvn generate-resources` or the build-generated file. TEST is kept
       false: SpellConfiguration.IsOptionActive short-circuits to true when TEST is truthy, which
       would make configuration specs vacuously pass,
    3. the pure modules Colors.lua, Constants.lua, Logger.lua and Common.lua, dofile'd in TOC
       dependency order.

  It also prepends test/headless to package.path so specs can `require("WowStubs")` for the opt-in
  WoW-global stub registry.

  Module-state reset convention for specs: because modules load via dofile (not require /
  package.loaded), re-dofile a module inside before_each to get a fresh module table -- e.g.
  `dofile("code/Warn.lua")` re-runs `mod.warn = {}`, clearing its file-local state.
  Whatever a spec file leaves in rgpvpw or the saved variables is reset when the file ends (see
  "Spec file isolation" at the bottom), so no spec depends on the order the files run in.

  Saved-variables convention for specs: assign the per-character saved variables through the global
  table -- `_G.PVPWarnConfiguration = {...}` -- a bareword assignment inside the busted sandbox is
  not seen by the modules under test.

  Expected cwd: addon repo root. Run from elsewhere and the dofile()s will fail.
]]--

-- luacheck: globals unpack

-- allow specs to require the opt-in WoW-global stub registry as `require("WowStubs")`
package.path = "./test/headless/?.lua;" .. package.path

-- WoW's Lua 5.1 exposes unpack as a global (used by code/Common.lua SelectMultiple);
-- the busted container runs a newer Lua where it lives in table.unpack
unpack = unpack or table.unpack -- luacheck: ignore 143

-- the addon namespace, normally created by code/Core.lua
rgpvpw = {}

-- shimmed environment, mirroring the development build of code/Environment.lua. TEST must stay
-- false so SpellConfiguration option checks execute for real under the harness.
RGPVPW_ENVIRONMENT = {
  ADDON_IDENTIFIER = "com.ragedunicorn.wow.classic.pvpwarn-addon",
  LOG_LEVEL = 4,
  LOG_EVENT = true,
  DEBUG = true,
  TEST = false
}

-- load the pure modules in PVPWarn.toc dependency order
dofile("code/Colors.lua")    -- defines RGPVPW_COLORS (no load-time WoW calls)
dofile("code/Constants.lua") -- defines RGPVPW_CONSTANTS (derives TEXTURES from RGPVPW_COLORS)
dofile("code/Logger.lua")    -- defines rgpvpw.logger (reads RGPVPW_ENVIRONMENT at load time)
dofile("code/Common.lua")    -- defines rgpvpw.common

--[[
  Spec file isolation. busted insulates the globals of every spec file, but rgpvpw and the saved
  variables are single tables shared by all of them: a module a spec dofiles
  (dofile("code/Configuration.lua") replaces rgpvpw.configuration), a stub it installs or a field
  it mutates would otherwise leak into every spec file that runs after it, making results depend
  on file order. Each spec file therefore starts from the namespace captured when it starts and
  gets it back when it ends - two levels deep for rgpvpw (the module tables and their fields) and
  fully for the saved variables. Specs still restore what they replace per test; this is the
  safety net across files.
]]--
local busted = require("busted")

-- the saved variables specs assign through _G
local SAVED_VARIABLES = { "PVPWarnConfiguration", "PVPWarnProfiles" }

local function ShallowCopy(source)
  local copy = {}

  for key, value in pairs(source) do
    copy[key] = value
  end

  return copy
end

local function DeepCopy(source)
  if type(source) ~= "table" then return source end

  local copy = {}

  for key, value in pairs(source) do
    copy[key] = DeepCopy(value)
  end

  return copy
end

-- make target hold exactly the fields of source, keeping the table identity
local function ReplaceContents(target, source)
  for key in pairs(target) do
    if source[key] == nil then
      target[key] = nil
    end
  end

  for key, value in pairs(source) do
    target[key] = value
  end
end

--[[
  Capture rgpvpw and the saved variables

  @return {function}
    restores all of them to the captured state
]]--
local function SnapshotNamespace()
  local modules = {}
  local savedVariables = {}

  for name, module in pairs(rgpvpw) do
    modules[name] = {
      module = module,
      fields = type(module) == "table" and ShallowCopy(module) or nil
    }
  end

  for _, name in ipairs(SAVED_VARIABLES) do
    savedVariables[name] = {
      value = _G[name],
      copy = DeepCopy(_G[name])
    }
  end

  return function()
    for name in pairs(rgpvpw) do
      if modules[name] == nil then
        rgpvpw[name] = nil
      end
    end

    for name, captured in pairs(modules) do
      rgpvpw[name] = captured.module

      if captured.fields ~= nil then
        ReplaceContents(captured.module, captured.fields)
      end
    end

    for name, captured in pairs(savedVariables) do
      if type(captured.value) == "table" then
        ReplaceContents(captured.value, DeepCopy(captured.copy))
      end

      _G[name] = captured.value
    end
  end
end

local restoreNamespace

busted.subscribe({ "file", "start" }, function()
  restoreNamespace = SnapshotNamespace()

  return nil, true
end)

busted.subscribe({ "file", "end" }, function()
  if restoreNamespace ~= nil then
    restoreNamespace()
    restoreNamespace = nil
  end

  return nil, true
end)
