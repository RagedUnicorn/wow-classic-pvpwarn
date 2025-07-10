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

-- luacheck: globals CreateFrame STANDARD_TEXT_FONT

local mod = rgpvpw
local me = {}
mod.voicePackMenu = me

me.tag = "VoicePackMenu"

-- track whether the menu was already built
local builtMenu = false

-- reference to the dropdown frame
local voicePackDropdown

--[[
  Build the ui for the voice pack menu

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildUi(frame)
  if builtMenu then return end

  me.BuildTitle(frame)
  me.BuildVoicePackDropdown(frame)

  builtMenu = true
end

--[[
  Build the title for the voice pack menu

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildTitle(frame)
  local titleFontString = frame:CreateFontString(RGPVPW_CONSTANTS.ELEMENT_VOICE_PACK_TITLE, "OVERLAY")
  titleFontString:SetFont(STANDARD_TEXT_FONT, 20)
  titleFontString:SetPoint("TOP", 0, -20)
  titleFontString:SetSize(frame:GetWidth(), 20)
  titleFontString:SetText(rgpvpw.L["voice_pack_title"])
end

--[[
  Build the voice pack dropdown menu

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildVoicePackDropdown(frame)
  local dropdownLabel = frame:CreateFontString(nil, "OVERLAY")
  dropdownLabel:SetFont(STANDARD_TEXT_FONT, 15)
  dropdownLabel:SetPoint("TOPLEFT", 20, -80)
  dropdownLabel:SetTextColor(.95, .95, .95)
  dropdownLabel:SetText(rgpvpw.L["voice_pack_dropdown_label"])

  voicePackDropdown = mod.libUiDropDownMenu.CreateUiDropDownMenu(
    RGPVPW_CONSTANTS.ELEMENT_VOICE_PACK_DROPDOWN,
    frame
  )
  voicePackDropdown:SetPoint("LEFT", dropdownLabel, "RIGHT", 10, -2)

  mod.libUiDropDownMenu.UiDropDownMenu_Initialize(voicePackDropdown, me.InitializeDropdown)

  me.UpdateDropdownWidth()
  me.UpdateDropdownSelection()
end

--[[
  Initialize the dropdown menu with available voice packs
]]--
function me.InitializeDropdown()
  local voicePacks = mod.voicePack.GetRegisteredVoicePacks()

  for name, voicePack in pairs(voicePacks) do
    local info = mod.libUiDropDownMenu.UiDropDownMenu_CreateInfo()
    info.text = voicePack.displayName
    info.value = name
    info.func = me.OnVoicePackSelect
    info.checked = mod.configuration.GetActiveVoicePack() == name
    mod.libUiDropDownMenu.UiDropDownMenu_AddButton(info)
  end

  me.UpdateDropdownWidth()
end

--[[
  Callback for when a voice pack is selected

  @param {table} self
    The menu item that was clicked
]]--
function me.OnVoicePackSelect(self)
  local voicePackName = self.value

  mod.configuration.SetActiveVoicePack(voicePackName)
  mod.voicePack.SetActiveVoicePack(voicePackName)
  me.UpdateDropdownSelection()
  me.UpdateDropdownWidth()
  mod.libUiDropDownMenu.CloseDropDownMenus()

  mod.logger.LogInfo(me.tag, "Selected voice pack: " .. voicePackName)
end

--[[
  Update the dropdown to show the currently selected voice pack
]]--
function me.UpdateDropdownSelection()
  local activeVoicePack = mod.configuration.GetActiveVoicePack()
  local voicePacks = mod.voicePack.GetRegisteredVoicePacks()
  local voicePack = voicePacks[activeVoicePack]
  local displayText = voicePack and voicePack.displayName or rgpvpw.L["voice_pack_default"]

  mod.libUiDropDownMenu.UiDropDownMenu_SetText(voicePackDropdown, displayText)
end

--[[
  Calculate and update the dropdown width based on the longest text
]]--
function me.UpdateDropdownWidth()
  if not voicePackDropdown then return end

  -- create a temporary font string to measure text width
  local tempFontString = voicePackDropdown:CreateFontString(nil, "ARTWORK")
  tempFontString:SetFont(STANDARD_TEXT_FONT, 12) -- standard dropdown font size

  local maxWidth = 0
  local voicePacks = mod.voicePack.GetRegisteredVoicePacks()

  -- measure all voice pack display names
  for _, voicePack in pairs(voicePacks) do
    tempFontString:SetText(voicePack.displayName)
    local textWidth = tempFontString:GetStringWidth()
    if textWidth > maxWidth then
      maxWidth = textWidth
    end
  end

  tempFontString:Hide()

  -- add padding for dropdown arrow and margins (typically 40-50 pixels)
  local dropdownWidth = maxWidth + 50

  -- set minimum width to ensure it doesn't look too small
  if dropdownWidth < RGPVPW_CONSTANTS.ELEMENT_VOICE_PACK_DROPDOWN_MIN_WIDTH then
    dropdownWidth = RGPVPW_CONSTANTS.ELEMENT_VOICE_PACK_DROPDOWN_MIN_WIDTH
  end

  mod.libUiDropDownMenu.UiDropDownMenu_SetWidth(voicePackDropdown, dropdownWidth)
end
