# TC-WA-03 — Warn queue busy gate and age prune

**Area:** Warnings | **Client:** Era | **Mandatory:** yes

## Preconditions

- A battleground or a group fight where several tracked spells land in quick succession
- Sound warnings enabled for the spells involved

## Steps

1. Get into a burst of activity where three or more tracked spells are detected within a
   second or two
2. Listen carefully to how the warnings are spaced
3. Watch the detection bars while the warnings play
4. Provoke a long burst (a full enemy team opening on you) and note whether any warning
   arrives noticeably late

## Expected

- Warnings never overlap or talk over each other — the queue plays one, then blocks for
  `WARN_QUEUE_BUSY_GATE` (0.8s) before the next
- The queue drains on the `WARN_QUEUE_UPDATE_INTERVAL` (0.1s) ticker, so the spacing is
  audibly regular rather than instant
- Entries older than `MAX_WARN_AGE` (5s) are **dropped**, not played late — a long burst ends
  with silence, not a backlog of stale announcements
- Detection bars are **not** gated by the queue: they appear immediately for every detection,
  including ones whose sound was pruned
- No Lua errors
