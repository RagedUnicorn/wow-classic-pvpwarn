--[[
  MIT License

  Copyright (c) 2021 Michael Wiesendanger

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

-- luacheck: globals GetLocale

if (GetLocale() == "deDE") then
  rgpvpw = rgpvpw or {}
  rgpvpw.L = {}

  rgpvpw.L["name"] = "PVPWarn"

  -- console
  rgpvpw.L["help"] = "|cFFFFC300(%s)|r: Benutze |cFFFFC300/rgpvpw|r oder |cFFFFC300/pvpwarn|r "
    .. "für eine Liste der verfügbaren Optionen"
  rgpvpw.L["opt"] = "|cFFFFC300opt|r - zeige Optionsmenu an"
  rgpvpw.L["reload"] = "|cFFFFC300reload|r - UI neu laden"
  rgpvpw.L["info_title"] = "|cFF00FFB0PVPWarn:|r"

  -- file name pattern
  rgpvpw.L["removed"] = "_unten"
end
