# TC-DB-01 — Bar stack renders, stacks and fades

**Area:** Detection bar | **Client:** Era | **Mandatory:** yes

## Preconditions

- Detection bar enabled (`/rgpvpw opt` → Detection Bar → **Enable detection bar**)
- `maxBars` at its default of 4

## Steps

1. Run `/rgpvpw bar test`
2. Watch the four fixtures arrive roughly 0.5s apart
3. Read each bar's icon, event text and player name
4. Wait and watch them expire
5. Run `/rgpvpw bar test` twice in a row so a fifth bar is pushed while four are alive

## Expected

- Four bars stack, newest on top, each with the spell icon and a class-colored border:
  Stealth (Rogue), Polymorph (Mage), Power Word: Shield **down** (Priest), Charge (Warrior)
- The Power Word: Shield entry renders as a removal, visually distinct from the other three
- `Sneaky-Whitemane` renders as `Sneaky` — the realm suffix is stripped
- Stack opacity decreases down the stack (1.0 / 0.7 / 0.45 / 0.30)
- Bars fade in, hold, then fade out; survivors **slide up** to fill the freed slot
- Pushing a fifth bar drops the oldest rather than growing the stack past `maxBars`
- No Lua errors
