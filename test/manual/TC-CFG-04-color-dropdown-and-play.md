# TC-CFG-04 — Visual warning color and Play buttons

**Area:** Spell configuration | **Client:** Era | **Mandatory:** yes

## Preconditions

- `/rgpvpw opt` open on any category panel
- Sound enabled in the client

## Steps

1. Open the **Visual Warning** dropdown on a spell row and read the full list
2. Pick a color, then use the adjacent **Play** button
3. Use the **Play** button next to **Enable Sound**
4. Use the extra **Play** button next to **Enable Sound Fade** / **Enable Sound Cast** where
   offered
5. Set a spell's color to **None** and use its Play button
6. `/reload` and confirm every selection held

## Expected

- The dropdown offers None, Light Blue, Pink, White, Brown, Blue, Green, Orange, Red, Violet
  and Yellow
- The color Play button fires a vignette flash in the **selected** color, giving a preview
  without needing an enemy
- The sound Play buttons play the corresponding sound for that spell, and the fade/cast
  buttons play their own distinct variants
- With the color set to **None** the color Play button fires no flash
- Play buttons work regardless of whether the matching checkbox is enabled — they are
  previews, not gated by the setting
- Selections persist to `visualWarningColor` and survive `/reload`
- No Lua errors
