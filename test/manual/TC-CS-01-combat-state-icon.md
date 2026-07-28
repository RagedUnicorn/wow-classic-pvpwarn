# TC-CS-01 — Combat state icon tracks the enemy target

**Area:** Combat state | **Client:** Era | **Mandatory:** yes

## Preconditions

- **Enable combatstate tracking** checked in `/rgpvpw opt` → Options
- A hostile player who can be observed entering and leaving combat

## Steps

1. Target a hostile player who is out of combat
2. Have them enter combat and watch the icon next to the target frame
3. Have them leave combat
4. Clear your target, then re-target them
5. Uncheck **Enable combatstate tracking** and repeat step 2

## Expected

- The combat state icon appears next to the target frame once an enemy is targeted
- It flips to the in-combat state when they enter combat and back when they drop it
- Re-targeting the same player restores the correct state rather than showing stale data
- With tracking disabled the icon does not appear at all
- Combat state is inferred from the combat log, so a target who has done nothing observable
  may legitimately show no state yet
- No Lua errors
