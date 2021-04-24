# PVPWarn
&nbsp;  
![](https://raw.githubusercontent.com/RagedUnicorn/wow-classic-pvpwarn/master/docs/pvpw_ragedunicorn_love_classic.png)
&nbsp;  
_PVPWarn aims to help the player to hear and see enemy spells casted on himself and also spells that an enemy player resisted or spells that the player himself resisted_

## What is PVPWarn?

PVPWarns goal is to help the player recognizing combat log events in a more visual and acoustical way. PVPWarn can display visual and acoustical cues when a certain event is found in the combat log. As an example PVPWarn might play a sound both when an enemy warrior activates recklessness and when it runs out.

## Features of PVPWarn

### Warning

The basic feature of warning the player can be configured for each class and some additional categories such as items, racials and misc.

![](https://raw.githubusercontent.com/RagedUnicorn/wow-classic-pvpwarn/master/docs/pvpwarn_configure_spell.gif)

### Avoiding Spells

PVPWarn can also detect when certain spells where either resisted by the player itself or an enemy player.

#### Self Avoid

The avoid tab allows the configuration of warnings for all spells of a certain category. If you're interested in knowing when you resist a certain spells such as the silence of a shadow priest you will configurate this in the priest category.

![](https://raw.githubusercontent.com/RagedUnicorn/wow-classic-pvpwarn/master/docs/pvpwarn_configure_self_avoid.gif)

#### Enemy Avoid

To configure the resist warning for your own class use the `Enemy Avoid` navigation point. This menu contains all spells for your class that can be resisted and are supported by PVPWarn. If you use a different class the content of that menu is different.

![](https://raw.githubusercontent.com/RagedUnicorn/wow-classic-pvpwarn/master/docs/pvpwarn_configure_enemy_avoid.gif)

### Profiles

PVPWarn loads a default profile based on your class when the addon loads for the first time. The default profile can be loaded again at any point. If you however start modifying what spells are tracked you can create a new profile or you can even have multiple different profiles that you can then load based on your situation.


## FAQ

#### The Addon is not showing up in WoW. What can I do?

Make sure to recheck the installation part of this Readme and check that the Addon is placed inside `[WoW-installation-directory]\Interface\AddOns` and is correctly named as `PVPWarn`.

#### I get a red error (Lua Error) on my screen. What is this?

This is what we call a Lua error and it usually happens because of an oversight or error by the developer (in this case me). Take a screenshot off the error and create a Github Issue with it and I will see if I can resolve it. It also helps if you can add any additional information of what you we're doing at the time and what other addons you have active. Also if you are able to reproduce the error make sure to check if it still happens if you disable all others addons.

#### PVPWarn spams my chat with messages. How can I deactivate this?

Those obnoxious messages are intended for the development of this addon and means that you download a development version of the addon instead of a proper release. Releases can be downloaded from here - https://github.com/RagedUnicorn/wow-classic-pvpwarn/releases

#### PVPWarn did not warn me about a certain spell. Why?

This can have multiple errors. It might be an actual bug where the addon did not recognize the spell. Before creating a ticket however please make sure to check that the spell is actually configured to show a visual or acoustical warning.

#### PVPWarn does not support my Spell. What can I do?

PVPWarn is not complete and certain spells might have simply forgotten. If you have a certain spell that you would like to see supported in a future version of the addon make sure to create a ticket for it and I will have a  look at it.
