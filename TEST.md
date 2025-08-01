# Test

> PVPWarn has an extensive testsuite for all supported spells. Testing in the World of Warcraft client is managed through a command-line interface and test session system.

## Test Execution

### Command Line Interface

All tests are executed through slash commands. **Direct function calls using `/run` are not supported.**

#### Available Test Commands

```
/rgpvpw testlog [show|hide|clear]       - Manage test log window
/rgpvpw testsound [category]            - Run sound tests for category
/rgpvpw testselfsound [category]        - Run self-avoid sound tests for category
/rgpvpw testenemysound [category]       - Run enemy-avoid sound tests for category
/rgpvpw testcombatevent [category]      - Run combat event tests for category
/rgpvpw testselfcombatevent [category]  - Run self-avoid combat event tests for category
/rgpvpw testenemycombatevent [category] - Run enemy-avoid combat event tests for category
/rgpvpw testvalidation [type]           - Run test validation checks
```

**Available categories**: `druid`, `hunter`, `mage`, `paladin`, `priest`, `rogue`, `shaman`, `warlock`, `warrior`, `items`, `racials`, `misc`, `all`

#### Command Examples

```
/rgpvpw testsound mage                - Run mage sound tests
/rgpvpw testenemysound all            - Run enemy-avoid sound tests for all categories
/rgpvpw testcombatevent priest        - Run priest combat event tests
/rgpvpw testlog show                  - Show test log window
```

### Test Log Window

The test log window provides a comprehensive interface for viewing test results and managing test sessions.

#### Test Log Window Features

- **Session Management**: View results from current and previous test sessions
- **Real-time Updates**: See test results as they execute
- **Filtering**: Focus on specific test categories or sessions
- **Persistent Storage**: Test logs are saved to `PVPWarnTestLog` saved variables
- **Color-coded Results**: Visual indicators for passed/failed tests

#### Test Log Commands

```
/rgpvpw testlog show     - Display the test log window with saved test results
/rgpvpw testlog hide     - Hide the test log window
/rgpvpw testlog clear    - Clear the current display (does not delete saved logs)
```

#### Using the Test Log Window

1. **Open the window**: `/rgpvpw testlog show`
2. **Run tests**: Use any test command (e.g., `/rgpvpw testsound mage`)
3. **View results**: Results appear in real-time in the log window
4. **Review sessions**: Select different test sessions from the dropdown to review past results

## Test Structure

### Test Function Structure

Every test module follows a standardized structure with session management:

```lua
function me.Test()
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw [command] [category]")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end
```

**Key Points:**
- Tests can only be executed within an active test session
- Session management is handled automatically by the command interface
- Direct function calls bypass session management and are not supported
- Error messages guide users to the correct command syntax

## Test Types

### Sound Tests

Sound tests verify that playing specific sounds works correctly, catching issues like missing sound files or configuration errors.

#### File Naming Pattern
```
TestSound[Category].lua
TestSoundSelfAvoid[Category].lua
TestSoundEnemyAvoid[Category].lua
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

Combat event tests verify that the addon correctly handles expected combat log events for specific spells.

#### File Naming Pattern

```
TestCombatEvents[Category].lua
TestCombatEventsSelfAvoid[Category].lua
TestCombatEventsEnemyAvoid[Category].lua
```

#### Combat Event Types

##### Aura Applied Test

Combat event: `SPELL_AURA_APPLIED`

```lua
function me.TestCombatEventSpellNameApplied_12345()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSpellNameApplied_12345",
    testCategory,
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
    12345  -- spell ID
  )
end
```

##### Combat Event Self/Enemy Avoid Test

Combat event: `SPELL_MISSED`

Available miss types: `DODGE`, `PARRY`, `IMMUNE`, `MISS`, `BLOCK`, `RESIST`

```lua
function me.TestCombatEventSelfAvoidSpellNameDodge_12345()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSpellNameDodge_12345",
    testCategory,
    12345,  -- spell ID
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSpellNameParry_12345()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSpellNameParry_12345",
    testCategory,
    12345,  -- spell ID
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end
```

## Test Development Guidelines

### Adding New Tests

1. **Follow naming conventions**: Use consistent file and function naming patterns
2. **Use spell IDs**: Reference spells by their numeric ID, not name
3. **Include session checks**: All Test() functions must check for active sessions
4. **Test comprehensively**: Include all relevant event types for each spell
5. **Update documentation**: Document new test categories or patterns

### Debugging Tests

1. **Use test log window**: Monitor real-time test execution and results
2. **Check session status**: Ensure tests are run through command interface
3. **Verify spell IDs**: Confirm spell IDs match the spell map
4. **Review error messages**: Failed tests provide specific error information

### Best Practices

- Always use the command interface rather than direct function calls
- Keep the test log window open during test development
- Test both positive and negative cases where applicable
- Use descriptive test function names that include spell ID
- Group related tests logically within categories
