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

-- luacheck: globals GetLocale GetAddOnMetadata
-- Translator ZamestoTV
if (GetLocale() == "ruRU") then
  rgpvpw = rgpvpw or {}
  rgpvpw.L = {}

  rgpvpw.L["addon_name"] = "PVPWarn"

  -- console
  rgpvpw.L["info_title"] = "|cFF00FFB0PVPWarn:|r"
  rgpvpw.L["help"] = "|cFFFFC300(%s)|r: Используйте |cFFFFC300/rgpvpw|r или |cFFFFC300/pvpwarn|r для списка опций"
  rgpvpw.L["opt"] = "|cFFFFC300opt|r — открыть меню настроек"
  rgpvpw.L["combatstate"] = "|cFFFFC300combatstate enable/disable|r — настроить положение иконки состояния боя"
  rgpvpw.L["stancestate"] = "|cFFFFC300stancestate enable/disable|r — настроить положение иконки стойки"
  rgpvpw.L["reload"] = "|cFFFFC300reload|r — перезагрузить интерфейс"
  rgpvpw.L["invalid_argument"] = "Недопустимый аргумент"

  -- about
  rgpvpw.L["author"] = "Автор: Michael Wiesendanger"
  rgpvpw.L["email"] = "E-Mail: michael.wiesendanger@gmail.com"
  rgpvpw.L["version"] = "Версия: " .. GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Version")
  rgpvpw.L["issues"] = "Проблемы: https://github.com/RagedUnicorn/wow-classic-pvpwarn/issues"

  -- general
  rgpvpw.L["configuration_menu_general"] = "Настройки PVPWarn"
  rgpvpw.L["general_title"] = "Общая конфигурация"
  rgpvpw.L["enable_combat_state_tracking"] = "Отслеживать состояние боя"
  rgpvpw.L["enable_combat_state_tracking_tooltip"] = "Отслеживает состояние боя вражеской цели"
  rgpvpw.L["lock_frame_combat_state"] = "Заблокировать рамку состояния боя"
  rgpvpw.L["lock_frame_combat_state_tooltip"] = "Фиксирует или разблокирует рамку состояния боя"
  rgpvpw.L["enable_stance_state_tracking"] = "Отслеживать стойку"
  rgpvpw.L["enable_stance_state_tracking_tooltip"] = "Отслеживает стойку вражеской цели"
  rgpvpw.L["lock_frame_stance_state"] = "Заблокировать рамку стойки"
  rgpvpw.L["lock_frame_stance_state_tooltip"] = "Фиксирует или разблокирует рамку стойки"
  rgpvpw.L["hide_unknown_stance"] = "Скрывать неизвестную стойку"
  rgpvpw.L["hide_unknown_stance_tooltip"] = "Скрывает иконку стойки, если она неизвестна"

  -- voice pack
  rgpvpw.L["configuration_menu_voice_pack"] = "Голосовые пакеты"
  rgpvpw.L["voice_pack_title"] = "Настройка голосового пакета"
  rgpvpw.L["voice_pack_dropdown_label"] = "Выберите голосовой пакет:"
  rgpvpw.L["voice_pack_default"] = "По умолчанию"
  rgpvpw.L["voice_pack_play_sound_button"] = "Проверить голосовой пакет"

  -- zones
  rgpvpw.L["configuration_menu_zone"] = "Зоны"
  rgpvpw.L["zone_title"] = "Настройка зон"
  rgpvpw.L["battleground_alterac_valley"] = "Альтеракская долина"
  rgpvpw.L["battleground_arathi_basin"] = "Низина Арати"
  rgpvpw.L["battleground_warsong_gulch"] = "Ущелье Песни Войны"
  -- labels
  rgpvpw.L["label_battlegrounds"] = "Поля боя:"

  -- profiles
  rgpvpw.L["configuration_menu_profiles"] = "Профили"
  rgpvpw.L["save_current_profile_button"] = "Создать новый профиль"
  rgpvpw.L["delete_selected_profile_button"] = "Удалить профиль"
  rgpvpw.L["load_selected_profile_button"] = "Загрузить профиль"
  rgpvpw.L["update_profile_button"] = "Обновить профиль"

  -- create new profile
  rgpvpw.L["choose_profile_name_dialog_text"] = "Выберите имя для нового профиля"
  rgpvpw.L["choose_profile_name_accept_button"] = "Принять"
  rgpvpw.L["choose_profile_name_cancel_button"] = "Отмена"
  -- delete profile
  rgpvpw.L["confirm_delete_profile_dialog_text"] = "Это удалит выбранный профиль. Продолжить?"
  rgpvpw.L["confirm_delete_profile_yes_button"] = "Да"
  rgpvpw.L["confirm_delete_profile_no_button"] = "Нет"
  -- load profile
  rgpvpw.L["confirm_load_profile_dialog_text"] = "Это заменит текущий профиль. Продолжить?"
  rgpvpw.L["confirm_load_profile_yes_button"] = "Да"
  rgpvpw.L["confirm_load_profile_no_button"] = "Нет"
  -- update profile
  rgpvpw.L["confirm_override_profile_dialog_text"] = "Это обновит выбранный профиль текущими настройками. Продолжить?"
  rgpvpw.L["confirm_override_profile_yes_button"] = "Да"
  rgpvpw.L["confirm_override_profile_no_button"] = "Нет"
  -- user messages
  rgpvpw.L["user_message_select_profile_before_delete"] = "Выберите профиль для удаления"
  rgpvpw.L["user_message_select_profile_before_load"] = "Выберите профиль для загрузки"
  rgpvpw.L["user_message_select_profile_before_update"] = "Выберите профиль для обновления"
  rgpvpw.L["user_message_select_profile_already_exists"] = "Профиль уже существует — выберите другое имя"
  rgpvpw.L["user_message_add_new_profile_max_reached"] = "Достигнут максимум из %s профилей"
  rgpvpw.L["user_message_default_profile_cannot_be_deleted"] = "Профиль по умолчанию нельзя удалить"
  rgpvpw.L["user_message_default_profile_cannot_be_modified"] = "Профиль по умолчанию нельзя изменить"
  rgpvpw.L["user_message_profiles_reset_for_upgrade"] = "Ваши профили были сброшены на стандартные "
    .. "из-за обновления до v2.0.0"
  -- categories
  rgpvpw.L["category_druid"] = "Друид"
  rgpvpw.L["category_hunter"] = "Охотник"
  rgpvpw.L["category_mage"] = "Маг"
  rgpvpw.L["category_paladin"] = "Паладин"
  rgpvpw.L["category_priest"] = "Жрец"
  rgpvpw.L["category_rogue"] = "Разбойник"
  rgpvpw.L["category_shaman"] = "Шаман"
  rgpvpw.L["category_warlock"] = "Чернокнижник"
  rgpvpw.L["category_warrior"] = "Воин"
  rgpvpw.L["category_items"] = "Предметы"
  rgpvpw.L["category_racials"] = "Расовые"
  rgpvpw.L["category_misc"] = "Прочее"

  -- category navigation
  rgpvpw.L["tab_button_spell"] = "Заклинания"
  rgpvpw.L["tab_button_resist"] = "Избежание"

  -- category configuration

  -- spell tab
  rgpvpw.L["label_enable_sound"] = "Включить звук"
  rgpvpw.L["label_play_sound"] = "Воспроизвести"
  rgpvpw.L["label_enable_sound_fade"] = "Включить затухание громкости"
  rgpvpw.L["label_enable_sound_cast"] = "Включить звук применения"
  rgpvpw.L["label_play_sound_special"] = "Воспроизвести"
  rgpvpw.L["label_visual_warning"] = "Визуальное предупреждение:"
  rgpvpw.L["label_play_visual"] = "Воспроизвести"
  rgpvpw.L["user_message_choose_color"] = "Невозможно воспроизвести визуальное предупреждение — цвет не выбран"

  -- spell avoid tab
  rgpvpw.L["label_enable_avoid_sound"] = "Включить звук"
  rgpvpw.L["label_play_avoid_sound"] = "Воспроизвести"
  rgpvpw.L["label_avoid_visual_warning"] = "Визуальное предупреждение:"
  rgpvpw.L["label_play_avoid_visual"] = "Воспроизвести"

  -- enemy avoid
  rgpvpw.L["configuration_menu_enemy_avoid"] = "Избежание врага"
  rgpvpw.L["label_enable_enemy_avoid_sound"] = "Включить звук"
  rgpvpw.L["label_play_enemy_avoid_sound"] = "Воспроизвести"
  rgpvpw.L["label_play_enemy_avoid_visual"] = "Воспроизвести"
  rgpvpw.L["label_enemy_avoid_sound"] = "Визуальное предупреждение:"

  -- dropdown colors
  rgpvpw.L["texture_none"] = "Нет"
  rgpvpw.L["texture_light_blue"] = "Светло-синий"
  rgpvpw.L["texture_pink"] = "Розовый"
  rgpvpw.L["texture_white"] = "Белый"
  rgpvpw.L["texture_brown"] = "Коричневый"
  rgpvpw.L["texture_blue"] = "Синий"
  rgpvpw.L["texture_green"] = "Зелёный"
  rgpvpw.L["texture_orange"] = "Оранжевый"
  rgpvpw.L["texture_red"] = "Красный"
  rgpvpw.L["texture_violet"] = "Фиолетовый"
  rgpvpw.L["texture_yellow"] = "Жёлтый"
end
