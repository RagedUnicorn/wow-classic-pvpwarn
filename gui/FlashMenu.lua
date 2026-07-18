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

--[[
  Dedicated options sub-panel for the vignette flash feature. Provides a global enable toggle,
  a max-opacity slider, a pulse toggle, an additive-blend toggle and a test button. Registered
  as a sub-category under the addon Settings panel via gui/AddonConfiguration.lua. Mirrors the
  structure of gui/DetectionBarMenu.lua.
]]--

local mod = rgpvpw
local me = {}
mod.flashMenu = me

me.tag = "FlashMenu"

-- track whether the menu was already built
local builtMenu = false

--[[
  Build the ui for the flash menu.

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildUi(frame)
  if builtMenu then return end

  me.BuildTitle(frame)
  me.BuildEnableOption(frame)
  me.BuildMaxOpacitySlider(frame)
  me.BuildPulseOption(frame)
  me.BuildAdditiveBlendOption(frame)
  me.BuildTestButton(frame)

  builtMenu = true
end

--[[
  Build the title for the flash menu.

  @param {table} frame
]]--
function me.BuildTitle(frame)
  local titleFontString = frame:CreateFontString(
    RGPVPW_CONSTANTS.ELEMENT_FLASH_MENU_TITLE, "OVERLAY", "GameFontNormalLarge")
  titleFontString:SetPoint("TOPLEFT", 16, -16)
  mod.guiHelper.SetColor(titleFontString, RGPVPW_CONSTANTS.COLOR.TITLE_GOLD)
  titleFontString:SetText(rgpvpw.L["flash_title"])
end

--[[
  Build the global enable/disable checkbox.

  @param {table} frame
]]--
function me.BuildEnableOption(frame)
  local checkbox = mod.guiHelper.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_FLASH_OPT_ENABLE,
    frame,
    {"TOPLEFT", 20, -52},
    function(self)
      if self:GetChecked() then
        mod.configuration.EnableFlash()
      else
        mod.configuration.DisableFlash()
      end
    end,
    function(self)
      self:SetChecked(mod.configuration.IsFlashEnabled())
    end,
    rgpvpw.L["flash_enable"],
    rgpvpw.L["flash_enable_tooltip"]
  )

  checkbox:SetChecked(mod.configuration.IsFlashEnabled())
end

--[[
  Build the max-opacity slider (10% - 100%).

  @param {table} frame
]]--
function me.BuildMaxOpacitySlider(frame)
  me.CreateSlider(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_FLASH_OPT_MAX_OPACITY_SLIDER,
    rgpvpw.L["flash_max_opacity_label"],
    0.1, 1.0, 0.05, 25, -132,
    mod.configuration.GetFlashMaxOpacity,
    mod.configuration.SetFlashMaxOpacity,
    function(value)
      return tostring(math.floor(value * 100 + 0.5)) .. "%"
    end
  )
end

--[[
  Build the pulse effect checkbox. Toggling it refreshes the live animation so the next test
  flash reflects the change without a /reload.

  @param {table} frame
]]--
function me.BuildPulseOption(frame)
  local checkbox = mod.guiHelper.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_FLASH_OPT_PULSE,
    frame,
    {"TOPLEFT", 20, -177},
    function(self)
      if self:GetChecked() then
        mod.configuration.EnableFlashPulse()
      else
        mod.configuration.DisableFlashPulse()
      end

      mod.flash.RefreshAnimation()
    end,
    function(self)
      self:SetChecked(mod.configuration.IsFlashPulseEnabled())
    end,
    rgpvpw.L["flash_pulse"],
    rgpvpw.L["flash_pulse_tooltip"]
  )

  checkbox:SetChecked(mod.configuration.IsFlashPulseEnabled())
end

--[[
  Build the additive-blend checkbox. Checked maps to the "ADD" blend mode (brighter), unchecked
  to the default "BLEND".

  @param {table} frame
]]--
function me.BuildAdditiveBlendOption(frame)
  local checkbox = mod.guiHelper.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_FLASH_OPT_ADDITIVE_BLEND,
    frame,
    {"TOPLEFT", 20, -237},
    function(self)
      if self:GetChecked() then
        mod.configuration.SetFlashBlendMode("ADD")
      else
        mod.configuration.SetFlashBlendMode("BLEND")
      end
    end,
    function(self)
      self:SetChecked(mod.configuration.GetFlashBlendMode() == "ADD")
    end,
    rgpvpw.L["flash_additive_blend"],
    rgpvpw.L["flash_additive_blend_tooltip"]
  )

  checkbox:SetChecked(mod.configuration.GetFlashBlendMode() == "ADD")
end

--[[
  Pick a random flash color value (any RGPVPW_CONSTANTS.TEXTURES color except `none`).

  @return {number}
]]--
function me.GetRandomColorValue()
  local colorValues = {}

  for _, color in pairs(RGPVPW_CONSTANTS.TEXTURES) do
    if color.colorValue ~= RGPVPW_CONSTANTS.DEFAULT_COLOR then
      colorValues[#colorValues + 1] = color.colorValue
    end
  end

  return colorValues[math.random(#colorValues)]
end

--[[
  Build the test button. Fires a vignette in a random color using the current settings so the
  user can preview without a combat event.

  @param {table} frame
]]--
function me.BuildTestButton(frame)
  mod.guiHelper.CreatePlayButton(
    RGPVPW_CONSTANTS.ELEMENT_FLASH_OPT_TEST_BUTTON,
    frame,
    {"TOPLEFT", 20, -297},
    function()
      mod.flash.Show(me.GetRandomColorValue())
    end,
    rgpvpw.L["flash_test_button"]
  )
end

--[[
  Generic slider builder. Mirrors gui/DetectionBarMenu.lua's slider, without the detection-bar
  preview hook.

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
  @param {function} formatValue

  @return {table}
    The created slider
]]--
function me.CreateSlider(frame, name, label, min, max, step, posX, posY, getValue, setValue, formatValue)
  local slider = CreateFrame("Slider", name, frame, "OptionsSliderTemplate")
  slider:SetPoint("TOPLEFT", posX, posY)
  slider:SetWidth(220)
  slider:SetMinMaxValues(min, max)
  slider:SetValueStep(step)
  slider:SetObeyStepOnDrag(true)

  local function fmt(value)
    if formatValue then return formatValue(value) end

    return tostring(value)
  end

  _G[name .. "Low"]:SetText(fmt(min))
  _G[name .. "High"]:SetText(fmt(max))

  local function updateLabel(value)
    _G[name .. "Text"]:SetText(label .. " (" .. fmt(value) .. ")")
  end

  slider:SetValue(getValue())
  updateLabel(getValue())

  slider:SetScript("OnValueChanged", function(_, value)
    value = math.floor(value / step + 0.5) * step
    setValue(value)
    updateLabel(value)
  end)

  return slider
end
