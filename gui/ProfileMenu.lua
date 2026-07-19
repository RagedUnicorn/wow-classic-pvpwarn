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

-- luacheck: globals CreateFrame StaticPopupDialogs StaticPopup_Show STANDARD_TEXT_FONT ScrollUtil

local mod = rgpvpw
local me = {}
mod.profileMenu = me

me.tag = "ProfileMenu"

-- track whether the menu was already built
local builtMenu = false

local profileRows = {}
-- holds a reference to the scrollable content frame the profile rows attach to
local profileListContent
-- the name of the currently selected profile in the profile list
local currentSelectedProfileName
-- the multiline edit box used for export/import strings
local profileStringEditBox

-- forward declaration
local FinishProfileImport

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
  OnShow = function(dialog)
    local editBox = dialog:GetEditBox()
    local button1 = dialog:GetButton1()

    if editBox ~= nil and button1 ~= nil then
      button1:Disable()
      editBox:SetText("") -- reset text to empty
      editBox:SetFocus()
    end
  end,
  OnAccept = function(dialog)
    mod.profile.CreateProfile(dialog:GetEditBox():GetText())
    me.ProfileListUpdateOnUpdate()
    me.ClearSelectedProfile()
  end,
  EditBoxOnTextChanged = function(editBox)
    local button1 = editBox:GetParent():GetButton1()

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
    me.ProfileListUpdateOnUpdate()
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
    me.ProfileListUpdateOnUpdate()
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
    me.ProfileListUpdateOnUpdate()
    me.ClearSelectedProfile()
  end,
  timeout = 0,
  whileDead = true,
  preferredIndex = 4
}

--[[
  Popup dialog for choosing a name for an imported profile. The validated
  envelope is passed as the dialog data payload.
]]--
StaticPopupDialogs["RGPVPW_IMPORT_PROFILE_NAME"] = {
  text = rgpvpw.L["profile_import_name_prompt"],
  button1 = rgpvpw.L["choose_profile_name_accept_button"],
  button2 = rgpvpw.L["choose_profile_name_cancel_button"],
  OnShow = function(dialog)
    local editBox = dialog:GetEditBox()
    local button1 = dialog:GetButton1()

    if editBox ~= nil and button1 ~= nil then
      editBox:SetText((dialog.data and dialog.data.name) or "")
      editBox:SetFocus()
      editBox:HighlightText()

      if string.len(editBox:GetText()) > 0 then
        button1:Enable()
      else
        button1:Disable()
      end
    end
  end,
  OnAccept = function(dialog)
    FinishProfileImport(dialog:GetEditBox():GetText(), dialog.data)
  end,
  EditBoxOnTextChanged = function(editBox)
    local button1 = editBox:GetParent():GetButton1()

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
  @param {table} frame
]]--
function me.Init(frame)
  if builtMenu then
    me.ProfileListUpdateOnUpdate()
  else
    me.BuildUi(frame)
  end
end

--[[
  @param {table} frame
]]--
function me.BuildUi(frame)
  mod.guiHelper.CreatePanelTitle(frame, RGPVPW_CONSTANTS.ELEMENT_PROFILE_TITLE, rgpvpw.L["configuration_menu_profiles"])

  local listLabel = frame:CreateFontString(nil, "OVERLAY")
  listLabel:SetFont(STANDARD_TEXT_FONT, 13)
  listLabel:SetPoint("TOPLEFT", 20, -46)
  listLabel:SetText(rgpvpw.L["profile_list_label"])

  me.CreateProfileList(frame)

  -- creates a button that creates a new profile based on the current configuration
  me.CreateConfigurationButton(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_SAVE_PROFILE_BUTTON,
    150,
    {"TOPLEFT", 320, -64},
    rgpvpw.L["save_current_profile_button"],
    me.SaveProfileOnClick
  )
  -- create a button that loads the selected profile
  me.CreateConfigurationButton(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_LOAD_PROFILE_BUTTON,
    150,
    {"TOPLEFT", 320, -96},
    rgpvpw.L["load_selected_profile_button"],
    me.LoadSelectedProfileButtonOnClick
  )
  -- create a button that updates the selected profile
  me.CreateConfigurationButton(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_UPDATE_PROFILE_BUTTON,
    150,
    {"TOPLEFT", 320, -128},
    rgpvpw.L["update_profile_button"],
    me.UpdateProfileButtonOnClick
  )
  -- create a button that allows to delete the selected profile
  me.CreateConfigurationButton(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_DELETE_PROFILE_BUTTON,
    150,
    {"TOPLEFT", 320, -160},
    rgpvpw.L["delete_selected_profile_button"],
    me.DeleteSelectedProfileButtonOnClick
  )

  me.CreateProfileStringLabel(frame)
  me.CreateProfileStringBox(frame)
  -- create a button that exports the selected profile into the string box
  me.CreateConfigurationButton(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_PROFILE_EXPORT_BUTTON,
    110,
    {"TOPLEFT", 20, -366},
    rgpvpw.L["profile_export_button"],
    me.ExportProfileButtonOnClick
  )
  -- create a button that imports the profile string in the string box
  me.CreateConfigurationButton(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_PROFILE_IMPORT_BUTTON,
    110,
    {"TOPLEFT", 140, -366},
    rgpvpw.L["profile_import_button"],
    me.ImportProfileButtonOnClick
  )

  -- init scrollFrame
  me.ProfileListUpdateOnUpdate()
  builtMenu = true
end

--[[
  Create the bordered container with a scrollable list of all current profiles

  @param {table} frame

  @return {table}
    The created list container
]]--
function me.CreateProfileList(frame)
  local listWidth = RGPVPW_CONSTANTS.PROFILE_LIST_CONTENT_FRAME_WIDTH
  local listHeight = RGPVPW_CONSTANTS.PROFILE_LIST_ROW_HEIGHT * RGPVPW_CONSTANTS.PROFILE_LIST_MAX_ROWS

  local listContainer = CreateFrame("Frame", nil, frame, "BackdropTemplate")
  listContainer:SetSize(listWidth, listHeight)
  listContainer:SetPoint("TOPLEFT", 20, -64)
  mod.guiHelper.ApplyBorderBackdrop(listContainer)

  local scrollFrame = CreateFrame(
    "ScrollFrame",
    RGPVPW_CONSTANTS.ELEMENT_PROFILE_LIST_SCROLL_FRAME,
    listContainer
  )
  scrollFrame:SetPoint("TOPLEFT", 6, -6)
  scrollFrame:SetPoint("BOTTOMRIGHT", -22, 6)

  local scrollBar = CreateFrame("EventFrame", nil, listContainer, "MinimalScrollBar")
  scrollBar:SetPoint("TOPLEFT", scrollFrame, "TOPRIGHT", 8, 0)
  scrollBar:SetPoint("BOTTOMLEFT", scrollFrame, "BOTTOMRIGHT", 8, 0)
  ScrollUtil.InitScrollFrameWithScrollBar(scrollFrame, scrollBar)

  profileListContent = CreateFrame("Frame", RGPVPW_CONSTANTS.ELEMENT_PROFILE_LIST_CONTENT_FRAME, scrollFrame)
  profileListContent:SetSize(listWidth - 28, listHeight)
  scrollFrame:SetScrollChild(profileListContent)

  return listContainer
end

--[[
  @param {table} frame
  @param {number} position

  @return {table}
    The created row
]]--
function me.CreateRowFrame(frame, position)
  local rowOffset = (position - 1) * RGPVPW_CONSTANTS.PROFILE_LIST_ROW_HEIGHT * -1
  local row = CreateFrame(
    "Button", RGPVPW_CONSTANTS.ELEMENT_PROFILE_LIST_CONTENT_FRAME .. position, frame)
  row:SetHeight(RGPVPW_CONSTANTS.PROFILE_LIST_ROW_HEIGHT)
  row:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, rowOffset)
  row:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, rowOffset)

  row.profileName = me.CreateProfileName(row)
  row.highlight = me.CreateHighlightTexture(row)

  local hoverTexture = row:CreateTexture(nil, "HIGHLIGHT")
  hoverTexture:SetAllPoints()
  hoverTexture:SetColorTexture(1, 1, 1, 0.15)

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
  local profileNameFontString = profileFrame:CreateFontString(
    RGPVPW_CONSTANTS.ELEMENT_PROFILE_NAME, "OVERLAY", "GameFontHighlightSmall")
  profileNameFontString:SetPoint("LEFT", 4, 0)
  profileNameFontString:SetJustifyH("LEFT")

  return profileNameFontString
end

--[[
  Create a texture that marks the currently selected row

  @param {table} row

  @return {table}
    The created texture
]]--
function me.CreateHighlightTexture(row)
  local highlightTexture = row:CreateTexture(RGPVPW_CONSTANTS.ELEMENT_PROFILE_LIST_ROW_HIGHLIGHT, "BACKGROUND")
  highlightTexture:SetAllPoints()
  highlightTexture:SetColorTexture(1, 0.82, 0, 0.25)
  highlightTexture:Hide()

  return highlightTexture
end

--[[
  Update the profile list rows to reflect the current profiles. Rows are created
  lazily - one per profile - and surplus rows are hidden.
]]--
function me.ProfileListUpdateOnUpdate()
  local profiles = PVPWarnProfiles

  for i = 1, math.max(#profiles, #profileRows) do
    local profile = profiles[i]

    if profile ~= nil and profileRows[i] == nil then
      profileRows[i] = me.CreateRowFrame(profileListContent, i)
    end

    local row = profileRows[i]

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

  profileListContent:SetHeight(
    math.max(#profiles, RGPVPW_CONSTANTS.PROFILE_LIST_MAX_ROWS) * RGPVPW_CONSTANTS.PROFILE_LIST_ROW_HEIGHT
  )
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

    self.highlight:Show()
  end
end

--[[
  Hide the highlight of all rows
]]--
function me.ClearCellList()
  for _, profileRow in pairs(profileRows) do
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
  @param {number} width
  @param {table} position
  @param {string} text
  @param {function} callback

  @return {table}
    The created button
]]--
function me.CreateConfigurationButton(parentFrame, frameName, width, position, text, callback)
  -- create save configuration button
  local configurationButton = CreateFrame(
    "Button",
    frameName,
    parentFrame,
    "UIPanelButtonTemplate"
  )

  configurationButton:SetSize(width, RGPVPW_CONSTANTS.BUTTON_DEFAULT_HEIGHT)
  configurationButton:SetText(text)
  configurationButton:SetPoint(unpack(position))
  configurationButton:SetScript("OnClick", callback)

  return configurationButton
end

--[[
  Create a label for the profile export/import string box

  @param {table} parentFrame

  @return {table}
    The created fontString
]]--
function me.CreateProfileStringLabel(parentFrame)
  local stringLabelFontString = parentFrame:CreateFontString(RGPVPW_CONSTANTS.ELEMENT_PROFILE_STRING_LABEL, "OVERLAY")
  stringLabelFontString:SetFont(STANDARD_TEXT_FONT, 13)
  stringLabelFontString:SetPoint("TOPLEFT", 20, -246)
  stringLabelFontString:SetJustifyH("LEFT")
  stringLabelFontString:SetText(rgpvpw.L["profile_string_label"])

  return stringLabelFontString
end

--[[
  Create the multiline string box used to export and import profile strings

  @param {table} frame

  @return {table}
    The created scrollFrame
]]--
function me.CreateProfileStringBox(frame)
  local stringContainer = CreateFrame("Frame", nil, frame, "BackdropTemplate")
  stringContainer:SetSize(
    RGPVPW_CONSTANTS.PROFILE_STRING_BOX_WIDTH,
    RGPVPW_CONSTANTS.PROFILE_STRING_BOX_HEIGHT
  )
  stringContainer:SetPoint("TOPLEFT", 20, -264)
  mod.guiHelper.ApplyBorderBackdrop(stringContainer)

  local scrollContainer = CreateFrame(
    "ScrollFrame",
    RGPVPW_CONSTANTS.ELEMENT_PROFILE_STRING_SCROLL_FRAME,
    stringContainer,
    "InputScrollFrameTemplate"
  )
  scrollContainer:SetPoint("TOPLEFT", 6, -6)
  scrollContainer:SetPoint("BOTTOMRIGHT", -6, 6)

  --[[ the template draws its own input-border art outside its rect which does not line
       up with the profile list's backdrop - hide it, the container draws the border ]]--
  local artKeys = {
    "TopLeftTex", "TopRightTex", "BottomLeftTex", "BottomRightTex",
    "TopTex", "BottomTex", "LeftTex", "RightTex", "MiddleTex"
  }

  for _, artKey in ipairs(artKeys) do
    if scrollContainer[artKey] then
      scrollContainer[artKey]:Hide()
    end
  end

  if scrollContainer.CharCount then
    scrollContainer.CharCount:Hide()
  end

  profileStringEditBox = scrollContainer.EditBox
  profileStringEditBox:SetMaxLetters(0)
  profileStringEditBox:SetFontObject("ChatFontNormal")
  profileStringEditBox:SetWidth(RGPVPW_CONSTANTS.PROFILE_STRING_BOX_WIDTH - 30)
  profileStringEditBox:SetScript("OnEscapePressed", function(self)
    self:ClearFocus()
  end)

  return stringContainer
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

--[[
  Button callback to export the selected profile into the string box. The resulting
  string is highlighted so it can be copied right away.
]]--
function me.ExportProfileButtonOnClick()
  local selectedProfileName = me.GetCurrentSelectedProfileName()

  if not selectedProfileName or selectedProfileName == "" then
    mod.logger.PrintUserError(rgpvpw.L["user_message_select_profile_before_export"])
    return
  end

  local exportString = mod.profile.ExportString(selectedProfileName)

  if exportString == nil then
    mod.logger.PrintUserError(rgpvpw.L["user_message_select_profile_before_export"])
    return
  end

  profileStringEditBox:SetText(exportString)
  profileStringEditBox:HighlightText()
  profileStringEditBox:SetFocus()
end

--[[
  Button callback to import the profile string in the string box. Validates the
  string and prompts for a profile name on success. Shows a localized error
  message and changes nothing if the string cannot be imported.
]]--
function me.ImportProfileButtonOnClick()
  local envelope, errorKey = mod.profile.ImportString(profileStringEditBox:GetText())

  if not envelope then
    mod.logger.PrintUserError(rgpvpw.L[errorKey])
    return
  end

  StaticPopup_Show("RGPVPW_IMPORT_PROFILE_NAME", nil, nil, envelope)
end

--[[
  Store an imported, already validated envelope under the passed profile name.
  The imported profile is added to the profile list but not activated.

  @param {string} profileName
  @param {table} envelope
    A validated envelope as returned by mod.profile.ImportString
]]--
FinishProfileImport = function(profileName, envelope)
  if not mod.profile.AddImportedProfile(profileName, envelope.payload) then
    return
  end

  profileStringEditBox:SetText("")
  me.ProfileListUpdateOnUpdate()
  me.ClearSelectedProfile()
  mod.logger.PrintUserMessage(string.format(rgpvpw.L["profile_import_success"], profileName))
end
