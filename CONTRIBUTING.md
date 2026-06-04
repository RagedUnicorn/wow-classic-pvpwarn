# Contributing to PVPWarn

Thanks for helping improve PVPWarn! The single most valuable thing most players can contribute is
a **combat log**. This guide explains how to capture one and submit it - no programming or tools
required on your end.

## Contributing Combat Logs

PVPWarn reacts to spells by matching their **spell ID** and the **combat-log event** they generate
against an internal database (the "SpellMap"). To make sure every spell is configured correctly -
the right ID, the right events, across Classic Era, Burning Crusade Anniversary and Season of
Discovery - those entries are verified against **real combat logs** recorded in-game.

The events PVPWarn relies on are:

- `SPELL_CAST_START`
- `SPELL_CAST_SUCCESS`
- `SPELL_AURA_APPLIED`
- `SPELL_AURA_REMOVED`
- `SPELL_AURA_REFRESH`

The more logs the project has - especially from busy PvP situations against many different
classes - the more spells can be confirmed and the fewer remain unverified.

> **You do not need to run any tool, install anything, or analyze the log yourself.** Just record
> it and attach the file to a GitHub issue. The maintainer runs the parser in
> [`tools/combat_log_parser`](tools/combat_log_parser/README.md) against your log.

### 1. Enable combat logging

In the game, type the following in your chat box and press Enter:

```
/combatlog
```

This **starts** logging. Type `/combatlog` again later to **stop** it.

**Recommended:** also turn on **Advanced Combat Logging**. It records additional detail and writes
a fresh, timestamped file for each session, which makes logs easier to work with.

> Game Menu → **System** → **Network** → check **Advanced Combat Logging**

### 2. Play and generate events

With logging enabled, go play content that produces lots of spell casts against a variety of
classes:

- Battlegrounds, arenas, world PvP (ideal - lots of enemy spells)
- Dungeons and raids also work for many spells

The wider the mix of enemy classes and specs you encounter, the more useful the log.

### 3. Stop logging so the file is finalized

WoW writes to the log file continuously while logging is active. To be safe, **turn logging off
before you grab the file** so everything is flushed to disk:

```
/combatlog
```

The log is also flushed when you `/reload`, log out, or exit the game.

### 4. Find the log file

The log lives in the `Logs` folder of your WoW client installation:

```
[WoW-installation-directory]\_classic_era_\Logs\
```

The file is named:

- `WoWCombatLog.txt`, or
- `WoWCombatLog-MMDDYY_HHMMSS.txt` when **Advanced Combat Logging** is enabled
  (for example `WoWCombatLog-042125_180624.txt`)

> Other clients use their own folder - for example Burning Crusade Anniversary logs are under
> `_classic_\Logs\`. Pick the `Logs` folder that matches the version you played.

### 5. Submit it as a GitHub issue

1. Go to the [PVPWarn issue tracker](https://github.com/RagedUnicorn/wow-classic-pvpwarn/issues).
2. Click **New issue** and choose the **🪵 Combat Log Submission** template.
3. Fill in the short form (game version, what you did during the log) and **attach your log file**.

Tips for attaching:

- Combat logs can be large and `.txt` files are sometimes rejected by GitHub. **Zip the file
  first** - `WoWCombatLog.txt` → `WoWCombatLog.zip` - and drag the `.zip` into the issue.
- GitHub's per-attachment limit for issues is roughly **25 MB**. If your zipped log is bigger,
  split it into multiple smaller logs (log shorter sessions) or share a download link instead.
- Don't edit the file - the raw, unmodified log is exactly what's needed.

### What happens next

The maintainer runs the combat-log parser against your submission. It checks which spell/event
combinations your log confirms and updates the project's verification data accordingly. There's
nothing more you need to do - thank you for contributing!

## Other contributions

For code changes, build/packaging setup, testing, and release procedures, see
[DEVELOPMENT.md](DEVELOPMENT.md) and [TEST.md](TEST.md).
