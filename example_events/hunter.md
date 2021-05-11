# Hunter Example Events

## Casted Events

#### Concussive Shot

```lua
{
  ["spellName"] = "Concussive Shot",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Aspect of the Monkey

```lua
{
  ["spellName"] = "Aspect of the Monkey",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Aspect of the Hawk

```lua
{
  ["spellName"] = "Aspect of the Hawk",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Rapid Fire

```lua
{
  ["spellName"] = "Rapid Fire",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Rapid Fire",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Explosive Trap

```lua
{
  ["spellName"] = "Explosive Trap",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Freezing Trap

```lua
{
  ["spellName"] = "Freezing Trap",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Immolation Trap

```lua
{
  ["spellName"] = "Immolation Trap",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Frost Trap

```lua
{
  ["spellName"] = "Frost Trap",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Viper Sting

```lua
{
  ["spellName"] = "Viper Sting",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Scatter Shot

```lua
{
  ["spellName"] = "Scatter Shot",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Flare

```lua
{
  ["spellName"] = "Flare",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Intimidation

```lua
{
  ["spellName"] = "Intimidation",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Intimidation",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Bestial Wrath

```lua
{
  ["spellName"] = "Bestial Wrath",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Bestial Wrath",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Deterrence

```lua
{
  ["spellName"] = "Deterrence",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Deterrence",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

## Avoid Events

There is no need to differentiate in those examples between enemy and self avoid. The only thing that changes are the sourceflags.

#### Concussive Shot

```lua
{
  ["spellName"] = "Concussive Shot",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Concussive Shot",
  ["missType"] = "MISS",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Concussive Shot",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Scatter Shot

```lua
{
  ["spellName"] = "Scatter Shot",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Scatter Shot",
  ["missType"] = "MISS",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Serpent Sting

```lua
{
  ["spellName"] = "Serpent Sting",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Serpent Sting",
  ["missType"] = "MISS",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Viper Sting

```lua
{
  ["spellName"] = "Viper Sting",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Viper Sting",
  ["missType"] = "MISS",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```


#### Freezing Trap

```lua
{
  ["spellName"] = "Freezing Trap Effect",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Freezing Trap Effect",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Wing Clip

```lua
{
  ["spellName"] = "Wing Clip",
  ["missType"] = "DODGE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Wing Clip",
  ["missType"] = "PARRY",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["sourceFlags"] = [sourceFlags]
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["spellName"] = "Wing Clip",
}
```

```lua
{
  ["spellName"] = "Wing Clip",
  ["missType"] = "MISS",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Wing Clip",
  ["missType"] = "BLOCK",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```
