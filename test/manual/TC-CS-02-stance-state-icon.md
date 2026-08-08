# TC-CS-02 — Stance state icon and unknown stance

**Area:** Stance state | **Client:** Era | **Mandatory:** yes

## Preconditions

- **Enable stancestate tracking** checked in `/rgpvpw opt` → Stance State
- A hostile Warrior or Druid — the classes whose stance/form is worth tracking
- For steps 7-10 a hostile Hunter, and for step 9 a hostile Warrior, Druid, Priest or Warlock
  grouped with that Hunter and standing inside Aspect of the Pack range of them

## Steps

1. Target a hostile Warrior who has not yet switched stance in your combat log
2. Observe the stance icon
3. Have them switch stance and watch the icon
4. Have them switch again
5. Check **Hide unknown stance** and re-target a player whose stance you have not observed
6. Uncheck **Enable stancestate tracking** and re-target
7. Re-check **Enable stancestate tracking**, target a hostile Hunter and have them cast Aspect
   of the Hawk
8. Have them swap to Aspect of the Cheetah, then to Aspect of the Monkey
9. Have the Hunter cast Aspect of the Pack (or Aspect of the Wild) while you target their
   grouped Warrior/Druid/Priest/Warlock whose own stance you have already observed
10. Target the Hunter again and have them right-click the aspect buff off

## Expected

- Before any observation the icon shows `?` — the stance is inferred from the combat log, not
  queried, so it is genuinely unknown until they act
- Each stance switch updates the icon to the matching stance
- With **Hide unknown stance** checked the icon is hidden instead of showing `?`
- With tracking disabled the icon does not appear at all
- The Hunter's icon shows the cast aspect, and each aspect swap updates it to the newly applied
  aspect — it never falls back to `?` between the removal and the application
- The grouped target in step 9 keeps their own stance/form icon — Aspect of the Pack and Aspect
  of the Wild are party-wide area auras that land on every party member, and the icon must not be
  overwritten with the aspect
- Cancelling the aspect in step 10 returns the Hunter's icon to `?`, or hides it when **Hide
  unknown stance** is checked
- No Lua errors
