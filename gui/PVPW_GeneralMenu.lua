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
mod.generalMenu = me

me.tag = "GeneralMenu"

--[[
  Option texts for checkbutton options
]]--
local options = {
  {
    "EnableCombatStateTracking",
    rgpvpw.L["enable_combat_state_tracking"],
    rgpvpw.L["enable_combat_state_tracking_tooltip"]
  }, {
    "LockFrameCombatState",
    rgpvpw.L["lock_frame_combat_state"],
    rgpvpw.L["lock_frame_combat_state_tooltip"]
  },
  {
    "EnableStanceStateTracking",
    rgpvpw.L["enable_stance_state_tracking"],
    rgpvpw.L["enable_stance_state_tracking_tooltip"]
  }, {
    "LockFrameStanceState",
    rgpvpw.L["lock_frame_stance_state"],
    rgpvpw.L["lock_frame_stance_state_tooltip"]
  }
}

-- track whether the menu was already built
local builtMenu = false

--[[
  Build the ui for the general menu

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildUi(frame)
  if builtMenu then return end

  me.BuildTitle(frame)
  me.BuildCombatStateOptions(frame)
  me.BuildStanceStateOptions(frame)

  builtMenu = true
end

--[[
  Build the title for the general menu

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildTitle(frame)
  local titleFontString = frame:CreateFontString(RGPVPW_CONSTANTS.ELEMENT_GENERAL_TITLE, "OVERLAY")
  titleFontString:SetFont(STANDARD_TEXT_FONT, 20)
  titleFontString:SetPoint("TOP", 0, -20)
  titleFontString:SetSize(frame:GetWidth(), 20)
  titleFontString:SetText(rgpvpw.L["general_title"])
end

--[[
  Creates all checkButtons for the combatState configuration. Make sure to create checkbuttons
  that are dependant on others first

  @param {table} frame
]]--
function me.BuildCombatStateOptions(frame)
  me.BuildCheckButtonOption(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_GENERAL_OPT_LOCK_FRAME_COMBAT_STATE,
    40,
    -110,
    me.LockFrameCombatStateOnShow,
    me.LockFrameCombatStateOnClick
  )

  me.BuildCheckButtonOption(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_GENERAL_OPT_ENABLE_COMBAT_STATE,
    20,
    -80,
    me.EnableCombatStateTrackingOnShow,
    me.EnableCombatStateTrackingOnClick,
    { RGPVPW_CONSTANTS.ELEMENT_GENERAL_OPT_LOCK_FRAME_COMBAT_STATE }
  )
end

--[[
  OnShow callback for checkbuttons - lock combat state frame

  @param {table} self
]]--
function me.LockFrameCombatStateOnShow(self)
  if mod.configuration.IsCombatStateFrameLocked() then
    self:SetChecked(true)
  else
    self:SetChecked(false)
  end
end

--[[
  OnClick callback for checkbuttons - lock combat state frame

  @param {table} self
]]--
function me.LockFrameCombatStateOnClick(self)
  local enabled = self:GetChecked()

  if enabled then
    mod.configuration.LockCombatStateFrame()
  else
    mod.configuration.UnlockCombatStateFrame()
  end
end

--[[
  OnShow callback for checkbuttons - enable combat state tracking

  @param {table} self
]]--
function me.EnableCombatStateTrackingOnShow(self)
  if mod.configuration.IsCombatStateTrackingEnabled() then
    self:SetChecked(true)
    me.EnableCheckButtons(self.linkedCheckButtonNames)
  else
    self:SetChecked(false)
    me.DisableCheckButtons(self.linkedCheckButtonNames)
  end
end

--[[
  OnClick callback for checkbuttons - enable combat state tracking

  @param {table} self
]]--
function me.EnableCombatStateTrackingOnClick(self)
  local enabled = self:GetChecked()

  if enabled then
    mod.configuration.EnableCombatStateTracking()
    me.EnableCheckButtons(self.linkedCheckButtonNames)
  else
    mod.configuration.DisableCombatStateTracking()
    me.DisableCheckButtons(self.linkedCheckButtonNames)
  end
end

--[[
  Creates all checkButtons for the stanceState configuration. Make sure to create checkbuttons
  that are dependant on others first

  @param {table} frame
]]--
function me.BuildStanceStateOptions(frame)
  me.BuildCheckButtonOption(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_GENERAL_OPT_LOCK_FRAME_STANCE_STATE,
    40,
    -190,
    me.LockFrameStanceStateOnShow,
    me.LockFrameStanceStateOnClick
  )

  me.BuildCheckButtonOption(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_GENERAL_OPT_ENABLE_STANCE_STATE,
    20,
    -160,
    me.EnableStanceStateTrackingOnShow,
    me.EnableStanceStateTrackingOnClick,
    { RGPVPW_CONSTANTS.ELEMENT_GENERAL_OPT_LOCK_FRAME_STANCE_STATE }
  )
end

--[[
  OnShow callback for checkbuttons - lock stance state frame

  @param {table} self
]]--
function me.LockFrameStanceStateOnShow(self)
  if mod.configuration.IsCombatStateFrameLocked() then
    self:SetChecked(true)
  else
    self:SetChecked(false)
  end
end

--[[
  OnClick callback for checkbuttons - lock stance state frame

  @param {table} self
]]--
function me.LockFrameStanceStateOnClick(self)
  local enabled = self:GetChecked()

  if enabled then
    mod.configuration.LockStanceStateFrame()
  else
    mod.configuration.UnlockStanceStateFrame()
  end
end

--[[
  OnShow callback for checkbuttons - enable stance state tracking

  @param {table} self
]]--
function me.EnableStanceStateTrackingOnShow(self)
  if mod.configuration.IsStanceStateTrackingEnabled() then
    self:SetChecked(true)
    me.EnableCheckButtons(self.linkedCheckButtonNames)
  else
    self:SetChecked(false)
    me.DisableCheckButtons(self.linkedCheckButtonNames)
  end
end

--[[
  OnClick callback for checkbuttons - enable stance state tracking

  @param {table} self
]]--
function me.EnableStanceStateTrackingOnClick(self)
  local enabled = self:GetChecked()

  if enabled then
    mod.configuration.EnableStanceStateTracking()
    me.EnableCheckButtons(self.linkedCheckButtonNames)
  else
    mod.configuration.DisableStanceStateTracking()
    me.DisableCheckButtons(self.linkedCheckButtonNames)
  end
end

--[[
  Build a checkbutton option

  @param {table} parentFrame
  @param {string} optionFrameName
  @param {number} posX
  @param {number} posY
  @param {function} onShowCallback
  @param {function} onClickCallback
  @param {table} linkedCheckButtonNames
    Linked checkbutton that enables/disables this option
]]--
function me.BuildCheckButtonOption(parentFrame, optionFrameName, posX, posY, onShowCallback, onClickCallback,
  linkedCheckButtonNames)
  local checkButtonOptionFrame = mod.guiHelper.CreateCheckBox(
    optionFrameName,
    parentFrame,
    {"TOPLEFT", posX, posY},
    onShowCallback,
    onClickCallback,
    me.GetLabelText(optionFrameName)
  )

  --[[
    Set a linked button that automatically gets enabled/disabled based on the checkButton state
  ]]--
  if linkedCheckButtonNames ~= nil then
    checkButtonOptionFrame.linkedCheckButtonNames = linkedCheckButtonNames
  end

  checkButtonOptionFrame:SetScript("OnEnter", me.OptTooltipOnEnter)
  checkButtonOptionFrame:SetScript("OnLeave", me.OptTooltipOnLeave)
  checkButtonOptionFrame:SetScript("OnShow", onShowCallback)
  checkButtonOptionFrame:SetScript("OnClick", onClickCallback)
  -- load initial state
  onShowCallback(checkButtonOptionFrame)
end

--[[
  Get the label text for the checkbutton

  @param {string} frameName

  @return {string}
    The text for the label
]]--
function me.GetLabelText(frameName)
  if not frameName then return end

  for i = 1, table.getn(options) do
    if frameName == RGPVPW_CONSTANTS.ELEMENT_GENERAL_OPT .. options[i][1] then
      return options[i][2]
    end
  end
end

--[[
  OnEnter callback for checkbuttons - show tooltip

  @param {table} self
]]--
function me.OptTooltipOnEnter(self)
  local name = self:GetName()

  if not name then return end

  for i = 1, table.getn(options) do
    if name == RGPVPW_CONSTANTS.ELEMENT_GENERAL_OPT .. options[i][1] then
      mod.tooltip.BuildTooltipForOption(options[i][2], options[i][3])
      break
    end
  end
end

--[[
  OnEnter callback for checkbuttons - hide tooltip
]]--
function me.OptTooltipOnLeave()
  _G[RGPVPW_CONSTANTS.ELEMENT_TOOLTIP]:Hide()
end

--[[
  Enables a list of checkButtons

  @param {table} checkButtonNames
]]--
function me.EnableCheckButtons(checkButtonNames)
  for _, checkButtonName in pairs(checkButtonNames) do
    local checkButtonFrame = _G[checkButtonName]

    if checkButtonFrame ~= nil then
      mod.guiHelper.EnableCheckButton(checkButtonFrame)
    else
      mod.logger.LogError(me.tag, "Tried to enable non-existent checkbutton")
    end
  end
end

--[[
  Disables a list of checkButtons

  @param {table} checkButtonNames
]]--
function me.DisableCheckButtons(checkButtonNames)
  for _, checkButtonName in pairs(checkButtonNames) do
    local checkButtonFrame = _G[checkButtonName]

    if checkButtonFrame ~= nil then
      mod.guiHelper.DisableCheckButton(checkButtonFrame)
    else
      mod.logger.LogError(me.tag, "Tried to disable non-existent checkbutton")
    end
  end
end
