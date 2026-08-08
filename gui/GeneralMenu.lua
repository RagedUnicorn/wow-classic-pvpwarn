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

-- luacheck: globals STANDARD_TEXT_FONT

--[[
  General options sub-panel. Holds the settings that are not tied to a single feature - the
  combat state and stance state trackers live on their own sub-panels in gui/CombatStateMenu.lua
  and gui/StanceStateMenu.lua.
]]--

local mod = rgpvpw
local me = {}
mod.generalMenu = me

me.tag = "GeneralMenu"

-- track whether the menu was already built
local builtMenu = false

-- reference to the warn mode dropdown frame
local warnModeDropdown

--[[
  Build the ui for the general menu

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildUi(frame)
  if builtMenu then return end

  mod.guiHelper.CreatePanelTitle(frame, RGPVPW_CONSTANTS.ELEMENT_GENERAL_TITLE, rgpvpw.L["options_title"])
  me.BuildWarnModeDropdown(frame)

  builtMenu = true
end

--[[
  Build the warning mode dropdown (target filter). Mirrors the voice pack dropdown in
  gui/VoicePackMenu.lua.

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildWarnModeDropdown(frame)
  local dropdownLabel = frame:CreateFontString(nil, "OVERLAY")
  dropdownLabel:SetFont(STANDARD_TEXT_FONT, 15)
  dropdownLabel:SetPoint("TOPLEFT", 20, -52)
  mod.guiHelper.SetColor(dropdownLabel, RGPVPW_CONSTANTS.COLOR.BODY)
  dropdownLabel:SetText(rgpvpw.L["warn_mode_label"])

  warnModeDropdown = mod.guiHelper.CreateSettingsDropdown(
    RGPVPW_CONSTANTS.ELEMENT_GENERAL_OPT_WARN_MODE_DROPDOWN,
    frame,
    {"LEFT", dropdownLabel, "RIGHT", 10, -2},
    220,
    me.InitializeWarnModeDropdown
  )
  -- generate once so the button shows the current selection before the menu was ever opened
  warnModeDropdown:GenerateMenu()
end

--[[
  Menu generator for the warning mode dropdown - fills the root description with a radio
  entry per available target filter mode

  @param {table} _
    The dropdown the menu is generated for (unused)
  @param {table} rootDescription
]]--
function me.InitializeWarnModeDropdown(_, rootDescription)
  local modes = {
    {
      value = RGPVPW_CONSTANTS.TARGET_FILTER_MODE_WARN_ALL,
      text = rgpvpw.L["warn_mode_warn_all"]
    }, {
      value = RGPVPW_CONSTANTS.TARGET_FILTER_MODE_CURRENT_TARGET,
      text = rgpvpw.L["warn_mode_current_target"]
    }
  }

  for _, mode in ipairs(modes) do
    rootDescription:CreateRadio(mode.text, me.IsWarnModeSelected, me.OnWarnModeSelect, mode.value)
  end
end

--[[
  Whether the passed warning mode is the currently configured one

  @param {string} mode

  @return {boolean}
]]--
function me.IsWarnModeSelected(mode)
  return mod.configuration.GetTargetFilterMode() == mode
end

--[[
  Callback for when a warning mode is selected

  @param {string} mode
    The selected target filter mode
]]--
function me.OnWarnModeSelect(mode)
  mod.configuration.SetTargetFilterMode(mode)

  mod.logger.LogInfo(me.tag, "Selected warning mode: " .. mode)
end
