# TC-SV-01 — Fresh install seeds defaults

**Area:** SavedVariables | **Client:** Era | **Mandatory:** yes

## Preconditions

- Client fully logged out
- Backup of the character's current `WTF/.../SavedVariables/PVPWarn.lua` taken (to restore
  after the test)

## Steps

1. Delete `PVPWarn.lua` (and `PVPWarn.lua.bak`) from the character's `SavedVariables` folder
2. Log in
3. Observe the screen and chat for errors
4. Open `/rgpvpw opt` and walk every panel: Options, Combat State, Stance State, Zones,
   Voice Packs, Detection Bar, Flash, Profiles, all twelve category panels and Enemy Avoid
5. Log out and inspect the SavedVariables file

## Expected

- No Lua errors on login
- The three spell lists are seeded from the character's class profile
  (`mod.<class>Profile.GetSpellProfile(...)`), keyed by **numeric spellId**
- `PVPWarnConfiguration` contains `activeVoicePack = "default"`, `lastNotifiedVersion = ""`
  and an empty `frames` table
- `combatState` holds `enabled = true`, `locked = true`
- `stanceState` holds `enabled = true`, `locked = true`, `hideUnknown = false`
- None of the pre-v2.0.0 flat state keys (`enableCombatStateTracking`,
  `lockCombatStateFrame`, `enableStanceStateTracking`, `lockStanceStateFrame`,
  `hideUnknownStance`) are written any more
- `detectionBar` holds `enabled = true`, `maxBars = 4`, `scale = 1.0`, `dedupWindow = 1.0`,
  `hintShown = false`
- `flash` holds `enabled = true`, `maxOpacity = 0.85`, `pulse = true`, `blendMode = "BLEND"`
- `targetFilter.mode = "warnAll"`
- `addonZoneConfiguration` holds the three battlegrounds (30, 529, 489) all `enabled = true`
- `PVPWarnProfiles` holds **exactly one** entry named `Default`
- `addonVersion` is stamped with the current version
- No Lua errors
