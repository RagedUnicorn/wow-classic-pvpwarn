--[[
  MIT License

  Copyright (c) 2020 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--

local mod = rgpvpw
local me = {}

mod.debug = me

me.tag = "Debug"

_G["__PVPW__DEBUG__PLAYEXAMPLESOUND"] = function()
  mod.sound.PlaySound("warrior", 2, "shield_wall")
end

_G["__PVPW__DEBUG__SHOWEXAMPLEALERT"] = function()
  mod.visual.CreateVisualAlertFrame()
  mod.visual.ShowVisualAlert()
end

--[[
  TODO
]]--
function me.TrackLogEvent(event, sourceFlags, target, targetName, spellName)
  if PVPWarnLogTracker == nil then
    PVPWarnLogTracker = {}
  end

  local logEvent = {
    ["event"] = event,
    ["sourceFlags"] = sourceFlags,
    ["target"] = target,
    ["targetName"] = targetName,
    ["spellName"] = spellName
  }

  table.insert(PVPWarnLogTracker, logEvent)
end
