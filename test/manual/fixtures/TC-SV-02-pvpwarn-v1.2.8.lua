--[[
  Fixture for TC-SV-02 — a v1.2.8-schema SavedVariables file. Per-spell configuration is keyed
  by **spell name**, which is how v1.2.8 addressed it; the move to numeric spellId keys came
  later and is the break the upgrade path has to carry a file across.

  Provenance: not hand-written. Produced by running v1.2.8's own `SetupConfiguration()` over its
  own class-profile tables, from the `pvpwarn-v1.2.8-classic.zip` release artifact, for a
  WARRIOR. A set of realistic user changes was then applied through v1.2.8's own
  `spellConfiguration` API — spells switched off, colours changed, a fade cue muted, avoid
  entries opted into, a battleground disabled, the combat state frame moved. TC-SV-02 lists each
  of them as a post-upgrade check.

  The customization matters: a pristine class default cannot show the loss the profile reset
  causes, and would leave both avoid lists empty, since every v1.2.8 class ships empty avoid
  profiles.

  Treat this file as a fixed artifact — it represents a release that is already in the past and
  will not change. If it ever needs rebuilding, stage the upgrade in the client instead: install
  v1.2.8 from the release artifact, configure it, log out, and use the file it writes. TC-SV-02
  documents that procedure.

  Key order is sorted rather than the client's hash order, which makes the file diffable. Both
  are the same Lua table constructor.
]]--
PVPWarnConfiguration = {
	["addonVersion"] = "v1.2.8",
	["addonZoneConfiguration"] = {
		[30] = {
			["enabled"] = true,
			["name"] = "Alterac Valley",
		},
		[489] = {
			["enabled"] = false,
			["name"] = "Warsong Gulch",
		},
		[529] = {
			["enabled"] = true,
			["name"] = "Arathi Basin",
		},
	},
	["enableCombatStateTracking"] = true,
	["frames"] = {
		["PVPW_CombatStateFrame"] = {
			["point"] = "TOPLEFT",
			["posX"] = 420,
			["posY"] = -260,
			["relativePoint"] = "TOPLEFT",
			["relativeTo"] = "UIParent",
		},
	},
	["lockCombatStateFrame"] = true,
	["spellEnemyAvoidList"] = {
		["warrior"] = {
			["disarm"] = {
				["soundFadeWarningActive"] = false,
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 0,
			},
			["pummel"] = {
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 0,
			},
		},
	},
	["spellList"] = {
		["druid"] = {
			["barkskin"] = {
				["soundFadeWarningActive"] = true,
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 10,
			},
			["natures_grasp"] = {
				["soundFadeWarningActive"] = true,
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 4,
			},
			["natures_swiftness"] = {
				["soundFadeWarningActive"] = true,
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 4,
			},
		},
		["hunter"] = {
			["deterrence"] = {
				["soundFadeWarningActive"] = true,
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 5,
			},
		},
		["items"] = {
			["immune_charm_fear_polymorph"] = {
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 3,
			},
			["immune_charm_fear_stun"] = {
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 3,
			},
			["immune_fear_polymorph_snare"] = {
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 3,
			},
			["immune_fear_polymorph_stun"] = {
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 3,
			},
			["immune_root_snare_stun"] = {
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 3,
			},
		},
		["mage"] = {
			["arcane_power"] = {
				["soundFadeWarningActive"] = true,
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 10,
			},
			["ice_block"] = {
				["soundFadeWarningActive"] = true,
				["soundWarningActive"] = true,
				["spellActive"] = false,
				["visualWarningColor"] = 10,
			},
			["polymorph"] = {
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 0,
			},
			["presence_of_mind"] = {
				["soundFadeWarningActive"] = true,
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 10,
			},
		},
		["misc"] = {
		},
		["paladin"] = {
			["blessing_of_freedom"] = {
				["soundFadeWarningActive"] = true,
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 9,
			},
			["blessing_of_protection"] = {
				["soundFadeWarningActive"] = true,
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 9,
			},
			["divine_shield"] = {
				["soundFadeWarningActive"] = false,
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 9,
			},
		},
		["priest"] = {
		},
		["racials"] = {
		},
		["rogue"] = {
			["adrenaline_rush"] = {
				["soundFadeWarningActive"] = true,
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 1,
			},
			["blade_flurry"] = {
				["soundFadeWarningActive"] = true,
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 1,
			},
			["cold_blood"] = {
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 1,
			},
			["evasion"] = {
				["soundFadeWarningActive"] = true,
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 2,
			},
		},
		["shaman"] = {
			["elemental_mastery"] = {
				["soundFadeWarningActive"] = true,
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 6,
			},
			["natures_swiftness"] = {
				["soundFadeWarningActive"] = true,
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 6,
			},
			["tremor_totem"] = {
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 6,
			},
		},
		["warlock"] = {
			["amplify_curse"] = {
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 2,
			},
		},
		["warrior"] = {
			["recklessness"] = {
				["soundFadeWarningActive"] = true,
				["soundWarningActive"] = true,
				["spellActive"] = false,
				["visualWarningColor"] = 7,
			},
		},
	},
	["spellSelfAvoidList"] = {
		["rogue"] = {
			["kidney_shot"] = {
				["soundWarningActive"] = false,
				["spellActive"] = true,
				["visualWarningColor"] = 0,
			},
		},
		["warrior"] = {
			["hamstring"] = {
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 0,
			},
			["mortal_strike"] = {
				["soundWarningActive"] = true,
				["spellActive"] = true,
				["visualWarningColor"] = 0,
			},
		},
	},
}
PVPWarnProfiles = {
	{
		["name"] = "Default",
		["spellConfiguration"] = {
			["druid"] = {
				["barkskin"] = {
					["soundFadeWarningActive"] = true,
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 4,
				},
				["natures_grasp"] = {
					["soundFadeWarningActive"] = true,
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 4,
				},
				["natures_swiftness"] = {
					["soundFadeWarningActive"] = true,
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 4,
				},
			},
			["hunter"] = {
				["deterrence"] = {
					["soundFadeWarningActive"] = true,
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 5,
				},
			},
			["items"] = {
				["immune_charm_fear_polymorph"] = {
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 3,
				},
				["immune_charm_fear_stun"] = {
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 3,
				},
				["immune_fear_polymorph_snare"] = {
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 3,
				},
				["immune_fear_polymorph_stun"] = {
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 3,
				},
				["immune_root_snare_stun"] = {
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 3,
				},
			},
			["mage"] = {
				["arcane_power"] = {
					["soundFadeWarningActive"] = true,
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 10,
				},
				["ice_block"] = {
					["soundFadeWarningActive"] = true,
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 10,
				},
				["presence_of_mind"] = {
					["soundFadeWarningActive"] = true,
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 10,
				},
			},
			["misc"] = {
			},
			["paladin"] = {
				["blessing_of_freedom"] = {
					["soundFadeWarningActive"] = true,
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 9,
				},
				["blessing_of_protection"] = {
					["soundFadeWarningActive"] = true,
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 9,
				},
				["divine_shield"] = {
					["soundFadeWarningActive"] = true,
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 9,
				},
			},
			["priest"] = {
			},
			["racials"] = {
			},
			["rogue"] = {
				["adrenaline_rush"] = {
					["soundFadeWarningActive"] = true,
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 1,
				},
				["blade_flurry"] = {
					["soundFadeWarningActive"] = true,
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 1,
				},
				["cold_blood"] = {
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 1,
				},
				["evasion"] = {
					["soundFadeWarningActive"] = true,
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 1,
				},
			},
			["shaman"] = {
				["elemental_mastery"] = {
					["soundFadeWarningActive"] = true,
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 6,
				},
				["natures_swiftness"] = {
					["soundFadeWarningActive"] = true,
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 6,
				},
				["tremor_totem"] = {
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 6,
				},
			},
			["warlock"] = {
				["amplify_curse"] = {
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 2,
				},
			},
			["warrior"] = {
				["recklessness"] = {
					["soundFadeWarningActive"] = true,
					["soundWarningActive"] = true,
					["spellActive"] = true,
					["visualWarningColor"] = 7,
				},
			},
		},
		["spellEnemyAvoidConfiguration"] = {
		},
		["spellSelfAvoidConfiguration"] = {
		},
		["version"] = "v1.2.8",
	},
	["activeProfile"] = "Default",
	["modified"] = true,
}
