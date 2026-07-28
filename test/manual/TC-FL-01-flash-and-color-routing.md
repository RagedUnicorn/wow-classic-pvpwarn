# TC-FL-01 — Flash fires with the per-spell color

**Area:** Flash | **Client:** Era | **Mandatory:** yes

## Preconditions

- Flash enabled (`/rgpvpw opt` → Flash → **Enable flash**)
- A duel partner able to cast two different tracked spells

## Steps

1. Run `/rgpvpw flash test` and then `/rgpvpw flash test yellow`
2. Run `/rgpvpw flash test nonsense`
3. Set spell A's **Visual Warning** color to Red and spell B's to Blue in their category panel
4. Have the enemy cast each in turn and watch the vignette color
5. Set spell A's color to `None` and have it cast again
6. Run `/rgpvpw flash disable`, cast again, then `/rgpvpw flash enable`

## Expected

- `flash test` with no argument fires a red vignette; `yellow` fires a yellow one
- An unrecognised color prints the invalid-argument user error and fires nothing
- The vignette is a **soft** vignette — there is no tight variant
- Each spell flashes in its own configured `visualWarningColor`
- A spell set to `None` produces no flash while its sound and bar still fire
- `flash disable` / `flash enable` print their confirmation messages and toggle the channel
- No Lua errors
