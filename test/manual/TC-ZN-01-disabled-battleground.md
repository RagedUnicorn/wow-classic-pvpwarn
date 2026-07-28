# TC-ZN-01 — Disabled battleground suppresses warnings

**Area:** Zones | **Client:** Era | **Mandatory:** yes

## Preconditions

- Access to a battleground queue — Warsong Gulch pops fastest
- `/rgpvpw opt` → Zones showing the three battleground checkboxes, all checked by default

## Steps

1. Uncheck **Warsong Gulch** in the Zones panel
2. Queue for Warsong Gulch and enter
3. Get into a fight where tracked spells land on you
4. Leave, re-check **Warsong Gulch**, and enter again
5. Repeat step 3

## Expected

- With the battleground disabled, **nothing** warns inside it — no sound, no flash, no
  detection bar. The zone check is an early-out at the top of the combat-log handler, before
  any lookup happens
- With it re-enabled, warnings work normally in the same battleground
- The other two battlegrounds are unaffected by the toggle
- The setting persists to `PVPWarnConfiguration.addonZoneConfiguration[489].enabled` and
  survives `/reload`
- No Lua errors
