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

-- luacheck: globals CreateFrame STANDARD_TEXT_FONT CloseMenus

local mod = rgpvpw
local me = {}
mod.guiHelper = me

me.tag = "GuiHelper"

--[[
  Create a configuration checkbox

  @param {string} frameName
  @param {table} parent
  @param {table} position
    An object containing configuration parameters for a SetPoint function call
  @param {function} onClickCallback
    Callback that is called onClick
    @param {function} onShowCallback
      Callback that is called onShow
  @param {string} text
    Optional text that is used as label for the checkbox

  @return {table}
    The created checkbox
]]--
function me.CreateCheckBox(frameName, parent, position, onClickCallback, onShowCallback, text)
  local checkBoxFrame = CreateFrame(
    "CheckButton",
    frameName,
    parent,
    "UICheckButtonTemplate"
  )
  checkBoxFrame:SetSize(
    RGPVPW_CONSTANTS.CATEGORY_CHECK_BOX_SIZE,
    RGPVPW_CONSTANTS.CATEGORY_CHECK_BOX_SIZE
  )
  checkBoxFrame:SetPoint(unpack(position))

  checkBoxFrame.text = _G[checkBoxFrame:GetName() .. "Text"]
  checkBoxFrame.text:SetFont(STANDARD_TEXT_FONT, 15)
  checkBoxFrame.text:SetTextColor(.95, .95, .95)

  if text ~= nil then
    checkBoxFrame.text:SetText(text)
  end

  checkBoxFrame:SetScript("OnClick", onClickCallback)
  checkBoxFrame:SetScript("OnShow", onShowCallback)

  return checkBoxFrame
end

--[[
  @param {string} frameName
    The name of the button
  @param {table} parent
    A parent frame to attach to
  @param {table} position
    A valid object for SetPoint function of a frame
  @param {function} callback
    Click callback function for the created button
  @param {string} text
    Text of the button

  @return {table}
    The created button
]]--
function me.CreatePlayButton(frameName, parent, position, callback, text)
  local playButton = CreateFrame(
    "Button",
    frameName,
    parent,
    "UIPanelButtonTemplate"
  )

  playButton:SetHeight(RGPVPW_CONSTANTS.BUTTON_DEFAULT_HEIGHT)
  playButton:SetText(text)
  playButton:SetPoint(unpack(position))
  playButton:SetScript("OnClick", callback)

  local buttonFontString = playButton:GetFontString()

  playButton:SetWidth(
    buttonFontString:GetStringWidth() + RGPVPW_CONSTANTS.BUTTON_DEFAULT_PADDING
  )

  return playButton
end

--[[
  @param {string} text
  @param {number} value
  @param {function} callback

  @return {table}
    The created button
]]--
function me.CreateDropdownButton(text, value, callback)
  local button = mod.libUiDropDownMenu.UiDropDownMenu_CreateInfo()

  button.text = rgpvpw.L["texture_" .. text]
  button.value = value
  button.func = callback

  return button
end

--[[
  Resize button width to the size if its text

  @param {table} button
]]--
function me.ResizeButtonToText(button)
  local buttonFontString = button:GetFontString()

  button:SetWidth(
    buttonFontString:GetStringWidth() + RGPVPW_CONSTANTS.BUTTON_DEFAULT_PADDING
  )
end

--[[
  Load a frames position from SavedVariablesPerCharacter

  @param {table} slot
]]--
function me.LoadFramePosition(frame, frameName)
  local framePosition = mod.configuration.GetUserPlacedFramePosition(frameName)
  --[[
    Set user frame position if there is one saved
  ]]--
  if framePosition ~= nil then
    frame:ClearAllPoints() -- very important to clear all points first
    frame:SetPoint(
      framePosition.point,
      framePosition.relativeTo,
      framePosition.relativePoint,
      framePosition.posX,
      framePosition.posY
    )
  else
    -- initial position for first time use
    frame:SetPoint("CENTER", 0, 0)
  end
end

--[[
  Disables a checkButton and updates the text to greyed out

  @param {table} checkButton
    The checkButton to disable
]]
function me.DisableCheckButton(checkButton)
  checkButton:Disable()
  checkButton.text:SetTextColor(0.66, 0.66, 0.66)
end

--[[
  Enables a checkButton and updates the text to white

  @param {table} checkButton
    The checkButton to enable
]]
function me.EnableCheckButton(checkButton)
  checkButton:Enable()
  checkButton.text:SetTextColor(1, 1, 1)
end

--[[
  @param {table} parentFrame
  @param {number} position
  @param {string} spellFrameName
  @param {number} spellFrameRowHeight

  @return {table}
    The created row
]]--
function me.CreateSpellFrame(parentFrame, position, spellFrameName, spellFrameRowHeight)
  local spellFrame = CreateFrame("Button", spellFrameName .. position, parentFrame, "BackdropTemplate")
  spellFrame:SetSize(parentFrame:GetWidth(), spellFrameRowHeight)
  spellFrame:SetPoint("TOPLEFT", parentFrame, 0, (position -1) * spellFrameRowHeight * -1)

  spellFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    insets = {left = 0, right = 0, top = 0, bottom = 0},
  })

  if math.fmod(position, 2) == 0 then
    spellFrame:SetBackdropColor(0.37, 0.37, 0.37, .4)
  else
    spellFrame:SetBackdropColor(.25, .25, .25, .8)
  end

  return  spellFrame
end

--[[
    @param {string} scrollFrameName
    @param {table} parentFrame
    @param {number} scrollFrameWidth
    @param {number} rowHeight
    @param {number} maxRows
    @param {function} callback
    @param {function} createSpellFrameFunc
    @param {table} storage
]]--
function me.CreateFauxScrollFrame(
    scrollFrameName, parentFrame, scrollFrameWidth, rowHeight, maxRows, callback, createSpellFrameFunc, storage)
  local scrollFrame = CreateFrame("ScrollFrame", scrollFrameName, parentFrame, "FauxScrollFrameTemplate")
  scrollFrame:SetWidth(scrollFrameWidth)
  scrollFrame:SetHeight(rowHeight * maxRows)
  scrollFrame:EnableMouseWheel(true)

  scrollFrame:SetScript("OnVerticalScroll", function(self, offset)
    CloseMenus()
    self.ScrollBar:SetValue(offset)
    self.offset = math.floor(offset / rowHeight + 0.5)
    callback(self, self:GetParent().categoryName)
  end)

  for i = 1, maxRows do
    table.insert(storage, createSpellFrameFunc(scrollFrame, i))
  end

  scrollFrame:ClearAllPoints()
  scrollFrame:SetPoint("TOPLEFT", parentFrame)

  return scrollFrame, storage
end

--[[
  @param {table} parentFrame
  @param {string} iconName
  @param {number} iconSize

  @return {table}
    The created icon texture holder
]]--
function me.CreateSpellIcon(parentFrame, iconName, iconSize)
  local iconHolder = CreateFrame("Frame", nil, parentFrame, "BackdropTemplate")
  iconHolder:SetSize(
    iconSize + 5,
    iconSize + 5
  )
  iconHolder:SetPoint("LEFT", 40, 0)

  local spellIcon = iconHolder:CreateTexture(iconName, "ARTWORK")
  spellIcon.iconHolder = iconHolder
  spellIcon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
  spellIcon:SetPoint("CENTER", 0, 0)
  spellIcon:SetSize(
    iconSize,
    iconSize
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

  @param {table} parentFrame
  @param {string} spellTitle
  @param {number} spellTitleWidth
  @param {number} iconSize

  @return {table}
    The created fontstring
]]--
function me.CreateSpellTitle(parentFrame, spellTitle, spellTitleWidth, iconSize)
  local spellTitleFontString = parentFrame:GetParent():CreateFontString(spellTitle, "OVERLAY")
  spellTitleFontString:SetFont(STANDARD_TEXT_FONT, 15)
  spellTitleFontString:SetWidth(spellTitleWidth)
  spellTitleFontString:SetPoint(
    "LEFT",
    parentFrame,
    iconSize + 10,
    0
  )
  spellTitleFontString:SetTextColor(.95, .95, .95)

  return spellTitleFontString
end

--[[
  Create a label for the warn dropdown menu

  @param {table} parentFrame
  @param {string} visualLabelName
  @param {string} labelText

  @return {table}
    The created label
]]--
function me.CreateVisualWarningLabel(parentFrame, visualLabelName, labelText)
  local visualWarningLabelFontString = parentFrame:CreateFontString(
    visualLabelName,
    "OVERLAY"
  )
  visualWarningLabelFontString:SetFont(STANDARD_TEXT_FONT, 15)
  visualWarningLabelFontString:SetPoint(
    "RIGHT",
    parentFrame,
    "LEFT",
    0,
    0
  )
  visualWarningLabelFontString:SetTextColor(.95, .95, .95)
  visualWarningLabelFontString:SetText(labelText)
  visualWarningLabelFontString:SetWidth(
    visualWarningLabelFontString:GetStringWidth()
  )

  return visualWarningLabelFontString
end

--[[
  Create a dropdown with alert color textures to choose

  @param {table} parentFrame
  @param {string} dropdownName
  @param {function} initializeFunction

  @return {table}
    The created dropdown
]]--
function me.CreateVisualWarningDropdown(parentFrame, dropdownName, initializeFunction)
  local chooseVisualWarningDropdownMenu = mod.libUiDropDownMenu.CreateUiDropDownMenu(
    dropdownName .. parentFrame.position,
    parentFrame
  )
  chooseVisualWarningDropdownMenu:SetPoint("RIGHT", parentFrame.spellTitle, "RIGHT", 165, -30)
  chooseVisualWarningDropdownMenu.position = parentFrame.position

  mod.libUiDropDownMenu.UiDropDownMenu_Initialize(chooseVisualWarningDropdownMenu, initializeFunction)

  return chooseVisualWarningDropdownMenu
end
