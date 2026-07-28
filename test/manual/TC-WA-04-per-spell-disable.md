# TC-WA-04 — Per-spell disable suppresses the warning

**Area:** Warnings | **Client:** Era | **Mandatory:** yes

## Preconditions

- A duel partner able to cast a tracked spell on demand
- A **development** build, because this case must run outside a test session — see Steps

## Steps

1. Confirm no test session is active (`/rgpvpw testreset` if unsure)
2. Have the enemy cast the spell and confirm the warning fires
3. Open the spell's category panel and uncheck **Enable Sound**
4. Have the enemy cast the same spell again
5. Set the spell's **Visual Warning** color to `None` and cast again
6. Re-enable both, `/reload`, and cast once more

## Expected

- With **Enable Sound** unchecked the sound is silent while the detection bar still appears —
  the bar is a single global toggle, not a per-spell one
- With **Visual Warning** set to `None` no vignette flash fires
- Re-enabling restores both channels and the settings survive `/reload`
- No Lua errors

> This behavior is **not** verifiable from a test session. `RGPVPW_ENVIRONMENT.TEST` makes
> `SpellConfiguration.IsOptionActive` return `true` for every option, so every spell warns
> regardless of its configuration while a session is running.
