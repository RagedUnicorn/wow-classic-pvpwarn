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

**Do not run this case against your own development character.** A character used during
development has a SavedVariables file that grew *through* the schema change rather than across
it: its `addonVersion` is whatever in-development version was current, its spell lists are
already keyed by numeric spellId, and every field added since v1.2.8 is already present at a
real value. The migration will still fire on it and still print the reset message, so the case
appears to pass — but it proves nothing, because none of the three things this case exists to
verify (the name-to-id key break, the `SetupConfiguration()` backfill, the profile reset from a
genuinely old profile) are actually exercised. It is a false pass. Use a character whose
SavedVariables came from a real v1.2.8 install, or the fixture below.

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
  fixture profile carrying `version = "v1.2.8"`, takes the *stale-version* branch
  (`IsVersionBefore(profile.version, "v2.0.0")`, **not** the missing-`version` branch above
  it, which real v1.2.8 files never hit because v1.2.8 already stamped a version on every
  profile it created), calls `InitializeDefaultProfile()` and prints
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
- Each of the fixture's customizations is specifically gone — these are what make the loss
  observable rather than inferred, and every one is back at its class default:
  - Mage Ice Block and Warrior Recklessness are **active again** (the fixture had them off)
  - Paladin Divine Shield has its **fade cue back on**
  - Rogue Evasion and Druid Barkskin are back to their **category colours**, not the 2 and 10
    the fixture set
  - Mage Polymorph, which the fixture opted into, is **absent from the Warrior defaults**
  - Both avoid lists are **empty again** — the fixture's Warrior Hamstring / Mortal Strike /
    Pummel / Disarm and Rogue Kidney Shot entries are gone, since every class default ships
    empty avoid profiles
- The non-spell v1.2.8 keys **do** survive: `enableCombatStateTracking`,
  `lockCombatStateFrame`, `addonZoneConfiguration` (Warsong Gulch still `enabled = false` as
  set in the fixture) and the `PVPW_CombatStateFrame` entry in `frames` unchanged
- Fields introduced after v1.2.8 are present at their defaults:
  `enableStanceStateTracking = true`, `lockStanceStateFrame = true`,
  `hideUnknownStance = false`, `activeVoicePack = "default"`, `lastNotifiedVersion = ""`,
  and the whole `detectionBar` / `flash` / `targetFilter` sub-blocks
- `addonVersion` in the file is bumped to the new release version
- No Lua errors

## Optional: replaying v1.2.8 in the client

The checked-in fixture came from v1.2.8's own configuration code and is enough for a normal
release run. The one thing it cannot prove is that the *client* writes what that code produces.
If you want that last increment of confidence — worth doing once, and after any change to
`MigrationPath()` — stage the upgrade by actually running v1.2.8. Get the build from the
[GitHub release](https://github.com/RagedUnicorn/wow-classic-pvpwarn/releases/tag/v1.2.8)
(`pvpwarn-v1.2.8-classic.zip`; `*.zip` is gitignored, so it can sit at the repo root safely).

> **Hazard: the git working tree *is* the live addon folder.** This repo lives at
> `Interface/AddOns/PVPWarn`, which is exactly where the zip wants to extract. Never extract
> over it and never delete it. Commit or stash any pending work first, then move it aside by
> renaming — WoW ignores a folder whose name does not match its TOC, so the renamed copy is
> inert but intact.

1. Close the client completely (SavedVariables are only written on logout/exit)
2. Commit or stash pending work, then rename `Interface/AddOns/PVPWarn` →
   `Interface/AddOns/PVPWarn_repo`
3. Extract `pvpwarn-v1.2.8-classic.zip` into `Interface/AddOns/`, producing a fresh `PVPWarn/`
4. Move the test character's `WTF/.../SavedVariables/PVPWarn.lua` and `.bak` aside so v1.2.8
   starts from nothing
5. v1.2.8 declares `## Interface: 11507`; on a current client it needs **Load out of date
   AddOns** enabled in the character-select AddOns dialog
6. Log in with a Warrior and produce a config worth migrating: toggle a handful of spells
   across several categories in all three lists, change some per-spell sounds and colours,
   create a **custom profile** in addition to Default, disable a zone, and drag the combat
   state frame somewhere identifiable
7. Log out to the character screen and exit the client
8. Copy the resulting `PVPWarn.lua` — that is a genuine v1.2.8 capture. Keep it as the working
   fixture; optionally trim it into `test/manual/fixtures/` (a full one runs to thousands of lines)
9. Delete the extracted v1.2.8 `PVPWarn/` folder and rename `PVPWarn_repo` back to `PVPWarn`
10. Restore the captured file as the character's `PVPWarn.lua`, delete `PVPWarn.lua.bak`, and
    run the Steps above

Step 6 is what the hand-trimmed fixture cannot fully stand in for: the custom profile proves
the reset wipes *all* profiles rather than only Default, and the spread of per-spell
customization is what makes the loss visible when you compare before and after.

## Notes

The fixture was **produced by v1.2.8's own configuration code**, not written by hand: its
`SetupConfiguration()` was run over its own class-profile tables from the release artifact, and
a set of realistic user changes was then applied through its own `spellConfiguration` API. A
hand-written fixture would encode what we *believe* the v1.2.8 schema was, which is the very
thing this case exists to test. The fixture's file header records the details.

The customization matters for this case specifically. A pristine class default cannot
demonstrate the loss the reset causes, and it would leave both avoid lists empty — every v1.2.8
class ships empty avoid profiles, so those lists only exist because a user opted spells in.

Treat the fixture as a fixed artifact. It represents a release that is already in the past, so
it should not need regenerating; if it ever does, use the client replay below, which produces a
file the client actually wrote.

Note the fixture's spell lists are keyed by **spell name**. That is not a mistake: v1.2.8
addressed per-spell configuration as
`PVPWarnConfiguration[spellList][categoryName][spellName]`. The move to numeric spellId keys
came later, and the profile reset is what carries a v1.2.8 file across that break — there is
no name-to-id conversion anywhere.

v1.2.8 predates a lot: stance tracking, the detection bar, the flash, the target filter, the
voice pack selection and `lastNotifiedVersion` all arrived later, so this single hop
exercises nearly the whole `SetupConfiguration()` backfill. It also predates `v2.0.0`, which
is why the profile reset fires.

This case proves the reset **fires**. What it structurally cannot cover is the other half — a
profile already at `version >= v2.0.0` surviving **unchanged** on a later upgrade — because a
v1.2.8 fixture is always below the gate. That matters more than it sounds: while this release
was still numbered v1.3.0, `InitializeDefaultProfile()` stamped rebuilt profiles *below* the
`v2.0.0` gate, so every future version bump would have silently wiped them again. Shipping as
v2.0.0 is what closes the gate, and nothing in this case would have caught it.

To cover it, stage an upgrade *within* the v2.x line: take a v2.0.0 SavedVariables file, run it
against a build whose TOC is v2.0.1 or later, and assert the opposite of everything above — no
`user_message_profiles_reset_for_upgrade` message, profiles and per-spell customization intact,
only `addonVersion` changed. The TOC must be strictly newer than the file, or `SetAddonVersion()`
returns before `MigrationPath()` is ever reached and the check passes without executing any
migration code at all.
