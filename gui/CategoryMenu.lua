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

-- luacheck: globals CreateFrame

local mod = rgpvpw
local me = {}
mod.categoryMenu = me

me.tag = "CategoryMenu"

--[[
  The category menu builds a container for each category. Each category container has two subcontainers
  for spells and avoid. The user can switch between those two containers with the help of tabs.

  The goals of this module is to keep track of the already built containers and reuse them if the user navigates back.
--]]

--[[
  Currently active category
]]--
local categoryName
--[[
  Identifiers for the different tabs
]]--
local spellTab = 1
local avoidTab = 2
--[[
  Reference to the currently active tab

  One of spellTab(1) or avoidTab(2)
]]--
local activeTab
--[[
  Track whether the tab containers for a certain category were already built and store all relevant ui
  elements for the category
]]--
local categoriesBuilt = {}

--[[
  Build or update (if already built) the category menus for configuring spells

  @param {table} self
    Reference to the addon configuration frame to attach to
]]--
function me.MenuOnShow(self)
  categoryName = self.categoryName -- update active category name

  if not me.IsCategoryContainerAlreadyBuilt(self.categoryName) then
    mod.logger.LogInfo(me.tag, "Category not built yet - building " .. self.categoryName)
    me.CreateCategoryMenu(self)
  end

  me.UpdateCategoryTabButtons(self)
  me.ResetNavigation()
  me.ActivateTab(spellTab) -- activate the spell tab (first tab)
end

--[[
  @param {string} category

  @return {boolean}
    true - if the category container was already built
    false - if the category container was not yet built
 --]]
function me.IsCategoryContainerAlreadyBuilt(category)
  for _, value in ipairs(categoriesBuilt) do
    if value.name == category then
      return true
    end
  end

  return false
end

--[[
  @param {string} category

  @return {table | nil}
    The category container reference or nil if not found
]]--
function me.GetCategoryContainerReference(category)
  for _, categoryReference in ipairs(categoriesBuilt) do
    if categoryReference.name == category then
      return categoryReference
    end
  end

  return nil
end

--[[
  Update the category tab buttons, this is invoked everytime the category changes
  Some of the spell categories do not have an avoid tab

  @param {table} self
]]--
function me.UpdateCategoryTabButtons(self)
  local category = me.GetCategoryContainerReference(categoryName)

  if not RGPVPW_CONSTANTS.CATEGORIES[self.value].enemyAvoidEnabled then
    category.avoidTabButton:Hide()
  else
    category.avoidTabButton:Show()
  end
end

--[[
  Create the initial elements for the category menu. This includes containers to switch between
  the spelltab and the avoidtab and the buttons to allow this switching process. This function should
  only run once for each category. If the user navigates back to a category that was already built
  the function will not run again.
]]--
function me.CreateCategoryMenu(self)
  local spellTabButton = me.CreateTabButton(
    self,
    RGPVPW_CONSTANTS.ELEMENT_TAB_BUTTON .. spellTab,
    {"TOPLEFT", 5, 0},
    rgpvpw.L["tab_button_spell"],
    spellTab
  )

  local avoidTabButton = me.CreateTabButton(
    self,
    RGPVPW_CONSTANTS.ELEMENT_TAB_BUTTON .. avoidTab,
    {"LEFT", spellTabButton, "RIGHT", 5, 0},
    rgpvpw.L["tab_button_avoid"],
    avoidTab
  )

  --[[ content sits directly below the 37px tall tabs so the active tab art connects to it ]]--
  local spellContentFrame = mod.guiHelper.CreateCategoryContentFrame(
    self,
    RGPVPW_CONSTANTS.ELEMENT_TAB_CONTENT_FRAME .. spellTab,
    {"TOPLEFT", self, 5, -37}
  )

  local avoidContentFrame = mod.guiHelper.CreateCategoryContentFrame(
    self,
    RGPVPW_CONSTANTS.ELEMENT_TAB_CONTENT_FRAME .. avoidTab,
    {"TOPLEFT", self, 5, -37}
  )

  local category = {
    name = self.categoryName,
    spellContentFrame = spellContentFrame,
    spellInitFunc = mod.categoryMenuSpellsTab.Init,
    avoidContentFrame = avoidContentFrame,
    avoidInitFunc = mod.categoryMenuAvoidTab.Init,
    spellTabButton = spellTabButton,
    avoidTabButton = avoidTabButton
  }

  table.insert(categoriesBuilt, category)
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
  local tabButton = CreateFrame("Button", tabButtonName, parentFrame, "MinimalTabTemplate")

  tabButton.id = id
  tabButton:SetPoint(unpack(position))
  --[[ the template reads its text from an xml keyvalue which CreateFrame cannot pass -
       assign it after the fact and redo the mixin's width calculation ]]--
  tabButton.Text:SetText(text)
  tabButton:SetWidth(tabButton.Text:GetStringWidth() + 40)
  tabButton:SetScript("OnClick", function(self)
    me.TabNavigationButtonOnClick(self)
  end)

  return tabButton
end

--[[
  @param {table} self
]]--
function me.TabNavigationButtonOnClick(self)
  if activeTab == self.id then
    mod.logger.LogDebug(me.tag, "Tab is already active - skipping...")

    return
  end

  me.ResetNavigation()
  me.ActivateTab(self.id)
end

--[[
  Reset navigation
]]--
function me.ResetNavigation()
  mod.logger.LogDebug(me.tag, "Resetting navigation")

  local category = me.GetCategoryContainerReference(categoryName)

  category.spellContentFrame:Hide()
  category.avoidContentFrame:Hide()
  category.spellTabButton:SetSelected(false)
  category.avoidTabButton:SetSelected(false)

  activeTab = nil
end

--[[
  Activate a specific tab. Function is either called by an onclick event on one
  of the tab buttons or initially when the first tab is activated automatically

  @param {number} position spellTab or avoidTab
]]--
function me.ActivateTab(position)
  mod.logger.LogDebug(me.tag, "Activating tab position " .. position)

  local category = me.GetCategoryContainerReference(categoryName)

  if position == spellTab then
    category.spellContentFrame:Show()
    category.spellTabButton:SetSelected(true)
    category.avoidContentFrame:Hide()
    category.avoidTabButton:SetSelected(false)

    activeTab = spellTab

    category.spellInitFunc(category.spellContentFrame, categoryName)
  elseif position == avoidTab then
    category.avoidContentFrame:Show()
    category.avoidTabButton:SetSelected(true)
    category.spellContentFrame:Hide()
    category.spellTabButton:SetSelected(false)

    activeTab = avoidTab

    category.avoidInitFunc(category.avoidContentFrame, categoryName)
  end
end
