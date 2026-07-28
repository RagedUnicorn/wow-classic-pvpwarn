globals = {
  "rgpvpw",
  "RGPVPW_CONSTANTS",
  "RGPVPW_ENVIRONMENT",
  "RGPVPW_COLORS",
  "RGPVPW_ZONE",
  "PVPWarnTestLog",
  "PVPWarnConfiguration",
  "PVPWarnProfiles",
  "PVPWarnLogTracker",
  "PVPWarnLogTrackerAvoid",
  "PVPWarnShotLog",
  "RGPVPW_SHOTS"
}

files = {
  ["code"] = {std = "lua51"},
  ["gui"] = {std = "lua51"},
  ["localization"] = {std = "lua51"},
  ["profiles"] = {std = "lua51"},
  ["test"] = {std = "lua51"},
  ["dev"] = {std = "lua51"}
}

exclude_files = {
  ".luacheckrc",
  "target/",
  "tools/**/*.lua"
}
