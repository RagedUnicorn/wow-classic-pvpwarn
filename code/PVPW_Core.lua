--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

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

rgpvpw = rgpvpw or {}
local me = rgpvpw

me.tag = "Core"

--[[
  Addon load

  @param {table} self
]]--
function me.OnLoad(self)
  me.RegisterEvents(self)
end

--[[
  MainFrame OnEvent handler

  @param {string} event
  @param {table} vararg
]]--
function me.OnEvent(event, ...)
  if event == "PLAYER_LOGIN" then
    me.logger.LogEvent(me.tag, "PLAYER_LOGIN")
    me.Initialize()
  end
end

--[[
  Register addon events

  @param {table} self
]]--
function me.RegisterEvents(self)
  -- Register to player login event also fires on /reload
  self:RegisterEvent("PLAYER_LOGIN")
end

--[[
  Init function
]]--
function me.Initialize()
  me.logger.LogDebug(me.tag, "Initialize addon")

  print(string.format(GetAddOnMetadata("PVPWarn", "Title") .. rgpvpw.L["help"], GetAddOnMetadata("PVPWarn", "Version")))
end
