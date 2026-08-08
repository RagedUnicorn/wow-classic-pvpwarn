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

-- luacheck: globals CreateFrame TargetFrame

local mod = rgpvpw
local me = {}
mod.stanceFrame = me

me.tag = "StanceFrame"

-- Reference to the stance state frame
local stanceStateFrame

-- Forward declaration
local UpdateStanceBorderColor

--[[
  Default anchor of the stance state icon - directly next to the combat state icon, which is
  flush with the right edge of the target frame and exactly 25 pixels wide. relativeTo is the
  region name, never the frame object - a frame cannot round-trip through SavedVariables
  (see mod.configuration.SaveUserPlacedFramePosition).
]]--
local DEFAULT_POSITION = {"RIGHT", "TargetFrame", "RIGHT", 25, 0}

--[[
  Build the stance state ui. Displaying an icon to the player indicating what stance the current target is
]]--
function me.BuildStanceStateUi()
  mod.logger.LogDebug(me.tag, "Building stance state ui")

  stanceStateFrame = mod.guiHelper.BuildIconHolderUi(
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_FRAME,
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_TEXTURE,
    DEFAULT_POSITION,
    RGPVPW_COLORS.UI.neutral,
    function(frame)
      local startDrag, stopDrag = mod.guiHelper.CreateDragHandlers(
        RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_FRAME,
        --[[ the icon is only mouse enabled while positioning mode is active - the predicate
             mirrors that so a stale drag can never move the frame afterwards ]]--
        function() return mod.stanceState.IsConfigurationModeEnabled() end
      )
      frame:SetScript("OnDragStart", startDrag)
      frame:SetScript("OnDragStop", stopDrag)
    end
  )
end

--[[
  Enable or disable positioning of the stance state icon. Enabling the mouse makes the icon
  draggable but also stops it from passing clicks through to the target frame it sits on -
  it is thus only ever enabled while configuration mode is active.

  @param {boolean} enabled
]]--
function me.SetPositioningEnabled(enabled)
  if stanceStateFrame == nil then return end

  stanceStateFrame.iconHolder:EnableMouse(enabled)
end

--[[
  Reset the stance state icon to its default position and persist it
]]--
function me.ResetPosition()
  if stanceStateFrame == nil then return end

  --[[ a dragged frame can be anchored to UIParent - clear before re-anchoring to the target frame ]]--
  stanceStateFrame.iconHolder:ClearAllPoints()
  stanceStateFrame.iconHolder:SetPoint(unpack(DEFAULT_POSITION))

  mod.configuration.SaveUserPlacedFramePosition(
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_FRAME,
    DEFAULT_POSITION[1],
    DEFAULT_POSITION[2],
    DEFAULT_POSITION[3],
    DEFAULT_POSITION[4],
    DEFAULT_POSITION[5]
  )
end

--[[
  Update stance icon holder with new texture

  @param {number} iconId
]]--
function me.UpdateStanceStateUi(iconId)
  if iconId ~= nil then
    mod.logger.LogDebug(me.tag, "Updating stance state ui with id: " .. iconId)
    stanceStateFrame:SetTexture(iconId)
    UpdateStanceBorderColor()
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

--[[
  Update the stance frame border color based on the target's class
]]--
UpdateStanceBorderColor = function()
  if not stanceStateFrame or not stanceStateFrame.iconHolder then
    return
  end

  local targetClass = mod.target.GetCurrentTargetClass()
  local color

  color = RGPVPW_COLORS.GetCategoryColor(targetClass)

  stanceStateFrame.iconHolder:SetBackdropBorderColor(unpack(color))
end
