--[[
  MIT License

  Copyright (c) 2021 Michael Wiesendanger

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

-- luacheck: ignore _
-- luacheck: globals CreateFrame STANDARD_TEXT_FONT UIDropDownMenu_Initialize
-- luacheck: globals UIDropDownMenu_AddButton UIDropDownMenu_GetSelectedValue UIDropDownMenu_SetSelectedValue
-- luacheck: globals FauxScrollFrame_Update FauxScrollFrame_GetOffset GetSpellInfo GetItemIcon
-- luacheck: globals UIDropDownMenu_EnableDropDown UIDropDownMenu_DisableDropDown

local mod = rgpvpw
local me = {}
mod.categoryMenuSpellsTab = me

me.tag = "CategoryMenuSpellsTab"

-- track whether the menu was already built
local builtMenu = false

--[[
  Local references to ui elements
]]--
local spellRows = {}
local spellScrollFrame

--[[
  Cached spellList for reusing while the player scrolls through the spellList. Wiped
  when the category changes
]]--
local cachedCategoryData = nil
--[[
  Currently active category
]]--
local activeCategory = nil

--[[
  @param {table} frame
  @param {string} category
]]--
function me.Init(frame, category)
  frame.categoryName = category

  if builtMenu then
    -- cleaned cached data from previous category
    cachedCategoryData = nil
    mod.logger.LogInfo(me.tag, "Wiped cached spellList after category switch")
    -- changing the scrollframes parent to the respective active category panel
    spellScrollFrame:SetParent(frame)
    -- update the scrolllist with new category data
    me.FauxScrollFrameOnUpdate(spellScrollFrame, category)
  else
    me.BuildUi(frame, category)
  end
end

--[[
  Create the spelllist configuration menu

  @param {table} frame
  @param {string} category
]]--
function me.BuildUi(frame, category)
  spellScrollFrame = me.CreateSpellList(frame)
  me.FauxScrollFrameOnUpdate(spellScrollFrame, category)
  builtMenu = true
end

--[[
  Create the scrollist for the spelllist

  @param {table} frame

  @return {table}
]]--
function me.CreateSpellList(frame)
  return mod.guiHelper.CreateFauxScrollFrame(
    RGPVPW_CONSTANTS.ELEMENT_SPELL_LIST_SCROLL_FRAME,
    frame,
    RGPVPW_CONSTANTS.SPELL_LIST_CONTENT_FRAME_WIDTH,
    RGPVPW_CONSTANTS.SPELL_SELF_AVOID_LIST_ROW_HEIGHT,
    RGPVPW_CONSTANTS.SPELL_SELF_AVOID_LIST_MAX_ROWS,
    me.FauxScrollFrameOnUpdate,
    me.CreateRowFrame,
    spellRows
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
    RGPVPW_CONSTANTS.ELEMENT_SPELL_LIST_CONTENT_FRAME,
    RGPVPW_CONSTANTS.SPELL_LIST_ROW_HEIGHT
  )

  row.position = position
  row.spellStateCheckBox = me.CreateSpellStateCheckbox(row)
  row.spellIcon = mod.guiHelper.CreateSpellIcon(
    row,
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_ICON,
    RGPVPW_CONSTANTS.CATEGORY_SPELL_ICON_SIZE
  )
  row.spellTitle = mod.guiHelper.CreateSpellTitle(
    row.spellIcon,
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_NAME,
    RGPVPW_CONSTANTS.SPELL_TITLE_WIDTH,
    RGPVPW_CONSTANTS.CATEGORY_SPELL_ICON_SIZE
  )

  row.soundCheckBox = me.CreateSpellSoundCheckBox(row)
  row.playSound = mod.guiHelper.CreatePlayButton(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_PLAY_SOUND_BUTTON,
    row,
    {"LEFT", row.soundCheckBox, "RIGHT", 150, 0},
    me.PlaySoundButtonOnClick,
    rgpvpw.L["label_play_sound"]
  )
  row.soundFadeCheckBox = me.CreateSpellSoundFadeCheckBox(row)
  row.playSoundFade = mod.guiHelper.CreatePlayButton(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_PLAY_SOUND_FADE_BUTTON,
    row,
    {"LEFT", row.soundFadeCheckBox, "RIGHT", 150, 0},
    me.PlaySoundFadeButtonOnClick,
    rgpvpw.L["label_play_sound_fade"]
  )
  row.chooseVisual = me.CreateVisualAlertDropdown(row)
  row.chooseVisualLabel = mod.guiHelper.CreateVisualWarningLabel(
    row.chooseVisual,
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_VISUAL_WARNING_LABEL,
    rgpvpw.L["label_visual_warning"]
  )
  row.playVisual = mod.guiHelper.CreatePlayButton(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_PLAY_VISUAL_WARNING_BUTTON,
    row,
    {"LEFT", row.chooseVisual, "RIGHT", 140, 0},
    me.ToggleVisualWarningOnClick,
    rgpvpw.L["label_play_visual"]
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
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENABLE_SPELL,
    spellFrame,
    {"LEFT", 0, 0},
    function(self)
      mod.spellConfiguration.ToggleSpellState(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
        activeCategory,
        spellFrame.normalizedSpellName
      )

      local parentFrame = self:GetParent()

      me.UpdateCheckButtonState(self, parentFrame.soundCheckBox)
      me.UpdateCheckButtonState(self, parentFrame.soundFadeCheckBox)
      me.UpdateChooseVisualDropdownMenuState(parentFrame, self:GetChecked())
    end,
    function(self)
      local isActive = mod.spellConfiguration.IsSpellActive(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
        activeCategory,
        spellFrame.normalizedSpellName
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
function me.CreateSpellSoundCheckBox(spellFrame)
  return mod.guiHelper.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENABLE_SOUND,
    spellFrame,
    {"LEFT", spellFrame.spellTitle, "RIGHT", 0, 25},
    function()
      mod.spellConfiguration.ToggleSoundWarning(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
        activeCategory,
        spellFrame.normalizedSpellName
      )
    end,
    function(self)
      local isActive = mod.spellConfiguration.IsSoundWarningActive(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
        activeCategory,
        spellFrame.normalizedSpellName
      )

      if isActive then
        self:SetChecked(true)
      else
        self:SetChecked(false)
      end
    end,
    rgpvpw.L["label_enable_sound"]
  )
end

--[[
  Click callback for sound button

  @param {table} self
]]--
function me.PlaySoundButtonOnClick(self)
  mod.sound.PlaySound(self:GetParent().category, RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, self.soundFileName)
end

--[[
  Create checkbox for configuring sound down alert configuration

  @param {table} spellFrame

  @return {table}
    The created checkbox

  @return {table}
    The created checkbox
]]--
function me.CreateSpellSoundFadeCheckBox(spellFrame)
  return mod.guiHelper.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENABLE_SOUND_FADE,
    spellFrame,
    {"LEFT", spellFrame.spellTitle, "RIGHT", 0, 0},
    function()
      mod.spellConfiguration.ToggleSoundFadeWarning(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
        activeCategory,
        spellFrame.normalizedSpellName
      )
    end,
    function(self)
      local isActive = mod.spellConfiguration.IsSoundFadeWarningActive(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
        activeCategory,
        spellFrame.normalizedSpellName
      )

      if isActive then
        self:SetChecked(true)
      else
        self:SetChecked(false)
      end
    end,
    rgpvpw.L["label_enable_sound_fade"]
  )
end

--[[
  Click callback for sound fade button

  @param {table} self
]]--
function me.PlaySoundFadeButtonOnClick(self)
  mod.sound.PlaySound(self:GetParent().category, RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED, self.soundFileName)
end

--[[
  Create a dropdown with alert color textures to choose

  @param {table} spellFrame

  @return {table}
    The created dropdown
]]--
function me.CreateVisualAlertDropdown(spellFrame)
  return mod.guiHelper.CreateVisualWarningDropdown(
    spellFrame,
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_VISUAL_WARNING_DROPDOWN,
    function(self)
      for colorName, color in pairs(RGPVPW_CONSTANTS.TEXTURES) do
        UIDropDownMenu_AddButton(
          mod.guiHelper.CreateDropdownButton(colorName, color.colorValue, me.DropDownMenuCallback)
        )
      end

      if (UIDropDownMenu_GetSelectedValue(_G[self:GetName()]) == nil) then
        UIDropDownMenu_SetSelectedValue(
          _G[self:GetName()],
          RGPVPW_CONSTANTS.TEXTURES.none.colorValue
        )
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
  UIDropDownMenu_SetSelectedValue(
    _G[self:GetParent().dropdown:GetName()],
    self.value
  )

  mod.spellConfiguration.UpdateVisualWarningColor(
    RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
    activeCategory,
    self:GetParent().dropdown:GetParent().normalizedSpellName,
    self.value
  )
end

--[[
  Click callback for enabling/disabling visual warnings

  @param {table} self
]]--
function me.ToggleVisualWarningOnClick(self)
  -- retrieve color for specific spell and category from configuration
  local color = mod.spellConfiguration.GetVisualWarningColor(
    RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
    self:GetParent().category,
    self:GetParent().normalizedSpellName
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
  @param {string} category
]]--
function me.FauxScrollFrameOnUpdate(scrollFrame, category)
  activeCategory = category

  if cachedCategoryData == nil then
    mod.logger.LogInfo(me.tag, string.format("Warmed up cached spellList for category '%s'", category))
    cachedCategoryData = mod.spellMap.GetAllForCategory(category)
  end

  local maxValue = mod.common.TableLength(cachedCategoryData) or 0

  if maxValue <= RGPVPW_CONSTANTS.SPELL_LIST_MAX_ROWS then
    maxValue = RGPVPW_CONSTANTS.SPELL_LIST_MAX_ROWS + 1
  end
  -- Note: maxValue needs to be at least max_rows + 1
  FauxScrollFrame_Update(
    scrollFrame,
    maxValue,
    RGPVPW_CONSTANTS.SPELL_LIST_MAX_ROWS,
    RGPVPW_CONSTANTS.SPELL_LIST_ROW_HEIGHT
  )

  local offset = FauxScrollFrame_GetOffset(scrollFrame)

  for i = 1, RGPVPW_CONSTANTS.SPELL_LIST_MAX_ROWS do
    local value = i + offset

    if value <= maxValue then
      local row = spellRows[i]

      if cachedCategoryData[value] ~= nil then
        row.normalizedSpellName = cachedCategoryData[value].normalizedSpellName
        row.category = category
        row.spellTitle:SetText(cachedCategoryData[value].name)
        row.playSound.soundFileName = cachedCategoryData[value].soundFileName
        row.playSoundFade.soundFileName = cachedCategoryData[value].soundFileName

        me.UpdateIcon(row.spellIcon, category, cachedCategoryData[value])
        me.UpdateSpellStateCheckBox(row.spellStateCheckBox, category, cachedCategoryData[value].normalizedSpellName)
        me.UpdateSound(row.soundCheckBox, category, cachedCategoryData[value].normalizedSpellName)
        me.UpdateSoundFade(row.soundFadeCheckBox, row.playSoundFade, category, cachedCategoryData[value])
        me.UpdateChooseVisualDropdownMenu(row.chooseVisual, category, cachedCategoryData[value].normalizedSpellName)

        row:Show()
      else
        spellRows[i]:Hide()
      end
    end
  end
end

--[[
  @param {table} spellIcon
  @param {string} category
  @param {table} spell
]]--
function me.UpdateIcon(spellIcon, category, spell)
  local iconId
  local color = RGPVPW_CONSTANTS.CATEGORY_COLOR[category]

  --[[
    For most items we have to track the actual spelleffect in the combat log. However for
    people to recognize the item it is much better to use items icon itself.
  ]]--
  if spell.itemId ~= nil then
    iconId = GetItemIcon(spell.itemId)
  else
    _, _, iconId = GetSpellInfo(spell.spellId)
  end

  spellIcon:SetTexture(iconId)
  spellIcon.iconHolder:SetBackdropBorderColor(unpack(color))
end

--[[
  @param {table} dropdownMenu
  @param {string} category
  @param {string} spellName
]]--
function me.UpdateChooseVisualDropdownMenu(dropdownMenu, category, spellName)
  local colorValue = mod.spellConfiguration.GetVisualWarningColor(
    RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
    category,
    spellName
  )

  UIDropDownMenu_SetSelectedValue(
    dropdownMenu,
    colorValue
  )
end

--[[
  @param {table} spellStateCheckBox
  @param {string} category
  @param {string} spellName
]]--
function me.UpdateSpellStateCheckBox(spellStateCheckBox, category, spellName)
  local isSpellActive = mod.spellConfiguration.IsSpellActive(
    RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
    category,
    spellName
  )

  local parentFrame = spellStateCheckBox:GetParent()

  if isSpellActive then
    mod.logger.LogDebug(me.tag, string.format(
      "Spell %s for category %s is active", spellName, category)
    )
    spellStateCheckBox:SetChecked(true)

    me.UpdateCheckButtonState(spellStateCheckBox, parentFrame.soundCheckBox)
    me.UpdateCheckButtonState(spellStateCheckBox, parentFrame.soundFadeCheckBox)
    me.UpdateChooseVisualDropdownMenuState(parentFrame, true)
  else
    mod.logger.LogDebug(me.tag, string.format(
      "Spell %s for category %s is inactive", spellName, category)
    )
    spellStateCheckBox:SetChecked(false)

    me.UpdateCheckButtonState(spellStateCheckBox, parentFrame.soundCheckBox)
    me.UpdateCheckButtonState(spellStateCheckBox, parentFrame.soundFadeCheckBox)
    me.UpdateChooseVisualDropdownMenuState(parentFrame, false)
  end
end

--[[
  @param {table} soundCheckBox
  @param {string} category
  @param {string} spellName
]]--
function me.UpdateSound(soundCheckBox, category, spellName)
  -- update sound checkbox state
  soundCheckBox:SetChecked(
    mod.spellConfiguration.IsSoundWarningActive(
      RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
      category,
      spellName
    )
  )
end

--[[
  @param {table} soundFadeCheckBox
  @param {table} soundFadeButton
  @param {string} category
  @param {table} spell
]]--
function me.UpdateSoundFade(soundFadeCheckBox, soundFadeButton, category, spell)
  if spell.hasFade then
    soundFadeCheckBox:SetChecked(mod.spellConfiguration.IsSoundFadeWarningActive(
      RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
      category,
      spell.normalizedSpellName
    ))
    soundFadeCheckBox:Show()
    soundFadeButton:Show()
  else
    soundFadeCheckBox:Hide()
    soundFadeButton:Hide()
  end
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
    UIDropDownMenu_EnableDropDown(frame.chooseVisual)
    frame.chooseVisualLabel:SetTextColor(1, 1, 1)
  else
    UIDropDownMenu_DisableDropDown(frame.chooseVisual)
    frame.chooseVisualLabel:SetTextColor(0.66, 0.66, 0.66)
  end
end
