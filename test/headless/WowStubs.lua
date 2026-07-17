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
  Opt-in registry of WoW-global stubs.

  This is deliberately NOT a full Blizzard API mock. A spec requires this module and pulls only the
  stubs it needs, installs them onto the global table for the duration of the test, then restores
  the previous values so nothing leaks across specs. The Bootstrap helper prepends test/headless to
  package.path so this resolves as `require("WowStubs")`.

  Usage:
    local wowStubs = require("WowStubs")

    local restore
    before_each(function()
      restore = wowStubs.install({
        GetLocale        = wowStubs.stubs.GetLocale("enUS"),
        UnitFactionGroup = wowStubs.stubs.UnitFactionGroup("Alliance"),
      })
    end)
    after_each(function() restore() end)

  `install` also accepts any ad-hoc stub the registry does not provide, e.g.
    wowStubs.install({ SomeApi = function() return 42 end })
]]--

local M = {}

--[[
  Install a table of name -> value stubs onto the global table.

  @param {table} stubs
    map of global name to stub value (function, table, ...)

  @return {function}
    a restore function that puts the previous global values back (including nil for globals that
    did not previously exist). Call it from after_each.
]]--
function M.install(stubs)
  local previous = {}
  local names = {}

  for name, value in pairs(stubs) do
    previous[name] = _G[name]
    names[#names + 1] = name
    _G[name] = value
  end

  return function()
    for _, name in ipairs(names) do
      _G[name] = previous[name]
    end
  end
end

--[[
  Ready-made stub builders for the WoW globals the near-term pilot specs touch. Each returns a fresh
  stub configured by its arguments; add more here as new specs need them.
]]--
M.stubs = {}

--[[
  GetLocale() -> string (localization files branch on this at load time).

  @param {string} locale
  @return {function}
]]--
function M.stubs.GetLocale(locale)
  return function()
    return locale or "enUS"
  end
end

--[[
  UnitFactionGroup(unitId) -> string (code/spellmap/Base.lua gates racial entries on the player
  faction at load time).

  @param {string} faction
    "Alliance" or "Horde"
  @return {function}
]]--
function M.stubs.UnitFactionGroup(faction)
  return function()
    return faction or "Alliance"
  end
end

--[[
  GetTime() -> number (Warn queue aging, StanceState expiry). `clock` is a table with a `now` field
  the spec can advance between assertions; a plain number (or nil) builds a fixed clock.

  @param {table | number} clock
  @return {function}
]]--
function M.stubs.GetTime(clock)
  if type(clock) ~= "table" then
    clock = { now = clock or 0 }
  end

  return function()
    return clock.now
  end
end

--[[
  C_Timer namespace (Ticker.NewTicker, Warn / DetectionBarCmd After). Captures the scheduled
  callbacks instead of running them so specs can fire them deterministically: `.scheduled` lists
  the {seconds, callback} entries from After, `.tickers` the handles from NewTicker (each carries
  interval and callback and supports the Cancel / IsCancelled methods Ticker.lua relies on).

  @return {table}
]]--
function M.stubs.C_Timer()
  local timer = { scheduled = {}, tickers = {} }

  function timer.After(seconds, callback)
    timer.scheduled[#timer.scheduled + 1] = { seconds = seconds, callback = callback }
  end

  function timer.NewTicker(interval, callback)
    local ticker = { interval = interval, callback = callback, cancelled = false }

    function ticker:Cancel()
      self.cancelled = true
    end

    function ticker:IsCancelled()
      return self.cancelled
    end

    timer.tickers[#timer.tickers + 1] = ticker

    return ticker
  end

  return timer
end

--[[
  C_AddOns namespace (Logger.PrintLogMessage / PrintUserMessage). `metadata` maps the requested key
  (e.g. "Title", "Version") to the value to return.

  @param {table} metadata
  @return {table}
]]--
function M.stubs.C_AddOns(metadata)
  metadata = metadata or {}

  return {
    GetAddOnMetadata = function(_, key)
      return metadata[key]
    end
  }
end

return M
