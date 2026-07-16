# Test

> PVPWarn has an extensive testsuite covering every supported spell across all client branches.
> Testing in the World of Warcraft client is driven by a slash-command interface backed by a
> test session system. Tests run inside the client because they exercise real WoW API surfaces
> (sound playback, combat-log events) that cannot be reproduced headlessly.

> **Development builds only.** The entire `test/` tree is included only in development builds.
> Switching the build environment to `release` strips the test and debug files (see
> `DEVELOPMENT.md`), so none of the commands below exist in a released addon.

## Branches (client flavors)

The testsuite is branch-aware. Every spell map, validator, and test case is assembled per branch:

| Branch    | Argument  | Content                               |
|-----------|-----------|---------------------------------------|
| Classic   | `classic` | Classic Era / Anniversary             |
| SoD       | `sod`     | Season of Discovery                   |
| TBC       | `tbc`     | The Burning Crusade Classic           |

Every test and validation command accepts an **optional trailing `[branch]` argument**
(`classic`, `sod`, or `tbc`). **Omit it to run all three branches in sequence.** The runner
calls `SetActiveBranch` before each pass so the assembled spell map and the test-case discovery
all target that branch's content.

Test cases are organized on disk by branch and category:

```
test/<branch>/<category>/Test<Type><Category>.lua
  e.g. test/classic/warrior/TestSoundWarrior.lua
       test/tbc/mage/TestCombatEventsMage.lua
```

The file name omits the branch (the directory carries it), but the module table it registers
includes a PascalCase branch suffix, e.g. `mod.testSoundWarriorClassic`,
`mod.testSoundWarriorTbc`. This is how the runner looks modules up
(`mod["testSound" .. Category .. Branch]`).

## Test Execution

### Run all tests at once

The fastest way to run the complete suite - every test type, every category, every branch - is
the aggregate entry point in `test/TestAll.lua`:

```
/run rgpvpw.testAll.TestAll()           -- all branches (Classic, SoD, TBC)
/run rgpvpw.testAll.TestAll("tbc")      -- single branch only (classic, sod, or tbc)
```

`TestAll` first runs the coverage validators for each branch, then enqueues and plays every
sound and combat-event test (including self-avoid and enemy-avoid variants) for that branch.
It manages its own test session group, so unlike the per-category modules it can be invoked
directly via `/run`. The test log window does not open automatically for `TestAll` - open it
first with `/rgpvpw testlog show` to watch results stream in as the queue plays.

### Command Line Interface

Individual categories are run through `/rgpvpw` slash commands. **Do not call a per-category
test module's `Test()` function directly with `/run`** - those modules check for an active test
session and abort with an error pointing you back to the slash command. `TestAll` (above) is the
only supported `/run` entry point because it sets up its own session group.

#### Available Test Commands

```
/rgpvpw testlog [show|hide|clear]                 - Manage test log window
/rgpvpw testsound <category> [branch]             - Run sound tests
/rgpvpw testselfsound <category> [branch]         - Run self-avoid sound tests
/rgpvpw testenemysound <category> [branch]        - Run enemy-avoid sound tests
/rgpvpw testcombatevent <category> [branch]       - Run combat event tests
/rgpvpw testselfcombatevent <category> [branch]   - Run self-avoid combat event tests
/rgpvpw testenemycombatevent <category> [branch]  - Run enemy-avoid combat event tests
/rgpvpw testvalidation <suite> [branch]           - Run a test-coverage validation suite
```

Running any command with no arguments prints its inline help.

#### Categories

Sound and combat-event tests (`testsound`, `testcombatevent`):

```
all, druid, hunter, mage, paladin, priest, rogue, shaman, warlock, warrior, items, misc, racials
```

Self-avoid and enemy-avoid tests (`testselfsound`, `testenemysound`, `testselfcombatevent`,
`testenemycombatevent`) - class categories only:

```
all, druid, hunter, mage, paladin, priest, rogue, shaman, warlock, warrior
```

`all` runs every category for that test type. Branch-specific gaps (e.g. SoD has no `racials`,
no avoid coverage for some classes) are skipped silently rather than reported as failures.

#### Validation Suites

`testvalidation <suite> [branch]` checks that a test case **exists** for every spell in the spell
maps - it does not run the tests, only verifies coverage completeness.

```
all                               - Run all validation suites
sound                             - Sound test coverage
sounddown                         - Sound "down"/fade test coverage
soundrefresh                      - Sound refresh test coverage
soundselfavoid                    - Self-avoid sound test coverage
soundenemyavoid                   - Enemy-avoid sound test coverage
combatevent                       - Combat event test coverage
combateventselfavoid              - Self-avoid combat event test coverage
combateventenemyavoid             - Enemy-avoid combat event test coverage
combateventselfavoidirrelevant    - Self-avoid irrelevant combat event test coverage
combateventenemyavoidirrelevant   - Enemy-avoid irrelevant combat event test coverage
```

#### Command Examples

```
/run rgpvpw.testAll.TestAll()         - Run the entire suite, all branches
/run rgpvpw.testAll.TestAll("tbc")    - Run the entire suite for TBC only
/rgpvpw testsound mage                - Run mage sound tests (all branches)
/rgpvpw testsound mage tbc            - Run mage sound tests for TBC only
/rgpvpw testsound all                 - Run sound tests for all categories
/rgpvpw testenemysound all            - Run enemy-avoid sound tests for all categories
/rgpvpw testcombatevent priest        - Run priest combat event tests
/rgpvpw testvalidation all            - Run every coverage validation suite
/rgpvpw testvalidation sound tbc      - Check sound test coverage for TBC only
/rgpvpw testlog show                  - Show the test log window
```

### Detection Bar Visual Test

The detection bar is a visual warning channel (a stacked horizontal alert bar), so it is
verified by eye rather than through the session-based suite above. The `bar` subcommand drives
this manual check:

```
/rgpvpw bar test      - Push four staggered fake bars to demo the stack
/rgpvpw bar unlock    - Enter positioning mode: show the anchor's drag handle and a sample bar
/rgpvpw bar lock      - Leave positioning mode (default; mouse disabled, never blocks clicks)
```

Positioning mode is **transient** - it shows a drag handle plus a non-fading sample bar (so the
size, look and position are obvious) and reverts to locked on `/reload` or when combat starts, so
the anchor can never be left intercepting world clicks. Only the dragged position is persisted.
Opening **Settings → PVPWarn → Detection Bar** enters this mode automatically (Edit-Mode style)
and leaves it when you navigate away, so `bar unlock` is mostly for positioning without opening
Settings.

`bar test` pushes four bars (~0.5 s apart) across mixed class / spell / player-name payloads so
the full lifecycle is exercised in one shot:

- newest bar on top, older bars stacking below with the stack-position alpha `{1.0, 0.7, 0.45, 0.30}`,
- each bar's fade-in (180 ms) → hold (4 s) → fade-out (700 ms),
- the 200 ms slide-up when a bar dies,
- a 5th push dropping the oldest immediately (cap is the `maxBars` setting, default 4).

Run `bar test` **twice in quick succession** (within the dedup window, default 1 s) to verify
dedup: the repeated `(playerName, spellID)` payloads refresh the live bars' hold timers instead
of stacking duplicates.

Unlike the automated commands, `bar` needs no test session, takes no `[branch]` argument, and is
**available in every build** - it lives in `code/DetectionBarCmd.lua` (the always-loaded code
section), not the development-only `test/` tree. It exercises the visual surface directly and
does not touch the combat log, so it works without an enemy target. To verify the combat-log
path instead, enable a spell's per-spell *Detection Bar* checkbox in the Spells tab and have that
spell cast on you.

### Test Log Window

The test log window provides a comprehensive interface for viewing test results and managing
test sessions.

#### Test Log Window Features

- **Auto-open**: Window automatically opens when any test starts (if not already visible)
- **Session Management**: View results from current and previous test sessions
- **Real-time Updates**: See test results as they execute
- **Filtering**: Focus on specific test categories or sessions
- **Persistent Storage**: Test logs are saved to the `PVPWarnTestLog` saved variable
  (declared `SavedVariablesPerCharacter` in `PVPWarn.toc`)
- **Color-coded Results**: Visual indicators for passed/failed tests

#### Test Log Commands

```
/rgpvpw testlog show     - Display the test log window with saved test results
/rgpvpw testlog hide     - Hide the test log window
/rgpvpw testlog clear    - Clear the current display (does not delete saved logs)
```

#### Using the Test Log Window

1. **Open the window**: `/rgpvpw testlog show`
2. **Run tests**: Use any test command (e.g. `/rgpvpw testsound mage`) or `/run rgpvpw.testAll.TestAll()`
3. **View results**: Results appear in real-time in the log window
4. **Review sessions**: Select different test sessions from the dropdown to review past results

## Test Structure

### Test Session System

Per-category tests run inside a test session managed by `mod.testSessionManager`. The
slash-command handlers call `StartSession(...)`, which establishes the active session before any
test module runs. Each test module guards against being invoked outside a session:

```lua
function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testsound warrior")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    if type(completionCallback) == "function" then
      completionCallback()
    end
  end)
end
```

**Key Points:**

- Per-category tests can only run within an active test session.
- Session management is handled automatically by the slash-command interface.
- `me.Test(completionCallback)` chains into the next branch/category via its callback, which is
  how the runner sequences multiple branches and the `all` category.
- Direct `/run` calls to a per-category module's `Test()` bypass session management and abort.
- `rgpvpw.testAll.TestAll()` is the exception - it sets up its own session group and is the
  supported way to run everything via `/run`.

### Test Case Collection

A module's `CollectTestCases()` enqueues its individual test functions onto the reporter's
delayed queue:

```lua
function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserkerRage_18499)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserkerRage_18499)
  -- ...
end
```

## Test Types

### Sound Tests

Sound tests verify that playing specific sounds works correctly, catching issues like missing
sound files or configuration errors.

#### File Naming Pattern

```
test/<branch>/<category>/TestSound<Category>.lua
test/<branch>/<category>/TestSoundSelfAvoid<Category>.lua
test/<branch>/<category>/TestSoundEnemyAvoid<Category>.lua
```

#### Test Function Examples

##### Basic Sound Test

```lua
function me.TestSoundSpellName_12345()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSpellName_12345",
    testCategory,
    12345  -- spell ID
  )
end
```

##### Sound Fade Test

```lua
function me.TestSoundDownSpellName_12345()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSpellName_12345",
    testCategory,
    12345  -- spell ID
  )
end
```

##### Sound Self Avoid Test

```lua
function me.TestSoundSelfAvoidSpellName_12345()
  mod.testHelper.TestSoundSpellMissedSelf(
    "TestSoundSelfAvoidSpellName_12345",
    testCategory,
    12345  -- spell ID
  )
end
```

##### Sound Enemy Avoid Test

```lua
function me.TestSoundEnemyAvoidSpellName_12345()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidSpellName_12345",
    testCategory,
    12345  -- spell ID
  )
end
```

### Combat Event Tests

Combat event tests verify that the addon correctly handles expected combat log events for
specific spells.

#### File Naming Pattern

```
test/<branch>/<category>/TestCombatEvents<Category>.lua
test/<branch>/<category>/TestCombatEventsSelfAvoid<Category>.lua
test/<branch>/<category>/TestCombatEventsEnemyAvoid<Category>.lua
```

#### Combat Event Types

##### Aura Applied Test

Combat event: `SPELL_AURA_APPLIED`

```lua
function me.TestCombatEventSpellNameApplied_12345()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSpellNameApplied_12345",
    testCategory,
    "SpellName",
    12345  -- spell ID
  )
end
```

##### Aura Removed Test

Combat event: `SPELL_AURA_REMOVED`

```lua
function me.TestCombatEventSpellNameRemoved_12345()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSpellNameRemoved_12345",
    testCategory,
    "SpellName",
    12345  -- spell ID
  )
end
```

##### Aura Refresh Test

Combat event: `SPELL_AURA_REFRESH`

```lua
function me.TestCombatEventSpellNameRefresh_12345()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventSpellNameRefresh_12345",
    testCategory,
    "SpellName",
    12345  -- spell ID
  )
end
```

##### Spell Cast Success Test

Combat event: `SPELL_CAST_SUCCESS`

```lua
function me.TestCombatEventSpellNameSuccess_12345()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSpellNameSuccess_12345",
    testCategory,
    "SpellName",
    12345  -- spell ID
  )
end
```

##### Combat Event Self/Enemy Avoid Test

Combat event: `SPELL_MISSED`

Available miss types: `DODGE`, `PARRY`, `IMMUNE`, `MISS`, `BLOCK`, `RESIST`, `REFLECT`

```lua
function me.TestCombatEventSelfAvoidSpellNameDodge_12345()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSpellNameDodge_12345",
    testCategory,
    12345,  -- spell ID
    "SpellName",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSpellNameParry_12345()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSpellNameParry_12345",
    testCategory,
    12345,  -- spell ID
    "SpellName",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end
```

## Test Development Guidelines

### Adding New Tests

1. **Place by branch and category**: Add the test file under `test/<branch>/<category>/`.
2. **Register the branch-suffixed module**: `mod.testSound<Category><Branch> = me`
   (e.g. `mod.testSoundMageTbc`).
3. **Register the file in the TOC template**: Add it to the test section of
   `build-resources/pvpwarn-development.toc.tpl` (never `PVPWarn.toc` directly - that file is
   auto-generated and overwritten), then regenerate with
   `mvn generate-resources -D generate.sources.overwrite=true`.
4. **Follow naming conventions**: Use consistent file and function naming patterns.
5. **Use spell IDs**: Reference spells by their numeric ID, not name.
6. **Include session checks**: Per-category `Test()` functions must check for an active session
   and accept a `completionCallback`.
7. **Test comprehensively**: Include all relevant event types for each spell.
8. **Validate coverage**: Run `/rgpvpw testvalidation all` to confirm every spell has a test.

### Debugging Tests

1. **Use the test log window**: Monitor real-time test execution and results.
2. **Check session status**: Ensure tests are run through the command interface (or `TestAll`).
3. **Verify spell IDs**: Confirm spell IDs match the spell map for the active branch.
4. **Scope to a branch**: Pass a `[branch]` argument to isolate failures to one client flavor.
5. **Review error messages**: Failed tests provide specific error information.

### Best Practices

- Use `/run rgpvpw.testAll.TestAll()` for a full regression pass before a release.
- Use the slash-command interface (not direct `/run` of a module) for per-category runs.
- Keep the test log window open during test development.
- Test both positive and negative cases where applicable.
- Use descriptive test function names that include the spell ID.
- Group related tests logically within categories.

## Tooling Tests (out of client)

Separate from the in-client suite, the Python helper tools under `tools/` (`spellmap_core`,
`verify_sounds`, `verify_spellmap`, `voice_generator`) have their own pytest suites, run via
Docker:

```
docker compose -f docker-compose.test.yml run --rm spellmap-core-tests
docker compose -f docker-compose.test.yml run --rm verify-sounds-tests
docker compose -f docker-compose.test.yml run --rm verify-spellmap-tests
docker compose -f docker-compose.test.yml run --rm voice-generator-tests
```

Results are written under `target/test_results/`. These validate the tooling, not the addon's
runtime behavior - the spell, sound, and combat-event tests above remain the authoritative
addon testsuite.
