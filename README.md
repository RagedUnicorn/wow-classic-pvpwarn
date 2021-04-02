# PVPWarn

![](/docs/pvpw_ragedunicorn_love_classic.png)

> PVPWarn aims to help the player to hear and see enemy spells casted on himself and also spells that an enemy player resisted or spells that the player himself resisted

PVPWarn uses both visual and acoustic effects to make the player aware of certain events. The addon aims to be configurable to the players preferences and allows customization on exactly what spells should be brought to the attention of the player and in what form.

## Development

### Switching between Environments

Switching between development and release can be achieved with maven.

```
mvn generate-resources -Dgenerate.sources.overwrite=true -P development
```

This generates and overwrites `GM_Environment.lua` and `GearMenu.toc`. You need to specifically specify that you want to overwrite to files to prevent data loss. It is also possible to omit the profile because development is the default profile that will be used.

Switching to release can be done as such:

```
mvn generate-resources -Dgenerate.sources.overwrite=true -P release
```

In this case it is mandatory to add the release profile.

**Note:** Switching environments has the effect changing certain files to match an expected value depending on the environment. To be more specific this means that as an example test and debug files are not included when switching to release. It also means that variables such as loglevel change to match the environment.

As to not change those files all the time the repository should always stay in the development environment. Do not commit `GearMenu.toc` and `GM_Environment.lua` in their release state. Changes to those files should always be done inside `build-resources` and their respective template files marked with `.tpl`.

### Packaging the Addon

To package the addon use the `package` phase.

```
mvn package -Dgenerate.sources.overwrite=true -P development
```

This generates an addon package for development. For generating a release package the release profile can be used.

```
mvn package -Dgenerate.sources.overwrite=true -P release
```

**Note:** This packaging and switching resources can also be done one after another.

**Note:** The packaging is not fit to be used for twitch because twitch expects a specific packaging

```
# switch environment to release
mvn generate-resources -Dgenerate.sources.overwrite=true -P release
# package release
mvn package -P release
```

### Deploy GitHub Release

Before creating a new release update `addon.tag.version` in `pom.xml`. Afterwards to create a new release and deploy to GitHub the `deploy` profile has to be used.

```
# switch environment to release
mvn generate-resources -Dgenerate.sources.overwrite=true -P release
# deploy release
mvn package -P deploy-github
```

For this to work an oauth token for GitHub is required and has to be configured in your `.m2` settings file.

### Deploy Twitch Release

**Note:** Its best to create the release for GitHub first and only afterwards the twitch release. That way the tag was already created.

```
# switch environment to release
mvn generate-resources -Dgenerate.sources.overwrite=true -P release
# deploy release
mvn package -P deploy-twitch
```

## License

MIT License

Copyright (c) 2021 Michael Wiesendanger

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
