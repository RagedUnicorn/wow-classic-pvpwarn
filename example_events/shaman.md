# Shaman Example Events

## Casted Events

## Avoid Events

There is no need to differentiate in those examples between enemy and self avoid. The only thing that changes are the sourceflags.

#### Earth Shock

```lua
{
  ["spellName"] = "TODO",
  ["missType"] = "RESIST",
  ["target"] = "[targetUid]",
  ["targetName"] = "[targetName]",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = [sourceFlags]
}
```

#### Flame Shock

#### Frost Shock