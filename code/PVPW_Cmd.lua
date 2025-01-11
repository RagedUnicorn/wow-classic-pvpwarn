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

-- luacheck: globals SLASH_PVPWARN1 SLASH_PVPWARN2 SlashCmdList ReloadUI

local mod = rgpvpw
local me = {}
mod.cmd = me

me.tag = "Cmd"

--[[
  Print cmd options for addon
]]--
local function ShowInfoMessage()
  print(rgpvpw.L["info_title"])
  print(rgpvpw.L["opt"])
  print(rgpvpw.L["combatstate"])
  print(rgpvpw.L["stancestate"])
  print(rgpvpw.L["reload"])
end

--[[
  Setup slash command handler
]]--
function me.SetupSlashCmdList()
  SLASH_PVPWARN1 = "/rgpvpw"
  SLASH_PVPWARN2 = "/pvpwarn"

  SlashCmdList["PVPWARN"] = function(msg)
    local args = {}

    mod.logger.LogDebug(me.tag, "/rgpvpw passed argument: " .. msg)

    -- parse arguments by whitespace
    for arg in string.gmatch(msg, "%S+") do
      table.insert(args, arg)
    end

    if args[1] == "" or args[1] == "help" or table.getn(args) == 0 then
      ShowInfoMessage()
    elseif args[1] == "rl" or args[1] == "reload" then
      ReloadUI()
    elseif args[1] == "opt" then
      mod.addonConfiguration.OpenMainCategory()
    elseif args[1] == "combatstate" then
      if args[2] == "enable" then
        mod.combatState.EnableConfigurationMode()
      elseif args[2] == "disable" then
        mod.combatState.DisableConfigurationMode()
      else
        mod.logger.PrintUserError(rgpvpw.L["invalid_argument"])
      end
    elseif args[1] == "stancestate" then
      if args[2] == "enable" then
        mod.stanceState.EnableConfigurationMode()
      elseif args[2] == "disable" then
        mod.stanceState.DisableConfigurationMode()
      else
        mod.logger.PrintUserError(rgpvpw.L["invalid_argument"])
      end
    else
      mod.logger.PrintUserError(rgpvpw.L["invalid_argument"])
    end
  end
end
