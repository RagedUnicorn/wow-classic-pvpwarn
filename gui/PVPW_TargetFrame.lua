--[[
  MIT License

  Copyright (c) 2021 Michael Wiesendanger

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

-- luacheck: globals CreateFrame TargetFrame

local mod = rgpvpw
local me = {}
mod.targetFrame = me

me.tag = "TargetFrame"

--[[
  Build the combat state ui. Displaying an icon to the player indicating that his
  target is currently in combat
]]--
function me.BuildCombatStateUi()
  mod.logger.LogDebug(me.tag, "Building combat state ui")

  local iconHolder = CreateFrame("Frame", RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_FRAME, TargetFrame, "BackdropTemplate")
  iconHolder:SetSize(
    RGPVPW_CONSTANTS.COMBAT_STATE_ICON_SIZE + 5,
    RGPVPW_CONSTANTS.COMBAT_STATE_ICON_SIZE + 5
  )
  iconHolder:SetPoint("RIGHT", 0, 0)
  iconHolder:SetMovable(true)
  iconHolder:SetClampedToScreen(true)

  mod.guiHelper.LoadFramePosition(iconHolder, RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_FRAME)
  me.SetupDragFrame(iconHolder)

  local combatStateIcon = iconHolder:CreateTexture(RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_TEXTURE, "ARTWORK")
  combatStateIcon.iconHolder = iconHolder
  combatStateIcon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
  combatStateIcon:SetPoint("CENTER", 0, 0)
  combatStateIcon:SetSize(
    RGPVPW_CONSTANTS.COMBAT_STATE_ICON_SIZE,
    RGPVPW_CONSTANTS.COMBAT_STATE_ICON_SIZE
  )

  local backdrop = {
    bgFile = "Interface\\AddOns\\PVPWarn\\assets\\images\\ui_slot_background",
    edgeFile = "Interface\\AddOns\\PVPWarn\\assets\\images\\ui_slot_background",
    tile = false,
    tileSize = 32,
    edgeSize = 20,
    insets = {
      left = 2,
      right = 2,
      top = 2,
      bottom = 2
    }
  }

  iconHolder:SetBackdrop(backdrop)
  combatStateIcon.iconHolder:SetBackdropBorderColor(1, .1, 0, .8)
  -- set combat state active icon
  combatStateIcon:SetTexture(RGPVPW_CONSTANTS.COMBAT_STATE_ACTIVE_ICON_ID)
  iconHolder:Hide()
end

--[[
  @param {table} frame
    The frame to attach the drag handlers to
]]--
function me.SetupDragFrame(frame)
  frame:SetScript("OnMouseDown", me.StartDragFrame)
  frame:SetScript("OnMouseUp", me.StopDragFrame)
end

--[[
  Frame callback to start moving the passed (self) frame

  @param {table} self
]]--
function me.StartDragFrame(self)
  if mod.configuration.IsCombatStateFrameLocked() then return end

  self:StartMoving()
end

--[[
  Frame callback to stop moving the passed (self) frame

  @param {table} self
]]--
function me.StopDragFrame(self)
  if mod.configuration.IsCombatStateFrameLocked() then return end

  self:StopMovingOrSizing()

  local point, relativeTo, relativePoint, posX, posY = self:GetPoint()

  mod.configuration.SaveUserPlacedFramePosition(
    RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_FRAME,
    point,
    relativeTo,
    relativePoint,
    posX,
    posY
  )
end

--[[
  Update the ui on the targetframe to reflect its combat state

  - Show the combat affecting icon if the target is affected by combat
  - Hide the combat affecting icon if the target is not affected by combat

  @param {boolean} affectingCombat
]]--
function me.UpdateCombateStateUi(combatState)
  if combatState then
    me.ShowCombatState()
  else
    me.HideCombatState()
  end
end

--[[
  Hide the displayed combatStateFrame
]]--
function me.HideCombatState()
  _G[RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_FRAME]:Hide()
end

--[[
  Show the displayed combatStateFrame
]]--
function me.ShowCombatState()
  _G[RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_FRAME]:Show()
end
