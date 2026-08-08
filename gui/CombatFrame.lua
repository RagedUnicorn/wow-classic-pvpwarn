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

local mod = rgpvpw
local me = {}
mod.combatFrame = me

me.tag = "CombatFrame"

-- Reference to the combat state frame
local combatStateFrame

--[[
  Default anchor of the combat state icon - flush with the right edge of the target frame.
  relativeTo is the region name, never the frame object - a frame cannot round-trip through
  SavedVariables (see mod.configuration.SaveUserPlacedFramePosition).
]]--
local DEFAULT_POSITION = {"RIGHT", "TargetFrame", "RIGHT", 0, 0}

--[[
  Build the combat state ui. Displaying an icon to the player indicating that his
  target is currently in combat
]]--
function me.BuildCombatStateUi()
  mod.logger.LogDebug(me.tag, "Building combat state ui")

  combatStateFrame = mod.guiHelper.BuildIconHolderUi(
    RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_FRAME,
    RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_TEXTURE,
    DEFAULT_POSITION,
    RGPVPW_COLORS.UI.combat_active,
    function(frame)
      local startDrag, stopDrag = mod.guiHelper.CreateDragHandlers(
        RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_FRAME,
        --[[ the icon is only mouse enabled while positioning mode is active - the predicate
             mirrors that so a stale drag can never move the frame afterwards ]]--
        function() return mod.combatState.IsConfigurationModeEnabled() end
      )
      frame:SetScript("OnDragStart", startDrag)
      frame:SetScript("OnDragStop", stopDrag)
    end,
    RGPVPW_CONSTANTS.COMBAT_STATE_ACTIVE_ICON_ID
  )
end

--[[
  Enable or disable positioning of the combat state icon. Enabling the mouse makes the icon
  draggable but also stops it from passing clicks through to the target frame it sits on -
  it is thus only ever enabled while configuration mode is active.

  @param {boolean} enabled
]]--
function me.SetPositioningEnabled(enabled)
  if combatStateFrame == nil then return end

  combatStateFrame.iconHolder:EnableMouse(enabled)
end

--[[
  Reset the combat state icon to its default position and persist it
]]--
function me.ResetPosition()
  if combatStateFrame == nil then return end

  --[[ a dragged frame can be anchored to UIParent - clear before re-anchoring to the target frame ]]--
  combatStateFrame.iconHolder:ClearAllPoints()
  combatStateFrame.iconHolder:SetPoint(unpack(DEFAULT_POSITION))

  mod.configuration.SaveUserPlacedFramePosition(
    RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_FRAME,
    DEFAULT_POSITION[1],
    DEFAULT_POSITION[2],
    DEFAULT_POSITION[3],
    DEFAULT_POSITION[4],
    DEFAULT_POSITION[5]
  )
end

--[[
  Update the ui on the combat frame to reflect its combat state

  - Show the combat affecting icon if the target is affected by combat
  - Hide the combat affecting icon if the target is not affected by combat

  @param {boolean} combatState
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
