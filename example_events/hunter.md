# Hunter Example Events

## Casted Events

## Avoid Events

There is no need to differentiate in those examples between enemy and self avoid. The only thing that changes are the sourceflags.

#### Concussive Shot

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

#### Scatter Shot

#### Serpent Sting

{
  ["sourceFlags"] = 66888,
  ["missType"] = "IMMUNE",
  ["target"] = "Player-4463-019F54C3",
  ["targetName"] = "Lyzqt",
  ["event"] = "SPELL_MISSED",
  ["spellName"] = "Serpent Sting",
}, -- [26642]

#### Viper Sting

#### Freezing Trap

{
  ["spellName"] = "Freezing Trap Effect",
  ["missType"] = "IMMUNE",
  ["target"] = "Player-4463-019F54C3",
  ["targetName"] = "Lyzqt",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = 16680,
}, -- [26649]

{
		["spellName"] = "Freezing Trap Effect",
		["missType"] = "RESIST",
		["target"] = "Player-4463-01123930",
		["targetName"] = "Nyt",
		["event"] = "SPELL_MISSED",
		["sourceFlags"] = 16680,
	}, -- [86466]



#### Wing Clip

{
  ["sourceFlags"] = 66888,
  ["missType"] = "IMMUNE",
  ["target"] = "Player-4463-019F54C3",
  ["targetName"] = "Lyzqt",
  ["event"] = "SPELL_MISSED",
  ["spellName"] = "Wing Clip",
}, -- [26638]

{
  ["spellName"] = "Wing Clip",
  ["missType"] = "MISS",
  ["target"] = "Player-4463-019F54C3",
  ["targetName"] = "Lyzqt",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = 66888,
}, -- [26700]

{
  ["spellName"] = "Wing Clip",
  ["missType"] = "DODGE",
  ["target"] = "Player-4463-019F54C3",
  ["targetName"] = "Lyzqt",
  ["event"] = "SPELL_MISSED",
  ["sourceFlags"] = 66888,
}, -- [26853]
