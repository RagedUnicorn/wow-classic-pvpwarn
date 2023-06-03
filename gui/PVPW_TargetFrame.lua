--[[
  MIT License

  Copyright (c) 2023 Michael Wiesendanger

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

-- Reference to the combat state frame
local combatStateFrame
-- Reference to the stance state frame
local stanceStateFrame

--[[
  @param {string} frameName
    A reference name for the frame that holds the texture
  @param {string} textureName
    A reference name for the texture
  @param {table} position
    The initial position of the frame
  @param {table} borderColor
    The color to use for the border of the iconHolder
  @param {function} dragFrameCallback
    The function that registers the dragFrame listeners
  @param {string}

  @return {table}
    The created iconHolder frame
]]--
function me.BuildIconHolderUi(frameName, textureName, position, borderColor, dragFrameCallback, defaultTexture)
  local iconHolder = CreateFrame("Frame", frameName, TargetFrame, "BackdropTemplate")
  iconHolder:SetSize(
    RGPVPW_CONSTANTS.STATE_ICON_HOLDER_ICON_SIZE + 5,
    RGPVPW_CONSTANTS.STATE_ICON_HOLDER_ICON_SIZE + 5
  )
  iconHolder:SetPoint(unpack(position))
  iconHolder:SetMovable(true)
  iconHolder:SetClampedToScreen(true)

  mod.guiHelper.LoadFramePosition(iconHolder, frameName)
  dragFrameCallback(iconHolder)

  local texture = iconHolder:CreateTexture(textureName, "ARTWORK")
  texture.iconHolder = iconHolder
  texture:SetTexCoord(0.07, 0.93, 0.07, 0.93)
  texture:SetPoint("CENTER", 0, 0)
  texture:SetSize(
    RGPVPW_CONSTANTS.STATE_ICON_HOLDER_ICON_SIZE,
    RGPVPW_CONSTANTS.STATE_ICON_HOLDER_ICON_SIZE
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
  texture.iconHolder:SetBackdropBorderColor(unpack(borderColor))

  if defaultTexture ~= nil then
    texture:SetTexture(defaultTexture)
  end

  iconHolder:Hide()

  return texture
end

--[[
  Build the combat state ui. Displaying an icon to the player indicating that his
  target is currently in combat
]]--
function me.BuildCombatStateUi()
  mod.logger.LogDebug(me.tag, "Building combat state ui")

  combatStateFrame = me.BuildIconHolderUi(
    RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_FRAME,
    RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_TEXTURE,
    {"RIGHT", 0, 0},
    {1, .1, 0, .8},
    function(frame)
      frame:SetScript("OnMouseDown", me.StartCombatStateDragFrame)
      frame:SetScript("OnMouseUp", me.StopCombatStateDragFrame)
    end,
    RGPVPW_CONSTANTS.COMBAT_STATE_ACTIVE_ICON_ID
  )
end

--[[
  Frame callback to start moving the passed (self) frame

  @param {table} self
]]--
function me.StartCombatStateDragFrame(self)
  if mod.configuration.IsCombatStateFrameLocked() then return end

  self:StartMoving()
end

--[[
  Frame callback to stop moving the passed (self) frame

  @param {table} self
]]--
function me.StopCombatStateDragFrame(self)
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
function me.UpdateCombatStateUi(combatState)
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
  combatStateFrame.iconHolder:Hide()
end

--[[
  Show the displayed combatStateFrame
]]--
function me.ShowCombatState()
  combatStateFrame.iconHolder:Show()
end

--[[
  Build the stance state ui. Displaying an icon to the player indicating what stance the current target is
]]--
function me.BuildStanceStateUi()
  mod.logger.LogDebug(me.tag, "Building stance state ui")

  stanceStateFrame = me.BuildIconHolderUi(
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_FRAME,
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_TEXTURE,
    {"RIGHT", 25, 0},
    {0.65, 0.48, 0.31, 1.0},
    function(frame)
      frame:SetScript("OnMouseDown", me.StartStanceStateDragFrame)
      frame:SetScript("OnMouseUp", me.StopStanceStateDragFrame)
    end
  )
end

--[[
  Frame callback to start moving the passed (self) frame

  @param {table} self
]]--
function me.StartStanceStateDragFrame(self)
  if mod.configuration.IsStanceStateFrameLocked() then return end

  self:StartMoving()
end

--[[
  Frame callback to stop moving the passed (self) frame

  @param {table} self
]]--
function me.StopStanceStateDragFrame(self)
  if mod.configuration.IsStanceStateFrameLocked() then return end

  self:StopMovingOrSizing()

  local point, relativeTo, relativePoint, posX, posY = self:GetPoint()

  mod.configuration.SaveUserPlacedFramePosition(
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_FRAME,
    point,
    relativeTo,
    relativePoint,
    posX,
    posY
  )
end

--[[
  Update stance icon holder with new texture

  @param {number} iconId
]]--
function me.UpdateStanceStateUi(iconId)
  mod.logger.LogDebug(me.tag, "Updating stance state ui with id: " .. iconId)

  if iconId ~= nil then
    stanceStateFrame:SetTexture(iconId)
    me.ShowStanceState()
  else
    me.HideStanceState()
  end
end

--[[
  Hide the displayed stanceStateFrame
]]--
function me.HideStanceState()
  stanceStateFrame.iconHolder:Hide()
end

--[[
  Show the displayed stanceStateFrame
]]--
function me.ShowStanceState()
  stanceStateFrame.iconHolder:Show()
end
