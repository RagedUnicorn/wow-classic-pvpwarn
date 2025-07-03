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

#### Self Avoid

To check if we as a player avoided an attack/spell we filter for hostile player combat log entries.

```lua
if CombatLog_Object_IsA(sourceFlags, COMBATLOG_FILTER_HOSTILE_PLAYERS) then
  -- work
end
```

Example event for a resisted spell. This is from our view and we resisted the counterspell from an enemy player.

```lua
{
    ["spellName"] = "Counterspell",
    ["target"] = "Player-uid",
    ["targetName"] = "Targetname",
    ["event"] = "SPELL_MISSED",
    ["sourceFlags"] = 66888,
}
```

#### Enemy Avoid

For checking if an enemy avoided something from us we need to make sure to include `COMBATLOG_FILTER_MINE`. This filters for our own events.

```lua
if CombatLog_Object_IsA(sourceFlags, COMBATLOG_FILTER_MINE) then
  -- work
end
```

Example event for a resisted spell. In this case counterspell was casted and the enemy (the targetname) resisted the spell.

```lua
{
  ["spellName"] = "Counterspell",
  ["target"] = "Player-uid",
  ["targetName"] = "Targetname",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = 1297,
}
```

#### Event SPELL_MISSED

The name spell missed might be a bit misleading. It is important to know that even physical spells are considered spells and thus the event `SPELL_MISSED` is used for everything that is related to avoiding a spell in some way. WoW supports the following misstypes.

###### WoW full list missTypes

* ABSORB
* BLOCK
* DEFLECT
* DODGE
* EVADE
* IMMUNE
* MISS
* PARRY
* REFLECT
* RESIST

###### PVPWarn supported missTypes

* DODGE
* PARRY
* IMMUNE
* MISS
* BLOCK
* RESIST

PVPWarn uses the exact missType for two things.

###### Filter Unwanted missType

PVPWarn filters unwanted missTypes. See above for supported missTypes. As an example completely absorbing a spell such as `Cone of Cold` with a `Power Word: Shield` is in the eyes of PVPWarn not an avoid. By filtering `ABSORB` those events will not be processed.

###### Filter Unsuported missType for Spell

Certain spells might not support a specific misstype. The spellAvoidMap has the ultimate control in what PVPWarn thinks what possible avoids each spell has. Before an avoid event is announced the spellAvoidMap has to be consulted about whether the spell supports that misstype event.
