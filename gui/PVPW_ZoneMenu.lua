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

-- luacheck: globals STANDARD_TEXT_FONT

local mod = rgpvpw
local me = {}
mod.zoneMenu = me

me.tag = "ZoneMenu"

-- track whether the menu was already built
local builtMenu = false

--[[
  Build the ui for the general menu

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildUi(frame)
  if builtMenu then return end

  me.BuildTitle(frame)
  me.BuildLabel(
    frame,
    {"TOPLEFT", 20, -50},
    rgpvpw.L["label_battlegrounds"]
  )
  me.BuildZoneOption(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_ZONE_ALTERAC_VALLEY,
    {"TOPLEFT", 20, -80},
    rgpvpw.L["battleground_alterac_valley"],
    RGPVPW_ZONE.ZONE_BATTLEGROUND_ALTERAC_VALLEY
  )
  me.BuildZoneOption(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_ZONE_ARATHI_BASIN,
    {"TOPLEFT", 20, -120},
    rgpvpw.L["battleground_arathi_basin"],
    RGPVPW_ZONE.ZONE_BATTLEGROUND_ARATHI_BASIN
  )
  me.BuildZoneOption(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_ZONE_WARSONG_GULCH,
    {"TOPLEFT", 20, -160},
    rgpvpw.L["battleground_warsong_gulch"],
    RGPVPW_ZONE.ZONE_BATTLEGROUND_WARSONG_GULCH
  )

  builtMenu = true
end

--[[
  Build the title for the general menu

  @param {table} parentFrame
    The addon configuration frame to attach to
]]--
function me.BuildTitle(parentFrame)
  local titleFontString = parentFrame:CreateFontString(RGPVPW_CONSTANTS.ELEMENT_ZONE_TITLE, "OVERLAY")
  titleFontString:SetFont(STANDARD_TEXT_FONT, 20)
  titleFontString:SetPoint("TOP", 0, -20)
  titleFontString:SetSize(parentFrame:GetWidth(), 20)
  titleFontString:SetText(rgpvpw.L["zone_title"])
end

--[[
  @param {table} frame
  @param {table} position
  @param {string} text
]]--
function me.BuildLabel(frame, position, text)
  local zoneLabel = frame:CreateFontString(
    nil,
    "OVERLAY"
  )
  zoneLabel:SetPoint(unpack(position))
  zoneLabel:SetFont(STANDARD_TEXT_FONT, 20)
  zoneLabel:SetTextColor(1, 1, 1)
  zoneLabel:SetText(text)
end

--[[
  Create a zone checkbox and load its state

  @param {table} parentFrame
  @param {string} frameName
  @param {table} position
  @param {string} text
  @param {number} zone
    A zone from RGPVPW_ZONE
]]--
function me.BuildZoneOption(parentFrame, frameName, position, text, zone)
  local zoneOption = mod.guiHelper.CreateCheckBox(
    frameName,
    parentFrame,
    position,
    function(self)
      me.OnClickCallback(self)
    end,
    function(self)
      me.OnShowCallback(self)
    end,
    text
  )

  zoneOption.value = zone -- set the map or instance id
  --[[
    After creating a new zoneOption show and manually invoke its OnShowCallback to load the initial state
  ]]--
  zoneOption:Show()
  me.OnShowCallback(zoneOption)
end

--[[
  Update the configuration state of the option. Invoked via onClick event.

  @param {table} self
]]--
function me.OnClickCallback(self)
  -- change state
  local enabled = self:GetChecked()

  if enabled then
    mod.configuration.EnableZone(self.value)
  else
    mod.configuration.DisableZone(self.value)
  end
end

--[[
  Load the configuration state of the option. Invoked manually or via onShow event.

  @param {table} self
]]--
function me.OnShowCallback(self)
  -- initial state
  local isZoneEnabled = mod.configuration.IsZoneEnabled(self.value)

  if isZoneEnabled then
    self:SetChecked(true)
  else
    self:SetChecked(false)
  end
end
