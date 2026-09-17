--[[
  MIT License

  Copyright (c) 2026 Michael Wiesendanger

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
-- holds a reference to the scrollbar that drives the profile list
local profileListScrollBar
-- the name of the currently selected profile in the profile list
local currentSelectedProfileName
-- the multiline edit box used for export/import strings
local profileStringEditBox
--[[
  The action buttons that act on the selected profile and are greyed out while they could
  not act - see UpdateActionButtonState
]]--
local loadProfileButton
local renameProfileButton
local deleteProfileButton
local exportProfileButton

-- forward declaration
local FinishProfileImport
local ProfileNameEditBoxOnTextChanged
local UpdateActionButtonState

--[[
  Panel layout. Positions are derived from the shared dimension constants and from each
  other so a resized element moves its siblings along.
]]--
local contentLeft = 20
local listTop = -64
local listHeight = RGPVPW_CONSTANTS.PROFILE_LIST_ROW_HEIGHT * RGPVPW_CONSTANTS.PROFILE_LIST_MAX_ROWS
-- vertical distance between a section label and the content frame below it
local labelOffset = 18
local actionButtonWidth = 150
local actionButtonLeft = contentLeft + RGPVPW_CONSTANTS.PROFILE_LIST_CONTENT_FRAME_WIDTH + 20
local actionButtonSpacing = 32
local stringLabelTop = listTop - listHeight - 22
local stringBoxTop = stringLabelTop - labelOffset
local stringButtonWidth = 110
local stringButtonTop = stringBoxTop - RGPVPW_CONSTANTS.PROFILE_STRING_BOX_HEIGHT - 12

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
    local profileName = dialog:GetEditBox():GetText()

    -- a refused name keeps the prompt open so it can be corrected in place
    if not mod.profile.CreateProfile(profileName) then
      return true
    end

    -- the new profile is the active one now; keep it selected
    me.SetCurrentSelectedProfileName(profileName)
    me.RefreshProfileList()
  end,
  EditBoxOnTextChanged = function(editBox)
    ProfileNameEditBoxOnTextChanged(editBox)
  end,
  timeout = 0,
  whileDead = true,
  preferredIndex = 3,
  hasEditBox = true,
  maxLetters = mod.profile.GetMaxProfileNameLength()
}

--[[
  Popup dialog for choosing a new name for the selected profile. The name of the profile
  to rename is passed as the dialog data payload and prefilled into the edit box.
]]--
StaticPopupDialogs["RGPVPW_RENAME_PROFILE_NAME"] = {
  text = rgpvpw.L["choose_new_profile_name_dialog_text"],
  button1 = rgpvpw.L["choose_profile_name_accept_button"],
  button2 = rgpvpw.L["choose_profile_name_cancel_button"],
  OnShow = function(dialog)
    local editBox = dialog:GetEditBox()
    local button1 = dialog:GetButton1()

    if editBox ~= nil and button1 ~= nil then
      editBox:SetText(dialog.data or "")
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
    local newName = dialog:GetEditBox():GetText()

    -- a refused name keeps the prompt open so it can be corrected in place
    if not mod.profile.RenameProfile(dialog.data, newName) then
      return true
    end

    me.SetCurrentSelectedProfileName(newName)
    me.RefreshProfileList()
  end,
  EditBoxOnTextChanged = function(editBox)
    ProfileNameEditBoxOnTextChanged(editBox)
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
    me.DeleteSelectedProfile()
  end,
  timeout = 0,
  whileDead = true,
  preferredIndex = 4
}

--[[
  Popup dialog warning before deleting the active profile - says what follows: the Default
  profile takes over the live configuration
]]--
StaticPopupDialogs["RGPVPW_DELETE_ACTIVE_PROFILE_WARNING"] = {
  text = rgpvpw.L["confirm_delete_active_profile_dialog_text"],
  button1 = rgpvpw.L["confirm_delete_profile_yes_button"],
  button2 = rgpvpw.L["confirm_delete_profile_no_button"],
  OnAccept = function()
    me.DeleteSelectedProfile()
  end,
  timeout = 0,
  whileDead = true,
  preferredIndex = 4
}

--[[
  Popup dialog warning before loading a profile. The profile that is active now keeps
  every edit made up to now - SwitchProfile mirrors it before the selected one takes over.
]]--
StaticPopupDialogs["RGPVPW_LOAD_PROFILE_WARNING"] = {
  text = rgpvpw.L["confirm_load_profile_dialog_text"],
  button1 = rgpvpw.L["confirm_load_profile_yes_button"],
  button2 = rgpvpw.L["confirm_load_profile_no_button"],
  OnAccept = function()
    mod.profile.SwitchProfile(me.GetCurrentSelectedProfileName())
    me.RefreshProfileList()
  end,
  timeout = 0,
  whileDead = true,
  preferredIndex = 4
}

--[[
  Popup dialog warning before resetting the active profile to the class factory lists
]]--
StaticPopupDialogs["RGPVPW_RESET_PROFILE_WARNING"] = {
  text = rgpvpw.L["confirm_reset_profile_dialog_text"],
  button1 = rgpvpw.L["confirm_reset_profile_yes_button"],
  button2 = rgpvpw.L["confirm_reset_profile_no_button"],
  OnAccept = function()
    mod.profile.ResetActiveProfile()
    me.RefreshProfileList()
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
    -- a refused name keeps the prompt open so it can be corrected in place
    return not FinishProfileImport(dialog:GetEditBox():GetText(), dialog.data)
  end,
  EditBoxOnTextChanged = function(editBox)
    ProfileNameEditBoxOnTextChanged(editBox)
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
    me.RefreshProfileList()
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
  listLabel:SetPoint("TOPLEFT", contentLeft, listTop + labelOffset)
  listLabel:SetText(rgpvpw.L["profile_list_label"])

  me.CreateProfileList(frame)

  -- creates a button that creates a new profile based on the current configuration
  me.CreateConfigurationButton(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_CREATE_PROFILE_BUTTON,
    actionButtonWidth,
    {"TOPLEFT", actionButtonLeft, listTop},
    rgpvpw.L["create_new_profile_button"],
    me.CreateProfileButtonOnClick
  )
  -- create a button that loads the selected profile
  loadProfileButton = me.CreateConfigurationButton(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_LOAD_PROFILE_BUTTON,
    actionButtonWidth,
    {"TOPLEFT", actionButtonLeft, listTop - actionButtonSpacing},
    rgpvpw.L["load_selected_profile_button"],
    me.LoadSelectedProfileButtonOnClick
  )
  -- create a button that renames the selected profile
  renameProfileButton = me.CreateConfigurationButton(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_RENAME_PROFILE_BUTTON,
    actionButtonWidth,
    {"TOPLEFT", actionButtonLeft, listTop - actionButtonSpacing * 2},
    rgpvpw.L["rename_selected_profile_button"],
    me.RenameSelectedProfileButtonOnClick
  )
  -- create a button that allows to delete the selected profile
  deleteProfileButton = me.CreateConfigurationButton(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_DELETE_PROFILE_BUTTON,
    actionButtonWidth,
    {"TOPLEFT", actionButtonLeft, listTop - actionButtonSpacing * 3},
    rgpvpw.L["delete_selected_profile_button"],
    me.DeleteSelectedProfileButtonOnClick
  )
  -- create a button that resets the active profile to the class factory lists
  me.CreateConfigurationButton(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_RESET_PROFILE_BUTTON,
    actionButtonWidth,
    {"TOPLEFT", actionButtonLeft, listTop - actionButtonSpacing * 4},
    rgpvpw.L["reset_profile_button"],
    me.ResetProfileButtonOnClick
  )

  me.CreateProfileStringLabel(frame)
  me.CreateProfileStringBox(frame)
  -- create a button that exports the selected profile into the string box
  exportProfileButton = me.CreateConfigurationButton(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_PROFILE_EXPORT_BUTTON,
    stringButtonWidth,
    {"TOPLEFT", contentLeft, stringButtonTop},
    rgpvpw.L["profile_export_button"],
    me.ExportProfileButtonOnClick
  )
  -- create a button that imports the profile string in the string box
  me.CreateConfigurationButton(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_PROFILE_IMPORT_BUTTON,
    stringButtonWidth,
    {"TOPLEFT", contentLeft + stringButtonWidth + 10, stringButtonTop},
    rgpvpw.L["profile_import_button"],
    me.ImportProfileButtonOnClick
  )

  -- init scrollFrame
  me.RefreshProfileList()
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
  -- padding between the border of the container and the list itself
  local viewportInset = RGPVPW_CONSTANTS.PROFILE_LIST_VIEWPORT_INSET

  local listContainer = CreateFrame("Frame", nil, frame, "BackdropTemplate")
  listContainer:SetSize(listWidth, listHeight)
  listContainer:SetPoint("TOPLEFT", contentLeft, listTop)
  mod.guiHelper.ApplyBorderBackdrop(listContainer)

  local scrollFrame = CreateFrame(
    "ScrollFrame",
    RGPVPW_CONSTANTS.ELEMENT_PROFILE_LIST_SCROLL_FRAME,
    listContainer
  )
  scrollFrame:SetPoint("TOPLEFT", viewportInset, viewportInset * -1)
  scrollFrame:SetPoint("BOTTOMRIGHT", viewportInset * -1, viewportInset)

  --[[
    The bar is placed on top of the rows instead of next to them so the row background - the
    selection highlight above all - reaches the border of the list and runs on behind the bar.
    CreateProfileName keeps the profile name clear of it.
  ]]--
  profileListScrollBar = CreateFrame("EventFrame", nil, listContainer, "MinimalScrollBar")
  profileListScrollBar:SetPoint("TOPRIGHT", scrollFrame, viewportInset * -1, 0)
  profileListScrollBar:SetPoint("BOTTOMRIGHT", scrollFrame, viewportInset * -1, 0)
  --[[ clears the rows, which sit two frame levels below their scroll frame ]]--
  profileListScrollBar:SetFrameLevel(listContainer:GetFrameLevel() + 10)
  ScrollUtil.InitScrollFrameWithScrollBar(scrollFrame, profileListScrollBar)
  mod.guiHelper.EnableScrollBarAutoHide(scrollFrame, profileListScrollBar)

  profileListContent = CreateFrame("Frame", RGPVPW_CONSTANTS.ELEMENT_PROFILE_LIST_CONTENT_FRAME, scrollFrame)
  --[[
    Seed the content with no scrollable extent - RefreshProfileList sets the real height once
    it knows its row count. Seeding the full listHeight would leave the list scrollable by the
    viewport insets alone and keep the scrollbar visible on an empty list
  ]]--
  profileListContent:SetSize(listWidth - viewportInset * 2, 1)
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
  --[[ bounded on the right so a long name is cut off before it reaches the scrollbar that
       overlays the row, instead of running underneath it ]]--
  profileNameFontString:SetPoint("RIGHT", RGPVPW_CONSTANTS.PROFILE_LIST_NAME_INSET_RIGHT * -1, 0)
  profileNameFontString:SetJustifyH("LEFT")
  profileNameFontString:SetWordWrap(false)

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
  lazily - one per profile - and surplus rows are hidden. The active profile's row reads
  "<name> (active)" in gold, every other row in the body colour; the translucent selection
  texture is a separate signal that follows the selected name, so a row can be active,
  selected or both. A selection that no longer exists is dropped.
]]--
function me.RefreshProfileList()
  local profiles = PVPWarnProfiles
  local activeProfileName = mod.profile.GetActiveProfileName()

  if currentSelectedProfileName ~= nil and not mod.profile.ProfileExists(currentSelectedProfileName) then
    currentSelectedProfileName = nil
  end

  for i = 1, math.max(#profiles, #profileRows) do
    local profile = profiles[i]

    if profile ~= nil and profileRows[i] == nil then
      profileRows[i] = me.CreateRowFrame(profileListContent, i)
    end

    local row = profileRows[i]

    if profile ~= nil then
      -- the row keeps the raw name; only the drawn label carries the active suffix
      row.profileName.name = profile.name

      if profile.name == activeProfileName then
        row.profileName:SetText(string.format(rgpvpw.L["profile_active_suffix"], profile.name))
        mod.guiHelper.SetColor(row.profileName, RGPVPW_CONSTANTS.COLOR.TITLE_GOLD)
      else
        row.profileName:SetText(profile.name)
        mod.guiHelper.SetColor(row.profileName, RGPVPW_CONSTANTS.COLOR.BODY)
      end

      if profile.name == currentSelectedProfileName then
        row.highlight:Show()
      else
        row.highlight:Hide()
      end

      row:Show()
    else
      row.profileName:SetText("")
      row.profileName.name = ""
      row.highlight:Hide()
      row:Hide()
    end
  end

  --[[
    Track the real row count instead of padding up to PROFILE_LIST_MAX_ROWS - padding would
    keep the list permanently scrollable. The list box itself keeps its fixed height
  ]]--
  profileListContent:SetHeight(math.max(#profiles * RGPVPW_CONSTANTS.PROFILE_LIST_ROW_HEIGHT, 1))

  UpdateActionButtonState()
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
    UpdateActionButtonState()
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
  UpdateActionButtonState()
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
  stringLabelFontString:SetPoint("TOPLEFT", contentLeft, stringLabelTop)
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
  stringContainer:SetPoint("TOPLEFT", contentLeft, stringBoxTop)
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
  Button callback to create a new profile from the current configuration. This will invoke
  a popup dialog for the user to choose a name for the profile.
]]--
function me.CreateProfileButtonOnClick()
  StaticPopup_Show("RGPVPW_CHOOSE_PROFILE_NAME")
end

--[[
  Button callback to delete the selected user configuration. This will invoke a popup
  dialog for the user to confirm the action - the active profile gets the variant that
  says the Default profile takes over.
]]--
function me.DeleteSelectedProfileButtonOnClick()
  local selectedProfileName = me.GetCurrentSelectedProfileName()

  if not selectedProfileName or selectedProfileName == "" then
    mod.logger.PrintUserError(rgpvpw.L["user_message_select_profile_before_delete"])
    return
  end

  if mod.profile.IsDefaultProfile(selectedProfileName) then
    mod.logger.PrintUserError(rgpvpw.L["user_message_default_profile_cannot_be_deleted"])
    return
  end

  if selectedProfileName == mod.profile.GetActiveProfileName() then
    StaticPopup_Show(
      "RGPVPW_DELETE_ACTIVE_PROFILE_WARNING", selectedProfileName, RGPVPW_CONSTANTS.DEFAULT_PROFILE_NAME)
    return
  end

  StaticPopup_Show("RGPVPW_DELETE_PROFILE_WARNING", selectedProfileName)
end

--[[
  Delete the selected profile after the confirm. Deleting the active profile falls back
  to Default (the module applies it); either way the list is refreshed and the selection
  cleared.
]]--
function me.DeleteSelectedProfile()
  mod.profile.DeleteProfile(me.GetCurrentSelectedProfileName())
  me.ClearSelectedProfile()
  me.RefreshProfileList()
end

--[[
  Button callback to load the selected user configuration. This will invoke a popup
  dialog for the user to confirm the action. The active profile is loaded already (the
  button is greyed for it).
]]--
function me.LoadSelectedProfileButtonOnClick()
  local selectedProfileName = me.GetCurrentSelectedProfileName()

  if not selectedProfileName or selectedProfileName == "" then
    mod.logger.PrintUserError(rgpvpw.L["user_message_select_profile_before_load"])
    return
  end

  local activeProfileName = mod.profile.GetActiveProfileName()

  if selectedProfileName == activeProfileName then
    return
  end

  StaticPopup_Show("RGPVPW_LOAD_PROFILE_WARNING", selectedProfileName, activeProfileName)
end

--[[
  Button callback to rename the selected profile. This will invoke a popup dialog prefilled
  with the current name. The Default profile cannot be renamed.
]]--
function me.RenameSelectedProfileButtonOnClick()
  local selectedProfileName = me.GetCurrentSelectedProfileName()

  if not selectedProfileName or selectedProfileName == "" then
    mod.logger.PrintUserError(rgpvpw.L["user_message_select_profile_before_rename"])
    return
  end

  if mod.profile.IsDefaultProfile(selectedProfileName) then
    mod.logger.PrintUserError(rgpvpw.L["user_message_default_profile_cannot_be_renamed"])
    return
  end

  StaticPopup_Show("RGPVPW_RENAME_PROFILE_NAME", nil, nil, selectedProfileName)
end

--[[
  Button callback to reset the active profile to the class factory lists. This will invoke
  a popup dialog for the user to confirm the action. Acts on the active profile, not the
  selection.
]]--
function me.ResetProfileButtonOnClick()
  StaticPopup_Show("RGPVPW_RESET_PROFILE_WARNING", mod.profile.GetActiveProfileName())
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
  The imported profile is added to the profile list and selected but not activated.

  @param {string} profileName
  @param {table} envelope
    A validated envelope as returned by mod.profile.ImportString

  @return {boolean}
    true - if the profile was stored (the prompt may close)
    false - if the name was refused
]]--
FinishProfileImport = function(profileName, envelope)
  if not mod.profile.AddImportedProfile(profileName, envelope.payload) then
    return false
  end

  -- the string served its purpose; clearing it signals success and prevents a
  -- confusing re-import of the leftover text (kept on failure paths for retry)
  profileStringEditBox:SetText("")
  me.SetCurrentSelectedProfileName(profileName)
  me.RefreshProfileList()
  mod.logger.PrintUserMessage(string.format(rgpvpw.L["profile_import_success"], profileName))

  return true
end

--[[
  Grey out the buttons that act on the selection while they could not act: Load, Rename,
  Delete and Export with nothing selected, Load also on the active profile (it is loaded
  already), Rename and Delete also on the Default profile. Create new Profile, Reset to
  defaults and Import never depend on the selection. The click handlers guard the same
  conditions - this only makes the refusal visible before the click.
]]--
UpdateActionButtonState = function()
  if not loadProfileButton or not renameProfileButton or not deleteProfileButton or not exportProfileButton then
    return
  end

  local selected = currentSelectedProfileName ~= nil and mod.profile.ProfileExists(currentSelectedProfileName)
  local editable = selected and not mod.profile.IsDefaultProfile(currentSelectedProfileName)
  local loadable = selected and currentSelectedProfileName ~= mod.profile.GetActiveProfileName()

  loadProfileButton:SetEnabled(loadable)
  renameProfileButton:SetEnabled(editable)
  deleteProfileButton:SetEnabled(editable)
  exportProfileButton:SetEnabled(selected)
end

--[[
  Shared EditBoxOnTextChanged handler for the profile name dialogs - the accept button is
  only enabled while a non-empty name is entered.

  @param {table} editBox
]]--
ProfileNameEditBoxOnTextChanged = function(editBox)
  local button1 = editBox:GetParent():GetButton1()

  if button1 ~= nil then
    if string.len(editBox:GetText()) > 0 then
      button1:Enable()
    else
      button1:Disable()
    end
  end
end
