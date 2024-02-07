--[[
  MIT License

  Copyright (c) 2024 Michael Wiesendanger

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

-- luacheck: globals CreateFrame UIParent WorldFrame UIFrameFlash C_Timer GetCursorPosition

local mod = rgpvpw
local me = {}
mod.visual = me

me.tag = "Visual"

--[[
  Private
]]--
local TEXTURE_BASE_PATH = "Interface\\AddOns\\PVPWarn\\assets\\images\\"
local alertFrame
local alertTexture

--[[
  Create the basic world frame and its texture that displays alert flashes
]]--
function me.CreateVisualAlertFrame()
  alertFrame = CreateFrame("Frame", RGPVPW_CONSTANTS.ELEMENT_ALERT_FRAME, UIParent)
  alertTexture = alertFrame:CreateTexture(RGPVPW_CONSTANTS.ELEMENT_ALERT_TEXTURE, "BACKGROUND")

  alertTexture:SetBlendMode("ADD")
  alertTexture:SetAllPoints(WorldFrame)
end

--[[
  Show a visual warning to the user

  @param {number} colorValue
    see PVPW_CONSTANTS.TEXTURES for color values
]]--
function me.ShowVisualAlert(colorValue)
  local texture = me.GetTexture(colorValue)

  if texture == nil then
    mod.logger.LogError(me.tag, "Unable to find a texture matching colorValue: " .. colorValue)
    return
  end

  if alertTexture == nil then
    -- initialize frameholder
    me.CreateVisualAlertFrame()
  end

  alertTexture:SetTexture(TEXTURE_BASE_PATH .. texture)
  UIFrameFlash(alertFrame, .2, .5, .7, false, 0, 0)
end

--[[
  Search for the texture matching the colorValue

  @param {number} colorValue
    see PVPW_CONSTANTS.TEXTURES for color values

  @return {string | nil}
    Returns the textureName found or nil if none can be found
]]--
function me.GetTexture(colorValue)
  local textures = RGPVPW_CONSTANTS.TEXTURES

  for _, color in pairs(textures) do
    if color.colorValue == colorValue then
      return color.textureName
    end
  end

  return nil
end
