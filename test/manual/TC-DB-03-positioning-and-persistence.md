# TC-DB-03 — Positioning mode, drag, reset and persistence

**Area:** Detection bar | **Client:** Era | **Mandatory:** yes

## Preconditions

- Detection bar enabled
- Out of combat

## Steps

1. Run `/rgpvpw bar unlock` and drag the anchor to a clearly different screen position
2. Run `/rgpvpw bar test` to confirm bars now appear at the new position
3. Run `/rgpvpw bar lock`
4. `/reload`, then `/rgpvpw bar test` again
5. Open `/rgpvpw opt` → Detection Bar and observe what happens on panel show, then close the
   settings window
6. Enter positioning mode again and enter combat without locking first
7. Click **Reset position** and `/reload`

## Expected

- `bar unlock` shows the drag handle and a sample bar and prints the unlocked message;
  `bar lock` prints the locked message and hides them
- The dragged position survives `/reload` and a full relog
- Opening the Detection Bar panel enters positioning mode automatically; closing the
  settings window leaves it
- Entering combat leaves positioning mode on its own — the mode is transient
- **Reset position** returns the bar to its default anchor
- The saved position stores `relativeTo` as a region **name string**, never a frame object —
  a serialized frame breaks `SetPoint` on the next login
- No Lua errors
