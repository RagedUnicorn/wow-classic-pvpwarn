--[[
  MIT License

  Copyright (c) 2025 Michael Wiesendanger

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

-- luacheck: globals GetLocale C_AddOns

if (GetLocale() == "deDE") then
  rgpvpw = rgpvpw or {}
  rgpvpw.L = {}

  rgpvpw.L["addon_name"] = "PVPWarn"

  -- console
  rgpvpw.L["info_title"] = "|cFF00FFB0PVPWarn:|r"
  rgpvpw.L["help"] = "|cFFFFC300(%s)|r: Benutze |cFFFFC300/rgpvpw|r oder |cFFFFC300/pvpwarn|r "
    .. "für eine Liste der verfügbaren Optionen"
  rgpvpw.L["opt"] = "|cFFFFC300opt|r - zeige Optionsmenu an"
  rgpvpw.L["combatstate"] = "|cFFFFC300combatstate enable/disable|r - Konfiguriere die Position des Kampfstatus Symbol"
  rgpvpw.L["stancestate"] = "|cFFFFC300stancestate enable/disable|r - "
    .. "Konfiguriere die Position des Haltungszustand Symbol"
  rgpvpw.L["reload"] = "|cFFFFC300reload|r - UI neu laden"
  rgpvpw.L["bar"] = "|cFFFFC300bar lock/unlock/test|r - die Erkennungsleiste sperren, entsperren oder testen"
  rgpvpw.L["invalid_argument"] = "Ungültiges Argument übergeben"
  rgpvpw.L["update_available"] = "Neue Version |cFFFFC300%s|r ist verfügbar - |cFF00FFB0Update empfohlen!|r"

  -- about
  rgpvpw.L["author"] = "Authr: Michael Wiesendanger"
  rgpvpw.L["email"] = "E-Mail: michael.wiesendanger@gmail.com"
  rgpvpw.L["version"] = "Version: " .. C_AddOns.GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Version")
  rgpvpw.L["issues"] = "Probleme: https://github.com/RagedUnicorn/wow-classic-pvpwarn/issues"

  -- general
  rgpvpw.L["configuration_menu_general"] = "PVPWarn Optionen"
  rgpvpw.L["general_title"] = "Allgemeine Konfiguration"
  rgpvpw.L["enable_combat_state_tracking"] = "Aktiviere Kampfstatus Überwachung"
  rgpvpw.L["enable_combat_state_tracking_tooltip"] = "Überwacht den Kampfstatus eines gegnerischen Zieles"
  rgpvpw.L["lock_frame_combat_state"] = "Blockiere das Kampfzustand Fenster"
  rgpvpw.L["lock_frame_combat_state_tooltip"] = "Aktiviert oder deaktiviert das bewegen des Kampfzustand Fenster"
  rgpvpw.L["enable_stance_state_tracking"] = "Aktiviere Haltungszustand Überwachung"
  rgpvpw.L["enable_stance_state_tracking_tooltip"] = "Überwacht den Haltungszustand eines gegnerischen Zieles"
  rgpvpw.L["lock_frame_stance_state"] = "Blockiere das Haltungszustand Fenster"
  rgpvpw.L["lock_frame_stance_state_tooltip"] = "Aktiviert oder deaktiviert das bewegen des Haltungszustand Fenster"
  rgpvpw.L["hide_unknown_stance"] = "Unbekannte Haltung ausblenden"
  rgpvpw.L["hide_unknown_stance_tooltip"] = "Blendet das Haltungssymbol aus, wenn die Haltung unbekannt ist"

  -- voice pack
  rgpvpw.L["configuration_menu_voice_pack"] = "Sprachpakete"
  rgpvpw.L["voice_pack_title"] = "Sprachpaket Konfiguration"
  rgpvpw.L["voice_pack_dropdown_label"] = "Sprachpaket auswählen:"
  rgpvpw.L["voice_pack_default"] = "Standard"
  rgpvpw.L["voice_pack_play_sound_button"] = "Sprachpaket testen"

  -- detection bar
  rgpvpw.L["configuration_menu_detection_bar"] = "Erkennungsleiste"
  rgpvpw.L["detection_bar_title"] = "Erkennungsleiste Konfiguration"
  rgpvpw.L["detection_bar_enable"] = "Erkennungsleiste aktivieren"
  rgpvpw.L["detection_bar_enable_tooltip"] = "Zeigt eine horizontale Warnleiste, wenn ein verfolgter gegnerischer "
    .. "Zauber ausgelöst wird"
  rgpvpw.L["detection_bar_position"] = "Erkennungsleiste positionieren"
  rgpvpw.L["detection_bar_done"] = "Fertig"
  rgpvpw.L["detection_bar_max_bars_label"] = "Maximal sichtbare Leisten:"
  rgpvpw.L["detection_bar_size_label"] = "Leistengrösse:"
  rgpvpw.L["detection_bar_reset_anchor_button"] = "Position zurücksetzen"
  rgpvpw.L["detection_bar_drag_handle"] = "PVPWarn Erkennungsleiste - zum Verschieben ziehen"
  rgpvpw.L["detection_bar_locked_message"] = "Positionierung der Erkennungsleiste deaktiviert"
  rgpvpw.L["detection_bar_unlocked_message"] = "Positionierung der Erkennungsleiste aktiviert - "
    .. "ziehe die Leiste zum Verschieben"
  rgpvpw.L["flash_enabled_message"] = "Blitz-Warnung aktiviert"
  rgpvpw.L["flash_disabled_message"] = "Blitz-Warnung deaktiviert"
  rgpvpw.L["configuration_menu_flash"] = "Blitz"
  rgpvpw.L["flash_title"] = "Blitz-Konfiguration"
  rgpvpw.L["flash_enable"] = "Blitz aktivieren"
  rgpvpw.L["flash_max_opacity_label"] = "Maximale Deckkraft:"
  rgpvpw.L["flash_pulse"] = "Pulseffekt"
  rgpvpw.L["flash_additive_blend"] = "Additives Blending (heller)"
  rgpvpw.L["flash_test_button"] = "Test"
  rgpvpw.L["detection_bar_hint"] = "Tipp: Aktiviere die Erkennungsleiste unter Optionen, um verfolgte "
    .. "gegnerische Zauber als gestapelte Warnleisten anzuzeigen. Öffne Optionen > Erkennungsleiste zum "
    .. "Positionieren, oder tippe /rgpvpw bar test."

  -- zones
  rgpvpw.L["configuration_menu_zone"] = "Zonen"
  rgpvpw.L["zone_title"] = "Konfiguriere Zonen"
  rgpvpw.L["battleground_alterac_valley"] = "Alteractal"
  rgpvpw.L["battleground_arathi_basin"] = "Arathibecken"
  rgpvpw.L["battleground_warsong_gulch"] = "Kriegshymnenschlucht"
  -- labels
  rgpvpw.L["label_battlegrounds"] = "Schlachtfelder:"

  -- profiles
  rgpvpw.L["configuration_menu_profiles"] = "Profile"
  rgpvpw.L["save_current_profile_button"] = "Erstelle Profil"
  rgpvpw.L["delete_selected_profile_button"] = "Lösche Profil"
  rgpvpw.L["load_selected_profile_button"] = "Lade Profil"
  rgpvpw.L["update_profile_button"] = "Aktualisiere Profil"

  -- create new profile
  rgpvpw.L["choose_profile_name_dialog_text"] = "Wähle einen Namen für das neue Profil"
  rgpvpw.L["choose_profile_name_accept_button"] = "Akzeptieren"
  rgpvpw.L["choose_profile_name_cancel_button"] = "Abbrechen"
  -- delete profile
  rgpvpw.L["confirm_delete_profile_dialog_text"] = "Dieser Vorgang löscht das ausgewählte Profil. "
    .. "Willst du fortfahren?"
  rgpvpw.L["confirm_delete_profile_yes_button"] = "Ja"
  rgpvpw.L["confirm_delete_profile_no_button"] = "Nein"
  -- load profile
  rgpvpw.L["confirm_load_profile_dialog_text"] = "Dieser Vorgang überschreibt deine jetzige Konfiguration. "
    .. "Willst du fortfahren?"
  rgpvpw.L["confirm_load_profile_yes_button"] = "Ja"
  rgpvpw.L["confirm_load_profile_no_button"] = "Nein"
  -- update profile
  rgpvpw.L["confirm_override_profile_dialog_text"] = "Dieser Vorgang lädt das ausgewählte Profil und "
    .. "überschreibt deine jetzige Konfiguration. Willst du fortfahren?"
  rgpvpw.L["confirm_override_profile_yes_button"] = "Ja"
  rgpvpw.L["confirm_override_profile_no_button"] = "Nein"
  -- user messages
  rgpvpw.L["user_message_select_profile_before_delete"] = "Wähle ein Profil aus um es zu löschen"
  rgpvpw.L["user_message_select_profile_before_load"] = "Wähle ein Profil aus um es zu laden"
  rgpvpw.L["user_message_select_profile_before_update"] = "Wähle ein Profil aus um es zu aktualisieren"
  rgpvpw.L["user_message_select_profile_before_export"] = "Wähle ein Profil aus um es zu exportieren"
  rgpvpw.L["user_message_select_profile_already_exists"] = "Das Profil existiert bereits - wähle einen anderen Name"
  rgpvpw.L["user_message_add_new_profile_max_reached"] = "Eine maximale Anzahl von %s Profilen ist erlaubt. "
    .. "Du hast das maximum erreicht"
  rgpvpw.L["user_message_default_profile_cannot_be_deleted"] = "Das Standard Profil kann nicht gelöscht werden"
  rgpvpw.L["user_message_default_profile_cannot_be_modified"] = "Das Standard Profil kann nicht verändert werden"
  rgpvpw.L["user_message_profiles_reset_for_upgrade"] = "Deine Profile wurden aufgrund des Upgrades auf v2.0.0 auf die "
    .. "Standardeinstellungen zurückgesetzt."

  -- profile export / import
  rgpvpw.L["profile_string_label"] = "Profil-Zeichenkette (Export / Import)"
  rgpvpw.L["profile_export_button"] = "Exportieren"
  rgpvpw.L["profile_import_button"] = "Importieren"
  rgpvpw.L["profile_import_name_prompt"] = "Gib einen Namen ein, unter dem das importierte Profil gespeichert wird:"
  rgpvpw.L["profile_import_success"] = "Profil \"%s\" importiert"
  rgpvpw.L["profile_error_empty"] = "Es gibt keine Profil-Zeichenkette zum Importieren"
  rgpvpw.L["profile_error_invalid"] = "Die Profil-Zeichenkette ist ungültig oder konnte nicht gelesen werden"
  rgpvpw.L["profile_error_checksum"] = "Die Profil-Zeichenkette ist beschädigt (Prüfsumme stimmt nicht)"
  rgpvpw.L["profile_error_wrong_addon"] = "Diese Profil-Zeichenkette wurde nicht von PVPWarn erstellt"
  rgpvpw.L["profile_error_version"] = "Diese Profil-Zeichenkette wurde mit einer neueren Version von PVPWarn erstellt"

  -- categories
  rgpvpw.L["category_druid"] = "Druide"
  rgpvpw.L["category_hunter"] = "Jäger"
  rgpvpw.L["category_mage"] = "Magier"
  rgpvpw.L["category_paladin"] = "Paladin"
  rgpvpw.L["category_priest"] = "Priester"
  rgpvpw.L["category_rogue"] = "Schurke"
  rgpvpw.L["category_shaman"] = "Shamane"
  rgpvpw.L["category_warlock"] = "Hexenmeister"
  rgpvpw.L["category_warrior"] = "Krieger"
  rgpvpw.L["category_items"] = "Items"
  rgpvpw.L["category_racials"] = "Rassenfähigkeiten"
  rgpvpw.L["category_misc"] = "Diverse"

  -- category navigation
  rgpvpw.L["tab_button_spell"] = "Zauber"
  rgpvpw.L["tab_button_resist"] = "Meiden"

  -- category configuration

  -- spell tab
  rgpvpw.L["label_enable_sound"] = "Aktiviere Ton"
  rgpvpw.L["label_play_sound"] = "Abspielen"
  rgpvpw.L["label_enable_sound_fade"] = "Aktiviere Ton verblassen"
  rgpvpw.L["label_enable_sound_cast"] = "Aktiviere Ton wirken"
  rgpvpw.L["label_play_sound_special"] = "Abspielen"
  rgpvpw.L["label_visual_warning"] = "Visuelle Warnung:"
  rgpvpw.L["label_play_visual"] = "Abspielen"
  rgpvpw.L["user_message_choose_color"] = "Kann keine visuelle Warnung anzeigen - Keine Farbe ausgewählt"

  -- spell avoid tab
  rgpvpw.L["label_enable_avoid_sound"] = "Aktiviere Ton"
  rgpvpw.L["label_play_avoid_sound"] = "Abspielen"
  rgpvpw.L["label_avoid_visual_warning"] = "Visuelle Warnung:"
  rgpvpw.L["label_play_avoid_visual"] = "Abspielen"

  -- enemy avoid
  rgpvpw.L["configuration_menu_enemy_avoid"] = "Feind Meiden"
  rgpvpw.L["label_enable_enemy_avoid_sound"] = "Aktiviere Ton"
  rgpvpw.L["label_play_enemy_avoid_sound"] = "Abspielen"
  rgpvpw.L["label_play_enemy_avoid_visual"] = "Abspielen"
  rgpvpw.L["label_enemy_avoid_sound"] = "Optische Warnung:"

  -- dropdown colors
  rgpvpw.L["texture_none"] = "Keine"
  rgpvpw.L["texture_light_blue"] = "Hellblau"
  rgpvpw.L["texture_pink"] = "Rosa"
  rgpvpw.L["texture_white"] = "Weiss"
  rgpvpw.L["texture_brown"] = "Braun"
  rgpvpw.L["texture_blue"] = "Blau"
  rgpvpw.L["texture_green"] = "Grün"
  rgpvpw.L["texture_orange"] = "Orange"
  rgpvpw.L["texture_red"] = "Rot"
  rgpvpw.L["texture_violet"] = "Violett"
  rgpvpw.L["texture_yellow"] = "Gelb"
end
