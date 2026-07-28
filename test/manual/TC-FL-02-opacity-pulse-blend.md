# TC-FL-02 — Opacity, pulse and additive blending

**Area:** Flash | **Client:** Era | **Mandatory:** yes

## Preconditions

- Flash enabled
- `/rgpvpw opt` → Flash open, with the **Test** button reachable

## Steps

1. Drag **Max opacity** to its minimum and hit **Test**
2. Drag it to its maximum and hit **Test**
3. Uncheck **Pulse effect** and hit **Test**; re-check it and hit **Test** again
4. Check **Additive blending (brighter)** and hit **Test**; uncheck and compare
5. `/reload` and confirm all three settings held, then run `/rgpvpw flash test red`

## Expected

- Max opacity visibly scales the vignette's peak brightness; at minimum it is faint but
  present, at maximum it is at its strongest
- With pulse off the vignette fades in and out once; with pulse on it visibly pulses
- Additive blending renders noticeably brighter than the default `BLEND` mode
- The Test button fires a random-colored vignette, so its color varies between clicks —
  `/rgpvpw flash test <color>` is the way to pin a specific one
- All three persist to `PVPWarnConfiguration.flash.maxOpacity` / `.pulse` / `.blendMode` and
  survive `/reload`
- No Lua errors
