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
  Build the stance state ui. Displaying an icon to the player indicating what stance the current target is
]]--
function me.BuildStanceStateUi()
  mod.logger.LogDebug(me.tag, "Building stance state ui")

  stanceStateFrame = mod.guiHelper.BuildIconHolderUi(
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_FRAME,
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_TEXTURE,
    {"RIGHT", 25, 0},
    RGPVPW_COLORS.UI.neutral,
    function(frame)
      local startDrag, stopDrag = mod.guiHelper.CreateDragHandlers(
        RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_FRAME,
        function() return not mod.configuration.IsStanceStateFrameLocked() end
      )
      frame:SetScript("OnMouseDown", startDrag)
      frame:SetScript("OnMouseUp", stopDrag)
    end
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
