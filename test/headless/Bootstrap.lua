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
    3. the pure modules Constants.lua, Logger.lua and Common.lua, dofile'd in TOC dependency order.

  It also prepends test/headless to package.path so specs can `require("WowStubs")` for the opt-in
  WoW-global stub registry.

  Module-state reset convention for specs: because modules load via dofile (not require /
  package.loaded), re-dofile a module inside before_each to get a fresh module table -- e.g.
  `dofile("code/Warn.lua")` re-runs `mod.warn = {}`, clearing its file-local state.

  Saved-variables convention for specs: assign the per-character saved variables through the global
  table -- `_G.PVPWarnConfiguration = {...}` -- a bareword assignment inside the busted sandbox is
  not seen by the modules under test.

  Expected cwd: addon repo root. Run from elsewhere and the dofile()s will fail.
]]--

-- luacheck: globals rgpvpw RGPVPW_ENVIRONMENT

-- allow specs to require the opt-in WoW-global stub registry as `require("WowStubs")`
package.path = "./test/headless/?.lua;" .. package.path

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
dofile("code/Constants.lua") -- defines RGPVPW_CONSTANTS (no load-time WoW calls)
dofile("code/Logger.lua")    -- defines rgpvpw.logger (reads RGPVPW_ENVIRONMENT at load time)
dofile("code/Common.lua")    -- defines rgpvpw.common
