# SpellMap Core

Shared SpellMap / SpellAvoidMap loading and assembly for the PVPWarn tools. This is a
library, not a tool — it has no CLI entry point of its own.

## What it provides

| Module | Purpose |
| --- | --- |
| `lua_parser.py` | `LuaParser` — executes the Lua source (via lupa) in a mocked addon environment and converts spellMap / spellAvoidMap / overlay tables to Python |
| `assembler.py` | Python port of `code/SpellMapAssembler.lua` (`apply` / `validate`) — keep in sync with the Lua side |
| `map_loader.py` | `load_union_map` / `union_apply` — directory-level loading of the Base.lua + overlay layout into the cross-branch union view (add / replace / appendRanks applied, `remove` skipped) |
| `file_reader.py` | `SpellMapFileReader` — file I/O helper used by the verify / export entry points |
| `constants.py` | Lua environment mocks and parsing patterns |

## Consumers

- `tools/verify_spellmap` — per-branch assembly + validation (uses `LuaParser`, `assembler`, `SpellMapFileReader`)
- `tools/export_spellmap` — per-branch assembly + export (same surface)
- `tools/combat_log_parser`, `tools/verify_sounds`, `tools/voice_generator` — union view via `load_union_map`

Consumers import the package from source by inserting this tool root on `sys.path`:

```python
sys.path.insert(0, str(Path(__file__).resolve().parent... / "spellmap_core"))
from spellmap_core.map_loader import load_union_map
```

This requires the repo layout (`tools/<tool>/` side by side) to stay intact — spellmap_core
must remain co-located with its consumers. Because the package is imported from source
(never pip-installed), every consumer must keep `lupa` in its own `requirements.txt`.

## Tests

```bash
# From the repository root
docker compose -f docker-compose.test.yml run --rm spellmap-core-tests
```
