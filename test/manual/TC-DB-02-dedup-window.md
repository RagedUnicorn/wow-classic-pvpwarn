# TC-DB-02 — Dedup window collapses repeated detections

**Area:** Detection bar | **Client:** Era | **Mandatory:** yes

## Preconditions

- Detection bar enabled
- `detectionBar.dedupWindow` at its default of 1.0 seconds

## Steps

1. Run `/rgpvpw bar test` and immediately run it again, well inside one second
2. Count the bars that appear
3. Wait more than a second after the first batch finishes, then run `/rgpvpw bar test` again
4. In combat, have the same enemy cast the same tracked spell twice in quick succession

## Expected

- The second immediate `bar test` does **not** double the stack — repeats of the same
  spell/player pair inside the dedup window are collapsed into the existing bar
- After the window lapses, the same detection produces a fresh bar
- A genuinely repeated cast outside the window is shown as a new detection, not swallowed
- Dedup applies to the bar only; the sound warning path has its own busy gate (TC-WA-03)
- No Lua errors
