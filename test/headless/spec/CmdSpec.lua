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
  Headless spec for code/Cmd.lua (rgpvpw.cmd): the /rgpvpw and /pvpwarn slash command - the
  built-in sub-commands, the registry other modules (detection bar, flash, the test commands) add
  their sub-commands to, and the error for an unknown argument.

  SlashCmdList, SLASH_PVPWARN1/2, ReloadUI and print are installed through WowStubs (the SLASH_*
  globals as false so restore can put the headless-absent nil back). The modules the commands reach
  - addonConfiguration, combatState, stanceState - are counting stubs, rgpvpw.L echoes its keys and
  the logger captures user errors. Cmd.lua is re-dofile'd in before_each for a fresh registry; every
  replaced rgpvpw field is restored in after_each.
]]--

-- luacheck: read globals SlashCmdList SLASH_PVPWARN1 SLASH_PVPWARN2

local wowStubs = require("WowStubs")

describe("Cmd", function()
  local cmd
  local handle
  local restoreGlobals
  local prints
  local userErrors
  local loggedErrors
  local calls
  local originalCmd = rgpvpw.cmd
  local originalLogger = rgpvpw.logger
  local originalAddonConfiguration = rgpvpw.addonConfiguration
  local originalCombatState = rgpvpw.combatState
  local originalStanceState = rgpvpw.stanceState
  local originalL = rgpvpw.L

  --[[
    @param {string} name
    @return {function}
      a stub that counts its calls under that name
  ]]--
  local function counter(name)
    return function()
      calls[name] = (calls[name] or 0) + 1
    end
  end

  before_each(function()
    prints = {}
    userErrors = {}
    loggedErrors = {}
    calls = {}

    restoreGlobals = wowStubs.install({
      SlashCmdList = {},
      SLASH_PVPWARN1 = false,
      SLASH_PVPWARN2 = false,
      ReloadUI = counter("ReloadUI"),
      print = function(message) prints[#prints + 1] = message end
    })

    rgpvpw.logger = {
      LogDebug = function() end,
      LogError = function(_, message) loggedErrors[#loggedErrors + 1] = message end,
      PrintUserError = function(message) userErrors[#userErrors + 1] = message end
    }
    rgpvpw.addonConfiguration = { OpenMainCategory = counter("OpenMainCategory") }
    rgpvpw.combatState = {
      EnableConfigurationMode = counter("combatEnable"),
      DisableConfigurationMode = counter("combatDisable")
    }
    rgpvpw.stanceState = {
      EnableConfigurationMode = counter("stanceEnable"),
      DisableConfigurationMode = counter("stanceDisable")
    }
    rgpvpw.L = setmetatable({}, { __index = function(_, key) return key end })

    dofile("code/Cmd.lua")
    cmd = rgpvpw.cmd
    cmd.SetupSlashCmdList()
    handle = SlashCmdList["PVPWARN"]
  end)

  after_each(function()
    restoreGlobals()
    rgpvpw.cmd = originalCmd
    rgpvpw.logger = originalLogger
    rgpvpw.addonConfiguration = originalAddonConfiguration
    rgpvpw.combatState = originalCombatState
    rgpvpw.stanceState = originalStanceState
    rgpvpw.L = originalL
  end)

  it("registers /rgpvpw and /pvpwarn", function()
    assert.are.equal("/rgpvpw", SLASH_PVPWARN1)
    assert.are.equal("/pvpwarn", SLASH_PVPWARN2)
    assert.are.equal("function", type(handle))
  end)

  it("prints the help for no argument and for help", function()
    handle("")
    local helpLines = #prints

    handle("help")

    assert.is_true(helpLines > 0)
    assert.are.equal(helpLines * 2, #prints)
    assert.are.equal("info_title", prints[1])
  end)

  it("reloads the ui for rl and reload", function()
    handle("rl")
    handle("reload")

    assert.are.equal(2, calls.ReloadUI)
  end)

  it("opens the options for opt", function()
    handle("opt")

    assert.are.equal(1, calls.OpenMainCategory)
  end)

  it("switches the combat state configuration mode", function()
    handle("combatstate enable")
    handle("combatstate disable")

    assert.are.equal(1, calls.combatEnable)
    assert.are.equal(1, calls.combatDisable)
  end)

  it("switches the stance state configuration mode", function()
    handle("stancestate enable")
    handle("stancestate disable")

    assert.are.equal(1, calls.stanceEnable)
    assert.are.equal(1, calls.stanceDisable)
  end)

  it("prints the sub-command help for a state command without a valid mode", function()
    handle("combatstate")
    handle("stancestate toggle")

    assert.are.same({ "info_title", "combatstate", "info_title", "stancestate" }, prints)
    assert.is_nil(calls.combatEnable)
    assert.is_nil(calls.stanceEnable)
  end)

  it("hands a registered sub-command the remaining arguments", function()
    local received

    cmd.RegisterCommand("bar", function(args) received = args end)

    handle("bar   test  now")

    assert.are.same({ "test", "now" }, received)
  end)

  it("refuses to register a sub-command without a name or a handler", function()
    cmd.RegisterCommand(nil, function() end)
    cmd.RegisterCommand("bar", "not a function")

    assert.are.same({}, cmd.registeredCommands)
    assert.are.equal(2, #loggedErrors)
  end)

  it("reports an unknown argument to the user", function()
    handle("doesnotexist")

    assert.are.same({ "invalid_argument" }, userErrors)
  end)
end)
