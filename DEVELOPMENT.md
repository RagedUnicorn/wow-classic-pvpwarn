# Development

### Add a new Spell

#### Spell

- [ ] Create an entry for the spell in /code/SpellMap.lua and the matching category
- [ ] Create an entry in /example-events/[category] and gather a mtaching event
- [ ] Create a sound file /assets/sounds/[language]/[category]/[spellName].mp3
- [ ] Add sound test /test/TestSound[category][language].lua
- [ ] Add combat test /test/TestCombatEvents[category][language].lua

#### Avoid Spell

- [ ] Create an entry for the spell in /code/SpellAvoidMap.lua and the matching category
- [ ] Create an entry in /example-events/[category] and gather events such as dodge, miss etc.
- [ ] Create enemy avoid sound file /assets/sounds/[language]/[category]/enemy_avoid/[spellName].mp3
- [ ] Create self avoid sound file /assets/sounds/[language]/[category]/self_avoid/[spellName].mp3
- [ ] Add enemy avoid sound test /test/TestSoundEnemyAvoid[category][language].lua
- [ ] Add self avoid sound test /test/TestSoundSelfAvoid[category][language].lua
- [ ] Add enemy avoid combat test /test/TestCombatEventsEnemyAvoid[category][language].lua
  - Depending on what possible avoids the spell supports different testcases need to be created
- [ ] Add self avoid combat test /test/TestCombatEventsSelfAvoid[category][language].lua
  - Depending on what possible avoids the spell supports different testcases need to be created
- [ ] Add tests to /test/TestAll[language].lua

### Avoid and How it Works

#### Event SPELL_MISSED

The name spell missed might be a bit misleading. It is important to know that even physical spells are considered spells and thus the event `SPELL_MISSED` is used for everything that is related to avoiding a spell in some way. WoW supports the following misstypes.

##### SPELL_MISSED Event Parameters

The SPELL_MISSED event follows this parameter structure:

```
timestamp, subevent, sourceGUID, sourceName, sourceFlags, sourceRaidFlags,
destGUID, destName, destFlags, destRaidFlags, spellID, spellName, spellSchool,
missType, isOffHand, amountMissed
```

```
m/dd/yyyy hh:mm:ss.SSSS  SPELL_MISSED,[sourceGUID],"[sourceName]",0x511,0x0,[destGUID],"[destName]",0x10548,0x0,[spellId],"[spellName]",0x1,[misstType],nil,nil
```

Parameter breakdown:
- **timestamp**: Event time (e.g., "4/21/2025 18:08:37.4702")
- **subevent**: Always "SPELL_MISSED" for this event type
- **sourceGUID**: GUID of the caster (e.g., "Player-1234-ABCDEF01")
- **sourceName**: Name of the caster (e.g., "Player1-ServerName-EU")
- **sourceFlags**: Bit flags for source unit (e.g., 0x511 for player)
- **sourceRaidFlags**: Raid-specific flags
- **destGUID**: GUID of the target
- **destName**: Name of the target
- **destFlags**: Bit flags for destination unit
- **destRaidFlags**: Raid-specific flags for destination
- **spellID**: Numerical ID of the spell (e.g., 462717)
- **spellName**: Name of the spell (e.g., "Backstab")
- **spellSchool**: School of magic (0x1 = Physical, 0x2 = Holy, etc.)
- **missType**: Type of miss (DODGE, PARRY, MISS, etc.)
- **isOffHand**: Boolean for offhand attacks (often nil)
- **amountMissed**: Amount that would have been dealt (often nil)

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
4. **Cleanup**: Removes stale entries older than 5 minutes

#### Key Files

- **StanceState.lua**: Core stance tracking logic
- **SpellMap.lua**: Defines which spells are stance spells (`isStanceSpell = true`)
- **CombatLog.lua**: Processes combat events and triggers stance tracking

#### Adding Stance Support

To add stance tracking for a new spell:

1. Add `isStanceSpell = true` to the spell entry in SpellMap.lua
2. Include both `SPELL_AURA_APPLIED` and `SPELL_AURA_REMOVED` in `trackedEvents`
3. Add the class to `supportedClasses` in StanceState.lua if needed

For a detailed flow diagram and more information, see [docs/stance-tracking-flow.md](docs/stance_tracking_flow.md).

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

# Combat Log Analysis
docker compose run --rm combat-log-parser           # Parse combat logs 
docker compose run --rm combat-log-parser-report    # Parse combat logs with report output

# Sound Verification
docker compose run --rm verify-sounds               # Verify sound files exist
docker compose run --rm verify-sounds-report        # Verify sound files with detailed report

# SpellMap Validation
docker compose run --rm verify-spellmap             # Verify SpellMap and SpellAvoidMap
docker compose run --rm verify-spellmap-report      # Verify SpellMap with report output

# Voice Generation
docker compose run --rm voice-generator             # Generate voice files using ElevenLabs API
```

**Output Files:**
Services with "-report" suffix generate output files in the `./target/` directory:
- `./target/luacheck-junit.xml` - Luacheck results in JUnit format
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

### Testing and Code Quality

Before committing changes:

1. Run Luacheck to ensure code quality: `docker compose up`
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

This generates and overwrites `GM_Environment.lua` and `GearMenu.toc`. You need to specifically specify that you want to overwrite the files to prevent data loss. It is also possible to omit the profile because development is the default profile that will be used.

Switching to release can be done as such:

```
mvn generate-resources -D generate.sources.overwrite=true -P release
```

In this case it is mandatory to add the release profile.

**Note:** Switching environments has the effect changing certain files to match an expected value depending on the environment. To be more specific this means that as an example test and debug files are not included when switching to release. It also means that variables such as loglevel change to match the environment.

As to not change those files all the time the repository should always stay in the development environment. Do not commit `GearMenu.toc` and `GM_Environment.lua` in their release state. Changes to those files should always be done inside `build-resources` and their respective template files marked with `.tpl`.

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
