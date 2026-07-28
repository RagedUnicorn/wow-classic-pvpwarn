
-- Fixture for TC-SV-02 - a v1.2.8-shaped SavedVariables file for a Warrior character.
--
-- Hand-trimmed, not a full capture: a real v1.2.8 PVPWarnConfiguration carries a per-spell
-- entry for every spell in all twelve categories and runs to thousands of lines. This file
-- keeps every top-level key of the v1.2.8 schema plus a handful of spells per list, which is
-- what the backfill and migration paths actually read.
--
-- Deliberate properties of this fixture, all of which the case asserts against:
--
--   * Spell lists are keyed by SPELL NAME. v1.2.8 addressed per-spell configuration as
--     PVPWarnConfiguration[spellList][categoryName][spellName]. Numeric spellId keys came
--     later; there is no name-to-id conversion, the profile reset is what carries a file
--     across the break.
--   * Entries carry visualWarningActive, which no longer exists - it was replaced by
--     visualWarningColor alone. It is here because v1.2.8 wrote it.
--   * No stance tracking, detection bar, flash, target filter, activeVoicePack or
--     lastNotifiedVersion keys. All of those must backfill on login.
--   * Warsong Gulch (489) is disabled, so the case can prove zone configuration survives.
--   * The stored profile carries version "v1.2.8", which is < v2.0.0, so UpgradeToV2_0_0
--     triggers the profile reset through the version branch rather than the missing-field one.
--
-- Copy over WTF/Account/<ACCOUNT>/<Server>/<Character>/SavedVariables/PVPWarn.lua while the
-- client is fully logged out, and delete PVPWarn.lua.bak alongside it.

PVPWarnConfiguration = {
	["spellList"] = {
		["warrior"] = {
			["recklessness"] = {
				["spellActive"] = true,
				["soundWarningActive"] = true,
				["soundFadeWarningActive"] = true,
				["visualWarningActive"] = true,
				["visualWarningColor"] = 7,
			},
		},
		["mage"] = {
			["polymorph"] = {
				["spellActive"] = true,
				["soundWarningActive"] = true,
				["soundFadeWarningActive"] = true,
				["visualWarningActive"] = true,
				["visualWarningColor"] = 3,
			},
			["ice_block"] = {
				["spellActive"] = true,
				["soundWarningActive"] = false,
				["soundFadeWarningActive"] = true,
				["visualWarningActive"] = true,
				["visualWarningColor"] = 1,
			},
		},
		["rogue"] = {
			["evasion"] = {
				["spellActive"] = true,
				["soundWarningActive"] = true,
				["soundFadeWarningActive"] = true,
				["visualWarningActive"] = true,
				["visualWarningColor"] = 1,
			},
		},
		["priest"] = {},
		["racials"] = {
			["will_of_the_forsaken"] = {
				["spellActive"] = true,
				["soundWarningActive"] = true,
				["visualWarningActive"] = false,
				["visualWarningColor"] = 0,
			},
		},
		["items"] = {},
		["misc"] = {},
	},
	["spellSelfAvoidList"] = {
		["mage"] = {
			["polymorph"] = {
				["spellActive"] = true,
				["soundWarningActive"] = true,
				["visualWarningActive"] = true,
				["visualWarningColor"] = 3,
			},
		},
		["paladin"] = {
			["hammer_of_justice"] = {
				["spellActive"] = true,
				["soundWarningActive"] = true,
				["visualWarningActive"] = false,
				["visualWarningColor"] = 0,
			},
		},
		["warlock"] = {},
	},
	["spellEnemyAvoidList"] = {
		["warrior"] = {
			["hamstring"] = {
				["spellActive"] = true,
				["soundWarningActive"] = true,
				["visualWarningActive"] = false,
				["visualWarningColor"] = 0,
			},
			["pummel"] = {
				["spellActive"] = true,
				["soundWarningActive"] = false,
				["visualWarningActive"] = false,
				["visualWarningColor"] = 0,
			},
		},
	},
	["enableCombatStateTracking"] = true,
	["lockCombatStateFrame"] = false,
	["addonZoneConfiguration"] = {
		[30] = {
			["enabled"] = true,
			["name"] = "Alterac Valley",
		},
		[529] = {
			["enabled"] = true,
			["name"] = "Arathi Basin",
		},
		[489] = {
			["enabled"] = false,
			["name"] = "Warsong Gulch",
		},
	},
	["frames"] = {
		["PVPW_CombatStateFrame"] = {
			["point"] = "TOPLEFT",
			["relativeTo"] = "UIParent",
			["relativePoint"] = "BOTTOMLEFT",
			["posX"] = 640,
			["posY"] = 420,
		},
	},
	["addonVersion"] = "v1.2.8",
}

PVPWarnProfiles = {
	{
		["name"] = "Default",
		["version"] = "v1.2.8",
		["spellConfiguration"] = {
			["warrior"] = {
				["recklessness"] = {
					["spellActive"] = true,
					["soundWarningActive"] = true,
					["soundFadeWarningActive"] = true,
					["visualWarningActive"] = true,
					["visualWarningColor"] = 7,
				},
			},
			["mage"] = {
				["polymorph"] = {
					["spellActive"] = true,
					["soundWarningActive"] = true,
					["soundFadeWarningActive"] = true,
					["visualWarningActive"] = true,
					["visualWarningColor"] = 3,
				},
			},
		},
		["spellSelfAvoidConfiguration"] = {
			["mage"] = {
				["polymorph"] = {
					["spellActive"] = true,
					["soundWarningActive"] = true,
					["visualWarningActive"] = true,
					["visualWarningColor"] = 3,
				},
			},
		},
		["spellEnemyAvoidConfiguration"] = {
			["warrior"] = {
				["hamstring"] = {
					["spellActive"] = true,
					["soundWarningActive"] = true,
					["visualWarningActive"] = false,
					["visualWarningColor"] = 0,
				},
			},
		},
	},
	["activeProfile"] = "Default",
	["modified"] = false,
}
