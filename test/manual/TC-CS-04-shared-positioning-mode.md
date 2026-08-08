# TC-CS-04 — Shared positioning mode for the state icons

**Area:** Combat state | **Client:** Era | **Mandatory:** yes

## Preconditions

- Both combatstate and stancestate tracking enabled
- An enemy player targeted (both icons hang off the Blizzard target frame)

## Steps

1. Open **Options > Combat State** and click **Position state icons**
2. Without leaving positioning mode, navigate to **Options > Stance State** and read its button
3. Drag both icons into a new side-by-side arrangement in this one pass
4. Click **Done** on the Stance State panel
5. Click **Position state icons** again, then close the Settings window with Escape
6. Run `/rgpvpw combatstate enable`, then open **Options > Stance State**
7. Click **Done**, then run `/rgpvpw stancestate enable` and enter combat
8. Click the reset button on each panel
9. `/reload` and re-check both positions
10. Clear the target, then click **Position state icons**

## Expected

- One click shows **both** icons — combat and stance — and both are draggable, with no enemy in
  combat needed
- Navigating between the two state panels keeps the mode alive; **both** panels' buttons read
  **Done**
- **Done** on either panel hides both icons and flips both labels back
- Closing Settings with Escape while positioning is active leaves no icon stranded and no icon
  mouse-enabled
- Opening a panel after a slash-command toggle shows the correct label, and a slash-command
  toggle while a panel is open updates its label live — the panels read live state
- Entering combat cancels the mode on its own
- **Reset combatstate icon** / **Reset stancestate icon** return that icon to its default spot on
  the right edge of the target frame (combat flush, stance 25px further out, edge to edge),
  including after a drag that re-anchored it to `UIParent` — see TC-CS-05 for the size half of
  the same button
- Both dragged positions survive `/reload`
- With no target, entering the mode prints the localized no-target message **once** (not once per
  icon)
- No Lua errors
