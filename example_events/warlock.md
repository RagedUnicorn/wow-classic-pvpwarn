# Warlock Example Events

## Casted Events

## Avoid Events

There is no need to differentiate in those examples between enemy and self avoid. The only thing that changes are the sourceflags.

#### Curse of Tongues

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

#### Fear

#### Howl of Terror
