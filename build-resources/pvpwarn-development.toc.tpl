## Interface: ${addon.interface}
## Title: ${addon.name}
## Author: ${addon.author}
## Notes: ${addon.description}
## Version: ${addon.tag.version}
## SavedVariablesPerCharacter: ${addon.savedVariablesPerCharacter}

# constant values
code/PVPW_Constants.lua
# environment variables
code/PVPW_Environment.lua

# localization
localization/enUS.lua
localization/deDE.lua

# code
code/PVPW_Core.lua
code/PVPW_Logger.lua
code/PVPW_Filter.lua
code/PVPW_Ticker.lua
code/PVPW_Warn.lua
code/PVPW_Sound.lua
code/PVPW_Visual.lua
code/PVPW_CombatLog.lua
code/PVPW_SpellMapHelper.lua
code/PVPW_SpellMap.lua
code/PVPW_SpellAvoidMapHelper.lua
code/PVPW_SpellAvoidMap.lua
code/PVPW_Common.lua
code/PVPW_Target.lua
code/PVPW_CombatState.lua
code/PVPW_StanceState.lua
code/PVPW_Configuration.lua
code/PVPW_SpellConfiguration.lua
code/PVPW_Cmd.lua
code/PVPW_Tooltip.lua
code/PVPW_Macro.lua
code/PVPW_Zone.lua
code/PVPW_Season.lua

# profiles
profiles/PVPW_Profile.lua
profiles/PVPW_DruidProfile.lua
profiles/PVPW_HunterProfile.lua
profiles/PVPW_MageProfile.lua
profiles/PVPW_PaladinProfile.lua
profiles/PVPW_PriestProfile.lua
profiles/PVPW_RogueProfile.lua
profiles/PVPW_ShamanProfile.lua
profiles/PVPW_WarlockProfile.lua
profiles/PVPW_WarriorProfile.lua

# debug
code/PVPW_Debug.lua

# gui
# custom blizzard dropdown impl
libs/LibUiDropDownMenu/LibUiDropDownMenu.lua
libs/LibUiDropDownMenu/LibUiDropDownMenu.xml
libs/LibUiDropDownMenu/LibUiDropDownMenuTemplates.lua
libs/LibUiDropDownMenu/LibUiDropDownMenuTemplates.xml

gui/PVPW_Frame.xml
gui/PVPW_AddonConfiguration.lua
gui/PVPW_AboutContent.lua
gui/PVPW_GeneralMenu.lua
gui/PVPW_ZoneMenu.lua
gui/PVPW_ProfileMenu.lua
gui/PVPW_CategoryMenu.lua
gui/PVPW_CategoryMenuSpellsTab.lua
gui/PVPW_CategoryMenuAvoidTab.lua
gui/PVPW_EnemyAvoidMenu.lua
gui/PVPW_TargetFrame.lua
gui/PVPW_GuiHelper.lua

# test
test/PVPW_TestReporter.lua
test/PVPW_TestHelper.lua

# testbase
test/PVPW_TestSound.lua
test/PVPW_TestCombatEvent.lua

# warrior
test/warrior/PVPW_TestSoundWarrior.lua
test/warrior/PVPW_TestSoundSelfAvoidWarrior.lua
test/warrior/PVPW_TestSoundEnemyAvoidWarrior.lua
test/warrior/PVPW_TestCombatEventsWarrior.lua
test/warrior/PVPW_TestCombatEventsSelfAvoidWarrior.lua
test/warrior/PVPW_TestCombatEventsEnemyAvoidWarrior.lua
# priest
test/priest/PVPW_TestSoundPriestEn.lua
test/priest/PVPW_TestSoundSelfAvoidPriestEn.lua
test/priest/PVPW_TestSoundEnemyAvoidPriestEn.lua
test/priest/PVPW_TestCombatEventsPriestEn.lua
test/priest/PVPW_TestCombatEventsSelfAvoidPriestEn.lua
test/priest/PVPW_TestCombatEventsEnemyAvoidPriestEn.lua
# rogue
test/rogue/PVPW_TestSoundRogueEn.lua
test/rogue/PVPW_TestSoundSelfAvoidRogueEn.lua
test/rogue/PVPW_TestSoundEnemyAvoidRogueEn.lua
test/rogue/PVPW_TestCombatEventsRogueEn.lua
test/rogue/PVPW_TestCombatEventsSelfAvoidRogueEn.lua
test/rogue/PVPW_TestCombatEventsEnemyAvoidRogueEn.lua
# mage
test/mage/PVPW_TestSoundMageEn.lua
test/mage/PVPW_TestSoundSelfAvoidMageEn.lua
test/mage/PVPW_TestSoundEnemyAvoidMageEn.lua
test/mage/PVPW_TestCombatEventsMageEn.lua
test/mage/PVPW_TestCombatEventsSelfAvoidMageEn.lua
test/mage/PVPW_TestCombatEventsEnemyAvoidMageEn.lua
# hunter
test/hunter/PVPW_TestSoundHunterEn.lua
test/hunter/PVPW_TestSoundSelfAvoidHunterEn.lua
test/hunter/PVPW_TestSoundEnemyAvoidHunterEn.lua
test/hunter/PVPW_TestCombatEventsHunterEn.lua
test/hunter/PVPW_TestCombatEventsSelfAvoidHunterEn.lua
test/hunter/PVPW_TestCombatEventsEnemyAvoidHunterEn.lua
# warlock
test/warlock/PVPW_TestSoundWarlockEn.lua
test/warlock/PVPW_TestSoundSelfAvoidWarlockEn.lua
test/warlock/PVPW_TestSoundEnemyAvoidWarlockEn.lua
test/warlock/PVPW_TestCombatEventsWarlockEn.lua
test/warlock/PVPW_TestCombatEventsSelfAvoidWarlockEn.lua
test/warlock/PVPW_TestCombatEventsEnemyAvoidWarlockEn.lua
# paladin
test/paladin/PVPW_TestSoundPaladinEn.lua
test/paladin/PVPW_TestSoundSelfAvoidPaladinEn.lua
test/paladin/PVPW_TestSoundEnemyAvoidPaladinEn.lua
test/paladin/PVPW_TestCombatEventsPaladinEn.lua
test/paladin/PVPW_TestCombatEventsSelfAvoidPaladinEn.lua
test/paladin/PVPW_TestCombatEventsEnemyAvoidPaladinEn.lua
# druid
test/druid/PVPW_TestSoundDruidEn.lua
test/druid/PVPW_TestSoundSelfAvoidDruidEn.lua
test/druid/PVPW_TestSoundEnemyAvoidDruidEn.lua
test/druid/PVPW_TestCombatEventsDruidEn.lua
test/druid/PVPW_TestCombatEventsSelfAvoidDruidEn.lua
test/druid/PVPW_TestCombatEventsEnemyAvoidDruidEn.lua
# shaman
test/shaman/PVPW_TestSoundShamanEn.lua
test/shaman/PVPW_TestSoundSelfAvoidShamanEn.lua
test/shaman/PVPW_TestSoundEnemyAvoidShamanEn.lua
test/shaman/PVPW_TestCombatEventsShamanEn.lua
test/shaman/PVPW_TestCombatEventsSelfAvoidShamanEn.lua
test/shaman/PVPW_TestCombatEventsEnemyAvoidShamanEn.lua
# racials
test/racials/PVPW_TestSoundRacialsEn.lua
test/racials/PVPW_TestCombatEventsRacialsEn.lua
# items
test/items/PVPW_TestSoundItemsEn.lua
test/items/PVPW_TestCombatEventsItemsEn.lua
# misc
test/misc/PVPW_TestSoundMiscEn.lua
test/misc/PVPW_TestCombatEventsMiscEn.lua

# test all
test/PVPW_TestAll.lua
