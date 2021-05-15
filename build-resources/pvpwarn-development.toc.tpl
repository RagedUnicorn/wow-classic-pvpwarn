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
code/PVPW_SpellMap.lua
code/PVPW_SpellAvoidMap.lua
code/PVPW_Common.lua
code/PVPW_Target.lua
code/PVPW_CombatState.lua
code/PVPW_Configuration.lua
code/PVPW_SpellConfiguration.lua
code/PVPW_Cmd.lua
code/PVPW_Tooltip.lua

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
test/PVPW_TestSoundWarriorEn.lua
test/PVPW_TestSoundSelfAvoidWarriorEn.lua
test/PVPW_TestSoundEnemyAvoidWarriorEn.lua
test/PVPW_TestCombatEventsWarriorEn.lua
test/PVPW_TestCombatEventsSelfAvoidWarriorEn.lua
test/PVPW_TestCombatEventsEnemyAvoidWarriorEn.lua
# priest
test/PVPW_TestSoundPriestEn.lua
test/PVPW_TestSoundSelfAvoidPriestEn.lua
test/PVPW_TestSoundEnemyAvoidPriestEn.lua
test/PVPW_TestCombatEventsPriestEn.lua
test/PVPW_TestCombatEventsSelfAvoidPriestEn.lua
test/PVPW_TestCombatEventsEnemyAvoidPriestEn.lua
# rogue
test/PVPW_TestSoundRogueEn.lua
test/PVPW_TestSoundSelfAvoidRogueEn.lua
test/PVPW_TestSoundEnemyAvoidRogueEn.lua
test/PVPW_TestCombatEventsRogueEn.lua
test/PVPW_TestCombatEventsSelfAvoidRogueEn.lua
test/PVPW_TestCombatEventsEnemyAvoidRogueEn.lua
# mage
test/PVPW_TestSoundMageEn.lua
test/PVPW_TestSoundSelfAvoidMageEn.lua
test/PVPW_TestSoundEnemyAvoidMageEn.lua
test/PVPW_TestCombatEventsMageEn.lua
test/PVPW_TestCombatEventsSelfAvoidMageEn.lua
test/PVPW_TestCombatEventsEnemyAvoidMageEn.lua
# hunter
test/PVPW_TestSoundHunterEn.lua
test/PVPW_TestSoundSelfAvoidHunterEn.lua
test/PVPW_TestSoundEnemyAvoidHunterEn.lua
test/PVPW_TestCombatEventsHunterEn.lua
test/PVPW_TestCombatEventsSelfAvoidHunterEn.lua
test/PVPW_TestCombatEventsEnemyAvoidHunterEn.lua
# warlock
test/PVPW_TestSoundWarlockEn.lua
test/PVPW_TestSoundSelfAvoidWarlockEn.lua
test/PVPW_TestSoundEnemyAvoidWarlockEn.lua
test/PVPW_TestCombatEventsWarlockEn.lua
test/PVPW_TestCombatEventsSelfAvoidWarlockEn.lua
test/PVPW_TestCombatEventsEnemyAvoidWarlockEn.lua
# paladin
test/PVPW_TestSoundPaladinEn.lua
test/PVPW_TestSoundSelfAvoidPaladinEn.lua
test/PVPW_TestSoundEnemyAvoidPaladinEn.lua
test/PVPW_TestCombatEventsPaladinEn.lua
test/PVPW_TestCombatEventsSelfAvoidPaladinEn.lua
test/PVPW_TestCombatEventsEnemyAvoidPaladinEn.lua
# druid
test/PVPW_TestSoundDruidEn.lua
test/PVPW_TestSoundSelfAvoidDruidEn.lua
test/PVPW_TestSoundEnemyAvoidDruidEn.lua
test/PVPW_TestCombatEventsDruidEn.lua
test/PVPW_TestCombatEventsSelfAvoidDruidEn.lua
test/PVPW_TestCombatEventsEnemyAvoidDruidEn.lua
# shaman
test/PVPW_TestSoundShamanEn.lua
test/PVPW_TestSoundSelfAvoidShamanEn.lua
test/PVPW_TestSoundEnemyAvoidShamanEn.lua
test/PVPW_TestCombatEventsShamanEn.lua
test/PVPW_TestCombatEventsSelfAvoidShamanEn.lua
test/PVPW_TestCombatEventsEnemyAvoidShamanEn.lua
# racials
test/PVPW_TestSoundRacialsEn.lua
test/PVPW_TestCombatEventsRacialsEn.lua
# items
test/PVPW_TestSoundItemsEn.lua
test/PVPW_TestCombatEventsItemsEn.lua
# misc
test/PVPW_TestSoundMiscEn.lua
test/PVPW_TestCombatEventsMiscEn.lua

# test all
test/PVPW_TestAllEn.lua
