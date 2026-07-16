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

-- luacheck: globals CreateFrame UIParent STANDARD_TEXT_FONT

--[[
  The user-movable anchor frame the detection bar stack hangs from.

  During normal play the anchor is always "locked": the mouse is disabled so it never blocks
  clicks and nothing is drawn until a tracked enemy spell fires. To position it the user enters
  a transient "positioning mode" (auto when the Detection Bar options panel is open, or via
  /rgpvpw bar unlock, or the options panel button) which enables the mouse, shows a drag handle
  and a non-fading sample bar so the size / look / position are obvious. Positioning mode is
  never persisted - it always reverts to locked on /reload or when combat starts - so the anchor
  can never be left intercepting world clicks. Only the dragged position is persisted, via the
  same PVPWarnConfiguration.frames table CombatFrame uses.
]]--

local mod = rgpvpw
local me = {}
mod.detectionBarAnchor = me

me.tag = "DetectionBarAnchor"

--[[ default anchor position - upper middle of the screen, below standard nameplates ]]--
local DEFAULT_OFFSET_Y = 260

local anchorFrame
--[[ transient positioning state (never persisted) ]]--
local positioning = false

--[[
  Optional callback invoked whenever positioning mode is entered or exited. The options menu
  uses this to keep its "Position detection bar" button label in sync when combat or a panel
  close forces positioning off.
]]--
me.onPositioningChanged = nil

--[[
  Build the anchor frame and restore its saved position. The anchor always starts locked.

  @return {table}
    The anchor frame
]]--
function me.BuildAnchor()
  mod.logger.LogDebug(me.tag, "Building detection bar anchor")

  anchorFrame = CreateFrame("Frame", RGPVPW_CONSTANTS.ELEMENT_DETECTION_BAR_ANCHOR_FRAME, UIParent)
  anchorFrame:SetSize(RGPVPW_CONSTANTS.DETECTION_BAR_WIDTH, RGPVPW_CONSTANTS.DETECTION_BAR_HEIGHT)
  anchorFrame:SetFrameStrata("HIGH")
  anchorFrame:SetClampedToScreen(true)
  anchorFrame:SetMovable(true)
  anchorFrame:EnableMouse(false)
  anchorFrame:EnableMouseWheel(false)
  anchorFrame:RegisterForDrag("LeftButton")
  anchorFrame:SetScript("OnDragStart", me.StartDrag)
  anchorFrame:SetScript("OnDragStop", me.StopDrag)

  me.RestorePosition()
  me.BuildDragHandle()
  me.RegisterCombatSafeguard()

  return anchorFrame
end

--[[
  Register an event frame that forces positioning mode off when combat starts so the anchor
  can never be left mouse-enabled in combat.
]]--
function me.RegisterCombatSafeguard()
  local eventFrame = CreateFrame("Frame")
  eventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
  eventFrame:SetScript("OnEvent", function()
    if positioning then
      me.ExitPositioning()
    end
  end)

  me.combatSafeguardFrame = eventFrame
end

--[[
  Restore the saved anchor position or fall back to the default CENTER offset.
]]--
function me.RestorePosition()
  local framePosition = mod.configuration.GetUserPlacedFramePosition(
    RGPVPW_CONSTANTS.ELEMENT_DETECTION_BAR_ANCHOR_FRAME
  )

  -- discard positions saved by versions that persisted the relativeTo frame object itself
  if framePosition ~= nil and type(framePosition.relativeTo) == "table" then
    mod.logger.LogWarn(me.tag, "Discarding corrupted saved frame position for - "
      .. RGPVPW_CONSTANTS.ELEMENT_DETECTION_BAR_ANCHOR_FRAME)
    framePosition = nil
  end

  anchorFrame:ClearAllPoints()

  if framePosition ~= nil then
    anchorFrame:SetPoint(
      framePosition.point,
      framePosition.relativeTo,
      framePosition.relativePoint,
      framePosition.posX,
      framePosition.posY
    )
  else
    anchorFrame:SetPoint("CENTER", UIParent, "CENTER", 0, DEFAULT_OFFSET_Y)
  end
end

--[[
  Build the drag handle shown only in positioning mode. The sample preview bars already show the
  draggable area, so this is just an instruction label floated above the anchor.
]]--
function me.BuildDragHandle()
  local label = anchorFrame:CreateFontString(nil, "OVERLAY")
  label:SetFont(STANDARD_TEXT_FONT, 14)
  label:SetPoint("BOTTOM", anchorFrame, "TOP", 0, 6)
  label:SetText(rgpvpw.L["detection_bar_drag_handle"])
  label:Hide()

  anchorFrame.dragLabel = label
end

--[[
  Frame callback to start moving the anchor.

  @param {table} self
]]--
function me.StartDrag(self)
  if not positioning then return end

  self:StartMoving()
end

--[[
  Frame callback to stop moving the anchor and persist its new position.

  @param {table} self
]]--
function me.StopDrag(self)
  if not positioning then return end

  self:StopMovingOrSizing()

  local point, relativeTo, relativePoint, posX, posY = self:GetPoint()

  mod.configuration.SaveUserPlacedFramePosition(
    RGPVPW_CONSTANTS.ELEMENT_DETECTION_BAR_ANCHOR_FRAME,
    point,
    relativeTo and relativeTo:GetName() or nil, -- persist the name, frames cannot round-trip SavedVariables
    relativePoint,
    posX,
    posY
  )
end

--[[
  Enter positioning mode - enable the mouse, show the drag handle and a sample preview bar.
]]--
function me.EnterPositioning()
  if anchorFrame == nil then return end

  positioning = true
  anchorFrame:EnableMouse(true)
  anchorFrame.dragLabel:Show()

  mod.detectionBarManager.ShowPreview()

  if me.onPositioningChanged then me.onPositioningChanged() end
end

--[[
  Exit positioning mode - disable the mouse, hide the drag handle and the sample preview bar.
]]--
function me.ExitPositioning()
  if anchorFrame == nil then return end

  positioning = false
  anchorFrame:EnableMouse(false)
  anchorFrame.dragLabel:Hide()

  mod.detectionBarManager.HidePreview()

  if me.onPositioningChanged then me.onPositioningChanged() end
end

--[[
  Toggle positioning mode.
]]--
function me.TogglePositioning()
  if positioning then
    me.ExitPositioning()
  else
    me.EnterPositioning()
  end
end

--[[
  @return {boolean}
    true - if positioning mode is currently active
]]--
function me.IsPositioning()
  return positioning
end

--[[
  Reset the anchor to its default position and persist it.
]]--
function me.ResetPosition()
  if anchorFrame == nil then return end

  anchorFrame:ClearAllPoints()
  anchorFrame:SetPoint("CENTER", UIParent, "CENTER", 0, DEFAULT_OFFSET_Y)

  mod.configuration.SaveUserPlacedFramePosition(
    RGPVPW_CONSTANTS.ELEMENT_DETECTION_BAR_ANCHOR_FRAME,
    "CENTER",
    "UIParent",
    "CENTER",
    0,
    DEFAULT_OFFSET_Y
  )
end

--[[
  @return {table | nil}
    The anchor frame, or nil if not built yet
]]--
function me.GetAnchor()
  return anchorFrame
end
