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

--[[
  Dedicated options sub-panel for the stance state tracker. Provides the tracking enable toggle,
  the hide unknown stance toggle that depends on it, the shared positioning mode toggle (see
  gui/StateFramePositioning.lua - it shows both state icons so they can be aligned in one pass)
  and a reset button for this icon's position. Registered as a sub-category under the addon
  Settings panel via gui/AddonConfiguration.lua. Mirrors the structure of gui/CombatStateMenu.lua.
]]--

local mod = rgpvpw
local me = {}
mod.stanceStateMenu = me

me.tag = "StanceStateMenu"

-- track whether the menu was already built
local builtMenu = false
-- reference to the positioning toggle button so its label can be kept in sync
local positionButton
-- reference to the icon size slider so the reset button can move it back to the default
local iconSizeSlider

--[[
  OnShow handler for the panel. Builds the ui once, then syncs the positioning button label
  because the slash command can have changed positioning mode while the panel was closed.

  @param {table} frame
    The addon configuration (sub-category) frame
]]--
function me.OnPanelShow(frame)
  me.BuildUi(frame)
  me.UpdatePositionButtonLabel()
end

--[[
  Build the ui for the stance state menu

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildUi(frame)
  if builtMenu then return end

  mod.guiHelper.CreatePanelTitle(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_TITLE,
    rgpvpw.L["stance_state_title"]
  )
  me.BuildStanceStateOptions(frame)
  me.BuildPositionButton(frame)
  me.BuildIconSizeSlider(frame)
  me.BuildResetButton(frame)

  --[[ positioning mode is shared and can also be flipped by the slash commands - the coordinator
       owns the callback slots and fans changes out to every registered listener ]]--
  mod.stateFramePositioning.RegisterListener(me.UpdatePositionButtonLabel)

  builtMenu = true
end

--[[
  Creates all checkButtons for the stanceState configuration. Make sure to create checkbuttons
  that are dependant on others first

  @param {table} frame
]]--
function me.BuildStanceStateOptions(frame)
  mod.guiHelper.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_OPT_HIDE_UNKNOWN,
    frame,
    {"TOPLEFT", 40, -100},
    me.HideUnknownStanceOnClick,
    me.HideUnknownStanceOnShow,
    rgpvpw.L["hide_unknown_stance"],
    rgpvpw.L["hide_unknown_stance_tooltip"]
  )

  mod.guiHelper.CreateLinkedCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_OPT_ENABLE,
    frame,
    {"TOPLEFT", 20, -52},
    me.EnableStanceStateTrackingOnClick,
    me.EnableStanceStateTrackingOnShow,
    rgpvpw.L["enable_stance_state_tracking"],
    rgpvpw.L["enable_stance_state_tracking_tooltip"],
    { RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_OPT_HIDE_UNKNOWN }
  )
end

--[[
  Build the positioning mode toggle button. Entering positioning mode shows both state icons -
  the combat and the stance one - and makes them draggable, so they can be placed next to each
  other without a target in combat; the button flips to "Done" to hide them again.

  @param {table} frame
]]--
function me.BuildPositionButton(frame)
  positionButton = mod.guiHelper.CreateTextButton(
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_POSITION_BUTTON,
    frame,
    {"TOPLEFT", 20, -155},
    function()
      mod.stateFramePositioning.TogglePositioning()
    end,
    rgpvpw.L["state_frame_position"]
  )
end

--[[
  Build the icon size slider. Resizing is applied live to the icon and persisted per frame -
  the combat icon has its own independent size.

  @param {table} frame
]]--
function me.BuildIconSizeSlider(frame)
  iconSizeSlider = mod.guiHelper.CreateSlider(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_ICON_SIZE_SLIDER,
    rgpvpw.L["state_frame_icon_size_label"],
    RGPVPW_CONSTANTS.STATE_ICON_SIZE_MIN,
    RGPVPW_CONSTANTS.STATE_ICON_SIZE_MAX,
    RGPVPW_CONSTANTS.STATE_ICON_SIZE_STEP,
    20, -210,
    mod.configuration.GetStanceStateIconSize,
    function(value)
      mod.configuration.SetStanceStateIconSize(value)
      mod.stanceFrame.SetIconSize(value)
    end,
    function(value)
      return tostring(value) .. rgpvpw.L["state_frame_icon_size_unit"]
    end
  )
end

--[[
  Build the button that resets the stance state icon back to its defaults - position and size

  @param {table} frame
]]--
function me.BuildResetButton(frame)
  mod.guiHelper.CreateTextButton(
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_RESET_BUTTON,
    frame,
    {"TOPLEFT", 20, -270},
    function()
      mod.stanceFrame.ResetToDefault()
      --[[ the reset changed the size behind the slider's back - move it along ]]--
      mod.guiHelper.SetSliderValue(iconSizeSlider, RGPVPW_CONSTANTS.STATE_ICON_HOLDER_ICON_SIZE)
    end,
    rgpvpw.L["stance_state_reset"]
  )
end

--[[
  Update the position button's label to reflect the current positioning mode state.
]]--
function me.UpdatePositionButtonLabel()
  if positionButton == nil then return end

  if mod.stateFramePositioning.IsPositioning() then
    positionButton:SetText(rgpvpw.L["state_frame_done"])
  else
    positionButton:SetText(rgpvpw.L["state_frame_position"])
  end

  mod.guiHelper.ResizeButtonToText(positionButton)
end

--[[
  OnShow callback for checkbuttons - enable stance state tracking

  @param {table} self
]]--
function me.EnableStanceStateTrackingOnShow(self)
  if mod.configuration.IsStanceStateTrackingEnabled() then
    self:SetChecked(true)
    mod.guiHelper.EnableCheckButtons(self.linkedCheckButtonNames)
  else
    self:SetChecked(false)
    mod.guiHelper.DisableCheckButtons(self.linkedCheckButtonNames)
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
    mod.guiHelper.EnableCheckButtons(self.linkedCheckButtonNames)
  else
    mod.configuration.DisableStanceStateTracking()
    mod.guiHelper.DisableCheckButtons(self.linkedCheckButtonNames)
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
