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

-- luacheck: globals CreateFrame StaticPopupDialogs StaticPopup_Show

local mod = rgpvpw
local me = {}
mod.profileMenu = me

me.tag = "ProfileMenu"

local profileRows = {}

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
    mod.profile.AddNewProfile(self.editBox:GetText())
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
  TODO
]]--
function me.BuildUi(frame)
  mod.logger.LogDebug(me.tag, "Loaded ProfilesMenu")

  local scrollFrame = me.CreateProfilesScrollFrame(frame)
  me.CreateProfileSaveButton(frame)
  me.CreateDeleProfileButton(frame)

  -- init TODO
  me.FauxScrollFrameOnUpdate(scrollFrame)
end

--[[
  TODO
]]--
function me.CreateProfilesScrollFrame(frame)
  local scrollFrame = CreateFrame("ScrollFrame", RGPVPW_CONSTANTS.ELEMENT_PROFILE_LIST_SCROLL_FRAME, frame, "FauxScrollFrameTemplate")
  scrollFrame:SetWidth(RGPVPW_CONSTANTS.PROFILE_LIST_CONTENT_FRAME_WIDTH)
  scrollFrame:SetHeight(RGPVPW_CONSTANTS.PROFILE_LIST_ROW_HEIGHT * RGPVPW_CONSTANTS.PROFILE_LIST_MAX_ROWS)
  scrollFrame:EnableMouseWheel(true)
  scrollFrame:SetPoint("TOPLEFT", frame, 5, -7)

  scrollFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    insets = {left = 0, right = 0, top = 0, bottom = 0},
  })

  scrollFrame:SetScript("OnVerticalScroll", function(self, offset)
    self.ScrollBar:SetValue(offset)
    self.offset = math.floor(offset / RGPVPW_CONSTANTS.PROFILE_LIST_ROW_HEIGHT + 0.5)
    me.FauxScrollFrameOnUpdate(self)
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

  return row
end

--[[
  TODO
  Create fontstring for title of the spell to configure

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
  FauxScrollFrame callback for profileslist

  TODO parameters
]]--
function me.FauxScrollFrameOnUpdate(scrollFrame)
  local profiles = PVPWarnProfiles
  local maxValue = mod.common.TableLength(profiles) or 0

  if maxValue <= RGPVPW_CONSTANTS.PROFILE_LIST_MAX_ROWS then
    maxValue = RGPVPW_CONSTANTS.PROFILE_LIST_MAX_ROWS + 1
  end
  mod.logger.LogError(me.tag, "maxValue: " .. maxValue)
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
    mod.logger.LogError(me.tag, "Row: " .. i)
    row.profileName:SetText("row: " .. i)

    row:Show()
  end
end

--[[
  TODO
]]--
function me.CreateProfileSaveButton(frame)
  -- create save configuration button
  local saveConfigurationButton = CreateFrame(
    "Button",
    RGPVPW_CONSTANTS.ELEMENT_SAVE_PROFILE_BUTTON,
    frame,
    "UIPanelButtonTemplate"
  )

  saveConfigurationButton:SetPoint(
    "BOTTOMLEFT",
    0, 0
  )

  saveConfigurationButton:SetHeight(32)
  -- saveConfigurationButton:SetText(rgpvpw.L["save_current_profile_button"])
  saveConfigurationButton:SetText("Test")
  saveConfigurationButton:SetScript('OnClick', me.SaveProfileOnClick)

  mod.guiHelper.ResizeButtonToText(saveConfigurationButton)
end

--[[
  Button callback to save the current user configuration. This will invoke a popup
  dialog for the user to choose a name for the profile.
]]--
function me.SaveProfileOnClick()
  StaticPopup_Show("RGPVPW_CHOOSE_PROFILE_NAME")
end

--[[
  TODO
]]--
function me.CreateDeleProfileButton(frame)
  local deleteProfileButton = CreateFrame(
    "Button",
    RGPVPW_CONSTANTS.ELEMENT_DELETE_PROFILE_BUTTON,
    frame,
    "UIPanelButtonTemplate"
  )

  deleteProfileButton:SetPoint(
    "BOTTOMLEFT",
    50, 0
  )

  deleteProfileButton:SetHeight(32)
  -- deleteProfileButton:SetText(rgpvpw.L["delete_selected_profile_button"])
  deleteProfileButton:SetText("delete button")
  deleteProfileButton:SetScript("OnClick", me.DeleteSelectedProfileButtonOnClick) -- TODO

  mod.guiHelper.ResizeButtonToText(deleteProfileButton)
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
