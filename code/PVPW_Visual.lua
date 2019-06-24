--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

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
  texturePath = TEXTURE_BASE_PATH .. "texture_yellow"
  mod.logger.LogDebug(me.tag, "Displaying warning texture - " .. "texture_yellow")

  alertTexture:SetTexture(texturePath)
  UIFrameFlash(alertFrame, .2, .5, .7, false, 0, 0)
end

-- /run _G["__PVPW__DEBUG__TEST"]()
-- _G["PointerTexture"]:SetRotation(1)
function me.CreateFramePointer()
  local test = CreateFrame("Frame", "PointerFrame", UIParent)
  test:SetSize(70, 70)
  local texture = test:CreateTexture("PointerTexture", "BACKGROUND")
  texture:SetTexture([[Interface\AddOns\PVPWarn\assets\images\pointer]])
  texture:SetVertexColor(0, 0.5, 1)
  texture:SetPoint("TOPLEFT", test, "TOPLEFT")
  texture:SetPoint("BOTTOMRIGHT", test, "BOTTOMRIGHT")
  test:SetPoint("BOTTOMLEFT", 1498, 599)

  C_Timer.NewTicker(
    0.02, function()
      local scale, l, b, w, h = test:GetEffectiveScale(), test:GetRect()
      local x, y = GetCursorPosition()
      local dx, dy = (x / scale) - (l + w / 2), (y / scale) - (b + h / 2)
      local angle = atan2(dy, dx) % 360
      mod.logger.LogWarn(me.tag, "angle: " .. angle)
      texture:SetRotation(angle/180*3.1415926535898 - 90/180*3.1415926535898)
    end
  )
end
