# Priest Example Events

## Casted Events

#### Psychic Scream

```lua
{
  ["spellName"] = "Psychic Scream",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Silence

```lua
{
  ["spellName"] = "Silence",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Power Infusion

```lua
{
  ["spellName"] = "Power Infusion",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Power Infusion",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Inner Fire

```lua
{
  ["spellName"] = "Inner Fire",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Inner Fire",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REFRESH",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Inner Fire",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Vampiric Embrace

```lua
{
  ["spellName"] = "Vampiric Embrace",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Vampiric Embrace",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REFRESH",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Devouring Plague

```lua
{
  ["spellName"] = "Devouring Plague",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Touch of Weakness

```lua
{
  ["spellName"] = "Touch of Weakness",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Touch of Weakness",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Touch of Weakness",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REFRESH",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Fear Ward

```lua
{
  ["spellName"] = "Fear Ward",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Fear Ward",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REFRESH",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Desperate Prayer

```lua
{
  ["spellName"] = "Desperate Prayer",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Hex of Weakness

```lua
{
  ["spellName"] = "Hex of Weakness",
  ["target"] = "[targetUid]",
  ["event"] = "SPELL_CAST_SUCCESS",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Shadowguard

```lua
{
  ["spellName"] = "Shadowguard",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_APPLIED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Shadowguard",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REFRESH",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Shadowguard",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_AURA_REMOVED",
  ["sourceFlags"] = [sourceFlags]
}
```

## Avoid Events

There is no need to differentiate in those examples between enemy and self avoid. The only thing that changes are the sourceflags.

#### Devouring Plague

```lua
{
  ["spellName"] = "Devouring Plague",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Devouring Plague",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Blackout

```lua
{
  ["spellName"] = "Blackout",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Blackout",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Mana Burn

```lua
{
  ["spellName"] = "Mana Burn",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Mana Burn",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Mind Control

```lua
{
  ["spellName"] = "Mind Control",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Mind Control",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Psychic Scream

```lua
{
  ["spellName"] = "Psychic Scream",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Psychic Scream",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Shadow Word Pain

```lua
{
  ["spellName"] = "Shadow Word: Pain",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Shadow Word: Pain",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Silence

```lua
{
  ["spellName"] = "Silence",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Silence",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Vampiric Embrace

```lua
{
  ["spellName"] = "Vampiric Embrace",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

```lua
{
  ["spellName"] = "Vampiric Embrace",
  ["missType"] = "IMMUNE",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```
