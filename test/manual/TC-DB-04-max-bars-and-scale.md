# TC-DB-04 — Maximum visible bars and scale sliders

**Area:** Detection bar | **Client:** Era | **Mandatory:** yes

## Preconditions

- Detection bar enabled
- `/rgpvpw opt` → Detection Bar open

## Steps

1. Set **Maximum visible bars** to 1 and run `/rgpvpw bar test`
2. Set it to 2, then to the maximum of 4, running `bar test` after each change
3. Move the **Bar size** slider to its minimum and run `bar test`
4. Move it to its maximum and run `bar test`
5. `/reload` and check both sliders and the rendered bars

## Expected

- With `maxBars = 1` only the newest bar is ever visible; each new detection replaces it
- The visible count tracks the slider exactly and never exceeds `DETECTION_BAR_MAX_SLOTS` (4)
- The scale slider resizes the bars live, without a reload
- The stack stays correctly spaced at every scale — bars do not overlap or gap
- Both values persist to `PVPWarnConfiguration.detectionBar.maxBars` / `.scale` and survive
  `/reload`
- No Lua errors
