# TC-AV-01 — Self-avoid warns when you avoid a spell

**Area:** Avoid | **Client:** Era | **Mandatory:** yes

## Preconditions

- A duel partner casting an avoidable spell at you
- The spell enabled on the **Avoid** tab of its category panel
- An avoid is reproducible: a Paladin bubble or a Warrior Spell Reflection makes IMMUNE and
  REFLECT easy to force; DODGE and PARRY come from melee

## Steps

1. Force an avoid you control — bubble through an incoming spell for IMMUNE, or reflect one
2. Listen for the warning and watch for the bar
3. Repeat for a second miss type if one is reachable (DODGE, PARRY, RESIST, BLOCK, MISS)
4. Uncheck **Enable Sound** on the Avoid tab for that spell and force the same avoid again

## Expected

- The self-avoid warning announces that **you** avoided the spell, distinct from the
  TC-WA-01 cast warning for the same spell
- The detection bar names the enemy who cast it, not you
- Each miss type routes to its own announcement where the spell declares one
- With the Avoid-tab sound unchecked the announcement is silent
- No Lua errors
