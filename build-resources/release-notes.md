## PVPWarn v2.1.0

### Profiles - your settings always belong to the active profile

Profiles no longer need an **Update Profile** button, and there is none. The profile drawn
in gold on the Profiles page is the active one: every spell setting you change is saved into
it, and switching to another profile keeps everything you changed in the one you leave. A
macro switch (`RGPVPW_MACRO_LOADPROFILE`) behaves the same way.

- **Default** is now your editable home profile - change it as you like. Loading it no longer
  resets anything; the new **Reset to defaults** button restores the class defaults into
  whichever profile is active
- **Rename** gives a profile a new name in place
- Deleting the active profile loads **Default** instead of leaving you on nothing
- The page reads Create new Profile / Load / Rename / Delete / Reset to defaults, and the
  active profile is remembered across logins
- Exporting the active profile always carries your current settings

Your existing profiles carry over as they are - nothing is reset by this update.

### Combat State and Stance State options

Combat and stance state tracking moved out of General Settings into their own **Combat State**
and **Stance State** option pages.

- Both icons can be positioned together in a shared positioning mode, with a reset for each
- Each icon has its own size setting
- Your existing tracking settings are carried over automatically

### Hunter Aspects in Stance Tracking

Stance state tracking now covers Hunters: Aspect of the Monkey, Hawk, Pack, Cheetah, Wild and
Beast, plus Falcon and Viper on Season of Discovery and Viper on TBC Anniversary. Party-wide
aspects such as Aspect of the Pack no longer overwrite the stance icon of the warrior or druid
standing next to the hunter.

Swapping stances no longer clears the freshly tracked stance when the removal of the old one
arrives late.

### Update Notifications

- The version is now announced to your guild only at login, and to your party or raid when the
  group changes - a player joining right after another roster change no longer misses it
- Battleground groups now receive the version too
- Only well-formed version strings can trigger the update notice

### Fixes

- German and Russian clients fall back to the English text for any string not yet translated
  instead of showing nothing
- Profile import is more robust: overly long pastes are capped, malformed numbers are rejected
  and an invalid profile name in a share string is dropped
- PVPWarn finishes loading even if one of its startup steps fails, instead of staying silent
  for the whole session
- Clearer feedback for invalid arguments to the `combatstate`, `stancestate`, `bar` and
  `flash` slash commands

### Interface Polish

- The voice pack menu now points you to where more voice packs can be found
- Configuration menu entries are consistently labelled as options
- Warning colour choices are listed in a stable order
- Load is greyed out for the profile that is already active

### Under the Hood

- Release builds are now gated on lint, the headless test suite and a package contents check
- The headless test suite grew to cover serialization, events, slash commands, seasons, sound,
  voice packs and zones
