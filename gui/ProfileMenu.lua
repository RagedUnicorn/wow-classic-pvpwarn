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

-- luacheck: globals CreateFrame StaticPopupDialogs StaticPopup_Show STANDARD_TEXT_FONT
-- luacheck: globals FauxScrollFrame_Update FauxScrollFrame_GetOffset

local mod = rgpvpw
local me = {}
mod.profileMenu = me

me.tag = "ProfileMenu"

-- track whether the menu was already built
local builtMenu = false

local profileRows = {}
-- holds a reference to the profile scrollFrame
local profileListScrollFrame
-- the name of the currently selected profile in the profile list
local currentSelectedProfileName

--[[
  Get the currently selected profile name from the profile list.
  If no profile is selected, nil will be returned.

  @return {string}
    The name of the currently selected profile or nil if no profile is selected
]]--
function me.GetCurrentSelectedProfileName()
  return currentSelectedProfileName
end

--[[
  Reset the currently selected profile.
]]--
function me.ResetCurrentSelectedProfileName()
  currentSelectedProfileName = nil
end

--[[
  Set the currently selected profile to the given profile name.
  If the profile name is nil or empty, the current selected profile will be reset.

  @param {string} profileName
    The name of the profile to set as currently selected
]]--
function me.SetCurrentSelectedProfileName(profileName)
  if profileName and profileName ~= "" then
    currentSelectedProfileName = profileName
  else
    currentSelectedProfileName = nil
  end
end

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
    me.ClearSelectedProfile()
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
StaticPopupDialogs["RGPVPW_DELETE_PROFILE_WARNING"] = {
  text = rgpvpw.L["confirm_delete_profile_dialog_text"],
  button1 = rgpvpw.L["confirm_delete_profile_yes_button"],
  button2 = rgpvpw.L["confirm_delete_profile_no_button"],
  OnAccept = function()
    mod.profile.DeleteProfile(me.GetCurrentSelectedProfileName())
    me.ProfileListUpdateOnUpdate(profileListScrollFrame)
    me.ClearSelectedProfile()
  end,
  timeout = 0,
  whileDead = true,
  preferredIndex = 4
}

--[[
  Popup dialog warning before loading a profile
]]--
StaticPopupDialogs["RGPVPW_LOAD_PROFILE_WARNING"] = {
  text = rgpvpw.L["confirm_load_profile_dialog_text"],
  button1 = rgpvpw.L["confirm_load_profile_yes_button"],
  button2 = rgpvpw.L["confirm_load_profile_no_button"],
  OnAccept = function()
    mod.profile.LoadProfile(me.GetCurrentSelectedProfileName())
    me.ProfileListUpdateOnUpdate(profileListScrollFrame)
    me.ClearSelectedProfile()
  end,
  timeout = 0,
  whileDead = true,
  preferredIndex = 4
}

--[[
  Popup dialog warning before updating the selected profile
]]--
StaticPopupDialogs["RGPVPW_UPDATE_PROFILE_WARNING"] = {
  text = rgpvpw.L["confirm_override_profile_dialog_text"],
  button1 = rgpvpw.L["confirm_override_profile_yes_button"],
  button2 = rgpvpw.L["confirm_override_profile_no_button"],
  OnAccept = function()
    mod.profile.UpdateProfile(me.GetCurrentSelectedProfileName())
    me.ProfileListUpdateOnUpdate(profileListScrollFrame)
    me.ClearSelectedProfile()
  end,
  timeout = 0,
  whileDead = true,
  preferredIndex = 4
}

--[[
  @param {table} frame
]]--
function me.Init(frame)
  if builtMenu then
    me.ProfileListUpdateOnUpdate(profileListScrollFrame)
  else
    me.BuildUi(frame)
  end
end

--[[
  @param {table} frame
]]--
function me.BuildUi(frame)
  me.CreateProfileTitle(frame)
  profileListScrollFrame = me.CreateProfileListScrollFrame(frame)
  -- creates a button that creates a new profile based on the current configuration
  local saveButton = me.CreateConfigurationButton(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_SAVE_PROFILE_BUTTON,
    {"BOTTOMLEFT", profileListScrollFrame, "BOTTOMLEFT", 0, -40},
    rgpvpw.L["save_current_profile_button"],
    me.SaveProfileOnClick
  )
  -- create a button that allows to delete the selected profile
  local deleteButton = me.CreateConfigurationButton(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_DELETE_PROFILE_BUTTON,
    {"LEFT", saveButton, "RIGHT", 0, 0},
    rgpvpw.L["delete_selected_profile_button"],
    me.DeleteSelectedProfileButtonOnClick
  )
  -- create a button that loads the selected profile
  local loadButton = me.CreateConfigurationButton(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_LOAD_PROFILE_BUTTON,
    {"LEFT", deleteButton, "RIGHT", 0, 0},
    rgpvpw.L["load_selected_profile_button"],
    me.LoadSelectedProfileButtonOnClick
  )

  -- create a button that updates the selected profile
  me.CreateConfigurationButton(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_UPDATE_PROFILE_BUTTON,
    {"LEFT", loadButton, "RIGHT", 0, 0},
    rgpvpw.L["update_profile_button"],
    me.UpdateProfileButtonOnClick
  )

  -- init scrollFrame
  me.ProfileListUpdateOnUpdate(profileListScrollFrame)
  builtMenu = true
end

--[[
  Create a label for profiles

  @param {table} frame

  @return {table}
    The created fontString
]]--
function me.CreateProfileTitle(parentFrame)
  local profileTitleFontString = parentFrame:CreateFontString(RGPVPW_CONSTANTS.ELEMENT_PROFILE_TITLE, "OVERLAY")
  profileTitleFontString:SetFont(STANDARD_TEXT_FONT, 20)
  profileTitleFontString:SetPoint("TOP", 0, -20)
  profileTitleFontString:SetSize(parentFrame:GetWidth(), 20)
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
    "FauxScrollFrameTemplate, BackdropTemplate"
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
  @param {table} frame
  @param {number} position

  @return {table}
    The created row
]]--
function me.CreateRowFrame(frame, position)
  local row = CreateFrame(
    "Button", RGPVPW_CONSTANTS.ELEMENT_PROFILE_LIST_CONTENT_FRAME .. position, frame, "BackdropTemplate")
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
  profileNameFontString:SetJustifyH("LEFT")
  profileNameFontString:SetWidth(profileFrame:GetWidth())
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
  local maxValue = #profiles

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
      local profileName = profile.name

      if mod.profile.GetActiveProfileName() == profile.name then
        profileName = profileName .. " (active)"

        if mod.profile.IsModified() then
          profileName = profileName .. "*"
        end
      end
      row.profileName.name = profile.name
      row.profileName:SetText(profileName)
      row:Show()
    else
      row.profileName:SetText("")
      row.profileName.name = ""
      row:Hide()
    end
  end
end

--[[
  Cell onClick callback for profileslist cells

  @param {table} self
    A reference to the clicked row
]]--
function me.ProfileListCellOnClick(self)
  -- Only select profile if it has a valid name
  if self.profileName.name and self.profileName.name ~= "" then
    me.SetCurrentSelectedProfileName(self.profileName.name)
    -- clear all current highlighting
    me.ClearCellList()

    self.selectedRow = true
    self.highlight:Show()
  end
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
  Clear the highlight of the currently selected row.
  This will reset the current selected profile name.
]]--
function me.ClearSelectedProfile()
  me.ClearCellList()
  me.ResetCurrentSelectedProfileName()
end

--[[
  @param {table} parentFrame
  @param {string} frameName
  @param {table} position
  @param {string} text
  @param {function} callback

  @return {table}
    The created button
]]--
function me.CreateConfigurationButton(parentFrame, frameName, position, text, callback)
  -- create save configuration button
  local configurationButton = CreateFrame(
    "Button",
    frameName,
    parentFrame,
    "UIPanelButtonTemplate"
  )

  configurationButton:SetHeight(RGPVPW_CONSTANTS.BUTTON_DEFAULT_HEIGHT)
  configurationButton:SetText(text)
  configurationButton:SetPoint(unpack(position))
  configurationButton:SetScript("OnClick", callback)

  mod.guiHelper.ResizeButtonToText(configurationButton)

  return configurationButton
end

--[[
  Button callback to save the current user configuration. This will invoke a popup
  dialog for the user to choose a name for the profile.
]]--
function me.SaveProfileOnClick()
  StaticPopup_Show("RGPVPW_CHOOSE_PROFILE_NAME")
end

--[[
  Button callback to delete the selected user configuration. This will invoke a popup
  dialog for the user to confirm the action.
]]--
function me.DeleteSelectedProfileButtonOnClick()
  local selectedProfileName = me.GetCurrentSelectedProfileName()

  if not selectedProfileName or selectedProfileName == "" then
    mod.logger.PrintUserError(rgpvpw.L["user_message_select_profile_before_delete"])
    return
  end

  if selectedProfileName == RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME then
    mod.logger.PrintUserError(rgpvpw.L["user_message_default_profile_cannot_be_deleted"])
    return
  end

  StaticPopup_Show("RGPVPW_DELETE_PROFILE_WARNING")
end

--[[
  Button callback to load the selected user configuration. This will invoke a popup
  dialog for the user to confirm the action.
]]--
function me.LoadSelectedProfileButtonOnClick()
  local selectedProfileName = me.GetCurrentSelectedProfileName()

  if selectedProfileName and selectedProfileName ~= "" then
    StaticPopup_Show("RGPVPW_LOAD_PROFILE_WARNING")
  else
    mod.logger.PrintUserError(rgpvpw.L["user_message_select_profile_before_load"])
  end
end

--[[
  Button callback to update the selected profiles configuration with the current one. This will invoke a popup
  dialog for the user to confirm the action.
]]--
function me.UpdateProfileButtonOnClick()
  local selectedProfileName = me.GetCurrentSelectedProfileName()

  if not selectedProfileName or selectedProfileName == "" then
    mod.logger.PrintUserError(rgpvpw.L["user_message_select_profile_before_update"])
    return
  end

  if selectedProfileName == RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME then
    mod.logger.PrintUserError(rgpvpw.L["user_message_default_profile_cannot_be_modified"])
    return
  end

  StaticPopup_Show("RGPVPW_UPDATE_PROFILE_WARNING")
end
