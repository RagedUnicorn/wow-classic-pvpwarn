# Development

## TODO descibe all steps necessary to add a new spell to the addon



#### Linked Spells

Linked spells are spells that have the same name as another spell even though they are different. There are not many spells that match this category. An example is `Nature's Swiftness` that can be cast by both a druid and a shaman. The spells are different and have a different spellid. It is however not possible to get the actual spellid from the combatlog of an enemy player. This is a limit by the wow api to better match the classic setting where this was not possible.

PVPWarn solves this problem by linking such spells together as one. This means for the player that it is not possible to have different option settings for spells that are linked together. He cannot have the warning for the druids cast of `Nature's Swiftness` active and have the same on deactivated by the shaman. The settings interface is handling this automatically and always updating linked spells as one.

During combat PVPWarn doesn't really care which spell is used. It will simply take the first one that is found and work from there. This requires that the spells are treated the same and thus essentially are the same. They need to have the same trackedEvents, the same icon, the same soundfile and so on. The only thing that differs between them is their links that point to each other. The only reason the spell has to have an entry in both categories is to show up in the configuration ui.


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

### Enemy Avoid

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
