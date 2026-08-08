--[[
  MIT License

  Copyright (c) 2026 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--

-- luacheck: globals CreateFrame Settings

local mod = rgpvpw
local me = {}

mod.addonConfiguration = me

me.tag = "AddonConfiguration"

--[[
  Holds the id reference to the main category of the addon. Can be used with Settings.OpenToCategory({number})
  {number}
]]--
local mainCategoryId

--[[
  Category ids captured at registration, keyed by a stable name: "main", "general",
  "combatState", "stanceState", "zone", "voicePack", "detectionBar", "flash", "profile",
  "enemyAvoid", plus one per spell category keyed by
  RGPVPW_CONSTANTS.CATEGORIES[i].categoryName ("druid" through "misc").
  Settings.OpenToCategory requires the numeric id - passing a category name errors on Classic
  Era ("outside of expected range") - so callers resolve through me.GetCategoryId instead of
  hardcoding ids or looking up localized names.
  {table}
]]--
local categoryIds = {}

--[[
  Retrieve the numeric settings category id registered under a key. Intended for programmatic
  navigation via Settings.OpenToCategory, which accepts only numeric ids.

  @param {string} key
    One of "main", "general", "combatState", "stanceState", "zone", "voicePack",
    "detectionBar", "flash", "profile", "enemyAvoid" or a spell category name
    ("druid" ... "misc")

  @return {number | nil}
    The category id or nil for an unknown key or before SetupAddonConfiguration ran
]]--
function me.GetCategoryId(key)
  return categoryIds[key]
end

--[[
  Create addon configuration menu(s)
]]--
function me.SetupAddonConfiguration()
  -- initialize the main addon category
  local category, menu = me.BuildCategory(RGPVPW_CONSTANTS.ELEMENT_ADDON_PANEL, nil, rgpvpw.L["addon_name"])
  -- add about content into main category
  mod.aboutContent.BuildAboutContent(menu)
  categoryIds.main = category.ID

  local generalSubCategory = me.BuildCategory(
    RGPVPW_CONSTANTS.ELEMENT_GENERAL_SUB_OPTION_FRAME,
    category,
    rgpvpw.L["options_category_name"],
    mod.generalMenu.BuildUi
  )
  categoryIds.general = generalSubCategory.ID

  local combatStateSubCategory = me.BuildCategory(
    RGPVPW_CONSTANTS.ELEMENT_COMBAT_STATE_SUB_OPTION_FRAME,
    category,
    rgpvpw.L["configuration_menu_combat_state"],
    mod.combatStateMenu.OnPanelShow
  )
  categoryIds.combatState = combatStateSubCategory.ID

  local stanceStateSubCategory = me.BuildCategory(
    RGPVPW_CONSTANTS.ELEMENT_STANCE_STATE_SUB_OPTION_FRAME,
    category,
    rgpvpw.L["configuration_menu_stance_state"],
    mod.stanceStateMenu.OnPanelShow
  )
  categoryIds.stanceState = stanceStateSubCategory.ID

  local zoneSubCategory = me.BuildCategory(
    RGPVPW_CONSTANTS.ELEMENT_ZONE_MENU_SUB_OPTION_FRAME,
    category,
    rgpvpw.L["configuration_menu_zone"],
    mod.zoneMenu.BuildUi
  )
  categoryIds.zone = zoneSubCategory.ID

  local voicePackSubCategory = me.BuildCategory(
    RGPVPW_CONSTANTS.ELEMENT_VOICE_PACK_SUB_OPTION_FRAME,
    category,
    rgpvpw.L["configuration_menu_voice_pack"],
    mod.voicePackMenu.BuildUi
  )
  categoryIds.voicePack = voicePackSubCategory.ID

  local detectionBarSubCategory = me.BuildCategory(
    RGPVPW_CONSTANTS.ELEMENT_DETECTION_BAR_SUB_OPTION_FRAME,
    category,
    rgpvpw.L["configuration_menu_detection_bar"],
    mod.detectionBarMenu.OnPanelShow
  )
  categoryIds.detectionBar = detectionBarSubCategory.ID

  local flashSubCategory = me.BuildCategory(
    RGPVPW_CONSTANTS.ELEMENT_FLASH_SUB_OPTION_FRAME,
    category,
    rgpvpw.L["configuration_menu_flash"],
    mod.flashMenu.BuildUi
  )
  categoryIds.flash = flashSubCategory.ID

  local profileSubCategory = me.BuildCategory(
    RGPVPW_CONSTANTS.ELEMENT_PROFILE_SUB_OPTION_FRAME,
    category,
    rgpvpw.L["configuration_menu_profiles"],
    mod.profileMenu.Init
  )
  categoryIds.profile = profileSubCategory.ID

  me.BuildSpellCategories(category)

  local enemyAvoidSubCategory = me.BuildCategory(
    RGPVPW_CONSTANTS.ELEMENT_ENEMY_AVOID_SUB_OPTION_FRAME,
    category,
    rgpvpw.L["configuration_menu_enemy_avoid"],
    mod.enemyAvoidMenu.Init
  )
  categoryIds.enemyAvoid = enemyAvoidSubCategory.ID
end

--[[
  Builds main and subcategories

  @param {string} frameName
  @param {table} parent
  @param {string} panelText
  @param {function} onShowCallback

  @return {table}, {table}
    category, menu
]]--
function me.BuildCategory(frameName, parent, panelText, onShowCallback)
  local category
  local menu

  if parent == nil then
    menu = CreateFrame("Frame", frameName)
    category = Settings.RegisterCanvasLayoutCategory(menu, panelText)
    mainCategoryId = category.ID
    Settings.RegisterAddOnCategory(category)
  else
    menu = CreateFrame("Frame", frameName, nil)
    menu.parent = parent.name
    local subcategory = Settings.RegisterCanvasLayoutSubcategory(parent, menu, frameName)
    subcategory.name = panelText
    category = subcategory
    Settings.RegisterAddOnCategory(subcategory)
  end

  if onShowCallback ~= nil then
    menu:SetScript("OnShow", onShowCallback)
  end

  --[[
   Important to hide panel initially. Interface addon options will take care of showing the menu.
   If this is not done OnShow callbacks will not be invoked correctly.
  ]]--
  menu:Hide()

  return category, menu
end

--[[
  Build configuration panels for all categories

  @param {table} parent
]]--
function me.BuildSpellCategories(parent)
  for index, category in ipairs(RGPVPW_CONSTANTS.CATEGORIES) do
    local menu = CreateFrame("Frame", category.name, nil)
    menu.parent = parent.name
    menu.value = index
    menu.categoryName = category.categoryName

    local subcategory = Settings.RegisterCanvasLayoutSubcategory(parent, menu, category.name)
    subcategory.name = rgpvpw.L[category.localizationKey]

    Settings.RegisterAddOnCategory(subcategory)
    --[[
      categoryName ("druid" ... "misc") is the stable, locale-independent token this addon
      already identifies a category by everywhere else - the frame name is UI-coupled and the
      localized name would break on a non-enUS client
    ]]--
    categoryIds[category.categoryName] = subcategory.ID
    menu:SetScript("OnShow", mod.categoryMenu.MenuOnShow)

    --[[
     Important to hide panel initially. Interface addon options will take care of showing the menu.
     If this is not done OnShow callbacks will not be invoked correctly.
    ]]--
    menu:Hide()
  end
end

--[[
  Open the Blizzard addon configurations panel for the addon
]]--
function me.OpenMainCategory()
  if mainCategoryId ~= nil then
    Settings.OpenToCategory(mainCategoryId)
  end
end
