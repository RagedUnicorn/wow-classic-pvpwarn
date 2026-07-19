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

-- luacheck: globals CreateFrame STANDARD_TEXT_FONT TargetFrame
-- luacheck: globals Settings MinimalSliderWithSteppersMixin

local mod = rgpvpw
local me = {}
mod.guiHelper = me

me.tag = "GuiHelper"

--[[
  Apply one of the RGPVPW_CONSTANTS.COLOR { r, g, b } tokens to a font string.

  @param {table} fontString
  @param {table} color
]]--
function me.SetColor(fontString, color)
  fontString:SetTextColor(color[1], color[2], color[3])
end

--[[
  Apply the shared bordered box backdrop used by panel content containers. The frame
  must have been created with the "BackdropTemplate" mixin.

  @param {table} frame
]]--
function me.ApplyBorderBackdrop(frame)
  frame:SetBackdrop({
    bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 12,
    insets = { left = 3, right = 3, top = 3, bottom = 3 }
  })
  frame:SetBackdropColor(0, 0, 0, 0.4)
  frame:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)
end

--[[
  Create a dropdown in the dark style of the stock configuration menus (WowStyle2, without
  the stepper buttons the settings panel adds around some of its dropdowns)

  @param {string} frameName
  @param {table} parent
  @param {table} position
    An object containing configuration parameters for a SetPoint function call
  @param {number} width
  @param {function} menuGenerator
    Menu generator passed to SetupMenu - receives (dropdown, rootDescription)

  @return {table}
    The created dropdown
]]--
function me.CreateSettingsDropdown(frameName, parent, position, width, menuGenerator)
  local dropdown = CreateFrame("DropdownButton", frameName, parent, "WowStyle2DropdownTemplate")
  dropdown:SetPoint(unpack(position))
  dropdown:SetWidth(width)
  dropdown:SetupMenu(menuGenerator)

  return dropdown
end

--[[
  Create a slider with stepper buttons in the style of the stock configuration menus
  (MinimalSliderWithSteppersTemplate, mirrors Pulse's settings sliders)

  @param {string} frameName
  @param {table} parent
  @param {table} position
    An object containing configuration parameters for a SetPoint function call
  @param {table} sliderConfig
    {
      min - {number} minimum slider value
      max - {number} maximum slider value
      step - {number} value step per slider tick
      defaultValue - {number} initial value
      label - {string} title rendered above the slider
      formatValue - {function} optional value to display string formatter
      onValueChanged - {function} invoked with (owner, value) whenever the value changes
    }

  @return {table}
    The created slider frame
]]--
function me.CreateSliderWithSteppers(frameName, parent, position, sliderConfig)
  local function formatValue(value)
    if sliderConfig.formatValue then
      return sliderConfig.formatValue(value)
    end

    return value
  end

  local sliderOptions = Settings.CreateSliderOptions(sliderConfig.min, sliderConfig.max, sliderConfig.step)
  sliderOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value)
    return formatValue(value)
  end)
  sliderOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Min, function()
    return formatValue(sliderConfig.min)
  end)
  sliderOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Max, function()
    return formatValue(sliderConfig.max)
  end)
  sliderOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Top, function()
    return sliderConfig.label
  end)

  local sliderFrame = CreateFrame("Frame", frameName, parent, "MinimalSliderWithSteppersTemplate")
  sliderFrame:SetWidth(RGPVPW_CONSTANTS.SLIDER_WITH_STEPPERS_WIDTH)
  sliderFrame:SetPoint(unpack(position))
  sliderFrame:Init(
    sliderConfig.defaultValue,
    sliderOptions.minValue,
    sliderOptions.maxValue,
    sliderOptions.steps,
    sliderOptions.formatters
  )

  if sliderConfig.onValueChanged then
    sliderFrame:RegisterCallback("OnValueChanged", sliderConfig.onValueChanged, sliderFrame)
  end

  return sliderFrame
end

--[[
  Generic option-panel slider builder - a compact positional wrapper around
  CreateSliderWithSteppers that reads the initial value via getValue and forwards value
  changes to setValue.

  @param {table} frame
  @param {string} name
  @param {string} label
  @param {number} min
  @param {number} max
  @param {number} step
  @param {number} posX
  @param {number} posY
  @param {function} getValue
  @param {function} setValue
    Invoked with (value) whenever the value changes
  @param {function} formatValue
    Optional value to display string formatter

  @return {table}
    The created slider
]]--
function me.CreateSlider(frame, name, label, min, max, step, posX, posY, getValue, setValue, formatValue)
  return me.CreateSliderWithSteppers(
    name,
    frame,
    {"TOPLEFT", posX, posY},
    {
      min = min,
      max = max,
      step = step,
      defaultValue = getValue(),
      label = label,
      formatValue = formatValue,
      onValueChanged = function(_, value)
        setValue(value)
      end
    }
  )
end

--[[
  Create the drag handler pair for a movable frame whose position is persisted. Both handlers
  are gated on the canMove predicate; once the drag ends the frame's position is saved under
  frameName (see Configuration.SaveUserPlacedFramePosition).

  @param {string} frameName
    The name the position is persisted under
  @param {function} canMove
    Predicate - the frame only starts/stops moving while it returns true

  @return {function}, {function}
    The drag start (OnMouseDown/OnDragStart) and drag stop (OnMouseUp/OnDragStop) handlers
]]--
function me.CreateDragHandlers(frameName, canMove)
  local function startDrag(self)
    if not canMove() then return end

    self:StartMoving()
  end

  local function stopDrag(self)
    if not canMove() then return end

    self:StopMovingOrSizing()

    local point, relativeTo, relativePoint, posX, posY = self:GetPoint()

    mod.configuration.SaveUserPlacedFramePosition(
      frameName,
      point,
      relativeTo and relativeTo:GetName() or nil, -- persist the name, frames cannot round-trip SavedVariables
      relativePoint,
      posX,
      posY
    )
  end

  return startDrag, stopDrag
end

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
  @param {string} description
    Optional always-visible gray description rendered directly beneath the checkbox

  @return {table}
    The created checkbox
]]--
function me.CreateCheckBox(frameName, parent, position, onClickCallback, onShowCallback, text, description)
  local checkBoxFrame = CreateFrame(
    "CheckButton",
    frameName,
    parent,
    "SettingsCheckboxTemplate"
  )
  checkBoxFrame:SetSize(
    RGPVPW_CONSTANTS.CATEGORY_CHECK_BOX_SIZE,
    RGPVPW_CONSTANTS.CATEGORY_CHECK_BOX_SIZE
  )
  checkBoxFrame:SetPoint(unpack(position))

  --[[ the template's inherited hover scripts drive the settings-list row highlight and
       misbehave outside that list - remove them ]]--
  checkBoxFrame:SetScript("OnEnter", nil)
  checkBoxFrame:SetScript("OnLeave", nil)

  --[[ the template ships no label - the settings list rows normally provide it ]]--
  local labelFontString = checkBoxFrame:CreateFontString(nil, "OVERLAY")
  labelFontString:SetFont(STANDARD_TEXT_FONT, 15)
  me.SetColor(labelFontString, RGPVPW_CONSTANTS.COLOR.BODY)
  labelFontString:SetPoint("LEFT", checkBoxFrame, "RIGHT", 5, 0)
  checkBoxFrame.text = labelFontString

  if text ~= nil then
    checkBoxFrame.text:SetText(text)
  end

  if description ~= nil then
    local descriptionFontString = checkBoxFrame:CreateFontString(nil, "OVERLAY")
    descriptionFontString:SetFont(STANDARD_TEXT_FONT, 12)
    me.SetColor(descriptionFontString, RGPVPW_CONSTANTS.COLOR.SUBNOTE)
    descriptionFontString:SetPoint("TOPLEFT", checkBoxFrame, "BOTTOMLEFT", 4, -2)
    descriptionFontString:SetJustifyH("LEFT")
    descriptionFontString:SetText(description)
    checkBoxFrame.description = descriptionFontString
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

  @param {table} frame
  @param {string} frameName
    The name the position is persisted under
  @param {table} defaultPosition
    Optional SetPoint arguments applied when no (valid) position is saved. Without it the
    frame keeps its current points, or gets an initial CENTER position when it has none.
]]--
function me.LoadFramePosition(frame, frameName, defaultPosition)
  local framePosition = mod.configuration.GetUserPlacedFramePosition(frameName)

  -- discard positions saved by versions that persisted the relativeTo frame object itself
  if framePosition ~= nil and type(framePosition.relativeTo) == "table" then
    mod.logger.LogWarn(me.tag, "Discarding corrupted saved frame position for - " .. frameName)
    framePosition = nil
  end
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
  elseif defaultPosition ~= nil then
    frame:ClearAllPoints()
    frame:SetPoint(unpack(defaultPosition))
  elseif frame:GetNumPoints() == 0 then
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
  me.SetColor(checkButton.text, RGPVPW_CONSTANTS.COLOR.DISABLED)
end

--[[
  Enables a checkButton and updates the text to white

  @param {table} checkButton
    The checkButton to enable
]]
function me.EnableCheckButton(checkButton)
  checkButton:Enable()
  me.SetColor(checkButton.text, RGPVPW_CONSTANTS.COLOR.BODY)
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
  spellTitleFontString:SetJustifyH("LEFT")
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
    -5,
    0
  )
  me.SetColor(visualWarningLabelFontString, RGPVPW_CONSTANTS.COLOR.BODY)
  visualWarningLabelFontString:SetText(labelText)
  visualWarningLabelFontString:SetWidth(
    visualWarningLabelFontString:GetStringWidth()
  )

  return visualWarningLabelFontString
end

--[[
  Create the gold title shared by all option sub-panels

  @param {table} parentFrame
    The panel frame to attach to
  @param {string} frameName
    A reference name for the fontString
  @param {string} text
    The already localized title text

  @return {table}
    The created fontString
]]--
function me.CreatePanelTitle(parentFrame, frameName, text)
  local titleFontString = parentFrame:CreateFontString(frameName, "OVERLAY", "GameFontNormalLarge")
  titleFontString:SetPoint("TOPLEFT", 16, -16)
  me.SetColor(titleFontString, RGPVPW_CONSTANTS.COLOR.TITLE_GOLD)
  titleFontString:SetText(text)

  return titleFontString
end

--[[
  Create a dropdown with alert color textures to choose

  @param {table} parentFrame
  @param {string} dropdownName
  @param {function} onColorSelected
    Invoked with (dropdown, colorValue) when the player picks a color

  @return {table}
    The created dropdown
]]--
function me.CreateVisualWarningDropdown(parentFrame, dropdownName, onColorSelected)
  local chooseVisualWarningDropdownMenu = me.CreateSettingsDropdown(
    dropdownName .. parentFrame.position,
    parentFrame,
    --[[ left-align with the sound checkbox column above ]]--
    {"LEFT", parentFrame.spellTitle, "RIGHT", 0, -30},
    150,
    function(dropdown, rootDescription)
      for colorName, color in pairs(RGPVPW_CONSTANTS.TEXTURES) do
        rootDescription:CreateRadio(
          rgpvpw.L["texture_" .. colorName],
          function(colorValue)
            return dropdown.selectedColorValue == colorValue
          end,
          function(colorValue)
            dropdown.selectedColorValue = colorValue
            onColorSelected(dropdown, colorValue)
          end,
          color.colorValue
        )
      end
    end
  )
  chooseVisualWarningDropdownMenu.position = parentFrame.position
  chooseVisualWarningDropdownMenu.selectedColorValue = RGPVPW_CONSTANTS.TEXTURES.none.colorValue

  return chooseVisualWarningDropdownMenu
end

--[[
  Build an icon holder UI element that can display a texture with a backdrop

  @param {string} frameName
    A reference name for the frame that holds the texture
  @param {string} textureName
    A reference name for the texture
  @param {table} position
    The initial position of the frame
  @param {table} borderColor
    The color to use for the border of the iconHolder
  @param {function} dragFrameCallback
    The function that registers the dragFrame listeners
  @param {string} defaultTexture
    Optional default texture to display

  @return {table}
    The created texture object with iconHolder reference
]]--
function me.BuildIconHolderUi(frameName, textureName, position, borderColor, dragFrameCallback, defaultTexture)
  local iconHolder = CreateFrame("Frame", frameName, TargetFrame, "BackdropTemplate")
  iconHolder:SetSize(
    RGPVPW_CONSTANTS.STATE_ICON_HOLDER_ICON_SIZE + 5,
    RGPVPW_CONSTANTS.STATE_ICON_HOLDER_ICON_SIZE + 5
  )
  iconHolder:SetPoint(unpack(position))
  iconHolder:SetMovable(true)
  iconHolder:SetClampedToScreen(true)

  me.LoadFramePosition(iconHolder, frameName)
  dragFrameCallback(iconHolder)

  local texture = iconHolder:CreateTexture(textureName, "ARTWORK")
  texture.iconHolder = iconHolder
  texture:SetTexCoord(0.07, 0.93, 0.07, 0.93)
  texture:SetPoint("CENTER", 0, 0)
  texture:SetSize(
    RGPVPW_CONSTANTS.STATE_ICON_HOLDER_ICON_SIZE,
    RGPVPW_CONSTANTS.STATE_ICON_HOLDER_ICON_SIZE
  )

  local backdrop = {
    bgFile = "Interface\\AddOns\\PVPWarn\\assets\\images\\ui_slot_background",
    edgeFile = "Interface\\AddOns\\PVPWarn\\assets\\images\\ui_slot_background",
    tile = false,
    tileSize = 32,
    edgeSize = 20,
    insets = {
      left = 2,
      right = 2,
      top = 2,
      bottom = 2
    }
  }

  iconHolder:SetBackdrop(backdrop)
  texture.iconHolder:SetBackdropBorderColor(unpack(borderColor))

  if defaultTexture ~= nil then
    texture:SetTexture(defaultTexture)
  end

  iconHolder:Hide()

  return texture
end
