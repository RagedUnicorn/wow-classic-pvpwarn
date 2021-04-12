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

-- luacheck: globals CreateFrame STANDARD_TEXT_FONT UIDropDownMenu_Initialize UIDropDownMenu_AddButton
-- luacheck: globals UIDropDownMenu_GetSelectedValue UIDropDownMenu_SetSelectedValue UnitClass
-- luacheck: globals FauxScrollFrame_Update FauxScrollFrame_GetOffset GetSpellInfo
-- luacheck: globals UIDropDownMenu_EnableDropDown UIDropDownMenu_DisableDropDown

local mod = rgpvpw
local me = {}
mod.enemyAvoidMenu = me

me.tag = "EnemyAvoidMenu"

-- track whether the menu was already built
local builtMenu = false
--[[
  Local references to ui elements
]]--
local spellAvoidRows = {}
local spellEnemyAvoidScrollFrame
--[[
  Cached spellEnemyAvoidList for reusing while the player scrolls through the spellEnemyAvoidList.
]]--
local cachedCategoryData = nil
--[[
  Currently active category
]]--
local activeCategory = nil

--[[
  @param {table} frame
]]--
function me.Init(frame)
  if builtMenu then
    return
  else
    me.SetCategoryName()
    me.BuildUi(frame)
  end
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
  Build the ui for the general menu

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildUi(frame)
  local contentFrame = me.CreateCategoryMenuContentFrame(frame)
  spellEnemyAvoidScrollFrame = me.CreateSpellEnemyAvoidList(contentFrame)
  me.FauxScrollFrameOnUpdate(spellEnemyAvoidScrollFrame)
  builtMenu = true
end

--[[
  @param {table} frame

  @return {table}
]]--
function me.CreateCategoryMenuContentFrame(frame)
  local contentFrame = CreateFrame("Frame", RGPVPW_CONSTANTS.ELEMENT_SPELL_ENEMY_AVOID_LIST_CONTENT_FRAME, frame)
  contentFrame:SetPoint("TOPLEFT", frame, 5, -7)
  contentFrame:SetBackdropColor(1, 0.37, 0.5, .7)
  contentFrame:SetWidth(RGPVPW_CONSTANTS.SPELL_LIST_CONTENT_FRAME_WIDTH)
  contentFrame:SetHeight(RGPVPW_CONSTANTS.SPELL_LIST_CONTENT_FRAME_HEIGHT)

  return contentFrame
end

--[[
  Create the scrollist for the spelllist

  @param {table} frame

  @return {table}
]]--
function me.CreateSpellEnemyAvoidList(frame)
  local scrollFrame = me.CreateFauxScrollFrame(
    RGPVPW_CONSTANTS.ELEMENT_SPELL_AVOID_LIST_SCROLL_FRAME,
    frame,
    RGPVPW_CONSTANTS.SPELL_ENEMY_AVOID_LIST_CONTENT_FRAME_WIDTH,
    me.FauxScrollFrameOnUpdate,
    spellAvoidRows
  )

  scrollFrame:ClearAllPoints()
  scrollFrame:SetPoint("TOPLEFT", frame)

  return scrollFrame
end

--[[
  @param {string} scrollFrameName
  @param {table} frame
  @param {number} width
  @param {function} callback
    OnVerticalScroll callback function
  @param {table} storage
    Storage for the created rows

  @return {table}
    The created scrollFrame
]]--
function me.CreateFauxScrollFrame(scrollFrameName, frame, width, callback, storage)
  local scrollFrame = CreateFrame("ScrollFrame", scrollFrameName, frame, "FauxScrollFrameTemplate")
  scrollFrame:SetWidth(width)
  scrollFrame:SetHeight(
    RGPVPW_CONSTANTS.SPELL_ENEMY_AVOID_LIST_ROW_HEIGHT * RGPVPW_CONSTANTS.SPELL_ENEMY_AVOID_LIST_MAX_ROWS)
  scrollFrame:EnableMouseWheel(true)
  scrollFrame:SetScript("OnVerticalScroll", function(self, offset)
    self.ScrollBar:SetValue(offset)
    self.offset = math.floor(offset / RGPVPW_CONSTANTS.SPELL_ENEMY_AVOID_LIST_ROW_HEIGHT + 0.5)
    callback(self, self:GetParent().categoryName)
  end)

  for i = 1, RGPVPW_CONSTANTS.SPELL_ENEMY_AVOID_LIST_MAX_ROWS do
    table.insert(storage, me.CreateRowFrame(scrollFrame, i))
  end

  return scrollFrame
end

--[[
  @param {table} frame
  @param {number} position

  @return {table}
    The created row
]]--
function me.CreateRowFrame(frame, position)
  local row = CreateFrame(
    "Button", RGPVPW_CONSTANTS.ELEMENT_SPELL_ENEMY_AVOID_LIST_CONTENT_ROW_FRAME .. position, frame)
  row:SetSize(frame:GetWidth(), RGPVPW_CONSTANTS.SPELL_ENEMY_AVOID_LIST_ROW_HEIGHT)
  row:SetPoint("TOPLEFT", frame, 0, (position -1) * RGPVPW_CONSTANTS.SPELL_ENEMY_AVOID_LIST_ROW_HEIGHT * -1)

  row:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    insets = {left = 0, right = 0, top = 0, bottom = 0},
  })

  if math.fmod(position, 2) == 0 then
    row:SetBackdropColor(0.37, 0.37, 0.37, .4)
  else
    row:SetBackdropColor(.25, .25, .25, .8)
  end

  row.position = position
  row.spellStateCheckBox = me.CreateSpellStateCheckbox(row)
  row.spellIcon = me.CreateSpellIcon(row)
  row.spellTitle = me.CreateSpellTitle(row)

  row.enemyAvoidSoundCheckBox = me.CreateSpellEnemyAvoidSoundCheckBox(row)
  row.playEnemyAvoidSound = me.CreateEnemyAvoidSoundButton(row)
  row.chooseEnemyAvoidVisual = me.CreateAvoidVisualAlertDropdown(row)
  row.chooseEnemyAvoidVisualLabel = me.CreateAvoidVisualLabel(row)
  row.playEnemyAvoidVisual = me.CreateAvoidVisualWarningButton(row)

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
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENABLE_SPELL_ENEMY_AVOID,
    spellFrame,
    {"LEFT", 0, 0},
    function(self)
      mod.spellConfiguration.ToggleSpellState(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID,
        activeCategory,
        spellFrame.normalizedSpellName
      )

      local parentFrame = self:GetParent()

      me.UpdateCheckButtonState(self, parentFrame.enemyAvoidSoundCheckBox)
      me.UpdateChooseVisualDropdownMenuState(parentFrame, self:GetChecked())
    end,
    function(self)
      local isActive = mod.spellConfiguration.IsSpellActive(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID,
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
  @param {table} spellFrame

  @return {table}
    The created icon texture holder
]]--
function me.CreateSpellIcon(spellFrame)
  local iconHolder = CreateFrame("Frame", nil, spellFrame)
  iconHolder:SetSize(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_ENEMY_AVOID_ICON_SIZE + 5,
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_ENEMY_AVOID_ICON_SIZE + 5
  )
  iconHolder:SetPoint("LEFT", 40, 0)

  local spellIcon = iconHolder:CreateTexture(RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_ENEMY_AVOID_ICON, "ARTWORK")
  spellIcon.iconHolder = iconHolder
  spellIcon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
  spellIcon:SetPoint("CENTER", 0, 0)
  spellIcon:SetSize(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_ENEMY_AVOID_ICON_SIZE,
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_ENEMY_AVOID_ICON_SIZE
  )

  local backdrop = {
    bgFile = "Interface\\AddOns\\PVPWarn\\assets\\images\\ui_slot_background",
    edgeFile = "Interface\\AddOns\\PVPWarn\\assets\\images\\ui_slot_background",
    tile = false,
    tileSize = 32,
    edgeSize = 20,
    insets = {
      left = 12,
      right = 12,
      top = 12,
      bottom = 12
    }
  }

  iconHolder:SetBackdrop(backdrop)
  iconHolder:SetBackdropColor(0.15, 0.15, 0.15, 1)

  return spellIcon
end

--[[
  Create fontstring for title of the spell to configure

  @param {table} spellFrame

  @return {table}
    The created fontstring
]]--
function me.CreateSpellTitle(spellFrame)
  local spellTitleFontString =
    spellFrame:CreateFontString(RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_ENEMY_AVOID_NAME, "OVERLAY")
  spellTitleFontString:SetFont(STANDARD_TEXT_FONT, 15)
  spellTitleFontString:SetWidth(RGPVPW_CONSTANTS.SPELL_ENEMY_AVOID_TITLE_WIDTH)
  spellTitleFontString:SetPoint(
    "LEFT",
    spellFrame.spellIcon,
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_ENEMY_AVOID_ICON_SIZE + 10,
    0
  )
  spellTitleFontString:SetTextColor(.95, .95, .95)

  return spellTitleFontString
end

--[[
  Create checkbox for configuring sound alert configuration

  @param {table} spellFrame

  @return {table}
    The created checkbox
]]--
function me.CreateSpellEnemyAvoidSoundCheckBox(spellFrame)
  return mod.guiHelper.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENABLE_ENEMY_AVOID_SOUND,
    spellFrame,
    {"LEFT", spellFrame.spellTitle, "RIGHT", 0, 25},
    function()
      mod.spellConfiguration.ToggleSoundWarning(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID,
        activeCategory,
        spellFrame.normalizedSpellName
      )
    end,
    function(self)
      local isActive = mod.spellConfiguration.IsSoundWarningActive(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID,
        activeCategory,
        spellFrame.normalizedSpellName
      )

      if isActive then
        self:SetChecked(true)
      else
        self:SetChecked(false)
      end
    end,
    rgpvpw.L["label_enable_enemy_avoid_sound"]
  )
end

--[[
  Create a sound button for testing the sound

  @param {table} spellFrame

  @return {table}
    The created button
]]--
function me.CreateEnemyAvoidSoundButton(spellFrame)
  return mod.guiHelper.CreatePlayButton(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_PLAY_ENEMY_AVOID_SOUND_BUTTON,
    spellFrame,
    {"LEFT", spellFrame.enemyAvoidSoundCheckBox, "RIGHT", 150, 0},
    me.PlayAvoidSoundButtonOnClick,
    rgpvpw.L["label_play_enemy_avoid_sound"]
  )
end

--[[
  Click callback for sound button

  @param {table} self
]]--
function me.PlayAvoidSoundButtonOnClick(self)
  mod.sound.PlaySound(self:GetParent().category, RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, self.soundFileName)
end


--[[
  Create a dropdown with alert color textures to choose

  @param {table} spellFrame

  @return {table}
    The created dropdown
]]--
function me.CreateAvoidVisualAlertDropdown(spellFrame)
  local chooseAvoidVisualWarningDropdownMenu = CreateFrame(
    "Button",
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENEMY_AVOID_VISUAL_WARNING_DROPDOWN .. spellFrame.position,
    spellFrame,
    "UIDropDownMenuTemplate"
  )
  chooseAvoidVisualWarningDropdownMenu:SetPoint("RIGHT", spellFrame.spellTitle, "RIGHT", 165, -30)
  chooseAvoidVisualWarningDropdownMenu.position = spellFrame.position

  UIDropDownMenu_Initialize(chooseAvoidVisualWarningDropdownMenu, me.InitializeAvoidVisualWarningDropdownMenu)

  return chooseAvoidVisualWarningDropdownMenu
end

--[[
  Create dropdownmenu for color selection

  @param {table} self
    A reference to the dropdown
]]--
function me.InitializeAvoidVisualWarningDropdownMenu(self)
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
    RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID,
    activeCategory,
    self:GetParent().dropdown:GetParent().normalizedSpellName,
    self.value
  )
end

--[[
  Create a label for the warn dropdown menu

  @param {table} spellFrame

  @return {table}
    The created label
]]--
function me.CreateAvoidVisualLabel(spellFrame)
  local avoidVisualWarningLabelFontString = spellFrame:CreateFontString(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENEMY_AVOID_VISUAL_WARNING_LABEL,
    "OVERLAY"
  )
  avoidVisualWarningLabelFontString:SetFont(STANDARD_TEXT_FONT, 15)
  avoidVisualWarningLabelFontString:SetPoint(
    "RIGHT",
    spellFrame.chooseEnemyAvoidVisual,
    "LEFT",
    0,
    0
  )
  avoidVisualWarningLabelFontString:SetTextColor(.95, .95, .95)
  avoidVisualWarningLabelFontString:SetText(rgpvpw.L["label_avoid_visual_warning"])
  avoidVisualWarningLabelFontString:SetWidth(
    avoidVisualWarningLabelFontString:GetStringWidth()
  )

  return avoidVisualWarningLabelFontString
end

--[[
  Create a visual warn button for testing the sound

  @param {table} spellFrame

  @return {table}
    The created button
]]--
function me.CreateAvoidVisualWarningButton(spellFrame)
  return mod.guiHelper.CreatePlayButton(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_PLAY_ENEMY_AVOID_VISUAL_ALERT_BUTTON,
    spellFrame,
    {"LEFT", spellFrame.chooseEnemyAvoidVisual, "RIGHT", 140, 0},
    me.ToggleAvoidVisualWarningOnClick,
    rgpvpw.L["label_play_enemy_avoid_visual"]
  )
end

--[[
  Click callback for enabling/disabling visual warnings

  @param {table} self
]]--
function me.ToggleAvoidVisualWarningOnClick(self)
  -- retrieve color for specific spell and category from configuration
  local color = mod.spellConfiguration.GetVisualWarningColor(
    RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID,
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
function me.FauxScrollFrameOnUpdate(scrollFrame)

  if cachedCategoryData == nil then
    mod.logger.LogInfo(me.tag, string.format("Warmed up cached spellEnemyAvoidList for category '%s'", activeCategory))
    cachedCategoryData = mod.spellAvoidMap.GetAllForCategory(activeCategory)
  end

  local maxValue = mod.common.TableLength(cachedCategoryData) or 0

  if maxValue <= RGPVPW_CONSTANTS.SPELL_ENEMY_AVOID_LIST_MAX_ROWS then
    maxValue = RGPVPW_CONSTANTS.SPELL_ENEMY_AVOID_LIST_MAX_ROWS + 1
  end
  -- Note: maxValue needs to be at least max_rows + 1
  FauxScrollFrame_Update(
    scrollFrame,
    maxValue,
    RGPVPW_CONSTANTS.SPELL_ENEMY_AVOID_LIST_MAX_ROWS,
    RGPVPW_CONSTANTS.SPELL_ENEMY_AVOID_LIST_ROW_HEIGHT
  )

  local offset = FauxScrollFrame_GetOffset(scrollFrame)

  for i = 1, RGPVPW_CONSTANTS.SPELL_ENEMY_AVOID_LIST_MAX_ROWS do
    local value = i + offset

    if value <= maxValue then
      local row = spellAvoidRows[i]

      if cachedCategoryData[value] ~= nil then
        row.normalizedSpellName = cachedCategoryData[value].normalizedSpellName
        row.category = activeCategory
        row.spellTitle:SetText(cachedCategoryData[value].name)
        row.playEnemyAvoidSound.soundFileName = cachedCategoryData[value].soundFileName

        me.UpdateIcon(
          row.spellIcon, activeCategory, cachedCategoryData[value].spellId
        )
        me.UpdateSpellStateCheckBox(
          row.spellStateCheckBox, activeCategory, cachedCategoryData[value].normalizedSpellName
        )
        me.UpdateSound(
          row.enemyAvoidSoundCheckBox, activeCategory, cachedCategoryData[value].normalizedSpellName
        )
        me.UpdateChooseVisualDropdownMenu(
          row.chooseEnemyAvoidVisual, activeCategory, cachedCategoryData[value].normalizedSpellName
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
@param {string} category
@param {number} spellId
]]--
function me.UpdateIcon(spellIcon, category, spellId)
  local _, _, iconId = GetSpellInfo(spellId)
  local color = RGPVPW_CONSTANTS.CATEGORY_COLOR[category]

  spellIcon:SetTexture(iconId)
  spellIcon.iconHolder:SetBackdropBorderColor(unpack(color))
end

--[[
  @param {table} spellStateCheckBox
  @param {string} category
  @param {string} spellName
]]--
function me.UpdateSpellStateCheckBox(spellStateCheckBox, category, spellName)
  local isSpellActive = mod.spellConfiguration.IsSpellActive(
    RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID,
    category,
    spellName
  )

  local parentFrame = spellStateCheckBox:GetParent()

  if isSpellActive then
    mod.logger.LogDebug(me.tag, string.format(
      "Spell %s for category %s is active", spellName, category)
    )
    spellStateCheckBox:SetChecked(true)

    me.UpdateCheckButtonState(spellStateCheckBox, parentFrame.enemyAvoidSoundCheckBox)
    me.UpdateChooseVisualDropdownMenuState(parentFrame, true)
  else
    mod.logger.LogDebug(me.tag, string.format(
      "Spell %s for category %s is inactive", spellName, category)
    )
    spellStateCheckBox:SetChecked(false)

    me.UpdateCheckButtonState(spellStateCheckBox, parentFrame.enemyAvoidSoundCheckBox)
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
      RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID,
      category,
      spellName
    )
  )
end

--[[
  @param {table} dropdownMenu
  @param {string} category
  @param {string} spellName
]]--
function me.UpdateChooseVisualDropdownMenu(dropdownMenu, category, spellName)
  local colorValue = mod.spellConfiguration.GetVisualWarningColor(
    RGPVPW_CONSTANTS.SPELL_TYPE.SPELL_ENEMY_AVOID,
    category,
    spellName
  )

  UIDropDownMenu_SetSelectedValue(
    dropdownMenu,
    colorValue
  )
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
    UIDropDownMenu_EnableDropDown(frame.chooseEnemyAvoidVisual)
    frame.chooseEnemyAvoidVisualLabel:SetTextColor(1, 1, 1)
  else
    UIDropDownMenu_DisableDropDown(frame.chooseEnemyAvoidVisual)
    frame.chooseEnemyAvoidVisualLabel:SetTextColor(0.66, 0.66, 0.66)
  end
end
