# Rogue Example Events

## Casted Events

#### Blind

```lua
{
  ["spellName"] = "Blind",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Blind",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Kick

```lua
{
  ["spellName"] = "Kick",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Sprint

```lua
{
  ["spellName"] = "Sprint",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Sprint",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Evasion

```lua
{
  ["spellName"] = "Evasion",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Evasion",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Kidney Shot

```lua
{
  ["spellName"] = "Kidney Shot",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Cheap Shot

```lua
{
  ["spellName"] = "Cheap Shot",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Adrenaline Rush

```lua
{
  ["spellName"] = "Adrenaline Rush",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Adrenaline Rush",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Blade Flurry

```lua
{
  ["spellName"] = "Blade Flurry",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Blade Flurry",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Cold Blood

```lua
{
  ["spellName"] = "Cold Blood",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Cold Blood",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Preparation

```lua
{
  ["spellName"] = "Preparation",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Vanish

```lua
{
  ["spellName"] = "Vanish",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Stealth

```lua
{
  ["spellName"] = "Stealth",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

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
  ["spellName"] = "Kick",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
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
  ["spellName"] = "Gouge",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
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
  ["spellName"] = "Garrote",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
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
