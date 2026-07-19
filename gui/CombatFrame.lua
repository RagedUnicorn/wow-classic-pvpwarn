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

local mod = rgpvpw
local me = {}
mod.combatFrame = me

me.tag = "CombatFrame"

-- Reference to the combat state frame
local combatStateFrame

--[[
  Build the combat state ui. Displaying an icon to the player indicating that his
  target is currently in combat
]]--
function me.BuildCombatStateUi()
  mod.logger.LogDebug(me.tag, "Building combat state ui")

  combatStateFrame = mod.guiHelper.BuildIconHolderUi(
    RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_FRAME,
    RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_TEXTURE,
    {"RIGHT", 0, 0},
    RGPVPW_COLORS.UI.combat_active,
    function(frame)
      local startDrag, stopDrag = mod.guiHelper.CreateDragHandlers(
        RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_FRAME,
        function() return not mod.configuration.IsCombatStateFrameLocked() end
      )
      frame:SetScript("OnMouseDown", startDrag)
      frame:SetScript("OnMouseUp", stopDrag)
    end,
    RGPVPW_CONSTANTS.COMBAT_STATE_ACTIVE_ICON_ID
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
