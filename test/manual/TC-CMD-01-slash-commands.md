# TC-CMD-01 — /rgpvpw command surface

**Area:** Slash commands | **Client:** Era | **Mandatory:** yes

## Preconditions

- Addon loaded

## Steps

1. Type `/rgpvpw`
2. Type `/rgpvpw help`
3. Type `/rgpvpw opt`
4. Type `/rgpvpw foo`
5. Type `/rgpvpw combatstate enable`, then `/rgpvpw combatstate disable`
6. Type `/rgpvpw combatstate` with no second argument
7. Type `/rgpvpw stancestate enable`, then `/rgpvpw stancestate disable`
8. Type `/rgpvpw bar unlock`, `/rgpvpw bar test`, `/rgpvpw bar lock`, then `/rgpvpw bar foo`
9. Type `/rgpvpw flash test`, `/rgpvpw flash test yellow`, `/rgpvpw flash disable`,
   `/rgpvpw flash enable`
10. Type `/pvpwarn opt` (alias)
11. Type `/rgpvpw rl` and `/rgpvpw reload` (both reload the UI)

## Expected

- Bare `/rgpvpw` and `/rgpvpw help` print the info title followed by the help lines for
  `opt`, `combatstate`, `stancestate`, `bar`, `flash` and `reload` — **`flash` must be listed**
- `/rgpvpw opt` opens the PVPWarn settings panel
- An unknown argument (`foo`) prints the invalid-argument user error; so does a missing or
  invalid second argument on `combatstate`, `stancestate`, `bar` and `flash`
- `bar` and `flash` are registered in **every** build, release included, and each prints its
  own confirmation message
- `/rgpvpw rl` and `/rgpvpw reload` both reload the UI
- `/pvpwarn` works identically to `/rgpvpw`
- No Lua errors
