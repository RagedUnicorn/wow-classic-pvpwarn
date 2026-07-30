# Release Testing

> This document describes the test procedure that must pass before a new PVPWarn release is created.
> Deployment steps live in [RELEASE.md](../RELEASE.md); this document is the testing gate referenced there.

A release passes when:

* All automated gates are green
* The in-client automated suite passes on every branch
* All mandatory manual test cases in [test/manual/](manual/) pass on Classic Era
* The smoke checklist passes on TBC Anniversary
* Zero Lua errors occurred during the whole run

Before starting the in-game runs, enable script errors so nothing is swallowed:

```
/console scriptErrors 1
```

## 1. Automated gates

Run locally (Docker required):

```bash
# lua linting
docker compose run --rm luacheck

# busted unit tests (test/headless/spec/)
docker compose run --rm busted

# spellmap / spellavoidmap and their branch overlays
docker compose run --rm verify-spellmap

# every spell has its sound files
docker compose run --rm verify-sounds

# python tooling test suites (tools/)
docker compose -f docker-compose.test.yml run --rm spellmap-core-tests
docker compose -f docker-compose.test.yml run --rm verify-spellmap-tests
docker compose -f docker-compose.test.yml run --rm verify-sounds-tests
docker compose -f docker-compose.test.yml run --rm export-spellmap-tests
```

Never use `docker compose up` - it would start every service including the paid
voice-generator. Always `run --rm <service>`.

Additionally verify that CI is green on `master` for the latest commit:

* `lint.yaml` - luacheck
* `test.yaml` - busted
* `verify_spellmap.yaml` - spellmap and overlay validation
* `verify_sounds.yaml` - sound file coverage

All must pass with zero failures before any in-game testing starts.

## 2. In-client automated suite

PVPWarn ships a session-based in-game test framework that no sibling addon has. It only
exists in **development** builds - the `release` profile strips the whole `test/` tree - so
run it from the dev checkout before packaging. See [TEST.md](../TEST.md) for the suite's
layout, naming conventions and the full command reference.

```
/run rgpvpw.testAll.TestAll()
```

Omitting the branch argument runs `classic`, `sod` and `tbc` in turn, re-assembling the
spell map per branch. Results land in `PVPWarnTestLog` and the test log window
(`/rgpvpw testlog show`). Run `/rgpvpw testreset` between sessions.

Every suite must report zero failures.

> The in-client suite cannot replace the manual catalog. `RGPVPW_ENVIRONMENT.TEST` makes
> `SpellConfiguration.IsOptionActive` return `true` for **every** option, so any behavior
> gated on a per-spell setting - sound on/off, fade, cast, visual warning color - is
> unverifiable inside a test session. Those paths are covered by `TC-WA-*`, `TC-AV-*` and
> `TC-CFG-*` below.

## 3. In-game test matrix

The dev checkout in `Interface/AddOns/PVPWarn` is what gets tested - no packaged build
required, except for `TC-REL-01` which needs a real release-profile package.

| Client                    | Interface | Coverage                                      |
|---------------------------|-----------|-----------------------------------------------|
| Classic Era               | 11509     | Full manual catalog ([test/manual/](manual/)) |
| TBC Anniversary           | 20506     | Smoke checklist (below)                       |
| Season of Discovery (Era) | 11509     | `TC-SOD-01` - conditional, see note below     |

The `TC-SOD-01` case is **conditional**: run it only if a Season of Discovery character is
available or if SoD-related code (`code/Season.lua`, `code/spellmap/overlay/Sod.lua`,
`code/spellavoidmap/overlay/Sod.lua`) was touched since the last release.

The `TC-VB-01` version broadcast case is **conditional**: run it only if a second
account/client (or a cooperative guild/party member) is available.

## 4. Smoke checklist (TBC Anniversary)

A short pass to confirm the addon behaves on the non-primary client:

- [ ] Addon loads without errors on login; the class default profile is present
- [ ] An enemy spell cast in combat produces the sound warning, the flash and a detection bar
- [ ] `/rgpvpw opt` opens the options panel; every category panel and tab opens without errors
- [ ] A TBC-only spell from `code/spellmap/overlay/Tbc.lua` warns correctly
- [ ] `/rgpvpw bar test` fills the stack; `/rgpvpw flash test` fires a vignette
- [ ] The combat state and stance state icons appear and can be dragged when unlocked
- [ ] Quick profile round trip: create, export, import under a new name, load
- [ ] `/reload` produces no Lua errors

## 5. Manual test case catalog (Classic Era)

One file per test case under [test/manual/](manual/). Case IDs follow `TC-<AREA>-<NN>`.

### SavedVariables lifecycle (mandatory every release)

| ID                                                           | Case                                           |
|--------------------------------------------------------------|------------------------------------------------|
| [TC-SV-01](manual/TC-SV-01-fresh-install.md)                 | Fresh install seeds defaults                   |
| [TC-SV-02](manual/TC-SV-02-upgrade-from-previous-release.md) | Upgrade from previous release migrates cleanly |

### Warnings

| ID                                                        | Case                                       |
|-----------------------------------------------------------|--------------------------------------------|
| [TC-WA-01](manual/TC-WA-01-enemy-spell-sound-warning.md)  | Enemy spell produces the sound warning     |
| [TC-WA-02](manual/TC-WA-02-fade-and-cast-variants.md)     | Fade and cast-start sound variants         |
| [TC-WA-03](manual/TC-WA-03-warn-queue-gating.md)          | Warn queue busy gate and age prune         |
| [TC-WA-04](manual/TC-WA-04-per-spell-disable.md)          | Per-spell disable suppresses the warning   |

### Avoid warnings

| ID                                                        | Case                                     |
|-----------------------------------------------------------|------------------------------------------|
| [TC-AV-01](manual/TC-AV-01-self-avoid.md)                 | Self-avoid warns when you avoid a spell  |
| [TC-AV-02](manual/TC-AV-02-enemy-avoid.md)                | Enemy-avoid warns when an enemy avoids   |
| [TC-AV-03](manual/TC-AV-03-irrelevant-miss-types.md)      | Irrelevant miss types stay silent        |

### Target filter

| ID                                                        | Case                                          |
|-----------------------------------------------------------|-----------------------------------------------|
| [TC-TF-01](manual/TC-TF-01-warn-all-mode.md)              | warnAll mode warns for every enemy            |
| [TC-TF-02](manual/TC-TF-02-current-target-mode.md)        | currentTarget mode suppresses non-target      |
| [TC-TF-03](manual/TC-TF-03-always-warn-exceptions.md)     | Spells on the player always warn (fail open)  |

### Detection bar

| ID                                                         | Case                                       |
|------------------------------------------------------------|--------------------------------------------|
| [TC-DB-01](manual/TC-DB-01-stack-renders-and-fades.md)     | Bar stack renders, stacks and fades        |
| [TC-DB-02](manual/TC-DB-02-dedup-window.md)                | Dedup window collapses repeated detections |
| [TC-DB-03](manual/TC-DB-03-positioning-and-persistence.md) | Positioning mode, drag, reset and persist  |
| [TC-DB-04](manual/TC-DB-04-max-bars-and-scale.md)          | Maximum visible bars and scale sliders     |
| [TC-DB-05](manual/TC-DB-05-global-disable.md)              | Global disable suppresses every bar        |

### Flash

| ID                                                        | Case                                        |
|-----------------------------------------------------------|---------------------------------------------|
| [TC-FL-01](manual/TC-FL-01-flash-and-color-routing.md)    | Flash fires with the per-spell color        |
| [TC-FL-02](manual/TC-FL-02-opacity-pulse-blend.md)        | Opacity, pulse and additive blending        |
| [TC-FL-03](manual/TC-FL-03-loading-screen-suppression.md) | Flash suppressed during loading screens     |

### Combat and stance state

| ID                                                        | Case                                        |
|-----------------------------------------------------------|---------------------------------------------|
| [TC-CS-01](manual/TC-CS-01-combat-state-icon.md)          | Combat state icon tracks the enemy target   |
| [TC-CS-02](manual/TC-CS-02-stance-state-icon.md)          | Stance state icon and unknown stance        |
| [TC-CS-03](manual/TC-CS-03-frame-drag-lock-persist.md)    | Frame drag, lock and position persistence   |

### Zones

| ID                                                        | Case                                        |
|-----------------------------------------------------------|---------------------------------------------|
| [TC-ZN-01](manual/TC-ZN-01-disabled-battleground.md)      | Disabled battleground suppresses warnings   |
| [TC-ZN-02](manual/TC-ZN-02-zone-change-reevaluates.md)    | Zone change re-evaluates the gating         |

### Voice packs

| ID                                                        | Case                                        |
|-----------------------------------------------------------|---------------------------------------------|
| [TC-VP-01](manual/TC-VP-01-switch-voice-pack.md)          | Voice pack switching and the test button    |
| [TC-VP-02](manual/TC-VP-02-missing-pack-fallback.md)      | Missing voice pack falls back to default    |

### Spell configuration

| ID                                                          | Case                                          |
|-------------------------------------------------------------|-----------------------------------------------|
| [TC-CFG-01](manual/TC-CFG-01-spells-tab-persists.md)        | Spells tab settings persist                   |
| [TC-CFG-02](manual/TC-CFG-02-self-avoid-tab-persists.md)    | Self-Avoid tab settings persist               |
| [TC-CFG-03](manual/TC-CFG-03-enemy-avoid-panel-persists.md) | Enemy Avoid panel settings persist            |
| [TC-CFG-04](manual/TC-CFG-04-color-dropdown-and-play.md)    | Visual warning color and Play buttons         |
| [TC-CFG-05](manual/TC-CFG-05-general-options.md)            | General options and the warning mode dropdown |

### Profiles

| ID                                                       | Case                                      |
|----------------------------------------------------------|-------------------------------------------|
| [TC-PR-01](manual/TC-PR-01-class-default-profile.md)     | Class default profile seeded on first run |
| [TC-PR-02](manual/TC-PR-02-create-load-update-delete.md) | Create, load, update and delete           |
| [TC-PR-03](manual/TC-PR-03-export-import-round-trip.md)  | Export / import round-trip                |
| [TC-PR-04](manual/TC-PR-04-corrupted-import-rejected.md) | Corrupted import string rejected          |
| [TC-PR-05](manual/TC-PR-05-name-and-count-limits.md)     | Profile name and count limits             |
| [TC-PR-06](manual/TC-PR-06-macro-load-bridge.md)         | Macro profile load bridge                 |

### Slash commands

| ID                                              | Case                    |
|-------------------------------------------------|-------------------------|
| [TC-CMD-01](manual/TC-CMD-01-slash-commands.md) | /rgpvpw command surface |

### Release build

| ID                                                    | Case                                         |
|-------------------------------------------------------|----------------------------------------------|
| [TC-REL-01](manual/TC-REL-01-release-build-strip.md)  | Release package strips the development tree  |

### Season of Discovery (conditional)

| ID                                              | Case                                |
|-------------------------------------------------|-------------------------------------|
| [TC-SOD-01](manual/TC-SOD-01-sod-overlay.md)    | SoD overlay spells warn correctly   |

### Version broadcast (conditional)

| ID                                               | Case                                      |
|--------------------------------------------------|-------------------------------------------|
| [TC-VB-01](manual/TC-VB-01-version-broadcast.md) | Version broadcast and update notification |

## 6. Notes

* Localization is covered by the busted spec `LocalizationParitySpec` (key parity of `deDE`
  and `ruRU` against `enUS`) - no manual locale pass is required.
* The spell catalog and its sound coverage are covered by `verify-spellmap` and
  `verify-sounds` - the manual cases sample a few spells, they do not walk the catalog.
* [TC-REL-01](manual/TC-REL-01-release-build-strip.md) is the only case that needs an actual
  `mvn package -P release` artifact. Every other case runs against the dev checkout.
* Keep a copy of the previous release's `PVPWarn.lua` SavedVariables file around - it is a
  real-world companion to the trimmed fixture used by
  [TC-SV-02](manual/TC-SV-02-upgrade-from-previous-release.md).
* SavedVariables live at
  `WTF/Account/<ACCOUNT>/<Server>/<Character>/SavedVariables/PVPWarn.lua`.
  Only touch this file while the client is fully logged out.
