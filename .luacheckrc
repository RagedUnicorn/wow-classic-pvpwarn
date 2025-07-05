globals = {
  "rgpvpw",
  "RGPVPW_CONSTANTS",
  "RGPVPW_ENVIRONMENT",
  "RGPVPW_ZONE",
  "PVPWarnTestLog",
  "PVPWarnConfiguration",
  "PVPWarnProfiles",
  "PVPWarnLogTracker",
  "PVPWarnLogTrackerAvoid"
}

-- Only lint specific directories
files["code"] = {std = "lua51"}
files["gui"] = {std = "lua51"}
files["localization"] = {std = "lua51"}
files["profiles"] = {std = "lua51"}
files["test"] = {std = "lua51"}

-- Exclude tools directory
exclude_files = {
  "tools/**/*.lua"
}
