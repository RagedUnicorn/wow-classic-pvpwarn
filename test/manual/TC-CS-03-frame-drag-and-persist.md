# TC-CS-03 — Frame drag, click-through and position persistence

**Area:** Combat state | **Client:** Era | **Mandatory:** yes

## Preconditions

- Both combatstate and stancestate tracking enabled
- An enemy player targeted (both icons are children of the Blizzard target frame and are
  invisible without a target)

## Steps

1. With no positioning mode active, left- and right-click the target portrait *underneath* each
   icon; repeat while in combat
2. Run `/rgpvpw combatstate enable` and drag the combat icon to a clearly different position
3. Run `/rgpvpw combatstate disable`, then try to drag the icon again
4. Repeat 2-3 with `/rgpvpw stancestate enable` / `disable` for the stance icon
5. Run `/rgpvpw combatstate` with no second argument
6. Run `/rgpvpw combatstate enable`, then enter combat
7. `/reload`, then log out and back in, checking both positions each time
8. Log out and inspect `PVPWarnConfiguration.frames`

## Expected

- Outside positioning mode the icons are **click-through**: every click reaches the Blizzard
  target frame underneath and nothing is dragged
- `combatstate enable` / `stancestate enable` make that icon draggable; `disable` returns it to
  click-through
- A missing or invalid second argument prints the invalid-argument user error
- Entering combat cancels configuration mode on its own — the icon hides and goes click-through
- Both positions survive `/reload` **and** a full relog
- `frames` holds `PVPW_CombatStateFrame` and `PVPW_StanceStateFrame` entries with `point`,
  `relativePoint`, `posX`, `posY` and a `relativeTo` that is a region **name string**, never
  a serialized frame object — a frame reference here breaks `SetPoint` on the next login and
  can only be fixed by hand-editing the SavedVariable
- No Lua errors
