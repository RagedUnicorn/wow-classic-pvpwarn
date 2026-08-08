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

--[[
  Dedicated options sub-panel for the combat state tracker. Provides the tracking enable toggle
  and the frame lock toggle that depends on it. Registered as a sub-category under the addon
  Settings panel via gui/AddonConfiguration.lua. Mirrors the structure of gui/FlashMenu.lua.
]]--

local mod = rgpvpw
local me = {}
mod.combatStateMenu = me

me.tag = "CombatStateMenu"

-- track whether the menu was already built
local builtMenu = false

--[[
  Build the ui for the combat state menu

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildUi(frame)
  if builtMenu then return end

  mod.guiHelper.CreatePanelTitle(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_TITLE,
    rgpvpw.L["combat_state_title"]
  )
  me.BuildCombatStateOptions(frame)

  builtMenu = true
end

--[[
  Creates all checkButtons for the combatState configuration. Make sure to create checkbuttons
  that are dependant on others first

  @param {table} frame
]]--
function me.BuildCombatStateOptions(frame)
  mod.guiHelper.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_OPT_LOCK_FRAME,
    frame,
    {"TOPLEFT", 40, -100},
    me.LockFrameCombatStateOnClick,
    me.LockFrameCombatStateOnShow,
    rgpvpw.L["lock_frame_combat_state"],
    rgpvpw.L["lock_frame_combat_state_tooltip"]
  )

  mod.guiHelper.CreateLinkedCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_OPT_ENABLE,
    frame,
    {"TOPLEFT", 20, -52},
    me.EnableCombatStateTrackingOnClick,
    me.EnableCombatStateTrackingOnShow,
    rgpvpw.L["enable_combat_state_tracking"],
    rgpvpw.L["enable_combat_state_tracking_tooltip"],
    { RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_OPT_LOCK_FRAME }
  )
end

--[[
  OnShow callback for checkbuttons - lock combat state frame

  @param {table} self
]]--
function me.LockFrameCombatStateOnShow(self)
  if mod.configuration.IsCombatStateFrameLocked() then
    self:SetChecked(true)
  else
    self:SetChecked(false)
  end
end

--[[
  OnClick callback for checkbuttons - lock combat state frame

  @param {table} self
]]--
function me.LockFrameCombatStateOnClick(self)
  local enabled = self:GetChecked()

  if enabled then
    mod.configuration.LockCombatStateFrame()
  else
    mod.configuration.UnlockCombatStateFrame()
  end
end

--[[
  OnShow callback for checkbuttons - enable combat state tracking

  @param {table} self
]]--
function me.EnableCombatStateTrackingOnShow(self)
  if mod.configuration.IsCombatStateTrackingEnabled() then
    self:SetChecked(true)
    mod.guiHelper.EnableCheckButtons(self.linkedCheckButtonNames)
  else
    self:SetChecked(false)
    mod.guiHelper.DisableCheckButtons(self.linkedCheckButtonNames)
  end
end

--[[
  OnClick callback for checkbuttons - enable combat state tracking

  @param {table} self
]]--
function me.EnableCombatStateTrackingOnClick(self)
  local enabled = self:GetChecked()

  if enabled then
    mod.configuration.EnableCombatStateTracking()
    mod.guiHelper.EnableCheckButtons(self.linkedCheckButtonNames)
  else
    mod.configuration.DisableCombatStateTracking()
    mod.guiHelper.DisableCheckButtons(self.linkedCheckButtonNames)
  end
end
