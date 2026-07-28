# TC-FL-03 — Flash suppressed during loading screens

**Area:** Flash | **Client:** Era | **Mandatory:** yes

## Preconditions

- Flash and detection bar both enabled
- A way to trigger a loading screen on demand: a battleground queue pop, a hearthstone, or
  an instance portal

## Steps

1. Get into a fight where tracked spells are landing on you
2. Accept a battleground queue (or take a portal) so a loading screen starts while detections
   are still arriving
3. Watch the moment the loading screen ends
4. Confirm warnings resume normally once loaded
5. Repeat watching the detection bar rather than the flash

## Expected

- No vignette flash is queued up behind the loading screen and fired all at once on arrival
- New flashes are blocked while suppressed; a flash already running is left to finish
  naturally rather than being cut
- The detection bar is suppressed the same way — `DetectionBarManager` and `Flash` both
  listen to `LOADING_SCREEN_ENABLED` / `LOADING_SCREEN_DISABLED`
- Warnings resume on the first detection after the loading screen clears
- No Lua errors
