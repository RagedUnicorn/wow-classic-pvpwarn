--[[
  MIT License

  Copyright (c) 2021 Michael Wiesendanger

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
-- luacheck: globals UIDropDownMenu_DisableDropDown PanelTemplates_TabResize

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
  Currently active category
]]--
local categoryName = nil

local spellTab = 1
local resistTab = 2

--[[
  Reference to the first tab switching button. The button changes its attached parent
  when switching through the different categories
]]--
local tabButton1
--[[
  Reference to the second tab switching button. The button changes its attached parent
  when switching through the different categories
]]--
local tabButton2
--[[
  Reference to the first content frame. The contentFrame changes its attached parent
  when switching through the different categories. It then clears out its content and
  displays the content of the current category.
]]--
local contentFrame1
--[[
  Reference to the second content frame. The contentFrame changes its attached parent
  when switching through the different categories. It then clears out its content and
  displays the content of the current category.
]]--
local contentFrame2

--[[
  Build or update (if already built) the category menus for configuring spells

  @param {table} self
    Reference to the addon configuration frame to attach to
]]--
function me.MenuOnShow(self)
  if not builtMenu then
    me.CreateCategoryMenu(self)
  end

  me.ResetNavigation()
  me.UpdateCategoryMenu(self)
  me.ActivateTab(spellTab) -- activate the spell tab (first tab)
end

--[[
  Create the initial elements for the category menu. This includes containers to switch between
  the spelltab and the resisttab and the buttons to allow this switching process. This function should
  only run once avoiding creating unnecessary ui elements.
]]--
function me.CreateCategoryMenu(self)
  tabButton1 = me.CreateTabButton(
    self,
    RGPVPW_CONSTANTS.ELEMENT_TAB_BUTTON .. spellTab,
    {"TOPLEFT", 5, 30},
    rgpvpw.L["tab_button_spell"],
    spellTab
  )

  tabButton2 = me.CreateTabButton(
    self,
    RGPVPW_CONSTANTS.ELEMENT_TAB_BUTTON .. resistTab,
    {"TOPLEFT", 70, 30},
    rgpvpw.L["tab_button_resist"],
    resistTab
  )

  contentFrame1 = me.CreateCategoryMenuContentFrame(
    self,
    RGPVPW_CONSTANTS.ELEMENT_TAB_CONTENT_FRAME .. spellTab,
    {"TOPLEFT", self, 5, -7}
  )
  navigation[spellTab].contentFrame = contentFrame1
  navigation[spellTab].func = mod.categoryMenuSpellsTab.Init

  contentFrame2 = me.CreateCategoryMenuContentFrame(
    self,
    RGPVPW_CONSTANTS.ELEMENT_TAB_CONTENT_FRAME .. resistTab,
    {"TOPLEFT", self, 5, -7}
  )
  navigation[resistTab].contentFrame = contentFrame2
  navigation[resistTab].func = mod.categoryMenuResistTab.Init

  builtMenu = true -- mark menu as built preventing from doing this step again
end

--[[
  @param {table} parentFrame
  @param {string} contentFrameName
  @param {table} position
  @param {string} text
  @param {number} id

  @return {table}
]]--
function me.CreateTabButton(parentFrame, tabButtonName, position, text, id)
  local tabButton = CreateFrame("Button", tabButtonName, parentFrame, "TabButtonTemplate")
  tabButton.id = id
  tabButton:SetPoint(unpack(position))
  tabButton:SetText(text)
  PanelTemplates_TabResize(tabButton, 0)
  tabButton:SetScript('OnClick', function(self)
    me.TabNavigationButtonOnClick(self)
  end)

  return tabButton
end

--[[
  @param {table} self
  @param {string} contentFrameName
  @param {table} position

  @return {table}
]]--
function me.CreateCategoryMenuContentFrame(self, contentFrameName, position)
  local contentFrame = CreateFrame("Frame", contentFrameName, self)
  contentFrame:SetPoint(unpack(position))
  contentFrame:SetBackdrop({ -- DEVELOPMENT ONLY
    bgFile = "Interface\\AddOns\\PVPWarn\\assets\\images\\ui_slot_background",
    insets = {left = 0, right = 0, top = 0, bottom = 0},
  })
  contentFrame:SetBackdropColor(1, 0.37, 0.5, .7)
  contentFrame:SetWidth(RGPVPW_CONSTANTS.SPELL_LIST_CONTENT_FRAME_WIDTH)
  contentFrame:SetHeight(RGPVPW_CONSTANTS.SPELL_LIST_CONTENT_FRAME_HEIGHT)

  return contentFrame
end

--[[
  @param {table} self
]]--
function me.TabNavigationButtonOnClick(self)
  if navigation[self.id].active then
    mod.logger.LogDebug(me.tag, "Tab is already active - skipping...")
    return
  end

  me.ResetNavigation()
  me.ActivateTab(self.id)
end

--[[
  Update the cateogry menu. This is invoked everytime the category changes. Buttons parents
  need to be updated.

  @param {table} self
]]--
function me.UpdateCategoryMenu(self)
  -- update ui elements parentframe
  tabButton1:SetParent(self)
  tabButton2:SetParent(self)
  contentFrame1:SetParent(self)
  contentFrame2:SetParent(self)

  -- update the current active category
  categoryName = self.categoryName
end

--[[
  Reset navigation
]]--
function me.ResetNavigation()
  mod.logger.LogDebug(me.tag, "Resetting navigation")

  for position, _ in pairs(navigation) do
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
  mod.logger.LogDebug(me.tag, "Activating tab position " .. position)

  local nav = navigation[position]
  _G[RGPVPW_CONSTANTS.ELEMENT_TAB_BUTTON .. position]:LockHighlight()

  nav.active = true
  nav.contentFrame:Show()
  nav.func(nav.contentFrame, categoryName)
end
