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
  }, {
    "HideUnknownStance",
    rgpvpw.L["hide_unknown_stance"],
    rgpvpw.L["hide_unknown_stance_tooltip"]
  }
}

-- track whether the menu was already built
local builtMenu = false

-- reference to the warn mode dropdown frame
local warnModeDropdown

--[[
  Build the ui for the general menu

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildUi(frame)
  if builtMenu then return end

  mod.guiHelper.CreatePanelTitle(frame, RGPVPW_CONSTANTS.ELEMENT_GENERAL_TITLE, rgpvpw.L["general_title"])
  me.BuildCombatStateOptions(frame)
  me.BuildStanceStateOptions(frame)
  me.BuildWarnModeDropdown(frame)

  builtMenu = true
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
    -100,
    me.LockFrameCombatStateOnShow,
    me.LockFrameCombatStateOnClick
  )

  me.BuildCheckButtonOption(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_GENERAL_OPT_ENABLE_COMBAT_STATE,
    20,
    -52,
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
    -212,
    me.LockFrameStanceStateOnShow,
    me.LockFrameStanceStateOnClick
  )

  me.BuildCheckButtonOption(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_GENERAL_OPT_HIDE_UNKNOWN_STANCE,
    40,
    -260,
    me.HideUnknownStanceOnShow,
    me.HideUnknownStanceOnClick
  )

  me.BuildCheckButtonOption(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_GENERAL_OPT_ENABLE_STANCE_STATE,
    20,
    -164,
    me.EnableStanceStateTrackingOnShow,
    me.EnableStanceStateTrackingOnClick,
    {
      RGPVPW_CONSTANTS.ELEMENT_GENERAL_OPT_LOCK_FRAME_STANCE_STATE,
      RGPVPW_CONSTANTS.ELEMENT_GENERAL_OPT_HIDE_UNKNOWN_STANCE
    }
  )
end

--[[
  OnShow callback for checkbuttons - lock stance state frame

  @param {table} self
]]--
function me.LockFrameStanceStateOnShow(self)
  if mod.configuration.IsStanceStateFrameLocked() then
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
  OnShow callback for checkbuttons - hide unknown stance

  @param {table} self
]]--
function me.HideUnknownStanceOnShow(self)
  if mod.configuration.IsHideUnknownStanceEnabled() then
    self:SetChecked(true)
  else
    self:SetChecked(false)
  end
end

--[[
  OnClick callback for checkbuttons - hide unknown stance

  @param {table} self
]]--
function me.HideUnknownStanceOnClick(self)
  local enabled = self:GetChecked()

  if enabled then
    mod.configuration.EnableHideUnknownStance()
  else
    mod.configuration.DisableHideUnknownStance()
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
  local labelText, descriptionText = me.GetOptionTexts(optionFrameName)

  mod.guiHelper.CreateCheckBox(
    optionFrameName,
    parentFrame,
    {"TOPLEFT", posX, posY},
    onClickCallback,
    --[[
      Linked buttons automatically get enabled/disabled based on the checkButton state. The
      names are assigned in the wrapper so they are already present when CreateCheckBox
      invokes the callback to load the initial state.
    ]]--
    function(self)
      self.linkedCheckButtonNames = linkedCheckButtonNames
      onShowCallback(self)
    end,
    labelText,
    descriptionText
  )
end

--[[
  Get the label and description text for the checkbutton

  @param {string} frameName

  @return {string}, {string}
    The text for the label and the always-visible description below it
]]--
function me.GetOptionTexts(frameName)
  if not frameName then return end

  for i = 1, #options do
    if frameName == RGPVPW_CONSTANTS.ELEMENT_GENERAL_OPT .. options[i][1] then
      return options[i][2], options[i][3]
    end
  end
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

--[[
  Build the warning mode dropdown (target filter). Mirrors the voice pack dropdown in
  gui/VoicePackMenu.lua.

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildWarnModeDropdown(frame)
  local dropdownLabel = frame:CreateFontString(nil, "OVERLAY")
  dropdownLabel:SetFont(STANDARD_TEXT_FONT, 15)
  dropdownLabel:SetPoint("TOPLEFT", 20, -322)
  mod.guiHelper.SetColor(dropdownLabel, RGPVPW_CONSTANTS.COLOR.BODY)
  dropdownLabel:SetText(rgpvpw.L["warn_mode_label"])

  warnModeDropdown = mod.guiHelper.CreateSettingsDropdown(
    RGPVPW_CONSTANTS.ELEMENT_GENERAL_OPT_WARN_MODE_DROPDOWN,
    frame,
    {"LEFT", dropdownLabel, "RIGHT", 10, -2},
    220,
    me.InitializeWarnModeDropdown
  )
  -- generate once so the button shows the current selection before the menu was ever opened
  warnModeDropdown:GenerateMenu()
end

--[[
  Menu generator for the warning mode dropdown - fills the root description with a radio
  entry per available target filter mode

  @param {table} _
    The dropdown the menu is generated for (unused)
  @param {table} rootDescription
]]--
function me.InitializeWarnModeDropdown(_, rootDescription)
  local modes = {
    {
      value = RGPVPW_CONSTANTS.TARGET_FILTER_MODE_WARN_ALL,
      text = rgpvpw.L["warn_mode_warn_all"]
    }, {
      value = RGPVPW_CONSTANTS.TARGET_FILTER_MODE_CURRENT_TARGET,
      text = rgpvpw.L["warn_mode_current_target"]
    }
  }

  for _, mode in ipairs(modes) do
    rootDescription:CreateRadio(mode.text, me.IsWarnModeSelected, me.OnWarnModeSelect, mode.value)
  end
end

--[[
  Whether the passed warning mode is the currently configured one

  @param {string} mode

  @return {boolean}
]]--
function me.IsWarnModeSelected(mode)
  return mod.configuration.GetTargetFilterMode() == mode
end

--[[
  Callback for when a warning mode is selected

  @param {string} mode
    The selected target filter mode
]]--
function me.OnWarnModeSelect(mode)
  mod.configuration.SetTargetFilterMode(mode)

  mod.logger.LogInfo(me.tag, "Selected warning mode: " .. mode)
end
