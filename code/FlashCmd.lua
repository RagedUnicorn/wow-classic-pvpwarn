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

--[[
  Registers the `flash` subcommand on the /rgpvpw and /pvpwarn registry so the vignette
  flash can be smoke-tested and toggled without opening the options panel:

    /rgpvpw flash test          - fire a soft red vignette flash
    /rgpvpw flash test yellow   - fire a soft yellow vignette flash
    /rgpvpw flash enable        - enable the flash warning channel
    /rgpvpw flash disable       - disable the flash warning channel
]]--

local mod = rgpvpw
local me = {}
mod.flashCmd = me

me.tag = "FlashCmd"

--[[
  Handle the `flash` subcommand.

  @param {table} args
    The remaining arguments after the `flash` subcommand
]]--
function me.HandleFlash(args)
  local action = args[1]

  if action == "test" then
    local color = args[2] or "red"

    if not mod.flash.Test(color) then
      mod.logger.PrintUserError(rgpvpw.L["invalid_argument"])
    end
  elseif action == "enable" then
    mod.configuration.EnableFlash()
    print(rgpvpw.L["info_title"] .. " " .. rgpvpw.L["flash_enabled_message"])
  elseif action == "disable" then
    mod.configuration.DisableFlash()
    print(rgpvpw.L["info_title"] .. " " .. rgpvpw.L["flash_disabled_message"])
  else
    mod.logger.PrintUserError(rgpvpw.L["invalid_argument"])
  end
end

--[[
  Register the `flash` subcommand on load.
]]--
mod.cmd.RegisterCommand("flash", me.HandleFlash)
