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

-- luacheck: globals CreateFrame STANDARD_TEXT_FONT FauxScrollFrame_Update FauxScrollFrame_GetOffset
-- luacheck: globals UIDropDownMenu_Initialize UIDropDownMenu_AddButton UIDropDownMenu_GetSelectedValue
-- luacheck: globals UIDropDownMenu_SetSelectedValue GetSpellInfo

local mod = rgpvpw
local me = {}
mod.categoryMenu = me

me.tag = "CategoryMenu"

--[[
  Local references to ui elements
]]--
local spellRows = {}
local spellScrollFrame -- TODO still needed as global?
-- track whether the menu was already built
local builtMenu = false
--[[
  Cached spelllist for reusing while the player scrolls through the spelllist. Wiped
  when the category changes
]]--
local cachedCategoryData = nil
--[[
  Currently active category
]]--
local activeCategory = nil

--[[
  Build or update (if already built) the category menus for configuring spells

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.MenuOnShow(self)
  if builtMenu then
    -- cleaned cached data from previous category
    cachedCategoryData = nil
    mod.logger.LogInfo(me.tag, "Wiped cached spellist after category switch")
    -- changing the scrollframes parent to the respective active category panel
    spellScrollFrame:SetParent(self)
    -- update the scrolllist with new category data
    me.FauxScrollFrameOnUpdate(spellScrollFrame, self.categoryName)
  else
    me.BuildUi(self, self.categoryName)
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
  local scrollFrame = me.CreateFauxScrollFrame(
    RGPVPW_CONSTANTS.ELEMENT_SPELL_LIST_SCROLL_FRAME,
    frame,
    RGPVPW_CONSTANTS.SPELL_LIST_CONTENT_FRAME_WIDTH,
    me.FauxScrollFrameOnUpdate,
    spellRows
  )

  scrollFrame:ClearAllPoints()
  scrollFrame:SetPoint("TOPLEFT", frame, 5, -7)

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
  scrollFrame:SetHeight(RGPVPW_CONSTANTS.SPELL_LIST_ROW_HEIGHT * RGPVPW_CONSTANTS.SPELL_LIST_MAX_ROWS)
  scrollFrame:EnableMouseWheel(true)

  scrollFrame:SetScript("OnVerticalScroll", function(self, offset)
    self.ScrollBar:SetValue(offset)
    self.offset = math.floor(offset / RGPVPW_CONSTANTS.SPELL_LIST_ROW_HEIGHT + 0.5)
    callback(self, self:GetParent().categoryName)
  end)

  for i = 1, RGPVPW_CONSTANTS.SPELL_LIST_MAX_ROWS do
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
  local row = CreateFrame("Button", RGPVPW_CONSTANTS.ELEMENT_SPELL_LIST_CONTENT_FRAME .. position, frame)
  row:SetSize(frame:GetWidth(), RGPVPW_CONSTANTS.SPELL_LIST_ROW_HEIGHT)
  row:SetPoint("TOPLEFT", frame, 0, (position -1) * RGPVPW_CONSTANTS.SPELL_LIST_ROW_HEIGHT * -1)

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
  row.cooldownIcon = me.CreateSpellIcon(row)
  row.spellTitle = me.CreateSpellTitle(row)

  row.soundCheckBox = me.CreateSpellSoundCheckBox(row)
  row.playSound = me.CreateSoundButton(row)
  row.soundFadeCheckBox = me.CreateSpellSoundFadeCheckBox(row)
  row.playSoundFade = me.CreateSoundFadeButton(row)
  row.chooseVisual = me.CreateVisualAlertDropdown(row)
  row.createVisualLabel = me.CreateVisualLabel(row)
  row.playVisual = me.CreateVisualWarningButton(row)

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
    function()
      mod.spellConfiguration.ToggleSpellState(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
        activeCategory,
        spellFrame.spellName
      )
    end,
    function(self)
      local isActive = mod.spellConfiguration.IsSpellActive(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
        activeCategory,
        spellFrame.spellName
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
    RGPVPW_CONSTANTS.CATEGORY_COOLDOWN_SPELL_ICON_SIZE + 5,
    RGPVPW_CONSTANTS.CATEGORY_COOLDOWN_SPELL_ICON_SIZE + 5
  )
  iconHolder:SetPoint("LEFT", 40, 0)

  local cooldownIcon = iconHolder:CreateTexture(RGPVPW_CONSTANTS.ELEMENT_CATEGORY_COOLDOWN_SPELL_ICON, "ARTWORK")
  cooldownIcon.iconHolder = iconHolder
  cooldownIcon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
  cooldownIcon:SetPoint("CENTER", 0, 0)
  cooldownIcon:SetSize(
    RGPVPW_CONSTANTS.CATEGORY_COOLDOWN_SPELL_ICON_SIZE,
    RGPVPW_CONSTANTS.CATEGORY_COOLDOWN_SPELL_ICON_SIZE
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

  return cooldownIcon
end

--[[
  Create fontstring for title of the spell to configure

  @param {table} spellFrame

  @return {table}
    The created fontstring
]]--
function me.CreateSpellTitle(spellFrame)
  local spellTitleFontString = spellFrame:CreateFontString(RGPVPW_CONSTANTS.ELEMENT_CATEGORY_SPELL_NAME, "OVERLAY")
  spellTitleFontString:SetFont(STANDARD_TEXT_FONT, 15)
  spellTitleFontString:SetWidth(RGPVPW_CONSTANTS.SPELL_TITLE_WIDTH)
  spellTitleFontString:SetPoint(
    "LEFT",
    spellFrame.cooldownIcon,
    RGPVPW_CONSTANTS.CATEGORY_COOLDOWN_SPELL_ICON_SIZE + 10,
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
function me.CreateSpellSoundCheckBox(spellFrame)
  return mod.guiHelper.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENABLE_SOUND,
    spellFrame,
    {"LEFT", spellFrame.spellTitle, "RIGHT", 0, 25},
    function()
      mod.spellConfiguration.ToggleSoundWarning(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
        activeCategory,
        spellFrame.spellName
      )
    end,
    function(self)
      local isActive = mod.spellConfiguration.IsSoundWarningActive(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
        activeCategory,
        spellFrame.spellName
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
  Create a sound button for testing the sound

  @param {table} spellFrame

  @return {table}
    The created button
]]--
function me.CreateSoundButton(spellFrame)
  return mod.guiHelper.CreatePlayButton(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_PLAY_SOUND_BUTTON,
    spellFrame,
    {"LEFT", spellFrame.soundCheckBox, "RIGHT", 150, 0},
    me.PlaySoundButtonOnClick,
    rgpvpw.L["label_play_sound"]
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
        spellFrame.spellName
      )
    end,
    function(self)
      local isActive = mod.spellConfiguration.IsSoundFadeWarningActive(
        RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
        activeCategory,
        spellFrame.spellName
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
  Create a sound fade button for testing the sound

  @param {table} spellFrame

  @return {table}
    The created button
]]--
function me.CreateSoundFadeButton(spellFrame)
  return mod.guiHelper.CreatePlayButton(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_PLAY_SOUND_FADE_BUTTON,
    spellFrame,
    {"LEFT", spellFrame.soundFadeCheckBox, "RIGHT", 150, 0},
    me.PlaySoundFadeButtonOnClick,
    rgpvpw.L["label_play_sound_fade"]
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
  local chooseVisualWarningDropdownMenu = CreateFrame(
    "Button",
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_VISUAL_WARNING_DROPDOWN .. spellFrame.position,
    spellFrame,
    "UIDropDownMenuTemplate"
  )
  chooseVisualWarningDropdownMenu:SetPoint("TOPLEFT", 360, -60)
  chooseVisualWarningDropdownMenu.position = spellFrame.position

  UIDropDownMenu_Initialize(chooseVisualWarningDropdownMenu, me.InitializeVisualWarningDropdownMenu)

  return chooseVisualWarningDropdownMenu
end

--[[
  Create dropdownmenu for color selection

  @param {table} self
    A reference to the dropdown
]]--
function me.InitializeVisualWarningDropdownMenu(self)
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
    RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
    activeCategory,
    self:GetParent().dropdown:GetParent().spellName,
    self.value
  )
end

--[[
  Create a label for the warn dropdown menu

  @param {table} spellFrame

  @return {table}
    The created label
]]--
function me.CreateVisualLabel(spellFrame)
  local visualWarningLabelFontString = spellFrame:CreateFontString(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_VISUAL_WARNING_LABEL,
    "OVERLAY"
  )
  visualWarningLabelFontString:SetFont(STANDARD_TEXT_FONT, 15)
  visualWarningLabelFontString:SetPoint(
    "RIGHT",
    spellFrame.chooseVisual,
    "LEFT",
    0,
    0
  )
  visualWarningLabelFontString:SetTextColor(.95, .95, .95)
  visualWarningLabelFontString:SetText(rgpvpw.L["label_visual_warning"])

  visualWarningLabelFontString:SetWidth(
    visualWarningLabelFontString:GetStringWidth()
  )

  return visualWarningLabelFontString
end

--[[
  Create a visual warn button for testing the sound

  @param {table} spellFrame

  @return {table}
    The created button
]]--
function me.CreateVisualWarningButton(spellFrame)
  return mod.guiHelper.CreatePlayButton(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_PLAY_VISUAL_WARNING_BUTTON,
    spellFrame,
    {"LEFT", spellFrame.chooseVisual, "RIGHT", 140, 0},
    me.ToggleVisualWarning,
    rgpvpw.L["label_play_visual"]
  )
end

--[[
  Click callback for enabling/disabling visual warnings

  @param {table} self
]]--
function me.ToggleVisualWarning(self)
  -- retrieve color for specific spell and category from configuration
  local color = mod.spellConfiguration.GetVisualWarningColor(
    RGPVPW_CONSTANTS.SPELL_TYPE.SPELL,
    self:GetParent().category,
    self:GetParent().spellName
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
    mod.logger.LogInfo(me.tag, string.format("Warmed up cached spelllist for category '%s'", category))
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
        row.spellName = cachedCategoryData[value].name
        row.category = category
        row.spellTitle:SetText(cachedCategoryData[value].name)
        row.playSound.soundFileName = cachedCategoryData[value].soundFileName
        row.playSoundFade.soundFileName = cachedCategoryData[value].soundFileName

        me.UpdateIcon(row.cooldownIcon, category, cachedCategoryData[value].spellId)
        me.UpdateSpellStateCheckBox(row.spellStateCheckBox, category, cachedCategoryData[value].name)
        me.UpdateSound(row.soundCheckBox, category, cachedCategoryData[value].name)
        me.UpdateSoundFade(row.soundFadeCheckBox, row.playSoundFade, category, cachedCategoryData[value])
        me.UpdateChooseVisualDropdownMenu(row.chooseVisual, category, cachedCategoryData[value].name)

        row:Show()
      else
        spellRows[i]:Hide()
      end
    end
  end
end

--[[
@param {table} cooldownIcon
@param {string} category
@param {number} spellId
]]--
function me.UpdateIcon(cooldownIcon, category, spellId)
  local _, _, iconId = GetSpellInfo(spellId)
  local color = RGPVPW_CONSTANTS.CATEGORY_COLOR[category]

  cooldownIcon:SetTexture(iconId)
  cooldownIcon.iconHolder:SetBackdropBorderColor(unpack(color))
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

  --TODO this causes fps drops atm TODO possible solution could be check value before setting it
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

  if isSpellActive then
    mod.logger.LogDebug(me.tag, string.format(
      "Spell %s for category %s is active", spellName, category)
    )
    spellStateCheckBox:SetChecked(true)
  else
    mod.logger.LogDebug(me.tag, string.format(
      "Spell %s for category %s is inactive", spellName, category)
    )
    -- disable all elements (play buttons as well?)
    spellStateCheckBox:SetChecked(false)
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
      spell.name
    ))
    soundFadeCheckBox:Show()
    soundFadeButton:Show()
  else
    soundFadeCheckBox:Hide()
    soundFadeButton:Hide()
  end
end
