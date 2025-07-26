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

-- luacheck: globals FauxScrollFrame_Update FauxScrollFrame_GetOffset GetSpellInfo GetItemIcon

local mod = rgpvpw
local me = {}
mod.categoryMenuResistTab = me

me.tag = "CategoryMenuResistTab"

-- track whether the menu was already built
local builtMenu = false
--[[
  Local references to ui elements
]]--
local spellAvoidRows = {}
local spellSelfAvoidScrollFrame

--[[
  Cached spellAvoidList for reusing while the player scrolls through the spellAvoidList. Wiped
  when the category changes
]]--
local cachedCategoryData
--[[
  Currently active category
]]--
local activeCategory

--[[
  @param {table} frame
  @param {string} categoryName
]]--
function me.Init(frame, categoryName)
  frame.categoryName = categoryName

  if builtMenu then
    -- cleaned cached data from previous category
    cachedCategoryData = nil
    mod.logger.LogInfo(me.tag, "Wiped cached spellAvoidList after category switch")

    me.UpdateCategoryMenu(frame)
    -- update the scrolllist with new category data
    me.FauxScrollFrameOnUpdate(spellSelfAvoidScrollFrame, categoryName)
  else
    me.BuildUi(frame, categoryName)
    builtMenu = true
  end
end

--[[
  Update the category menu avoid tab to its new parent category
]]--
function me.UpdateCategoryMenu(parentFrame)
  spellSelfAvoidScrollFrame:ClearAllPoints()
  spellSelfAvoidScrollFrame:SetPoint("TOPLEFT", parentFrame)
  spellSelfAvoidScrollFrame:SetParent(parentFrame)
  spellSelfAvoidScrollFrame:SetVerticalScroll(0) -- reset scroll position to top
end

--[[
  Create the spelllist configuration menu

  @param {table} frame
  @param {string} categoryName
]]--
function me.BuildUi(frame, categoryName)
  spellSelfAvoidScrollFrame = me.CreateSpellSelfAvoidList(frame)
  me.FauxScrollFrameOnUpdate(spellSelfAvoidScrollFrame, categoryName)
end

--[[
  Create the scrollist for the spelllist

  @param {table} frame

  @return {table}
]]--
function me.CreateSpellSelfAvoidList(frame)
  return mod.guiHelper.CreateFauxScrollFrame(
    RGPVPW_CONSTANTS.ELEMENT_SPELL_SELF_AVOID_LIST_SCROLL_FRAME,
    frame,
    RGPVPW_CONSTANTS.SPELL_SELF_AVOID_LIST_CONTENT_FRAME_WIDTH,
    RGPVPW_CONSTANTS.SPELL_SELF_AVOID_LIST_ROW_HEIGHT,
    RGPVPW_CONSTANTS.SPELL_SELF_AVOID_LIST_MAX_ROWS,
    me.FauxScrollFrameOnUpdate,
    me.CreateRowFrame,
    spellAvoidRows
  )
end

--[[
  @param {table} frame
  @param {number} position

  @return {table}
    The created row
]]--
function me.CreateRowFrame(frame, position)
  local row = mod.guiHelper.CreateSpellFrame(
    frame,
    position,
    RGPVPW_CONSTANTS.ELEMENT_SPELL_SELF_AVOID_LIST_CONTENT_FRAME,
    RGPVPW_CONSTANTS.SPELL_SELF_AVOID_LIST_ROW_HEIGHT
  )

  row.position = position
  row.spellStateCheckBox = me.CreateSpellStateCheckbox(row)
  row.spellIcon = mod.guiHelper.CreateSpellIcon(
    row,
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_SELF_AVOID_ICON,
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_SELF_AVOID_ICON_SIZE
  )
  row.spellTitle = mod.guiHelper.CreateSpellTitle(
    row.spellIcon,
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_SELF_AVOID_NAME,
    RGPVPW_CONSTANTS.SPELL_SELF_AVOID_TITLE_WIDTH,
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_SELF_AVOID_ICON_SIZE
  )

  row.avoidSoundCheckBox = me.CreateSpellAvoidSoundCheckBox(row)
  row.playAvoidSound = mod.guiHelper.CreatePlayButton(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_PLAY_SELF_AVOID_SOUND_BUTTON,
    row,
    {"LEFT", row.avoidSoundCheckBox, "RIGHT", 150, 0},
    me.PlayAvoidSoundButtonOnClick,
    rgpvpw.L["label_play_avoid_sound"]
  )
  row.chooseAvoidVisual = me.CreateAvoidVisualAlertDropdown(row)
  row.chooseAvoidVisualLabel = mod.guiHelper.CreateVisualWarningLabel(
    row.chooseAvoidVisual,
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SELF_AVOID_VISUAL_WARNING_LABEL,
    rgpvpw.L["label_avoid_visual_warning"]
  )
  row.playAvoidVisual = mod.guiHelper.CreatePlayButton(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_PLAY_SELF_AVOID_VISUAL_ALERT_BUTTON,
    row,
    {"LEFT", row.chooseAvoidVisual, "RIGHT", 140, 0},
    me.ToggleAvoidVisualWarningOnClick,
    rgpvpw.L["label_play_avoid_visual"]
  )

  return row
end

--[[
  Create checkbox for configuring whether a spell is active or not

  @param {table} spellFrame

  @return {table}
    The created checkbox
]]--
function me.CreateSpellStateCheckbox(spellFrame)
  return mod.guiHelper.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENABLE_SPELL_SELF_AVOID,
    spellFrame,
    {"LEFT", 0, 0},
    function(self)
      mod.spellConfiguration.ToggleSpellState(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID,
        activeCategory,
        spellFrame.spellId,
        spellFrame.spellTitle:GetText()
      )

      local parentFrame = self:GetParent()

      me.UpdateCheckButtonState(self, parentFrame.avoidSoundCheckBox)
      me.UpdateChooseVisualDropdownMenuState(parentFrame, self:GetChecked())
    end,
    function(self)
      local isActive = mod.spellConfiguration.IsSpellActive(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID,
        activeCategory,
        spellFrame.spellId
      )

      if isActive then
        self:SetChecked(true)
      else
        self:SetChecked(false)
      end
    end
  )
end

--[[
  Create checkbox for configuring sound alert configuration

  @param {table} spellFrame

  @return {table}
    The created checkbox
]]--
function me.CreateSpellAvoidSoundCheckBox(spellFrame)
  return mod.guiHelper.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENABLE_SELF_AVOID_SOUND,
    spellFrame,
    {"LEFT", spellFrame.spellTitle, "RIGHT", 0, 25},
    function()
      mod.spellConfiguration.ToggleSoundWarning(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID,
        activeCategory,
        spellFrame.spellId,
        spellFrame.spellTitle:GetText()
      )
    end,
    function(self)
      local isActive = mod.spellConfiguration.IsSoundWarningActive(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID,
        activeCategory,
        spellFrame.spellId
      )

      if isActive then
        self:SetChecked(true)
      else
        self:SetChecked(false)
      end
    end,
    rgpvpw.L["label_enable_avoid_sound"]
  )
end

--[[
  Click callback for sound button

  @param {table} self
]]--
function me.PlayAvoidSoundButtonOnClick(self)
  mod.sound.PlaySound(self:GetParent().category, RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, self.soundFileName)
end

--[[
  Create a dropdown with alert color textures to choose

  @param {table} spellFrame

  @return {table}
    The created dropdown
]]--
function me.CreateAvoidVisualAlertDropdown(spellFrame)
  return mod.guiHelper.CreateVisualWarningDropdown(
    spellFrame,
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SELF_AVOID_VISUAL_WARNING_DROPDOWN,
    function(self)
      for colorName, color in pairs(RGPVPW_CONSTANTS.TEXTURES) do
        mod.libUiDropDownMenu.UiDropDownMenu_AddButton(
          mod.guiHelper.CreateDropdownButton(colorName, color.colorValue, me.DropDownMenuCallback)
        )
      end

      if mod.libUiDropDownMenu.UiDropDownMenu_GetSelectedValue(self) == nil then
        mod.libUiDropDownMenu.UiDropDownMenu_SetSelectedValue(self, RGPVPW_CONSTANTS.TEXTURES.none.colorValue)
      end
    end
  )
end

--[[
  Callback for color dropdownmenu

  @param {table} self
    A reference to the dropdownbutton
]]--
function me.DropDownMenuCallback(self)
  local parentDropdown = self:GetParent().dropdown

  mod.spellConfiguration.UpdateVisualWarningColor(
    RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID,
    activeCategory,
    parentDropdown:GetParent().spellId,
    parentDropdown:GetParent().spellTitle:GetText(),
    self.value
  )

  mod.libUiDropDownMenu.UiDropDownMenu_SetSelectedValue(
    parentDropdown,
    self.value
  )
end

--[[
  Click callback for enabling/disabling visual warnings

  @param {table} self
]]--
function me.ToggleAvoidVisualWarningOnClick(self)
  -- retrieve color for specific spell and category from configuration
  local color = mod.spellConfiguration.GetVisualWarningColor(
    RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID,
    self:GetParent().category,
    self:GetParent().spellId
  )

  if color == RGPVPW_CONSTANTS.DEFAULT_COLOR then
    mod.logger.PrintUserError(rgpvpw.L["user_message_choose_color"])
    return
  end

  mod.visual.ShowVisualAlert(color)
end

--[[
  Update the scrollframe on vertical scroll events and initialy. Gathers all items that
  are intended to be displayed. To prevent a heavy load while retrieving the data this step
  is only done once and the data is being cached for further update events.

  @param {table} scrollFrame
  @param {string} categoryName
]]--
function me.FauxScrollFrameOnUpdate(scrollFrame, categoryName)
  activeCategory = categoryName

  if cachedCategoryData == nil then
    mod.logger.LogInfo(me.tag, string.format("Warmed up cached spellAvoidList for category '%s'", categoryName))
    cachedCategoryData = mod.spellAvoidMapHelper.GetAllForCategory(categoryName)
  end

  local maxValue = #cachedCategoryData

  if maxValue <= RGPVPW_CONSTANTS.SPELL_SELF_AVOID_LIST_MAX_ROWS then
    maxValue = RGPVPW_CONSTANTS.SPELL_SELF_AVOID_LIST_MAX_ROWS + 1
  end
  -- Note: maxValue needs to be at least max_rows + 1
  FauxScrollFrame_Update(
    scrollFrame,
    maxValue,
    RGPVPW_CONSTANTS.SPELL_SELF_AVOID_LIST_MAX_ROWS,
    RGPVPW_CONSTANTS.SPELL_SELF_AVOID_LIST_ROW_HEIGHT
  )

  local offset = FauxScrollFrame_GetOffset(scrollFrame)

  for i = 1, RGPVPW_CONSTANTS.SPELL_SELF_AVOID_LIST_MAX_ROWS do
    local value = i + offset

    if value <= maxValue then
      local row = spellAvoidRows[i]

      if cachedCategoryData[value] ~= nil then
        local spellId = cachedCategoryData[value].spellId
        row.spellId = spellId
        row.normalizedSpellName = cachedCategoryData[value].normalizedSpellName
        row.category = categoryName
        row.spellTitle:SetText(cachedCategoryData[value].name)
        row.playAvoidSound.soundFileName = cachedCategoryData[value].soundFileName

        me.UpdateIcon(
          row.spellIcon, categoryName, cachedCategoryData[value]
        )
        me.UpdateSpellStateCheckBox(
          row.spellStateCheckBox, categoryName, spellId
        )
        me.UpdateSound(
          row.avoidSoundCheckBox, categoryName, spellId
        )
        me.UpdateChooseVisualDropdownMenu(
          row.chooseAvoidVisual, categoryName, spellId
        )

        row:Show()
      else
        spellAvoidRows[i]:Hide()
      end
    end
  end
end

--[[
  @param {table} spellIcon
  @param {string} categoryName
  @param {table} spell
]]--
function me.UpdateIcon(spellIcon, categoryName, spell)
  local iconId
  local color = RGPVPW_COLORS.GetCategoryColor(categoryName)

  --[[
    For most items we have to track the actual spelleffect in the combat log. However for
    people to recognize the item it is much better to use items icon itself.
  ]]--
  if spell.itemId ~= nil then
    iconId = GetItemIcon(spell.itemId)
  else
    iconId = select(3, GetSpellInfo(spell.spellId))
  end

  spellIcon:SetTexture(iconId)
  spellIcon.iconHolder:SetBackdropBorderColor(unpack(color))
end

--[[
  @param {table} spellStateCheckBox
  @param {string} categoryName
  @param {number} spellId
]]--
function me.UpdateSpellStateCheckBox(spellStateCheckBox, categoryName, spellId)
  local isSpellActive = mod.spellConfiguration.IsSpellActive(
    RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID,
    categoryName,
    spellId
  )

  local parentFrame = spellStateCheckBox:GetParent()

  if isSpellActive then
    mod.logger.LogDebug(me.tag, string.format(
      "Spell %s for category %s is active", spellId, categoryName)
    )
    spellStateCheckBox:SetChecked(true)

    me.UpdateCheckButtonState(spellStateCheckBox, parentFrame.avoidSoundCheckBox)
    me.UpdateChooseVisualDropdownMenuState(parentFrame, true)
  else
    mod.logger.LogDebug(me.tag, string.format(
      "Spell %s for category %s is inactive", spellId, categoryName)
    )
    spellStateCheckBox:SetChecked(false)

    me.UpdateCheckButtonState(spellStateCheckBox, parentFrame.avoidSoundCheckBox)
    me.UpdateChooseVisualDropdownMenuState(parentFrame, false)
  end
end

--[[
  @param {table} soundCheckBox
  @param {string} categoryName
  @param {number} spellId
]]--
function me.UpdateSound(soundCheckBox, categoryName, spellId)
  -- update sound checkbox state
  soundCheckBox:SetChecked(
    mod.spellConfiguration.IsSoundWarningActive(
      RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID,
      categoryName,
      spellId
    )
  )
end

--[[
  @param {table} dropdownMenu
  @param {string} categoryName
  @param {number} spellId
]]--
function me.UpdateChooseVisualDropdownMenu(dropdownMenu, categoryName, spellId)
  local colorValue = mod.spellConfiguration.GetVisualWarningColor(
    RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_SELF_AVOID,
    categoryName,
    spellId
  )

  mod.libUiDropDownMenu.UiDropDownMenu_SetSelectedValue(dropdownMenu, colorValue)
  -- fix for updating text properly
  mod.libUiDropDownMenu.UiDropDownMenu_SetText(dropdownMenu, rgpvpw.L[mod.common.GetTextureNameByValue(colorValue)])
end

--[[
  Updates a checkbutton based on its state or a dependent checkButton

  @param {table} checkButton
  @param {table} dependentCheckButton
]]--
function me.UpdateCheckButtonState(checkButton, dependentCheckButton)
  if checkButton:GetChecked() then
    if dependentCheckButton ~= nil then
      mod.guiHelper.EnableCheckButton(dependentCheckButton)
    else
      mod.guiHelper.EnableCheckButton(checkButton)
    end
  else
    if dependentCheckButton ~= nil then
      mod.guiHelper.DisableCheckButton(dependentCheckButton)
    else
      mod.guiHelper.DisableCheckButton(checkButton)
    end
  end
end

--[[
  Enables or disables the chooseVisual dropdown and its label based
  on the checkButton state of the spell itself

  @param {table} frame
  @param {boolean} enable
]]--
function me.UpdateChooseVisualDropdownMenuState(frame, enable)
  if enable then
    mod.libUiDropDownMenu.UiDropDownMenu_EnableDropDown(frame.chooseAvoidVisual)
    frame.chooseAvoidVisualLabel:SetTextColor(1, 1, 1)
  else
    mod.libUiDropDownMenu.UiDropDownMenu_DisableDropDown(frame.chooseAvoidVisual)
    frame.chooseAvoidVisualLabel:SetTextColor(0.66, 0.66, 0.66)
  end
end
