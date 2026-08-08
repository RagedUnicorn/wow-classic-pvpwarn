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
  Dedicated options sub-panel for the stance state tracker. Provides the tracking enable toggle
  and the frame lock / hide unknown stance toggles that depend on it. Registered as a
  sub-category under the addon Settings panel via gui/AddonConfiguration.lua. Mirrors the
  structure of gui/CombatStateMenu.lua.
]]--

local mod = rgpvpw
local me = {}
mod.stanceStateMenu = me

me.tag = "StanceStateMenu"

-- track whether the menu was already built
local builtMenu = false

--[[
  Build the ui for the stance state menu

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildUi(frame)
  if builtMenu then return end

  mod.guiHelper.CreatePanelTitle(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_TITLE,
    rgpvpw.L["stance_state_title"]
  )
  me.BuildStanceStateOptions(frame)

  builtMenu = true
end

--[[
  Creates all checkButtons for the stanceState configuration. Make sure to create checkbuttons
  that are dependant on others first

  @param {table} frame
]]--
function me.BuildStanceStateOptions(frame)
  mod.guiHelper.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_OPT_LOCK_FRAME,
    frame,
    {"TOPLEFT", 40, -100},
    me.LockFrameStanceStateOnClick,
    me.LockFrameStanceStateOnShow,
    rgpvpw.L["lock_frame_stance_state"],
    rgpvpw.L["lock_frame_stance_state_tooltip"]
  )

  mod.guiHelper.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_OPT_HIDE_UNKNOWN,
    frame,
    {"TOPLEFT", 40, -148},
    me.HideUnknownStanceOnClick,
    me.HideUnknownStanceOnShow,
    rgpvpw.L["hide_unknown_stance"],
    rgpvpw.L["hide_unknown_stance_tooltip"]
  )

  mod.guiHelper.CreateLinkedCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_OPT_ENABLE,
    frame,
    {"TOPLEFT", 20, -52},
    me.EnableStanceStateTrackingOnClick,
    me.EnableStanceStateTrackingOnShow,
    rgpvpw.L["enable_stance_state_tracking"],
    rgpvpw.L["enable_stance_state_tracking_tooltip"],
    {
      RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_OPT_LOCK_FRAME,
      RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_OPT_HIDE_UNKNOWN
    }
  )
end

--[[
  OnShow callback for checkbuttons - lock stance state frame

  @param {table} self
]]--
function me.LockFrameStanceStateOnShow(self)
  if mod.configuration.IsStanceStateFrameLocked() then
    self:SetChecked(true)
  else
    self:SetChecked(false)
  end
end

--[[
  OnClick callback for checkbuttons - lock stance state frame

  @param {table} self
]]--
function me.LockFrameStanceStateOnClick(self)
  local enabled = self:GetChecked()

  if enabled then
    mod.configuration.LockStanceStateFrame()
  else
    mod.configuration.UnlockStanceStateFrame()
  end
end

--[[
  OnShow callback for checkbuttons - enable stance state tracking

  @param {table} self
]]--
function me.EnableStanceStateTrackingOnShow(self)
  if mod.configuration.IsStanceStateTrackingEnabled() then
    self:SetChecked(true)
    mod.guiHelper.EnableCheckButtons(self.linkedCheckButtonNames)
  else
    self:SetChecked(false)
    mod.guiHelper.DisableCheckButtons(self.linkedCheckButtonNames)
  end
end

--[[
  OnClick callback for checkbuttons - enable stance state tracking

  @param {table} self
]]--
function me.EnableStanceStateTrackingOnClick(self)
  local enabled = self:GetChecked()

  if enabled then
    mod.configuration.EnableStanceStateTracking()
    mod.guiHelper.EnableCheckButtons(self.linkedCheckButtonNames)
  else
    mod.configuration.DisableStanceStateTracking()
    mod.guiHelper.DisableCheckButtons(self.linkedCheckButtonNames)
  end
end

--[[
  OnShow callback for checkbuttons - hide unknown stance

  @param {table} self
]]--
function me.HideUnknownStanceOnShow(self)
  if mod.configuration.IsHideUnknownStanceEnabled() then
    self:SetChecked(true)
  else
    self:SetChecked(false)
  end
end

--[[
  OnClick callback for checkbuttons - hide unknown stance

  @param {table} self
]]--
function me.HideUnknownStanceOnClick(self)
  local enabled = self:GetChecked()

  if enabled then
    mod.configuration.EnableHideUnknownStance()
  else
    mod.configuration.DisableHideUnknownStance()
  end
end
