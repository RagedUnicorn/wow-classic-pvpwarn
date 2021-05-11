# Warlock Example Events

## Casted Events

#### Fear

```lua
{
  ["sourceFlags"] = [sourceFlags]
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["spellName"] = "Fear",
}
```

#### Shadowburn

```lua
{
  ["spellName"] = "Shadowburn",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Shadow Ward

```lua
{
  ["sourceFlags"] = [sourceFlags]
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["spellName"] = "Shadow Ward",
}
```

```lua
{
  ["sourceFlags"] = [sourceFlags]
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["spellName"] = "Shadow Ward",
}
```

#### Howl of Terror

```lua
{
  ["target"] = "[targetUid]",
  ["sourceFlags"] = [sourceFlags]
  ["event"] = "SPELL_CAST_SUCCESS",
  ["spellName"] = "Howl of Terror",
}
```

#### Death Coil

```lua
{
  ["sourceFlags"] = [sourceFlags]
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["spellName"] = "Death Coil",
}
```

#### Amplify Curse

```lua
{
  ["sourceFlags"] = [sourceFlags]
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["spellName"] = "Amplify Curse",
}
```

```lua
{
  ["spellName"] = "Amplify Curse",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Spell Lock

```lua
{
  ["spellName"] = "Spell Lock",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Soul Link

```lua
{
  ["spellName"] = "Soul Link",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Soul Link",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

## Avoid Events

There is no need to differentiate in those examples between enemy and self avoid. The only thing that changes are the sourceflags.

#### Curse of Tongues

```lua
{
  ["spellName"] = "Curse of Tongues",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Charge Stun",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Death Coil

```lua
{
  ["spellName"] = "Death Coil",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Death Coil",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Fear

```lua
{
  ["spellName"] = "Fear",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Fear",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Howl of Terror

```lua
{
  ["spellName"] = "Howl of Terror",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Howl of Terror",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```
