--[[
  Writable globals: the addon namespace and the SavedVariables - their fields are set
  across many files. Everything else a file reads from the global environment (the
  RGPVPW_* tables below, the WoW API in each file's inline `-- luacheck: read globals`
  header) is read-only, so an accidental assignment is reported.
]]--
globals = {
  "rgpvpw",
  "PVPWarnTestLog",
  "PVPWarnConfiguration",
  "PVPWarnProfiles",
  "PVPWarnLogTracker",
  "PVPWarnLogTrackerAvoid",
  "PVPWarnShotLog"
}

read_globals = {
  "RGPVPW_CONSTANTS",
  "RGPVPW_ENVIRONMENT",
  "RGPVPW_COLORS",
  "RGPVPW_ZONE",
  "RGPVPW_SHOTS"
}

files = {
  ["code"] = {std = "lua51"},
  ["gui"] = {std = "lua51"},
  ["localization"] = {std = "lua51"},
  ["profiles"] = {std = "lua51"},
  ["test"] = {std = "lua51"},
  ["test/headless/spec"] = {std = "lua51+busted"},
  ["dev"] = {std = "lua51"},
  -- the files that define an RGPVPW_* table may assign it
  ["code/Colors.lua"] = {globals = {"RGPVPW_COLORS"}},
  ["code/Constants.lua"] = {globals = {"RGPVPW_CONSTANTS"}},
  ["code/Environment.lua"] = {globals = {"RGPVPW_ENVIRONMENT"}},
  ["code/Zone.lua"] = {globals = {"RGPVPW_ZONE"}},
  ["test/headless/Bootstrap.lua"] = {globals = {"RGPVPW_ENVIRONMENT"}},
  ["dev/ShotManifest.lua"] = {globals = {"RGPVPW_SHOTS"}}
}

exclude_files = {
  ".luacheckrc",
  "target/",
  "tools/**/*.lua"
}
