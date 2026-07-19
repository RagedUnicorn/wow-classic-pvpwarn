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

  mod.guiHelper.CreatePanelTitle(frame, RGPVPW_CONSTANTS.ELEMENT_FLASH_MENU_TITLE, rgpvpw.L["flash_title"])
  me.BuildEnableOption(frame)
  me.BuildMaxOpacitySlider(frame)
  me.BuildPulseOption(frame)
  me.BuildAdditiveBlendOption(frame)
  me.BuildTestButton(frame)

  builtMenu = true
end

--[[
  Build the global enable/disable checkbox.

  @param {table} frame
]]--
function me.BuildEnableOption(frame)
  mod.guiHelper.CreateCheckBox(
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
end

--[[
  Build the max-opacity slider (10% - 100%).

  @param {table} frame
]]--
function me.BuildMaxOpacitySlider(frame)
  mod.guiHelper.CreateSlider(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_FLASH_OPT_MAX_OPACITY_SLIDER,
    rgpvpw.L["flash_max_opacity_label"],
    0.1, 1.0, 0.05, 20, -120,
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
  mod.guiHelper.CreateCheckBox(
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
end

--[[
  Build the additive-blend checkbox. Checked maps to the "ADD" blend mode (brighter), unchecked
  to the default "BLEND".

  @param {table} frame
]]--
function me.BuildAdditiveBlendOption(frame)
  mod.guiHelper.CreateCheckBox(
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
