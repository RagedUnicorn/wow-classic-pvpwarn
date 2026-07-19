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

  mod.guiHelper.CreatePanelTitle(frame, RGPVPW_CONSTANTS.ELEMENT_ZONE_TITLE, rgpvpw.L["zone_title"])
  me.BuildLabel(
    frame,
    {"TOPLEFT", 20, -52},
    rgpvpw.L["label_battlegrounds"]
  )
  me.BuildLabelDescription(
    frame,
    {"TOPLEFT", 24, -77},
    rgpvpw.L["label_battlegrounds_description"]
  )
  me.BuildZoneOption(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_ZONE_ALTERAC_VALLEY,
    {"TOPLEFT", 20, -102},
    rgpvpw.L["battleground_alterac_valley"],
    RGPVPW_ZONE.ZONE_BATTLEGROUND_ALTERAC_VALLEY
  )
  me.BuildZoneOption(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_ZONE_ARATHI_BASIN,
    {"TOPLEFT", 20, -142},
    rgpvpw.L["battleground_arathi_basin"],
    RGPVPW_ZONE.ZONE_BATTLEGROUND_ARATHI_BASIN
  )
  me.BuildZoneOption(
    frame,
    RGPVPW_CONSTANTS.ELEMENT_ZONE_WARSONG_GULCH,
    {"TOPLEFT", 20, -182},
    rgpvpw.L["battleground_warsong_gulch"],
    RGPVPW_ZONE.ZONE_BATTLEGROUND_WARSONG_GULCH
  )

  builtMenu = true
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
  mod.guiHelper.SetColor(zoneLabel, RGPVPW_CONSTANTS.COLOR.SECTION_GOLD)
  zoneLabel:SetText(text)
end

--[[
  Build an always-visible gray description below a section label. The zone checkboxes
  themselves carry no per-checkbox description - their labels are the zone names.

  @param {table} frame
  @param {table} position
  @param {string} text
]]--
function me.BuildLabelDescription(frame, position, text)
  local descriptionFontString = frame:CreateFontString(
    nil,
    "OVERLAY"
  )
  descriptionFontString:SetPoint(unpack(position))
  descriptionFontString:SetFont(STANDARD_TEXT_FONT, 12)
  mod.guiHelper.SetColor(descriptionFontString, RGPVPW_CONSTANTS.COLOR.SUBNOTE)
  descriptionFontString:SetJustifyH("LEFT")
  descriptionFontString:SetText(text)
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
  mod.guiHelper.CreateCheckBox(
    frameName,
    parentFrame,
    position,
    function(self)
      if self:GetChecked() then
        mod.configuration.EnableZone(zone)
      else
        mod.configuration.DisableZone(zone)
      end
    end,
    function(self)
      self:SetChecked(mod.configuration.IsZoneEnabled(zone))
    end,
    text
  )
end
