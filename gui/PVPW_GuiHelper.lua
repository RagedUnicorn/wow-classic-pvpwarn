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

-- luacheck: globals CreateFrame STANDARD_TEXT_FONT

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

  @retun {table}
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

  checkBoxFrame.text = _G[checkBoxFrame:GetName() .. 'Text']
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
  playButton:SetScript('OnClick', callback)

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
  local button = {}

  button.text = rgpvpw.L["texture_" .. text]
  button.value = value
  button.func = callback

  return button
end

--[[
  Resize button width to the size if its text

  @param {table} button
  TODO rename to resize to element isntead of only button
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
