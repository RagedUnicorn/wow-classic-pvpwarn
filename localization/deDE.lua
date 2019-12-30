
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
