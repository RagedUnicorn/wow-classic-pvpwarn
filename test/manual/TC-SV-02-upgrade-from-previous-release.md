# TC-SV-02 — Upgrade from previous release migrates cleanly

**Area:** SavedVariables | **Client:** Era | **Mandatory:** yes

## Preconditions

- Client fully logged out
- The version bump for the release under test is already applied — `pom.xml` bumped and
  `mvn generate-resources -D generate.sources.overwrite=true -P development` re-run, so
  `PVPWarn.toc` carries the **new** `## Version:`. `SetAddonVersion()` stamps whatever the
  TOC says; without the bump the version expectation below can neither pass nor fail
- The previous release's schema fixture: `test/manual/fixtures/TC-SV-02-pvpwarn-v1.2.8.lua`
- Backup of the test character's current `WTF/.../SavedVariables/PVPWarn.lua` taken (to
  restore after the test)

## Steps

1. Copy the fixture over the character's `SavedVariables/PVPWarn.lua` and delete
   `PVPWarn.lua.bak`
2. Log in with a Warrior (the fixture's spell lists are Warrior-shaped)
3. Observe the screen and chat for errors and for the profile reset message
4. Open `/rgpvpw opt` and check the Options, Detection Bar, Flash and Profiles panels
5. Trigger one warning in combat to confirm the addon still warns after the migration
6. Log out and inspect the SavedVariables file

## Expected

- No Lua errors on login
- `UpgradeToV2_0_0()` **runs** — `IsVersionBefore("v1.2.8", "v2.0.0")` is true — finds the
  version-less fixture profile, calls `InitializeDefaultProfile()` and prints
  `user_message_profiles_reset_for_upgrade` ("Your profiles have been reset to default due
  to the upgrade to v2.0.0"). That chat message is the observable proof the path ran
- `PVPWarnProfiles` afterwards holds **exactly one** entry named `Default`, carrying a
  `version` field with the new release version, plus `activeProfile = "Default"` and
  `modified = false`
- The three spell lists are **replaced**, not preserved. `InitializeDefaultProfile()` ends in
  `LoadProfile("Default")`, which clones the class defaults over
  `PVPWarnConfiguration.spellList` / `spellSelfAvoidList` / `spellEnemyAvoidList`. After
  login they are keyed by **numeric spellId**; the fixture's name-keyed entries are gone.
  Losing the old per-spell customization is the expected cost of the reset and is what the
  chat message announces
- The non-spell v1.2.8 keys **do** survive: `enableCombatStateTracking`,
  `lockCombatStateFrame`, `addonZoneConfiguration` (Warsong Gulch still `enabled = false` as
  set in the fixture) and the `PVPW_CombatStateFrame` entry in `frames` unchanged
- Fields introduced after v1.2.8 are present at their defaults:
  `enableStanceStateTracking = true`, `lockStanceStateFrame = true`,
  `hideUnknownStance = false`, `activeVoicePack = "default"`, `lastNotifiedVersion = ""`,
  and the whole `detectionBar` / `flash` / `targetFilter` sub-blocks
- `addonVersion` in the file is bumped to the new release version
- No Lua errors

## Notes

The fixture is hand-trimmed, not a full capture — a real v1.2.8 `PVPWarnConfiguration`
carries a per-spell entry for every spell in all twelve categories and runs to thousands of
lines. It keeps every top-level key of the v1.2.8 schema and a handful of spells per list,
which is what the backfill and migration paths actually read.

Note the fixture's spell lists are keyed by **spell name**. That is not a mistake: v1.2.8
addressed per-spell configuration as
`PVPWarnConfiguration[spellList][categoryName][spellName]`. The move to numeric spellId keys
came later, and the profile reset is what carries a v1.2.8 file across that break — there is
no name-to-id conversion anywhere.

v1.2.8 predates a lot: stance tracking, the detection bar, the flash, the target filter, the
voice pack selection and `lastNotifiedVersion` all arrived later, so this single hop
exercises nearly the whole `SetupConfiguration()` backfill. It also predates `v2.0.0`, which
is why the profile reset fires. When a release ships whose stored profiles already carry a
`version >= v2.0.0`, snapshot a fixture from it into `test/manual/fixtures/` alongside this
one and extend the case to assert those profiles survive **unchanged** instead of being
reset — that is the hop this fixture cannot cover.
