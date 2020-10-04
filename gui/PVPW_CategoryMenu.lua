--[[
  MIT License

  Copyright (c) 2020 Michael Wiesendanger

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

-- luacheck: globals CreateFrame STANDARD_TEXT_FONT FauxScrollFrame_Update FauxScrollFrame_GetOffset
-- luacheck: globals UIDropDownMenu_Initialize UIDropDownMenu_AddButton UIDropDownMenu_GetSelectedValue
-- luacheck: globals UIDropDownMenu_SetSelectedValue GetSpellInfo UIDropDownMenu_EnableDropDown
-- luacheck: globals UIDropDownMenu_DisableDropDown

local mod = rgpvpw
local me = {}
mod.categoryMenu = me

me.tag = "CategoryMenu"


-- track whether the menu was already built
local builtMenu = false


--[[
  The class configuration menu consists of multiple tabs. This module is responsible
  for handling those tabs
]]--
local navigation = {
  -- tab 1
  [1] = {
    ["active"] = false,
    ["func"] = nil,
    ["contentFrame"] = nil
  },
  -- tab 2
  [2] = {
    ["active"] = false,
    ["func"] = nil,
    ["contentFrame"] = nil
  }
}

--[[
  Build or update (if already built) the category menus for configuring spells

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.MenuOnShow(self)
  at = self
  if builtMenu then
    -- activate first tab and init it
  else
    Tabsexperiment(self)
  end
end

function Tabsexperiment(self)

  self:SetBackdrop({
    bgFile = "Interface\\AddOns\\PVPWarn\\assets\\images\\ui_slot_background", -- TODO development only
  insets = {left = 0, right = 0, top = 0, bottom = 0},
  })
  self:SetBackdropColor(0.37, 0.37, 0.37, .4)

  local tab1Button = CreateFrame("Button", RGPVPW_CONSTANTS.ELEMENT_TAB_BUTTON .. 1, self, "TabButtonTemplate")
  tab1Button.id = 1
  tab1Button:SetPoint("LEFT", 40, 0)
  tab1Button:SetText("tab1Button")
  tab1Button:SetScript('OnClick', function(self)
    mod.logger.LogError(me.tag, "clicked tab1")
    me.TabNavigationButtonOnClick(self)
  end)

  local tab2Button = CreateFrame("Button", RGPVPW_CONSTANTS.ELEMENT_TAB_BUTTON .. 2, self, "TabButtonTemplate")
  tab2Button.id = 2
  tab2Button:SetPoint("LEFT", 80, 0)
  tab2Button:SetText("tab2Button")
  tab2Button:SetScript('OnClick', function(self)
    mod.logger.LogError(me.tag, "clicked tab2")
    me.TabNavigationButtonOnClick(self)
  end)



  local contentFrame1 = CreateFrame("Frame", RGPVPW_CONSTANTS.ELEMENT_TAB_CONTENT_FRAME .. 1, self)
  contentFrame1:SetPoint("TOPLEFT", self, "TOPLEFT")
  contentFrame1:SetBackdrop({
    bgFile = "Interface\\AddOns\\PVPWarn\\assets\\images\\ui_slot_background",
    insets = {left = 0, right = 0, top = 0, bottom = 0},
  })
  contentFrame1:SetBackdropColor(1, 0.37, 0.5, .7)
  contentFrame1:SetWidth(RGPVPW_CONSTANTS.SPELL_LIST_CONTENT_FRAME_WIDTH)
  contentFrame1:SetHeight(200)
  navigation[1].contentFrame = contentFrame1
  navigation[1].func = mod.categoryMenuSpellsTab.Init
  -- UPDATE category
  navigation[1].category = self.categoryName

  local contentFrame2 = CreateFrame("Frame", RGPVPW_CONSTANTS.ELEMENT_TAB_CONTENT_FRAME .. 2, self)
  mod.logger.LogError(me.tag, "self name: " .. self:GetName())
  mod.logger.LogError(me.tag, "contentFrame2 name: " .. contentFrame2:GetName())
  contentFrame2:SetPoint("TOPLEFT", self, "TOPLEFT")
  contentFrame2:SetBackdrop({
    bgFile = "Interface\\AddOns\\PVPWarn\\assets\\images\\ui_slot_background",
    insets = {left = 0, right = 0, top = 0, bottom = 0},
  })
  contentFrame2:SetBackdropColor(1, 0.9, 0, 1)
  contentFrame2:SetWidth(RGPVPW_CONSTANTS.SPELL_LIST_CONTENT_FRAME_WIDTH)
  contentFrame2:SetHeight(200)
  navigation[2].contentFrame = contentFrame2
  navigation[2].func = mod.categoryMenuResistTab.Init
  -- UPDATE category
  navigation[2].category = self.categoryName


end

--[[
  @param {table} self
]]--
function me.TabNavigationButtonOnClick(self)
  local tabId = self.id

  if navigation[tabId].active then
    -- window is already active
    return
  end

  me.Reset()
  me.ActivateTab(tabId)
end

--[[
  Reset navigation before activating a new tab
]]--
function me.Reset()
  for position, _ in pairs(navigation) do
    mod.logger.LogError(me.tag, "pos: " .. position)
    _G[RGPVPW_CONSTANTS.ELEMENT_TAB_BUTTON .. position]:UnlockHighlight()

    navigation[position].active = false
    navigation[position].contentFrame:Hide()
  end
end

--[[
  Activate a specific tab. Function is either called by an onclick event on one
  of the tab buttons or initialy when the first tab is activated automatically

  @param {number} position
]]--
function me.ActivateTab(position)
  local nav = navigation[position]
  _G[RGPVPW_CONSTANTS.ELEMENT_TAB_BUTTON .. position]:LockHighlight()

  nav.active = true
  nav.contentFrame:Show()
  nav.func(nav.contentFrame, nav.category)
end
