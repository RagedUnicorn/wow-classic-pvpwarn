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

-- luacheck: globals CreateFrame
-- luacheck: globals SettingsPanel InterfaceOptionsFrame

--[[
  Dedicated options sub-panel for the detection bar feature. Provides a global enable toggle,
  an anchor lock toggle, max-bars / font-size sliders and an anchor reset button. Registered as
  a sub-category under the addon Settings panel via gui/AddonConfiguration.lua. Mirrors the
  structure of gui/GeneralMenu.lua.
]]--

local mod = rgpvpw
local me = {}
mod.detectionBarMenu = me

me.tag = "DetectionBarMenu"

-- track whether the menu was already built
local builtMenu = false
-- reference to the positioning toggle button so its label can be kept in sync
local positionButton

--[[
  OnShow handler for the panel. Builds the ui once, then auto-enters positioning mode so the
  anchor and a sample bar become visible while the panel is open (Blizzard Edit-Mode style).

  @param {table} frame
    The addon configuration (sub-category) frame
]]--
function me.OnPanelShow(frame)
  me.BuildUi(frame)
  mod.detectionBarAnchor.EnterPositioning()
  me.UpdatePositionButtonLabel()
end

--[[
  OnHide handler for the panel. Leaves positioning mode so the anchor reverts to locked when the
  user navigates away or closes Settings.
]]--
function me.OnPanelHide()
  mod.detectionBarAnchor.ExitPositioning()
end

--[[
  Hook the Settings window itself so closing it (Escape / close button) always finishes
  positioning - as if "Done" was clicked - even if the sub-panel's own OnHide does not fire.
  ExitPositioning is idempotent, so this can safely run alongside the panel OnHide.
]]--
function me.HookSettingsClose()
  if me.settingsCloseHooked then return end

  local settingsFrame = SettingsPanel or InterfaceOptionsFrame

  if settingsFrame == nil then return end

  settingsFrame:HookScript("OnHide", function()
    if mod.detectionBarAnchor.IsPositioning() then
      me.OnPanelHide()
    end
  end)

  me.settingsCloseHooked = true
end

--[[
  Build the ui for the detection bar menu.

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildUi(frame)
  if builtMenu then return end

  me.BuildTitle(frame)
  me.BuildEnableOption(frame)
  me.BuildPositionButton(frame)
  me.BuildMaxBarsSlider(frame)
  me.BuildScaleSlider(frame)
  me.BuildResetAnchorButton(frame)

  frame:SetScript("OnHide", me.OnPanelHide)
  --[[ also finish positioning when the whole Settings window closes, not just on navigate-away ]]--
  me.HookSettingsClose()
  --[[ keep the button label in sync when combat or a panel close forces positioning off ]]--
  mod.detectionBarAnchor.onPositioningChanged = me.UpdatePositionButtonLabel

  builtMenu = true
end

--[[
  Build the title for the detection bar menu.

  @param {table} frame
]]--
function me.BuildTitle(frame)
  local titleFontString = frame:CreateFontString(
    RGPVPW_CONSTANTS.ELEMENT_DETECTION_BAR_TITLE, "OVERLAY", "GameFontNormalLarge")
  titleFontString:SetPoint("TOPLEFT", 16, -16)
  mod.guiHelper.SetColor(titleFontString, RGPVPW_CONSTANTS.COLOR.TITLE_GOLD)
  titleFontString:SetText(rgpvpw.L["detection_bar_title"])
end

--[[
  Build the global enable/disable checkbox.

  @param {table} frame
]]--
function me.BuildEnableOption(frame)
  local checkbox = mod.guiHelper.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_DETECTION_BAR_ENABLE,
    frame,
    {"TOPLEFT", 20, -52},
    function(self)
      if self:GetChecked() then
        mod.configuration.EnableDetectionBar()
      else
        mod.configuration.DisableDetectionBar()
      end
    end,
    function(self)
      self:SetChecked(mod.configuration.IsDetectionBarEnabled())
    end,
    rgpvpw.L["detection_bar_enable"],
    rgpvpw.L["detection_bar_enable_tooltip"]
  )

  --[[
    GuiHelper.CreateCheckBox registers the OnShow handler but does not invoke it, so sync the
    initial checked state to the saved config explicitly
  ]]--
  checkbox:SetChecked(mod.configuration.IsDetectionBarEnabled())
end

--[[
  Build the "Position detection bar" toggle button. Entering positioning mode unlocks the anchor
  and shows a sample bar; the button flips to "Done" to lock it again.

  @param {table} frame
]]--
function me.BuildPositionButton(frame)
  positionButton = mod.guiHelper.CreatePlayButton(
    RGPVPW_CONSTANTS.ELEMENT_DETECTION_BAR_POSITION_BUTTON,
    frame,
    {"TOPLEFT", 20, -107},
    function()
      mod.detectionBarAnchor.TogglePositioning()
    end,
    rgpvpw.L["detection_bar_position"]
  )
end

--[[
  Update the position button's label to reflect the current positioning state.
]]--
function me.UpdatePositionButtonLabel()
  if positionButton == nil then return end

  if mod.detectionBarAnchor.IsPositioning() then
    positionButton:SetText(rgpvpw.L["detection_bar_done"])
  else
    positionButton:SetText(rgpvpw.L["detection_bar_position"])
  end

  mod.guiHelper.ResizeButtonToText(positionButton)
end

--[[
  Generic slider builder.

  @param {table} frame
  @param {string} name
  @param {string} label
  @param {number} min
  @param {number} max
  @param {number} step
  @param {number} posX
  @param {number} posY
  @param {function} getValue
  @param {function} setValue

  @return {table}
    The created slider
]]--
function me.CreateSlider(frame, name, label, min, max, step, posX, posY, getValue, setValue, formatValue)
  return mod.guiHelper.CreateSliderWithSteppers(
    name,
    frame,
    {"TOPLEFT", posX, posY},
    {
      min = min,
      max = max,
      step = step,
      defaultValue = getValue(),
      label = label,
      formatValue = formatValue,
      onValueChanged = function(_, value)
        setValue(value)
        --[[ reflect sizing changes on the sample bar while positioning ]]--
        mod.detectionBarManager.RefreshPreview()
      end
    }
  )
end

--[[
  Build the max-bars slider (1-4).

  @param {table} frame
]]--
function me.BuildMaxBarsSlider(frame)
  me.CreateSlider(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_DETECTION_BAR_MAX_BARS_SLIDER,
    rgpvpw.L["detection_bar_max_bars_label"],
    1, 4, 1, 20, -162,
    mod.configuration.GetDetectionBarMaxBars,
    mod.configuration.SetDetectionBarMaxBars
  )
end

--[[
  Build the bar-size (scale) slider (50% - 200%).

  @param {table} frame
]]--
function me.BuildScaleSlider(frame)
  me.CreateSlider(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_DETECTION_BAR_SCALE_SLIDER,
    rgpvpw.L["detection_bar_size_label"],
    0.5, 2.0, 0.05, 20, -222,
    mod.configuration.GetDetectionBarScale,
    me.SetBarScale,
    function(value)
      return tostring(math.floor(value * 100 + 0.5)) .. "%"
    end
  )
end

--[[
  Apply a new bar scale: persist it and scale the live stack.

  @param {number} value
]]--
function me.SetBarScale(value)
  mod.configuration.SetDetectionBarScale(value)
  mod.detectionBarManager.ApplyScale()
end

--[[
  Build the anchor reset button.

  @param {table} frame
]]--
function me.BuildResetAnchorButton(frame)
  mod.guiHelper.CreatePlayButton(
    RGPVPW_CONSTANTS.ELEMENT_DETECTION_BAR_RESET_ANCHOR_BUTTON,
    frame,
    {"TOPLEFT", 20, -282},
    function()
      mod.detectionBarAnchor.ResetPosition()
    end,
    rgpvpw.L["detection_bar_reset_anchor_button"]
  )
end
