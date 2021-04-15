# Rogue Example Events

TODO check improved/skilled kick

## Casted Events

## Avoid Events

There is no need to differentiate in those examples between enemy and self avoid. The only thing that changes are the sourceflags.

#### Kick

```lua
{
  ["spellName"] = "Kick",
  ["missType"] = "DODGE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Kick",
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
  ["spellName"] = "Kick",
}
```

```lua
{
  ["spellName"] = "Kick",
  ["missType"] = "MISS",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Kick",
  ["missType"] = "BLOCK",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Cheap Shot

Cannot be dodged, parried or blocked

```lua
{
  ["spellName"] = "Cheap Shot",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Cheap Shot",
  ["missType"] = "MISS",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Cheap Shot",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Gouge

```lua
{
  ["spellName"] = "Gouge",
  ["missType"] = "DODGE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Gouge",
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
  ["spellName"] = "Gouge",
}
```

```lua
{
  ["spellName"] = "Gouge",
  ["missType"] = "MISS",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Gouge",
  ["missType"] = "BLOCK",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Kidney Shot

```lua
{
  ["spellName"] = "Kidney Shot",
  ["missType"] = "DODGE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Kidney Shot",
  ["missType"] = "PARRY",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Kidney Shot",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Kidney Shot",
  ["missType"] = "MISS",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Kidney Shot",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Blind

```lua
{
  ["spellName"] = "Blind",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Ghostly Strike

```lua
{
  ["spellName"] = "Ghostly Strike",
  ["missType"] = "DODGE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Ghostly Strike",
  ["missType"] = "PARRY",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Ghostly Strike",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Ghostly Strike",
  ["missType"] = "MISS",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Sap

```lua
{
  ["spellName"] = "Sap",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Sap",
  ["missType"] = "MISS",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Distract

```lua
{
  ["spellName"] = "Distract",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Distract",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Expose Armor

```lua
{
  ["spellName"] = "Expose Armor",
  ["missType"] = "DODGE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Expose Armor",
  ["missType"] = "PARRY",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Expose Armor",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Expose Armor",
  ["missType"] = "MISS",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Garrote

```lua
{
  ["sourceFlags"] = [sourceFlags]
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["spellName"] = "Garrote",
}
```

#### Rupture

```lua
{
  ["spellName"] = "Rupture",
  ["missType"] = "DODGE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Gouge",
  ["missType"] = "PARRY",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Rupture",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Rupture",
  ["missType"] = "MISS",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```
