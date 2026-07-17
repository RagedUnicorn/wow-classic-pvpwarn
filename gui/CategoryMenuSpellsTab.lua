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

local mod = rgpvpw
local me = {}
mod.categoryMenuSpellsTab = me

me.tag = "CategoryMenuSpellsTab"

--[[
  Shared per-spell settings list configured for detected enemy spells
]]--
local spellList = mod.spellListHelper.NewSpellList({
  spellList = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
  soundType = RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL,
  hasSpecialSoundColumn = true,
  getCategoryData = mod.spellMapHelper.GetAllForCategory,
  getScrollFrameName = function(categoryName)
    return RGPVPW_CONSTANTS.ELEMENT_SPELL_LIST_SCROLL_FRAME .. " " .. categoryName
  end,
  listWidth = RGPVPW_CONSTANTS.SPELL_LIST_CONTENT_FRAME_WIDTH,
  rowHeight = RGPVPW_CONSTANTS.SPELL_LIST_ROW_HEIGHT,
  maxRows = RGPVPW_CONSTANTS.SPELL_LIST_MAX_ROWS,
  iconSize = RGPVPW_CONSTANTS.CATEGORY_SPELL_ICON_SIZE,
  titleWidth = RGPVPW_CONSTANTS.SPELL_TITLE_WIDTH,
  elementNames = {
    rowFrame = RGPVPW_CONSTANTS.ELEMENT_SPELL_LIST_CONTENT_FRAME,
    spellIcon = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_ICON,
    spellName = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_NAME,
    enableSpell = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENABLE_SPELL,
    enableSound = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENABLE_SOUND,
    enableSoundSpecial = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENABLE_SOUND_FADE,
    playSound = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_PLAY_SOUND_BUTTON,
    playSoundSpecial = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_PLAY_SOUND_SPECIAL_BUTTON,
    visualWarningLabel = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_VISUAL_WARNING_LABEL,
    visualWarningDropdown = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_VISUAL_WARNING_DROPDOWN,
    playVisualAlert = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_PLAY_VISUAL_ALERT_BUTTON
  },
  labels = {
    enableSound = rgpvpw.L["label_enable_sound"],
    playSound = rgpvpw.L["label_play_sound"],
    playSoundSpecial = rgpvpw.L["label_play_sound_special"],
    visualWarning = rgpvpw.L["label_visual_warning"],
    playVisual = rgpvpw.L["label_play_visual"]
  }
})

--[[
  @param {table} frame
  @param {string} categoryName
]]--
function me.Init(frame, categoryName)
  mod.spellListHelper.Init(spellList, frame, categoryName)
end
