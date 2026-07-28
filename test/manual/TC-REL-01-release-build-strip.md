# TC-REL-01 — Release package strips the development tree

**Area:** Release build | **Client:** Era | **Mandatory:** yes

## Preconditions

- A real release artifact, not the dev checkout:

  ```
  mvn generate-resources -D generate.sources.overwrite=true -P release
  mvn package -P release
  ```

- The dev checkout moved aside, so the packaged addon is what the client loads
- Client fully logged out before swapping the folder

## Steps

1. Unpack the release zip into `Interface/AddOns/` in place of the dev checkout
2. Inspect the packaged `PVPWarn.toc` and the packaged file tree
3. Log in and watch for errors
4. Type `/rgpvpw help` and read the listed commands
5. Type `/rgpvpw testsound mage` and `/rgpvpw testlog show`
6. Type `/rgpvpw bar test` and `/rgpvpw flash test`
7. Walk every settings panel, especially **Enemy Avoid**
8. Log out, inspect the SavedVariables, then restore the development checkout and
   re-run `mvn generate-resources -D generate.sources.overwrite=true -P development`

## Expected

- The package contains **no** `test/` directory and no `code/Debug.lua`
- The packaged TOC's `## SavedVariablesPerCharacter` lists only `PVPWarnConfiguration` and
  `PVPWarnProfiles` — `PVPWarnLogTracker`, `PVPWarnLogTrackerAvoid` and `PVPWarnTestLog` are
  **absent**
- The TOC carries the release-only `X-Category`, `X-Curse-Project-ID` and `X-Wago-ID` headers
- Every `test*` slash command prints the invalid-argument error — none survives into release
- `bar` and `flash` still work; they are registered in all builds
- Every settings panel renders without a Lua error. The Enemy Avoid panel specifically threw
  on first render in a past release-only regression (PW-0014), so it must be opened here
- Warnings, flash and detection bar all behave as in the dev build
- The repo is left back in **development** state — the release flavor of `PVPWarn.toc` and
  `code/Environment.lua` must never be committed
- No Lua errors

> This case has no sibling equivalent in Pulse or GearMenu. It exists because PVPWarn's
> dev/release split strips an entire tree and three SavedVariables, and because the release
> flavor has broken in ways the dev checkout could not reproduce.
