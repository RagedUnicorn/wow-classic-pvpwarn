# TC-ZN-02 — Zone change re-evaluates the gating

**Area:** Zones | **Client:** Era | **Mandatory:** yes

## Preconditions

- At least one battleground disabled in the Zones panel (carry over from TC-ZN-01)
- Access to a battleground and to a dungeon or raid instance

## Steps

1. Stand in the open world and confirm warnings fire on a duel partner
2. Enter the disabled battleground and confirm warnings are silent
3. Leave the battleground back to the open world **without** reloading, and duel again
4. Enter a dungeon or raid instance and have a party member cast on you
5. If an arena is reachable, enter one with warnings otherwise disabled

## Expected

- The gate is re-evaluated on `ZONE_CHANGED_NEW_AREA` — leaving the disabled battleground
  restores warnings **without** a `/reload`
- No zone inherits the previous zone's state; every transition sets the flag deliberately
- Dungeon and raid instances are **always** disabled regardless of configuration — enemy
  players cannot enter them
- Arenas are **always** enabled regardless of configuration
- The result is cached between zone changes rather than recomputed per combat event
- No Lua errors
