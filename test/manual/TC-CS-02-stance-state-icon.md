# TC-CS-02 — Stance state icon and unknown stance

**Area:** Stance state | **Client:** Era | **Mandatory:** yes

## Preconditions

- **Enable stancestate tracking** checked in `/rgpvpw opt` → Options
- A hostile Warrior or Druid — the classes whose stance/form is worth tracking

## Steps

1. Target a hostile Warrior who has not yet switched stance in your combat log
2. Observe the stance icon
3. Have them switch stance and watch the icon
4. Have them switch again
5. Check **Hide unknown stance** and re-target a player whose stance you have not observed
6. Uncheck **Enable stancestate tracking** and re-target

## Expected

- Before any observation the icon shows `?` — the stance is inferred from the combat log, not
  queried, so it is genuinely unknown until they act
- Each stance switch updates the icon to the matching stance
- With **Hide unknown stance** checked the icon is hidden instead of showing `?`
- With tracking disabled the icon does not appear at all
- No Lua errors
