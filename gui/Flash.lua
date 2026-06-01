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

-- luacheck: globals CreateFrame UIParent

local mod = rgpvpw
local me = {}
mod.flash = me

me.tag = "Flash"

--[[
  Private
]]--
local TEXTURE_BASE_PATH = "Interface\\AddOns\\PVPWarn\\assets\\flash\\"
--[[
  The flash uses the soft vignette flavor only. Colors that ship a vignette texture under
  assets/flash/ - every RGPVPW_CONSTANTS.TEXTURES color except `none` (which has no flash).
  Any unexpected color falls back to white (see me.Show).
]]--
local FLASH_COLORS = {
  ["red"] = true,
  ["orange"] = true,
  ["yellow"] = true,
  ["green"] = true,
  ["blue"] = true,
  ["light_blue"] = true,
  ["pink"] = true,
  ["brown"] = true,
  ["white"] = true,
  ["violet"] = true
}

local flashFrame
local flashTexture
local life
local pulseAnimation
local fadeOutAnimation

--[[
  Whether the flash is currently suppressed (during loading screens). Set by the event
  handler registered in me.RegisterSuppressionEvents.
]]--
me.suppressed = false

--[[
  Resolve the bare color name (e.g. "red") for a TEXTURES colorValue. The keys of
  RGPVPW_CONSTANTS.TEXTURES are the bare color names.

  @param {number} colorValue

  @return {string | nil}
    The color name or nil if no entry matches
]]--
local function GetColorName(colorValue)
  for colorName, color in pairs(RGPVPW_CONSTANTS.TEXTURES) do
    if color.colorValue == colorValue then
      return colorName
    end
  end

  return nil
end

--[[
  Apply the configured pulse setting to the lifecycle animation. When pulse is enabled the
  lifecycle is fade in -> hold -> pulse -> fade out; when disabled the pulse step collapses
  to a no-op so it becomes fade in -> hold -> fade out. The alpha values are normalized
  (0 - 1); the configured max opacity is applied separately via the texture alpha in me.Show.
]]--
local function ApplyPulseSetting()
  if life == nil then return end

  if mod.configuration.IsFlashPulseEnabled() then
    pulseAnimation:SetFromAlpha(0.55)
    pulseAnimation:SetToAlpha(0.85)
    pulseAnimation:SetDuration(0.7)
    fadeOutAnimation:SetFromAlpha(0.85)
  else
    --[[ flat hold (same duration) instead of an oscillating pulse - avoids a 0-duration step ]]--
    pulseAnimation:SetFromAlpha(0.55)
    pulseAnimation:SetToAlpha(0.55)
    pulseAnimation:SetDuration(0.7)
    fadeOutAnimation:SetFromAlpha(0.55)
  end
end

--[[
  Build the lifecycle animation group with normalized alpha values. References to the pulse
  and fade-out animations are kept so the pulse setting can be toggled live (see
  ApplyPulseSetting / me.RefreshAnimation).
]]--
local function BuildAnimation()
  life = flashFrame:CreateAnimationGroup()

  local fadeIn = life:CreateAnimation("Alpha")
  fadeIn:SetFromAlpha(0)
  fadeIn:SetToAlpha(1)
  fadeIn:SetDuration(0.25)
  fadeIn:SetSmoothing("OUT")
  fadeIn:SetOrder(1)

  local hold = life:CreateAnimation("Alpha")
  hold:SetFromAlpha(1)
  hold:SetToAlpha(0.55)
  hold:SetDuration(0.4)
  hold:SetSmoothing("IN_OUT")
  hold:SetOrder(2)

  pulseAnimation = life:CreateAnimation("Alpha")
  pulseAnimation:SetSmoothing("IN_OUT")
  pulseAnimation:SetOrder(3)

  fadeOutAnimation = life:CreateAnimation("Alpha")
  fadeOutAnimation:SetToAlpha(0)
  fadeOutAnimation:SetDuration(0.5)
  fadeOutAnimation:SetSmoothing("IN")
  fadeOutAnimation:SetOrder(4)

  ApplyPulseSetting()

  life:SetScript("OnFinished", function()
    flashFrame:Hide()
  end)
end

--[[
  Lazily create the full-screen overlay frame, its texture and the lifecycle animation
  group. Anchored to UIParent on the BACKGROUND strata so it sits behind unit frames /
  nameplates and never eats input.
]]--
function me.Initialize()
  if flashFrame ~= nil then return end

  flashFrame = CreateFrame("Frame", RGPVPW_CONSTANTS.ELEMENT_FLASH_FRAME, UIParent)
  flashFrame:SetAllPoints(UIParent)
  flashFrame:SetFrameStrata("BACKGROUND")
  flashFrame:EnableMouse(false)
  flashFrame:EnableMouseWheel(false)
  flashFrame:Hide()

  flashTexture = flashFrame:CreateTexture(RGPVPW_CONSTANTS.ELEMENT_FLASH_TEXTURE, "ARTWORK")
  flashTexture:SetAllPoints(flashFrame)

  BuildAnimation()
end

--[[
  Re-apply the pulse setting to the existing animation. Called by the options panel after the
  pulse checkbox is toggled so the next flash reflects the change without a /reload.
]]--
function me.RefreshAnimation()
  ApplyPulseSetting()
end

--[[
  Register the event frame that suppresses the flash during loading screens so detections that
  fire mid-load do not paint over the loading screen. An in-flight animation is left to finish
  naturally; only new flashes are blocked while suppressed.
]]--
function me.RegisterSuppressionEvents()
  local eventFrame = CreateFrame("Frame")

  eventFrame:RegisterEvent("LOADING_SCREEN_ENABLED")
  eventFrame:RegisterEvent("LOADING_SCREEN_DISABLED")

  eventFrame:SetScript("OnEvent", function(_, event)
    if event == "LOADING_SCREEN_ENABLED" then
      me.suppressed = true
    else
      me.suppressed = false
    end
  end)

  me.eventFrame = eventFrame
end

--[[
  Show a soft vignette flash for the given color and play the lifecycle animation.
  Re-firing while a previous flash is still animating restarts it cleanly.

  @param {number} colorValue
    see RGPVPW_CONSTANTS.TEXTURES for color values
]]--
function me.Show(colorValue)
  -- do not paint over loading screens
  if me.suppressed then
    return
  end

  -- `none` never flashes (also gated upstream by IsVisualWarningActive)
  if colorValue == nil or colorValue == RGPVPW_CONSTANTS.DEFAULT_COLOR then
    return
  end

  local color = GetColorName(colorValue)

  if color == nil then
    mod.logger.LogError(me.tag, "Unable to find a color matching colorValue: " .. tostring(colorValue))
    return
  end

  -- any unexpected color without a dedicated vignette asset falls back to white
  if not FLASH_COLORS[color] then
    color = "white"
  end

  me.Initialize()

  flashTexture:SetBlendMode(mod.configuration.GetFlashBlendMode())
  flashTexture:SetTexture(TEXTURE_BASE_PATH .. color)
  --[[ the animation drives the frame alpha 0 - 1; the texture alpha caps it at max opacity ]]--
  flashTexture:SetAlpha(mod.configuration.GetFlashMaxOpacity())
  flashFrame:SetAlpha(0)
  flashFrame:Show()
  life:Stop()
  life:Play()
end

--[[
  Thin wrapper used by the `flash` slash subcommand (see code/CmdFlash.lua) and the options
  panel test button to fire a one-off flash without a combat event.

  @param {string} colorName
    one of the FLASH_COLORS keys

  @return {boolean}
    true  - the flash was fired
    false - the color was invalid (caller is expected to print a user error)
]]--
function me.Test(colorName)
  if type(colorName) ~= "string" or not FLASH_COLORS[colorName] then
    return false
  end

  me.Show(RGPVPW_CONSTANTS.TEXTURES[colorName].colorValue)

  return true
end
