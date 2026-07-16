# SpellMap Export Tool

Replays the AddOn's runtime base + overlay assembly **offline** so the full `SpellMap` and
`SpellAvoidMap` for every branch (`classic`, `sod`, `tbc`) can be inspected without launching WoW.

This is the read-only sibling of [`../verify_spellmap`](../verify_spellmap). Where `verify_spellmap`
asserts the data is *valid*, `export_spellmap` *dumps* it for review, audits and cross-branch drift
detection (handy during the TBC Anniversary effort).

## What it produces

Running the exporter writes into the repo-root `target/spellmap-export/` directory (`target/` is
already covered by the root `.gitignore`, so the tool keeps no `.gitignore` of its own):

```
target/spellmap-export/
  classic/
    spellmap.json            assembled SpellMap for classic
    spellmap.summary.md      counts (per class, per spell type, per rank type) + anomalies
    avoidmap.json            assembled SpellAvoidMap for classic
    avoidmap.summary.md
  sod/      ... (same files)
  tbc/      ... (same files)
  diff.md                    cross-branch diff: branch-exclusive entries + type/rank drift
```

The JSON dumps are pretty-printed with sorted keys so they diff cleanly between runs.

## Derived fields

On top of the verbatim Lua source fields (`name`, `type`, `soundFileName`, `spellIcon`,
`allRanks`, flags, …), every **real** entry is enriched inline with data computed offline - no
network, nothing fetched. Ref-aliases (`{ "refId": ... }`) are left untouched.

| Field            | Example                                                                                                      | How it's built                                                                                                                   |
|------------------|--------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| `wowheadUrl`     | `https://www.wowhead.com/classic/spell=18499`                                                                | spell id + per-branch wowhead path (`/classic/` for `classic` and `sod`, `/tbc/` for `tbc`)                                      |
| `itemWowheadUrl` | `https://www.wowhead.com/classic/item=10592`                                                                 | only on item-backed entries (those with an `itemId`)                                                                             |
| `iconUrl`        | `https://wow.zamimg.com/images/wow/icons/large/spell_nature_ancestralguardian.jpg`                           | zamimg CDN URL from `spellIcon` (works for item icons too)                                                                       |
| `soundFiles`     | `{ "applied": { "path": "assets/sounds/en/warrior/berserker_rage.mp3", "exists": true }, "removed": { … } }` | the concrete `.mp3` files the AddOn would play, reconstructed from `code/Sound.lua`'s path convention, each checked against disk |

`soundFiles` roles for a **SpellMap** entry come from its `trackedEvents`
(`SPELL_CAST_SUCCESS`→`normal`, `SPELL_AURA_APPLIED`→`applied`, `SPELL_AURA_REFRESH`→`refresh`,
`SPELL_AURA_REMOVED`→`removed` (`_down`), `SPELL_CAST_START`→`start` (`_cast`)). For a
**SpellAvoidMap** entry they come from the `self_avoid` / `enemy_avoid` flags
(`self_avoid/you_avoided_*.mp3`, `enemy_avoid/enemy_avoided_*.mp3`). Entries without a
`soundFileName` get an empty `soundFiles` map.

Every sound file whose `exists` is `false` is also listed in a **Missing sound files** section of
the branch's `*.summary.md`. This is reporting only - a missing file never fails the build.

## Running locally

```bash
cd tools/export_spellmap
pip install -r requirements.txt
python export_spellmap.py
```

Options:

- `--spellmap-dir`        path to `code/spellmap/` (default: repo `code/spellmap`)
- `--spellavoidmap-dir`   path to `code/spellavoidmap/` (default: repo `code/spellavoidmap`)
- `--assets-dir`          path to `assets/sounds/en/` for the sound-file existence check (default: repo `assets/sounds/en`)
- `--output-dir`          where to write the export (default: repo-root `target/spellmap-export`)

A compact summary is also printed to stdout (this is what the GitHub Action renders into the
workflow step summary).

## Exit codes

- `0` - success, **including when the data set has simply changed**. The exporter never fails a
  build just because spells were added or edited.
- `1` - hard failure only: a Lua load/parse error, or an overlay describing a structurally
  impossible operation (e.g. `remove` of a spellId that isn't in the base). These are surfaced by
  the same validator `verify_spellmap` uses.

## Relationship to `spellmap_core`

The exporter imports the Lua loader (`LuaParser`, `SpellMapFileReader`) and the Python port of the
assembler (`assembler.apply` / `assembler.validate`) directly from the shared
[`../spellmap_core`](../spellmap_core) library. This keeps a **single implementation** of the
assembly rules - the tools cannot drift. As a result the tool directories must stay co-located
under `tools/`.

## GitHub Action

`.github/workflows/export_spellmap.yaml` runs the exporter on every change to the SpellMap /
SpellAvoidMap sources (or either tool), uploads the `target/spellmap-export/` directory as the
`spellmap-export-<sha>` artifact, renders the per-branch summaries and diff into the run's step
summary, and posts (and updates) a single PR comment with the cross-branch deltas.
