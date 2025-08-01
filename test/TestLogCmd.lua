--[[
  MIT License

  Copyright (c) 2025 Michael Wiesendanger

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

-- Test log command handler for PVPWarn addon
-- Handles testlog commands for managing the test log window
-- This module is only loaded in development builds

local mod = rgpvpw
local me = {}
mod.testLogCmd = me

me.tag = "TestLogCmd"

--[[
  Show test log command help

  Note: Will not be translated as this is a development-only feature
]]--
function me.ShowHelp()
  print("|cFF00FFFFTest Log Commands:|r")
  print("|cFF00FFFF/rgpvpw testlog|r - Show this help")
  print("|cFF00FFFF/rgpvpw testlog show|r - Show test log window (loads saved test logs)")
  print("|cFF00FFFF/rgpvpw testlog hide|r - Hide test log window")
  print("|cFF00FFFF/rgpvpw testlog clear|r - Clear test log window display")
  print("")
  print("Note: Test logs are saved to PVPWarnTestLog and displayed in the test log window.")
end

--[[
  Handle test log commands

  @param {string} testCommand - The test command to execute
]]--
function me.Handle(testCommand)
  if testCommand == "show" then
    mod.testLogWindow.Show()
  elseif testCommand == "hide" then
    mod.testLogWindow.Hide()
  elseif testCommand == "clear" then
    mod.testLogWindow.ClearLog()
  else
    me.ShowHelp()
  end
end
