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

-- luacheck: globals CreateFrame UnitClass

local mod = rgpvpw
local me = {}
mod.enemyAvoidMenu = me

me.tag = "EnemyAvoidMenu"

-- track whether the menu was already built
local builtMenu = false
--[[
  Currently active category. Always the players class
]]--
local activeCategory

--[[
  Shared per-spell settings list configured for spells avoided by enemy players
]]--
local spellList = mod.spellListHelper.NewSpellList({
  spellList = RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID,
  soundType = RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
  hasSpecialSoundColumn = false,
  getCategoryData = mod.spellAvoidMapHelper.GetAllForCategory,
  getScrollFrameName = function()
    return RGPVPW_CONSTANTS.ELEMENT_SPELL_ENEMY_AVOID_LIST_SCROLL_FRAME
  end,
  listWidth = RGPVPW_CONSTANTS.SPELL_ENEMY_AVOID_LIST_CONTENT_FRAME_WIDTH,
  rowHeight = RGPVPW_CONSTANTS.SPELL_ENEMY_AVOID_LIST_ROW_HEIGHT,
  maxRows = RGPVPW_CONSTANTS.SPELL_ENEMY_AVOID_LIST_MAX_ROWS,
  iconSize = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_ENEMY_AVOID_ICON_SIZE,
  titleWidth = RGPVPW_CONSTANTS.SPELL_ENEMY_AVOID_TITLE_WIDTH,
  elementNames = {
    rowFrame = RGPVPW_CONSTANTS.ELEMENT_SPELL_ENEMY_AVOID_LIST_CONTENT_ROW_FRAME,
    spellIcon = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_ENEMY_AVOID_ICON,
    spellName = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_ENEMY_AVOID_NAME,
    enableSpell = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENABLE_SPELL_ENEMY_AVOID,
    enableSound = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENABLE_ENEMY_AVOID_SOUND,
    playSound = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_PLAY_ENEMY_AVOID_SOUND_BUTTON,
    visualWarningLabel = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENEMY_AVOID_VISUAL_WARNING_LABEL,
    visualWarningDropdown = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENEMY_AVOID_VISUAL_WARNING_DROPDOWN,
    playVisualAlert = RGPVPW_CONSTANTS.ELEMENT_CATEGORY_PLAY_ENEMY_AVOID_VISUAL_ALERT_BUTTON
  },
  labels = {
    enableSound = rgpvpw.L["label_enable_enemy_avoid_sound"],
    playSound = rgpvpw.L["label_play_enemy_avoid_sound"],
    visualWarning = rgpvpw.L["label_enemy_avoid_sound"],
    playVisual = rgpvpw.L["label_play_enemy_avoid_visual"]
  }
})

--[[
  @param {table} frame
]]--
function me.Init(frame)
  if builtMenu then
    return
  end

  me.SetCategoryName()
  mod.spellListHelper.Init(spellList, me.CreateCategoryMenuContentFrame(frame), activeCategory)
  builtMenu = true
end

--[[
  Set active category to the players class
]]--
function me.SetCategoryName()
  local _, englishClass = UnitClass(RGPVPW_CONSTANTS.UNIT_ID_PLAYER)

  activeCategory = string.lower(englishClass)
  mod.logger.LogDebug(me.tag, "Set category to: " .. string.lower(englishClass))
end

--[[
  @param {table} frame

  @return {table}
]]--
function me.CreateCategoryMenuContentFrame(frame)
  local contentFrame = CreateFrame(
    "Frame", RGPVPW_CONSTANTS.ELEMENT_SPELL_ENEMY_AVOID_LIST_CONTENT_FRAME, frame, "BackdropTemplate")
  contentFrame:SetPoint("TOPLEFT", frame, 5, -7)
  contentFrame:SetBackdropColor(1, 0.37, 0.5, .7)
  contentFrame:SetWidth(RGPVPW_CONSTANTS.SPELL_LIST_CONTENT_FRAME_WIDTH)
  contentFrame:SetHeight(RGPVPW_CONSTANTS.SPELL_LIST_CONTENT_FRAME_HEIGHT)

  return contentFrame
end
