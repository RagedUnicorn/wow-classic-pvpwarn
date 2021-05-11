# Paladin Example Events

## Casted Events

#### Devotion Aura

```lua
{
  ["spellName"] = "Devotion Aura",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Retribution Aura

```lua
{
  ["spellName"] = "Retribution Aura",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Concentration Aura

```lua
{
  ["spellName"] = "Concentration Aura",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Shadow Resistance Aura

```lua
{
  ["spellName"] = "Shadow Resistance Aura",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Frost Resistance Aura

```lua
{
  ["spellName"] = "Frost Resistance Aura",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Fire Resistance Aura

```lua
{
  ["spellName"] = "Fire Resistance Aura",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Blessing of Protection

```lua
{
  ["spellName"] = "Blessing of Protection",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Blessing of Protection",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```


#### Blessing of Freedom

```lua
{
  ["spellName"] = "Blessing of Freedom",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Blessing of Freedom",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```


#### Blessing of Sacrifice

```lua
{
  ["spellName"] = "Blessing of Sacrifice",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Blessing of Sacrifice",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Hammer of Justice

```lua
{
  ["spellName"] = "Hammer of Justice",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Repentance

```lua
{
  ["spellName"] = "Repentance",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Forbearance

```lua
{
  ["spellName"] = "Forbearance",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Forbearance",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Lay on Hands

```lua
{
  ["spellName"] = "Lay on Hands",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

## Avoid Events

There is no need to differentiate in those examples between enemy and self avoid. The only thing that changes are the sourceflags.

#### Hammer of Wrath

```lua
{
  ["spellName"] = "Hammer of Wrath",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Hammer of Wrath",
  ["missType"] = "MISS",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Hammer of Justice

```lua
{
  ["spellName"] = "Hammer of Justice",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Hammer of Justice",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```
