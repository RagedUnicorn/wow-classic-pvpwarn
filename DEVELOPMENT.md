# Development

### Add a new Spell

#### Spell

- [ ] Create an entry for the spell in `code/spellmap/Base.lua` in the matching category. Spells that
      only exist on a specific branch go into the branch overlay instead
      (`code/spellmap/overlay/Sod.lua` or `code/spellmap/overlay/Tbc.lua`)
- [ ] Create a sound file `assets/sounds/en/[category]/[spell_name].mp3`
      (see `docker compose run --rm voice-generator`)
- [ ] Add sound test cases to `test/[branch]/[category]/TestSound[Category].lua`
- [ ] Add combat test cases to `test/[branch]/[category]/TestCombatEvents[Category].lua`
- [ ] Run `docker compose run --rm verify-spellmap` and `docker compose run --rm verify-sounds`

#### Avoid Spell

- [ ] Create an entry for the spell in `code/spellavoidmap/Base.lua` in the matching category. Spells
      that only exist on a specific branch go into the branch overlay instead
      (`code/spellavoidmap/overlay/Sod.lua` or `code/spellavoidmap/overlay/Tbc.lua`)
- [ ] Create enemy avoid sound file `assets/sounds/en/[category]/enemy_avoid/enemy_avoided_[spell_name].mp3`
- [ ] Create self avoid sound file `assets/sounds/en/[category]/self_avoid/you_avoided_[spell_name].mp3`
- [ ] Add enemy avoid sound test cases to `test/[branch]/[category]/TestSoundEnemyAvoid[Category].lua`
- [ ] Add self avoid sound test cases to `test/[branch]/[category]/TestSoundSelfAvoid[Category].lua`
- [ ] Add enemy avoid combat test cases to `test/[branch]/[category]/TestCombatEventsEnemyAvoid[Category].lua`
  - Depending on what possible avoids the spell supports different testcases need to be created
- [ ] Add self avoid combat test cases to `test/[branch]/[category]/TestCombatEventsSelfAvoid[Category].lua`
  - Depending on what possible avoids the spell supports different testcases need to be created
- [ ] Run `docker compose run --rm verify-spellmap` and `docker compose run --rm verify-sounds`

New test files (as opposed to new test cases in existing files) additionally need to be registered in
`build-resources/pvpwarn-development.toc.tpl`. See [TEST.md](TEST.md) for the test layout and naming
conventions.

### Avoid and How it Works

#### Event SPELL_MISSED

The name spell missed might be a bit misleading. It is important to know that even physical spells are considered spells and thus the event `SPELL_MISSED` is used for everything that is related to avoiding a spell in some way. WoW supports the following misstypes.

##### SPELL_MISSED Event Parameters

The SPELL_MISSED event as received through `CombatLogGetCurrentEventInfo()` follows this parameter
structure:

```
timestamp, subevent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags,
destGUID, destName, destFlags, destRaidFlags, spellId, spellName, spellSchool,
missType, isOffHand, amountMissed
```

```
m/dd/yyyy hh:mm:ss.SSSS  SPELL_MISSED,[sourceGUID],"[sourceName]",0x511,0x0,[destGUID],"[destName]",0x10548,0x0,[spellId],"[spellName]",0x1,[misstType],nil,nil
```

Parameter breakdown:
- **timestamp** (1): Event time (e.g., "4/21/2025 18:08:37.4702")
- **subevent** (2): Always "SPELL_MISSED" for this event type
- **hideCaster** (3): Boolean whether the source unit is hidden (not written to WoWCombatLog.txt,
  which is why it does not show up in the raw log example below)
- **sourceGUID** (4): GUID of the caster (e.g., "Player-1234-ABCDEF01")
- **sourceName** (5): Name of the caster (e.g., "Player1-ServerName-EU")
- **sourceFlags** (6): Bit flags for source unit (e.g., 0x511 for player)
- **sourceRaidFlags** (7): Raid-specific flags
- **destGUID** (8): GUID of the target
- **destName** (9): Name of the target
- **destFlags** (10): Bit flags for destination unit
- **destRaidFlags** (11): Raid-specific flags for destination
- **spellId** (12): Numerical ID of the spell (e.g., 462717)
- **spellName** (13): Name of the spell (e.g., "Backstab")
- **spellSchool** (14): School of magic (0x1 = Physical, 0x2 = Holy, etc.)
- **missType** (15): Type of miss (DODGE, PARRY, MISS, etc.)
- **isOffHand** (16): Boolean for offhand attacks (often nil)
- **amountMissed** (17): Amount that would have been dealt (often nil)

The positions match the indices used in `code/CombatLog.lua`
(`mod.common.SelectMultiple({12, 13, 15}, ...)` for spellId, spellName, and missType).

##### Real Example

```
4/21/2025 18:08:37.4702  SPELL_MISSED,Player-1234-ABCDEF01,"Player1-ServerName-EU",0x511,0x0,Player-1234-ABCDEF02,"Player2-ServerName-EU",0x10548,0x0,462717,"Backstab",0x1,DODGE,nil,nil
```

In this example:
- A player named "Player1" attempted to use Backstab
- The target "Player2" dodged the attack
- The spell school 0x1 indicates this is a physical ability
- The missType "DODGE" tells us exactly how the spell was avoided

###### PVPWarn supported missTypes

 - DODGE
 - BLOCK
 - PARRY
 - MISS
 - RESIST
 - IMMUNE
 - REFLECT

###### Filter Unwanted missType

PVPWarn filters unwanted missTypes. See above for supported missTypes. As an example completely absorbing a spell such as `Cone of Cold` with a `Power Word: Shield` is in the eyes of PVPWarn not an avoid. By filtering `ABSORB` those events will not be processed.

###### Self Avoid

To check if we as a player avoided an attack/spell we filter for hostile player combat log entries.

```lua
if CombatLog_Object_IsA(sourceFlags, COMBATLOG_FILTER_HOSTILE_PLAYERS) then
  -- work
end
```

###### Enemy Avoid

For checking if an enemy avoided something from us we need to make sure to include `COMBATLOG_FILTER_MINE`. This filters for our own events.

```lua
if CombatLog_Object_IsA(sourceFlags, COMBATLOG_FILTER_MINE) then
  -- work
end
```

### Stance Tracking

PVPWarn tracks stance states for Warriors, Druids, Priests, Hunters, and Warlocks to display their current form/stance in the UI. This feature helps players identify enemy capabilities at a glance.

#### How It Works

1. **Event Detection**: Listens for `SPELL_AURA_APPLIED` and `SPELL_AURA_REMOVED` events
2. **Stance Storage**: Maintains a tracker table with target GUIDs as keys
3. **UI Updates**: Shows stance icons when targeting tracked enemies
4. **Cleanup**: Removes stale entries older than 2 minutes (`stanceExpiredTimeout` in code/StanceState.lua)

#### Key Files

- **code/StanceState.lua**: Core stance tracking logic
- **code/spellmap/Base.lua**: Defines which spells are stance spells (`isStanceSpell = true`)
- **code/CombatLog.lua**: Processes combat events and triggers stance tracking

#### Adding Stance Support

To add stance tracking for a new spell:

1. Add `isStanceSpell = true` to the spell entry in code/spellmap/Base.lua
2. Include both `SPELL_AURA_APPLIED` and `SPELL_AURA_REMOVED` in `trackedEvents`
3. Add the class to `supportedClasses` in StanceState.lua if needed

For a detailed flow diagram and more information, see [docs/stance-tracking-flow.md](docs/stance_tracking_flow.md).

### Branch-specific Spells (Season of Discovery / TBC)

The spell maps are assembled per branch (`classic`, `sod`, `tbc`) from a base map plus branch
overlays:

- `code/spellmap/Base.lua` / `code/spellavoidmap/Base.lua` - the Classic Era base map.
- `code/spellmap/overlay/Sod.lua`, `code/spellmap/overlay/Tbc.lua` (and their
  `code/spellavoidmap/overlay/` counterparts) - branch overlays applied on top of the base map by
  `code/SpellMapAssembler.lua` (`mod.spellMapAssembler` / `mod.spellAvoidMapAssembler`, two
  instances of the same shared engine).

Spell entries additionally carry a `type` (`RGPVPW_CONSTANTS.SPELL_TYPE_BASE`, `SPELL_TYPE_SOD`, or
`SPELL_TYPE_TBC`) that `SpellMapHelper.GetFilteredSpellMap` uses to filter what is shown.

#### Overlay operations

Each overlay maps a category to a set of operations, applied in this order:

- `remove` - drop a base spellId that does not exist (or was replaced) on the branch.
- `add` - add a branch-only spell; the spellId must not exist in the base map.
- `replace` - replace an existing base entry with branch-specific data.
- `appendRanks` - append additional ranks to an existing base entry's `allRanks` (e.g. a new TBC
  rank of a Classic spell) without duplicating the whole entry.

Spells that were reworked on a branch and given new spell IDs are modeled as a `remove` of the base
entry plus an `add` of the new entry, so each client shows exactly one enable/disable option for the
spell. The SoD hunter traps (Explosive/Freezing/Immolation/Frost Trap) are the worked example in
`code/spellmap/overlay/Sod.lua`. Overlays are validated on assembly (`spellMapAssembler.Validate`
logs every rule violation) and by the `verify-spellmap` tool.

### Voice Pack Integration

PVPWarn supports custom voice packs as separate addons that can provide alternative sound files. Voice packs register themselves with the main addon and users can select them through the settings menu. For detailed information about how voice packs work and implementation details, see [docs/voice_pack_loading_flow.md](docs/voice_pack_loading_flow.md).

## Development Tools

### Docker Compose Services

The project includes a comprehensive Docker Compose configuration with multiple services for development and validation tasks. Each service is containerized and requires no local setup beyond Docker.

**Available Services:**

```bash
# Code Quality
docker compose run --rm luacheck                    # Run lua linting
docker compose run --rm luacheck-report             # Generate lua lint report

# Tests
docker compose run --rm busted                      # Run headless busted tests
docker compose run --rm busted-report               # Generate busted test report

# Combat Log Analysis
docker compose run --rm combat-log-parser           # Parse combat logs 
docker compose run --rm combat-log-parser-report    # Parse combat logs with report output
# To collect combat logs from players, point them to CONTRIBUTING.md

# Sound Verification
docker compose run --rm verify-sounds               # Verify sound files exist
docker compose run --rm verify-sounds-report        # Verify sound files with detailed report

# SpellMap Validation
docker compose run --rm verify-spellmap             # Verify SpellMap and SpellAvoidMap
docker compose run --rm verify-spellmap-report      # Verify SpellMap with report output

# Voice Generation
# Requires an ElevenLabs API key: cp tools/voice_generator/.env.example tools/voice_generator/.env
# and fill in the key. See tools/voice_generator/README.md for details.
docker compose run --rm voice-generator             # Generate voice files using ElevenLabs API
```

**Output Files:**
Services with "-report" suffix generate output files in the `./target/` directory:
- `./target/luacheck-junit.xml` - Luacheck results in JUnit format
- `./target/busted-junit.xml` - Busted test results in JUnit format
- `./target/combat_log_parser_output/` - Combat log analysis results  
- `./target/verify_sounds_output/verification_report.txt` - Sound verification report
- `./target/verify_spellmap_output/verification_report.txt` - SpellMap validation report
- `./target/voice_output/` - Generated voice files

### Running Luacheck

The project includes a Docker Compose configuration for running [Luacheck](https://github.com/lunarmodules/luacheck), a static analyzer and linter for Lua. This ensures code quality and catches common issues.

**To run Luacheck:**

```bash
docker compose run --rm luacheck
```

This will:
- Mount the project directory as read-only
- Run Luacheck on all Lua files
- Output any warnings or errors found

**To generate a report:**
```bash
docker compose run --rm luacheck-report
```

**Configuration:**
- `.luacheckrc` - Contains Luacheck configuration, including:
  - Global variables specific to WoW addons
  - Lua 5.1 standard for compatibility
  - Excluded directories (e.g., `target/`, `tools/`)

### Headless Unit Tests (busted)

The project uses [busted](https://lunarmodules.github.io/busted/) for headless unit tests. Specs
live under `test/headless/spec/`; a busted helper at `test/headless/Bootstrap.lua` reproduces the
minimal addon environment (the `rgpvpw` namespace, a shimmed `RGPVPW_ENVIRONMENT`, and the pure
modules Constants/Logger/Common in TOC dependency order) so modules can be tested without the WoW
client running. The `test/headless/` subfolder keeps these specs separate from the in-game tests
under `test/`.

**To run the test suite:**

```bash
docker compose run --rm busted
```

This will:
- Mount the project directory as read-only
- Run busted against the `test/headless/spec/` directory (configured via `.busted`)
- Report the number of successes / failures / errors

**To generate a report:**
```bash
docker compose run --rm busted-report
```

This generates a JUnit XML report in `./target/busted-junit.xml`.

**Configuration:**
- `.busted` - busted run configuration (spec root, the bootstrap helper, the `Spec.lua` pattern)
- `test/headless/Bootstrap.lua` - test globals and pure-module bootstrap
- `test/headless/WowStubs.lua` - opt-in registry of WoW-global stubs (`GetTime`, `C_Timer`,
  `GetLocale`, `C_AddOns`, ...); a spec installs what it needs and restores it in `after_each`

**Spec conventions:**
- Saved variables are assigned through the global table (`_G.PVPWarnConfiguration = { ... }`) - a
  bareword assignment inside the busted sandbox is not seen by the module under test.
- Modules load via `dofile`, not `require`: re-`dofile` a module in `before_each`
  (e.g. `dofile("code/Warn.lua")`) to reset its file-local state between tests.

**Relationship to the in-game test framework:** the headless busted suite covers pure Lua logic
(table/string math, configuration state, queue timing) with no WoW client involved. Anything that
touches real WoW APIs - combat-log replay, sound playback, frame behavior - still runs through the
in-game session-based framework triggered via `/rgpvpw test ...`; see [TEST.md](TEST.md) for that
suite's layout and naming conventions.

### Testing and Code Quality

Before committing changes:

1. Run Luacheck to ensure code quality: `docker compose run --rm luacheck`
2. Test the addon with `/reload` to ensure saved variables work correctly
3. Verify functionality in-game (spell warnings, stance tracking, etc.)
4. Run any relevant tests from the test suite

## Dependency Management

This repository uses [Renovate](https://renovatebot.com/) for automated dependency updates. Renovate monitors and updates:

- Maven dependencies (plugins and libraries)
- GitHub Actions versions
- World of Warcraft interface versions and related properties
  - `addon.interface` - WoW interface version
  - `addon.supported.patch` - WoW patch version
  - `addon.curseforge.gameVersion` - CurseForge game version ID

The configuration can be found in `renovate.json`. Renovate runs on a weekly schedule and creates pull requests for available updates.

## Switching between Environments

Switching between development and release can be achieved with maven.

```
mvn generate-resources -D generate.sources.overwrite=true -P development
```

This generates and overwrites `code/Environment.lua` and `PVPWarn.toc`. You need to specifically specify that you want to overwrite the files to prevent data loss. It is also possible to omit the profile because development is the default profile that will be used.

Switching to release can be done as such:

```
mvn generate-resources -D generate.sources.overwrite=true -P release
```

In this case it is mandatory to add the release profile.

**Note:** Switching environments has the effect changing certain files to match an expected value depending on the environment. To be more specific this means that as an example test and debug files are not included when switching to release. It also means that variables such as loglevel change to match the environment.

As to not change those files all the time the repository should always stay in the development environment. Do not commit `PVPWarn.toc` and `code/Environment.lua` in their release state. Changes to those files should always be done inside `build-resources` and their respective template files marked with `.tpl`.

## Packaging the Addon

To package the addon use the `package` phase.

```
mvn package -D generate.sources.overwrite=true -P development
```

This generates an addon package for development. For generating a release package the release profile can be used.

```
mvn package -D generate.sources.overwrite=true -P release
```

**Note:** This packaging and switching resources can also be done one after another.

**Note:** The packaging is not fit to be used for CurseForge because CurseForge expects a specific packaging

```
# switch environment to release
mvn generate-resources -D generate.sources.overwrite=true -P release
# package release
mvn package -P release
```

## Deploy GitHub Release

Before creating a new release update `addon.tag.version` in `pom.xml`. Afterwards to create a new release and deploy to GitHub the `deploy-github` profile has to be used.

```
# switch environment to release
mvn generate-resources -D generate.sources.overwrite=true -P release
# deploy release
mvn package -P deploy-github -D github.auth-token=[token]
```

**Note:** This is only intended for manual deployment to GitHub. With GitHub actions the token is supplied as a secret to the build process

## Deploy CurseForge Release

**Note:** It's best to create the release for GitHub first and only afterwards the CurseForge release. That way the tag was already created.

```
# switch environment to release
mvn generate-resources -D generate.sources.overwrite=true -P release
# deploy release
mvn package -P deploy-curseforge -D curseforge.auth-token=[token]
```

**Note:** This is only intended for manual deployment to CurseForge. With GitHub actions the token is supplied as a secret to the build process

## Deploy Wago.io Release

**Note:** It's best to create the release for GitHub first and only afterwards the Wago.io release. That way the tag was already created.

```
# switch environment to release
mvn generate-resources -D generate.sources.overwrite=true -P release
# deploy release
mvn package -P deploy-wago -D wago.auth-token=[token]
```

**Note:** This is only intended for manual deployment to Wago.io. With GitHub actions the token is supplied as a secret to the build process

## GitHub Action Profiles

This project has GitHub action profiles for different Devops related work such as linting and deployments to different providers. See `.github` folder for details.
