# Development

### Add a new Spell

#### Spell

- [ ] Create an entry for the spell in /code/PVPW_SpellMap.lua and the matching category
- [ ] Create an entry in /example-events/[category] and gather a mtaching event
- [ ] Create a sound file /assets/sounds/[language]/[category]/[spellName].mp3
- [ ] Add sound test /test/PVPW_TestSound[category][language].lua
- [ ] Add combat test /test/PVPW_TestCombatEvents[category][language].lua

#### Avoid Spell

- [ ] Create an entry for the spell in /code/PVPW_SpellAvoidMap.lua and the matching category
- [ ] Create an entry in /example-events/[category] and gather events such as dodge, miss etc.
- [ ] Create enemy avoid sound file /assets/sounds/[language]/[category]/enemy_avoid/[spellName].mp3
- [ ] Create self avoid sound file /assets/sounds/[language]/[category]/self_avoid/[spellName].mp3
- [ ] Add enemy avoid sound test /test/PVPW_TestSoundEnemyAvoid[category][language].lua
- [ ] Add self avoid sound test /test/PVPW_TestSoundSelfAvoid[category][language].lua
- [ ] Add enemy avoid combat test /test/PVPW_TestCombatEventsEnemyAvoid[category][language].lua
  - Depending on what possible avoids the spell supports different testcases need to be created
- [ ] Add self avoid combat test /test/PVPW_TestCombatEventsSelfAvoid[category][language].lua
  - Depending on what possible avoids the spell supports different testcases need to be created
- [ ] Add tests to /test/PVPW_TestAll[language].lua

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

- **PVPW_StanceState.lua**: Core stance tracking logic
- **PVPW_SpellMap.lua**: Defines which spells are stance spells (`isStanceSpell = true`)
- **PVPW_CombatLog.lua**: Processes combat events and triggers stance tracking

#### Adding Stance Support

To add stance tracking for a new spell:

1. Add `isStanceSpell = true` to the spell entry in PVPW_SpellMap.lua
2. Include both `SPELL_AURA_APPLIED` and `SPELL_AURA_REMOVED` in `trackedEvents`
3. Add the class to `supportedClasses` in PVPW_StanceState.lua if needed

For a detailed flow diagram and more information, see [docs/stance-tracking-flow.md](docs/stance_tracking_flow.md).
