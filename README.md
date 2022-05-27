# PVPWarn

![](docs/pvpw_ragedunicorn_love_classic.png)

> PVPWarn aims to help the player to hear and see enemy spells casted on himself and also spells that an enemy player resisted or spells that the player himself resisted

![](docs/wow_badge.svg)
![](docs/license_mit.svg)
[![](docs/curseforge.svg)](https://curseforge.overwolf.com/?addonId=475326&fileId=3767364)
![Lint](https://github.com/RagedUnicorn/wow-classic-pvpwarn/actions/workflows/lint.yaml/badge.svg?branch=master)

PVPWarn uses both visual and acoustic effects to make the player aware of certain events. The addon aims to be configurable to the players preferences and allows customization on exactly what spells should be brought to the attention of the player and in what form.

**WoW Classic Support**

> This Addon supports WoW Burning Cursade Classic see - [bcc-PVPWarn](https://github.com/RagedUnicorn/wow-bcc-pvpwarn/)

<a href="https://github.com/RagedUnicorn/wow-bcc-pvpwarn/"><img src="/docs/the_burning_crusade_logo.png" width="40%"></img></a>

## Installation

WoW-Addons are installed directly in your WoW directory:

`[WoW-installation-directory]\Interface\AddOns`

Make sure to get the newest version of the Addon from the releases tab:

[PVPWarn-Releases](https://github.com/RagedUnicorn/wow-classic-pvpwarn/releases)

> Note: If the Addon is not showing up in your ingame Addonlist make sure that the Addon is named `PVPWarn` in your Addons folder

## What is PVPWarn?

PVPWarns goal is to help the player recognizing combat log events in a more visual and acoustical way. PVPWarn can display visual and acoustical cues when a certain event is found in the combat log. As an example PVPWarn might play a sound both when an enemy warrior activates recklessness and when it runs out.

## Features of PVPWarn

### Warning

The basic feature of warning the player can be configured for each class and some additional categories such as items, racials and misc.

![](docs/pvpwarn_configure_spell.gif)

### Avoiding Spells

PVPWarn can also detect when certain spells where either resisted by the player itself or an enemy player.

#### Self Avoid

The avoid tab allows the configuration of warnings for all spells of a certain category. If you're interested in knowing when you resist a certain spells such as the silence of a shadow priest you will configure this in the priest category.

![](docs/pvpwarn_configure_self_avoid.gif)

#### Enemy Avoid

To configure the resist warning for your own class use the `Enemy Avoid` navigation point. This menu contains all spells for your class that can be resisted and are supported by PVPWarn. If you use a different class the content of that menu is different.

![](docs/pvpwarn_configure_enemy_avoid.gif)

### Profiles

PVPWarn loads a default profile based on your class when the addon loads for the first time. The default profile can be loaded again at any point. If you however start modifying what spells are tracked you can create a new profile, or you can even have multiple different profiles that you can then load based on your situation.

#### Loading Profiles with Macros

Once a profile is created in can be loaded manually or with a macro.

```lua
/run _G["RGPVPW_MACRO_LOADPROFILE"]("[profileName")
-- e.g.
/run _G["RGPVPW_MACRO_LOADPROFILE"]("Warriorprofile")
```

## FAQ

#### The Addon is not showing up in WoW. What can I do?

Make sure to recheck the installation part of this Readme and check that the Addon is placed inside `[WoW-installation-directory]\Interface\AddOns` and is correctly named as `PVPWarn`.

#### I get a red error (Lua Error) on my screen. What is this?

This is what we call a Lua error, and it usually happens because of an oversight or error by the developer (in this case me). Take a screenshot off the error and create a GitHub Issue with it, and I will see if I can resolve it. It also helps if you can add any additional information of what you were doing at the time and what other addons you have active. Additionally, if you are able to reproduce the error make sure to check if it still happens if you disable all others addons.

#### PVPWarn spams my chat with messages. How can I deactivate this?

Those obnoxious messages are intended for the development of this addon and means that you download a development version of the addon instead of a proper release. Releases can be downloaded from here - https://github.com/RagedUnicorn/wow-classic-pvpwarn/releases

#### PVPWarn did not warn me about a certain spell. Why?

This can have multiple errors. It might be an actual bug where the addon did not recognize the spell. Before creating a ticket however please make sure to check that the spell is actually configured to show a visual or acoustical warning.

#### PVPWarn does not support my Spell. What can I do?

PVPWarn is not complete and certain spells might have simply forgotten. If you have a certain spell that you would like to see supported in a future version of the addon make sure to create a ticket for it, and I will have a  look at it.

## Development

### Switching between Environments

Switching between development and release can be achieved with maven.

```
mvn generate-resources -D generate.sources.overwrite=true -P development
```

This generates and overwrites `GM_Environment.lua` and `GearMenu.toc`. You need to specifically specify that you want to overwrite the files to prevent data loss. It is also possible to omit the profile because development is the default profile that will be used.

Switching to release can be done as such:

```
mvn generate-resources -D generate.sources.overwrite=true -P release
```

In this case it is mandatory to add the release profile.

**Note:** Switching environments has the effect changing certain files to match an expected value depending on the environment. To be more specific this means that as an example test and debug files are not included when switching to release. It also means that variables such as loglevel change to match the environment.

As to not change those files all the time the repository should always stay in the development environment. Do not commit `GearMenu.toc` and `GM_Environment.lua` in their release state. Changes to those files should always be done inside `build-resources` and their respective template files marked with `.tpl`.

### Packaging the Addon

To package the addon use the `package` phase.

```
mvn package -D generate.sources.overwrite=true -P development
```

This generates an addon package for development. For generating a release package the release profile can be used.

```
mvn package -D generate.sources.overwrite=true -P release
```

**Note:** This packaging and switching resources can also be done one after another.

**Note:** The packaging is not fit to be used for CurseForge because CurseForge expects a specific packaging

```
# switch environment to release
mvn generate-resources -D generate.sources.overwrite=true -P release
# package release
mvn package -P release
```

### Deploy GitHub Release

Before creating a new release update `addon.tag.version` in `pom.xml`. Afterwards to create a new release and deploy to GitHub the `deploy-github` profile has to be used.

```
# switch environment to release
mvn generate-resources -D generate.sources.overwrite=true -P release
# deploy release
mvn package -P deploy-github -D github.auth-token=[token]
```

**Note:** This is only intended for manual deployment to GitHub. With GitHub actions the token is supplied as a secret to the build process

### Deploy CurseForge Release

**Note:** It's best to create the release for GitHub first and only afterwards the CurseForge release. That way the tag was already created.

```
# switch environment to release
mvn generate-resources -D generate.sources.overwrite=true -P release
# deploy release
mvn package -P deploy-curseforge -D curseforge.auth-token=[token]
```

**Note:** This is only intended for manual deployment to CurseForge. With GitHub actions the token is supplied as a secret to the build process

### Deploy Wago.io Release

**Note:** It's best to create the release for GitHub first and only afterwards the Wago.io release. That way the tag was already created.

```
# switch environment to release
mvn generate-resources -D generate.sources.overwrite=true -P release
# deploy release
mvn package -P deploy-wago -D wago.auth-token=[token]
```

**Note:** This is only intended for manual deployment to Wago.io. With GitHub actions the token is supplied as a secret to the build process

### GitHub Action Profiles

This project has GitHub action profiles for different Devops related work such as linting and deployments to different providers. See `.github` folder for details.

## License

MIT License

Copyright (c) 2022 Michael Wiesendanger

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
