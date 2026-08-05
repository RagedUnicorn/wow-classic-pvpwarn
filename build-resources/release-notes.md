## PVPWarn v2.0.0

> ### ⚠ Please read before updating — your spell settings will be reset
>
> This release changes how PVPWarn stores per-spell configuration. Internally, spells were
> previously addressed by **name** and are now addressed by **numeric spell ID**, which makes
> warnings reliable across locales and across ranks. There is no way to convert the old
> name-based entries, so **on first login after the update all profiles are reset to your
> class defaults** and you will see a chat message confirming it.
>
> **What you lose:** every per-spell customization — which spells are active, per-spell sound
> and colour choices, and any custom profiles you created.
>
> **What survives:** your zone settings, combat and stance state tracking options, frame
> positions and lock states, and your selected voice pack.
>
> **Recommendation:** if you have a profile you care about, export it before updating
> (Profiles panel → Export) so you have a record of it, then rebuild it after the update.
> This is a one-time reset — future updates will not repeat it.

---

### Detection Bar

A new visual warning channel. Detected spells appear as stacking bars showing the spell icon,
name and remaining duration, so you can see at a glance what is on you and how long is left.
Aura-removed events are called out with their own visual indicator and text. The bar can be
freely positioned and locked, and is toggled globally in the settings.

### Vignette Flash

A soft screen-edge flash on detection, coloured per spell. Each spell can carry its own
warning colour, so you can make your interrupts and crowd control instantly distinguishable
from routine chatter. Preview it any time with `/rgpvpw flash test`.

### Warning Modes — cut the noise

A new **Warning mode** setting in General Settings controls which events warn you:

- **Warn all** (default) — the previous behaviour, every detected spell warns
- **Current target** — only warn about events involving your current enemy target

Spells cast directly at you always warn regardless of the mode, so filtering can never hide
something aimed your way.

### Profile Import & Export

Profiles can now be exported to a share string and imported back — copy a setup between
characters, back it up, or share it with your guild. Imports are validated before they are
applied.

### TBC Anniversary Support

PVPWarn now ships as a single addon supporting both **Classic Era** and **TBC Anniversary**,
with a TBC-specific spell catalog layered on top of the shared base. No separate download and
no manual switching — the correct spell data is selected from the client you log into.

### Update Notifications

PVPWarn now recognises when a guild or party member is running a newer version and tells you
once per session, so you know when it is worth checking for an update.

### Stance Tracking Refinements

Stance state tracking now covers the additional forms it was missing, correctly excludes
Hunters (who have no stances to track), and offers a preview mode to position the frame
without needing to shapeshift.

### Interface Polish

- Spell entries now carry category-coloured gradients, making the long lists far easier to scan
- Hovering a spell icon shows its tooltip, so you can confirm exactly which spell and rank a row refers to
- Reworked sliders and the modern minimal scrollbar throughout the options
- Improved tab navigation in the category menu
- Profile names are now length-validated with clear feedback instead of failing silently

### Under the Hood

- Warning queue timing reworked so warnings no longer talk over each other
- Frame positions are stored by region name, fixing saved positions that could break on login
- Spell lookups now go through a category index for faster combat-log handling
- Automatic rank alias generation, so new spell ranks are picked up consistently
- A new headless test suite runs on every change, alongside the existing in-game test framework
