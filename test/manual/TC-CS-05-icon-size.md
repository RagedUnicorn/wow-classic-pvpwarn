# TC-CS-05 — Per-frame state icon size

**Area:** Combat state | **Client:** Era | **Mandatory:** yes

## Preconditions

- Both combatstate and stancestate tracking enabled
- An enemy player targeted, in combat, so both icons are visible
- An installation that predates this change, if one is available (for step 1)

## Steps

1. Log in for the first time after upgrading and look at both icons before touching anything
2. Open **Options > Combat State** and drag the **Icon size** slider across its whole range
3. Check the stance icon while doing so
4. Open **Options > Stance State** and set a different size there
5. Set one icon to the minimum and the other to the maximum, and look at both borders
6. Enter positioning mode, drag an icon to a new spot, then change its size
7. With both icons resized and moved, click **Reset combatstate icon**, then
   **Reset stancestate icon**
8. `/reload` and re-check both sizes

## Expected

- Before the slider is touched, both icons render at exactly their previous size — an upgrade
  changes nothing visually
- The slider shows the current value in pixels and resizes that icon **immediately**, with no
  `/reload`
- The two sizes are independent: changing the combat icon leaves the stance icon untouched, and
  vice versa
- The slot border stays proportional at both extremes — no hairline at the maximum, no border
  swallowing the icon at the minimum — and the stance icon keeps its class-colored border
- Resizing does not move the icon's anchor: the icon grows away from where it is anchored and
  stays where the player put it
- The reset button restores that icon's **position and size** in one click, and the slider jumps
  back to the default value with it — no stale number left on the panel
- Both sizes survive `/reload`, and so does a reset
- No Lua errors

## Notes

The default positions place the two icons edge to edge at the default size. Enlarging one can
make them overlap — use **Position state icons** to re-arrange them afterwards.
