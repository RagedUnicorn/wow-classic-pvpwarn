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

-- luacheck: globals CreateFrame StaticPopupDialogs StaticPopup_Show STANDARD_TEXT_FONT
-- luacheck: globals FauxScrollFrame_Update FauxScrollFrame_GetOffset

local mod = rgpvpw
local me = {}
mod.profileMenu = me

me.tag = "ProfileMenu"

local profileRows = {}
-- holds a reference to the profile scrollFrame
local profileListScrollFrame
-- the name of the currently selected profile in the profile list
local currentSelectedProfile = nil

--[[
  Popup dialog for choosing a profile name
]]--
StaticPopupDialogs["RGPVPW_CHOOSE_PROFILE_NAME"] = {
  text = rgpvpw.L["choose_profile_name_dialog_text"],
  button1 = rgpvpw.L["choose_profile_name_accept_button"],
  button2 = rgpvpw.L["choose_profile_name_cancel_button"],
  OnShow = function(self)
    local editBox = self:GetParent().editBox
    local button1 = self:GetParent().button1

    if editBox ~= nil and button1 ~= nil then
      button1:Disable()
      editBox:SetText("") -- reset text to empty
    end
  end,
  OnAccept = function(self)
    mod.profile.CreateProfile(self.editBox:GetText())
    me.ProfileListUpdateOnUpdate(profileListScrollFrame)
  end,
  EditBoxOnTextChanged = function(self)
    local editBox = self:GetParent().editBox
    local button1 = self:GetParent().button1

    if editBox ~= nil and button1 ~= nil then
      if string.len(editBox:GetText()) > 0 then
        button1:Enable()
      else
        button1:Disable()
      end
    end
  end,
  timeout = 0,
  whileDead = true,
  preferredIndex = 3,
  hasEditBox = true,
  maxLetters = mod.profile.GetMaxProfileNameLength()
}

--[[
  Popup dialog warning before deleting a profile
]]--
StaticPopupDialogs["PVPW_DELETE_PROFILE_WARNING"] = {
  text = rgpvpw.L["confirm_delete_profile_dialog_text"],
  button1 = rgpvpw.L["confirm_delete_profile_yes_button"],
  button2 = rgpvpw.L["confirm_delete_profile_no_button"],
  OnAccept = function()
    mod.profile.DeleteProfile(currentSelectedProfile)
    me.ProfileListUpdateOnUpdate(profileListScrollFrame)
  end,
  timeout = 0,
  whileDead = true,
  preferredIndex = 4
}

--[[
  Popup dialog warning before loading a profile
]]--
StaticPopupDialogs["PVPW_CHANGE_PROFILE_WARNING"] = {
  text = rgpvpw.L["confirm_override_profile_dialog_text"],
  button1 = rgpvpw.L["confirm_override_profile_yes_button"],
  button2 = rgpvpw.L["confirm_override_profile_no_button"],
  OnAccept = function(default) -- TODO default where is that coming from?
    if default then
      -- mod.profile.ActivateDefaultProfile()
    else
      -- mod.profile.ActivateProfile(currentSelectedProfile) TODO
      -- me.ProfileListUpdate() -- update visual list
    end
  end,
  timeout = 0,
  whileDead = true,
  preferredIndex = 4
}

--[[
  @param {table} frame
]]--
function me.BuildUi(frame)
  me.CreateProfileTitle(frame)
  profileListScrollFrame = me.CreateProfileListScrollFrame(frame)
  local saveButton = me.CreateProfileSaveButton(frame, profileListScrollFrame)
  local deleteButton = me.CreateDeleteProfileButton(frame, saveButton)
  local loadButton = me.CreateLoadProfileButton(frame, deleteButton)

  -- init scrollFrame
  me.ProfileListUpdateOnUpdate(profileListScrollFrame)
end

--[[
  Create a label for profiles

  @param {table} frame

  @return {table}
    The created fontString
]]--
function me.CreateProfileTitle(frame)
  local profileTitleFontString = frame:CreateFontString(RGPVPW_CONSTANTS.ELEMENT_PROFILE_TITLE, "OVERLAY")
  profileTitleFontString:SetFont(STANDARD_TEXT_FONT, 15)
  profileTitleFontString:SetPoint(
    "TOPLEFT", 15, -15
  )
  profileTitleFontString:SetTextColor(.95, .95, .95)
  profileTitleFontString:SetText(rgpvpw.L["configuration_menu_profiles"])

  return profileTitleFontString
end

--[[
  Create a scrollFrame with a list of all current profiles

  @param {table} frame
]]--
function me.CreateProfileListScrollFrame(frame)
  local scrollFrame = CreateFrame(
    "ScrollFrame",
    RGPVPW_CONSTANTS.ELEMENT_PROFILE_LIST_SCROLL_FRAME,
    frame,
    "FauxScrollFrameTemplate"
  )
  scrollFrame:SetWidth(RGPVPW_CONSTANTS.PROFILE_LIST_CONTENT_FRAME_WIDTH)
  scrollFrame:SetHeight(RGPVPW_CONSTANTS.PROFILE_LIST_ROW_HEIGHT * RGPVPW_CONSTANTS.PROFILE_LIST_MAX_ROWS)
  scrollFrame:EnableMouseWheel(true)
  scrollFrame:SetPoint("TOPLEFT", frame, 5, -50)

  scrollFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    insets = {left = 0, right = 0, top = 0, bottom = 0},
  })

  scrollFrame:SetScript("OnVerticalScroll", function(self, offset)
    self.ScrollBar:SetValue(offset)
    self.offset = math.floor(offset / RGPVPW_CONSTANTS.PROFILE_LIST_ROW_HEIGHT + 0.5)
    me.ProfileListUpdateOnUpdate(self)
  end)

  for i = 1, RGPVPW_CONSTANTS.PROFILE_LIST_MAX_ROWS do
    table.insert(profileRows, me.CreateRowFrame(scrollFrame, i))
  end

  return scrollFrame
end

--[[
  TODO

  @param {table} frame
  @param {number} position

  @return {table}
    The created row
]]--
function me.CreateRowFrame(frame, position)
  local row = CreateFrame("Button", RGPVPW_CONSTANTS.ELEMENT_PROFILE_LIST_CONTENT_FRAME .. position, frame)
  row:SetSize(frame:GetWidth(), RGPVPW_CONSTANTS.PROFILE_LIST_ROW_HEIGHT)
  row:SetPoint("TOPLEFT", frame, 0, (position -1) * RGPVPW_CONSTANTS.PROFILE_LIST_ROW_HEIGHT * -1)

  row:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    insets = {left = 0, right = 0, top = 0, bottom = 0},
  })

  if math.fmod(position, 2) == 0 then
    row:SetBackdropColor(0.37, 0.37, 0.37, .4)
  else
    row:SetBackdropColor(.25, .25, .25, .8)
  end

  row.profileName = me.CreateProfileName(row)
  row.highlight = me.CreateHighlightTexture(row)

  row:SetScript("OnClick", me.ProfileListCellOnClick)

  return row
end

--[[
  Create fontstring for title of the profile to configure

  @param {table} profileFrame

  @return {table}
    The created fontstring
]]--
function me.CreateProfileName(profileFrame)
  local profileNameFontString = profileFrame:CreateFontString(RGPVPW_CONSTANTS.ELEMENT_PROFILE_NAME, "OVERLAY")
  profileNameFontString:SetFont(STANDARD_TEXT_FONT, 15)
  profileNameFontString:SetWidth(RGPVPW_CONSTANTS.PROFILE_NAME_WIDTH)
  profileNameFontString:SetPoint(
    "LEFT", 0, 0
  )
  profileNameFontString:SetTextColor(.95, .95, .95)

  return profileNameFontString
end

--[[
  Create a texture that allows to mark the active state of a row

  @param {table} row

  @return {table}
    The created texture
]]--
function me.CreateHighlightTexture(row)
  local highlightTexture = row:CreateTexture(RGPVPW_CONSTANTS.ELEMENT_PROFILE_LIST_ROW_HIGHLIGHT, "BACKGROUND")
  highlightTexture:SetSize(row:GetWidth(), row:GetHeight())
  highlightTexture:SetPoint("TOPLEFT")
  highlightTexture:SetTexture("Interface\\QuestFrame\\UI-QuestLogTitleHighlight")
  highlightTexture:SetBlendMode("ADD")
  highlightTexture:Hide()

  return highlightTexture
end

--[[
  FauxScrollFrame callback for profileslist

  @param {table} scrollFrame
]]--
function me.ProfileListUpdateOnUpdate(scrollFrame)
  local profiles = PVPWarnProfiles
  local maxValue = mod.common.TableLength(profiles) or 0

  if maxValue <= RGPVPW_CONSTANTS.PROFILE_LIST_MAX_ROWS then
    maxValue = RGPVPW_CONSTANTS.PROFILE_LIST_MAX_ROWS + 1
  end
  -- Note: maxValue needs to be at least max_rows + 1
  FauxScrollFrame_Update(
    scrollFrame,
    maxValue,
    RGPVPW_CONSTANTS.PROFILE_LIST_MAX_ROWS,
    RGPVPW_CONSTANTS.PROFILE_LIST_ROW_HEIGHT
  )

  local offset = FauxScrollFrame_GetOffset(scrollFrame)

  for i = 1, RGPVPW_CONSTANTS.PROFILE_LIST_MAX_ROWS do
    local row = profileRows[i]
    local profile = profiles[offset + i]

    if profile ~= nil then
      row.profileName:SetText(profiles[offset + i].name)
    else
      row.profileName:SetText("")
    end

    row:Show()
  end
end

--[[
  Cell onClick callback for profileslist cells

  @param {table} self
    A reference to the clicked row
]]--
function me.ProfileListCellOnClick(self)
  currentSelectedProfile = self.profileName:GetText()
  -- clear all current highlighting
  me.ClearCellList()

  self.selectedRow = true
  self.highlight:Show()
end

--[[
  Hide the highlight of all rows
]]--
function me.ClearCellList()
  for _, profileRow in pairs(profileRows) do
    profileRow.selectedRow = false
    profileRow.highlight:Hide()
  end
end

--[[
  Create a button that TODO

  @param {table} parentFrame
  @param {table} relativeFrame

  @return {table}
    The created button
]]--
function me.CreateProfileSaveButton(parentFrame, relativeFrame)
  -- create save configuration button
  local saveConfigurationButton = CreateFrame(
    "Button",
    RGPVPW_CONSTANTS.ELEMENT_SAVE_PROFILE_BUTTON,
    parentFrame,
    "UIPanelButtonTemplate"
  )

  saveConfigurationButton:SetPoint(
    "BOTTOMLEFT",
    relativeFrame,
    "BOTTOMLEFT",
    0, -40
  )

  saveConfigurationButton:SetText(rgpvpw.L["save_current_profile_button"])
  saveConfigurationButton:SetScript('OnClick', me.SaveProfileOnClick)

  mod.guiHelper.ResizeButtonToText(saveConfigurationButton)

  return saveConfigurationButton
end

--[[
  Button callback to save the current user configuration. This will invoke a popup
  dialog for the user to choose a name for the profile.
]]--
function me.SaveProfileOnClick()
  StaticPopup_Show("RGPVPW_CHOOSE_PROFILE_NAME")
end

--[[
  Create a button that allows to delete the selected profile

  @param {table} parentFrame
  @param {table} relativeFrame

  @return {table}
    The created button
]]--
function me.CreateDeleteProfileButton(parentFrame, relativeFrame)
  local deleteProfileButton = CreateFrame(
    "Button",
    RGPVPW_CONSTANTS.ELEMENT_DELETE_PROFILE_BUTTON,
    parentFrame,
    "UIPanelButtonTemplate"
  )

  deleteProfileButton:SetPoint(
    "LEFT",
    relativeFrame,
    "RIGHT",
    0, 0
  )

  deleteProfileButton:SetHeight(32)
  deleteProfileButton:SetText(rgpvpw.L["delete_selected_profile_button"])
  deleteProfileButton:SetScript("OnClick", me.DeleteSelectedProfileButtonOnClick) -- TODO

  mod.guiHelper.ResizeButtonToText(deleteProfileButton)

  return deleteProfileButton
end

--[[
  TODO
]]--
function me.DeleteSelectedProfileButtonOnClick()
  StaticPopup_Show("PVPW_DELETE_PROFILE_WARNING")
end

--[[
  Create a button that loads the selected profile

  @param {table} parentFrame
  @param {table} relativeFrame

  @return {table}
    The created button
]]--
function me.CreateLoadProfileButton(parentFrame, relativeFrame)
  local loadProfileButton = CreateFrame(
    "Button",
    RGPVPW_CONSTANTS.ELEMENT_LOAD_PROFILE_BUTTON,
    parentFrame,
    "UIPanelButtonTemplate"
  )

  loadProfileButton:SetPoint(
    "LEFT",
    relativeFrame,
    "RIGHT",
    0, 0
  )

  loadProfileButton:SetHeight(32)
  loadProfileButton:SetText(rgpvpw.L["load_selected_profile_button"])
  loadProfileButton:SetScript("OnClick", me.LoadSelectedProfileButtonOnClick) -- TODO

  mod.guiHelper.ResizeButtonToText(loadProfileButton)

  return loadProfileButton
end

--[[
  TODO
]]--
function me.LoadSelectedProfileButtonOnClick()
  mod.logger.LogError(me.tag, "Load profile")
  StaticPopup_Show("PVPW_CHANGE_PROFILE_WARNING")
end

--[[
  Helper function to find elements inside a static popup dialog

  @param {table} context
  @param {string} elementName

  @return {table | nil}
    the element that was found or nil if none could be found
]]--
function me.FindDialogElementByName(context, elementName)
  for _, child in ipairs({context:GetParent():GetChildren()}) do
    a = child
    if string.find(child:GetName(), elementName) then
      return child
    end
  end

  return nil
end
