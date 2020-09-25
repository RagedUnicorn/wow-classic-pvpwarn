--[[
  MIT License

  Copyright (c) 2020 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
]]--

-- luacheck: globals GetAddOnMetadata

rgpvpw = rgpvpw or {}
rgpvpw.L = {}

rgpvpw.L["addon_name"] = "PVPWarn"

-- file name pattern
rgpvpw.L["removed"] = "_down"

-- console
rgpvpw.L["info_title"] = "|cFF00FFB0PVPWarn:|r"
rgpvpw.L["help"] = "|cFFFFC300(%s)|r: Use |cFFFFC300/rgpvpw|r or |cFFFFC300/pvpwarn|r for a list of options"
rgpvpw.L["opt"] = "|cFFFFC300opt|r - display Opionsmenu"
rgpvpw.L["combatstate"] = "|cFFFFC300combatstate|r - configure the position of the combatstate icon"
rgpvpw.L["reload"] = "|cFFFFC300reload|r - reload UI"
rgpvpw.L["invalid_argument"] = "Invalid argument passed"

-- about
rgpvpw.L["author"] = "Author: Michael Wiesendanger"
rgpvpw.L["email"] = "E-Mail: michael.wiesendanger@gmail.com"
rgpvpw.L["version"] = "Version: " .. GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Version")
rgpvpw.L["issues"] = "Issues: https://github.com/RagedUnicorn/wow-classic-pvpwarn/issues"

-- general
rgpvpw.L["configuration_menu_general"] = "General"
rgpvpw.L["general_title"] = "General Configuration"
rgpvpw.L["enable_combat_state_tracking"] = "Enable combatstate tracking"
rgpvpw.L["enable_combat_state_tracking_tooltip"] = "Tracks the combatstate of an enemy target"
rgpvpw.L["lock_frame_combat_state"] = "Lock combatstate frame"
rgpvpw.L["lock_frame_combat_state_tooltip"] = "Locks or unlocks the combatstate frame"

-- profiles
rgpvpw.L["configuration_menu_profiles"] = "Profiles"
rgpvpw.L["save_current_profile_button"] = "Create new Profile"
rgpvpw.L["delete_selected_profile_button"] = "Delete Profile"
rgpvpw.L["load_selected_profile_button"] = "Load Profile"

-- create new profile
rgpvpw.L["choose_profile_name_dialog_text"] = "Choose a name for the new profile"
rgpvpw.L["choose_profile_name_accept_button"] = "Accept"
rgpvpw.L["choose_profile_name_cancel_button"] = "Cancel"
-- delete profile
rgpvpw.L["confirm_delete_profile_dialog_text"] = "This will delete your selected profile. Do you want to continue?"
rgpvpw.L["confirm_delete_profile_yes_button"] = "Yes"
rgpvpw.L["confirm_delete_profile_no_button"] = "No"
-- load profile
rgpvpw.L["confirm_override_profile_dialog_text"] = "This will override your current profile. Do you want to continue?"
rgpvpw.L["confirm_override_profile_yes_button"] = "Yes"
rgpvpw.L["confirm_override_profile_no_button"] = "No"
-- user messages
rgpvpw.L["user_message_select_profile_before_delete"] = "Select a profile to delete"
rgpvpw.L["user_message_select_profile_before_load"] = "Select a profile to load"
rgpvpw.L["user_message_select_profile_already_exists"] = "Profile already exist - choose another name"
rgpvpw.L["user_message_add_new_profile_max_reached"] = "A maximum of %s profiles is allowed you reached the maximum"


-- categories
rgpvpw.L["category_druid"] = "Druid"
rgpvpw.L["category_hunter"] = "Hunter"
rgpvpw.L["category_mage"] = "Mage"
rgpvpw.L["category_paladin"] = "Paladin"
rgpvpw.L["category_priest"] = "Priest"
rgpvpw.L["category_rogue"] = "Rogue"
rgpvpw.L["category_shaman"] = "Shaman"
rgpvpw.L["category_warlock"] = "Warlock"
rgpvpw.L["category_warrior"] = "Warrior"
rgpvpw.L["category_items"] = "Items"
rgpvpw.L["category_racials"] = "Racials"
rgpvpw.L["category_misc"] = "Misc"

-- category configuration
rgpvpw.L["label_enable_sound"] = "Enable Sound"
rgpvpw.L["label_play_sound"] = "Play"
rgpvpw.L["label_enable_sound_fade"] = "Enable Sound Fade"
rgpvpw.L["label_play_sound_fade"] = "Play"
rgpvpw.L["label_visual_warning"] = "Visual Warning:"
rgpvpw.L["label_play_visual"] = "Play"
rgpvpw.L["user_message_choose_color"] = "Unable to play visual alert - No color chosen"

-- dropdown colors
rgpvpw.L["texture_none"] = "None"
rgpvpw.L["texture_light_blue"] = "Light Blue"
rgpvpw.L["texture_pink"] = "Pink"
rgpvpw.L["texture_white"] = "White"
rgpvpw.L["texture_brown"] = "Brown"
rgpvpw.L["texture_blue"] = "Blue"
rgpvpw.L["texture_green"] = "Green"
rgpvpw.L["texture_orange"] = "Orange"
rgpvpw.L["texture_red"] = "Red"
rgpvpw.L["texture_violet"] = "Violet"
rgpvpw.L["texture_yellow"] = "Yellow"
