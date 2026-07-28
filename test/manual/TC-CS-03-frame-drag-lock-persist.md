# TC-CS-03 — Frame drag, lock and position persistence

**Area:** Combat state | **Client:** Era | **Mandatory:** yes

## Preconditions

- Both combatstate and stancestate tracking enabled
- Both **Lock ... frame** checkboxes currently checked (the default)

## Steps

1. Try to drag the combat state icon while locked
2. Run `/rgpvpw combatstate enable` and drag the icon to a clearly different position
3. Run `/rgpvpw combatstate disable`
4. Repeat 2-3 with `/rgpvpw stancestate enable` / `disable` for the stance icon
5. Run `/rgpvpw combatstate` with no second argument
6. `/reload`, then log out and back in, checking both positions each time
7. Log out and inspect `PVPWarnConfiguration.frames`

## Expected

- A locked frame cannot be dragged; `combatstate enable` / `stancestate enable` unlock it for
  positioning and `disable` leaves that mode
- A missing or invalid second argument prints the invalid-argument user error
- Both positions survive `/reload` **and** a full relog
- `frames` holds `PVPW_CombatStateFrame` and `PVPW_StanceStateFrame` entries with `point`,
  `relativePoint`, `posX`, `posY` and a `relativeTo` that is a region **name string**, never
  a serialized frame object — a frame reference here breaks `SetPoint` on the next login and
  can only be fixed by hand-editing the SavedVariable
- No Lua errors
