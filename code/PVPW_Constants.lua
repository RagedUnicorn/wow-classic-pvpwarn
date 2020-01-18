--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

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

RGPVPW_CONSTANTS = {
  ADDON_NAME = "PVPWarn",
  --[[
    Intervals
  ]]--
  WARN_QUEUE_UPDATE_INTERVAL = 0.1,
  --[[
    Warn textures
  ]]--
  TEXTURES = {
    yellow = {
      textureName = "texture_yellow",
      colorValue = 1
    },
    violet = {
      textureName = "texture_violet",
      colorValue = 2
    },
    red = {
      textureName = "texture_red",
      colorValue = 3
    },
    orange = {
      textureName = "texture_orange",
      colorValue = 4
    },
    green = {
      textureName = "texture_green",
      colorValue = 5
    },
    blue = {
      textureName = "texture_blue",
      colorValue = 6
    },
    brown = {
      textureName = "texture_brown",
      colorValue = 7
    },
    white = {
      textureName = "texture_white",
      colorValue = 8
    },
    pink = {
      textureName = "texture_pink",
      colorValue = 9
    },
    light_blue = {
      textureName = "texture_light_blue",
      colorValue = 10
    }
  },
  SPELL_TYPES = {
    ["NORMAL"] = 1, -- SPELL_CAST_SUCCESS
    ["APPLIED"] = 2, -- SPELL_AURA_APPLIED
    ["REMOVED"] = 3, -- SPELL_AURA_REMOVED
    ["REFRESH"] = 4 -- SPELL_AURA_REFRESH
  },
  EVENT_SPELL_CAST_SUCCESS = "SPELL_CAST_SUCCESS",
  EVENT_SPELL_AURA_APPLIED = "SPELL_AURA_APPLIED",
  EVENT_SPELL_AURA_REMOVED = "SPELL_AURA_REMOVED",
  EVENT_SPELL_AURA_REFRESH = "SPELL_AURA_REFRESH",
  --[[
    Max age in seconds of a warn message before it is considered to old. Messages
    that are to old are dropped from the queue.
  ]]--
  MAX_WARN_AGE = 5,
  --[[
    Alert UI
  ]]--
  ELEMENT_ALERT_FRAME = "PVPW_AlertFrame",
  ELEMENT_ALERT_TEXTURE = "PVPW_AlertTexture",
  --[[
    Addon configuration
  ]]--
  ELEMENT_ADDON_PANEL = "PVPW_AddonPanel",
  ELEMENT_TOOLTIP = "GameTooltip", -- default blizzard frames tooltip
  --[[
    About
  ]]--
  ELEMENT_ABOUT_LOGO = "PVPW_AboutLogo",
  ELEMENT_ABOUT_AUTHOR_FONT_STRING = "PVPW_AboutAuthor",
  ELEMENT_ABOUT_EMAIL_FONT_STRING = "PVPW_AboutEmail",
  ELEMENT_ABOUT_VERSION_FONT_STRING = "PVPW_AboutVersion",
  ELEMENT_ABOUT_ISSUES_FONT_STRING = "PVPW_AboutIssues",
  --[[
    Generalmenu
  ]]--
  ELEMENT_GENERAL_SUB_OPTION_FRAME = "PVPW_GeneralMenuOptionsFrame",
  --[[
    A list of available categories consisting of all classes, racials, items and a
    misc category
  ]]--
  CATEGORIES = {
    [1] = {
      ["categoryName"] = "druid",
      ["localizationKey"] = "category_druid",
      ["name"] = "PVPW_DruidOptionsFrame"
    },
    [2] = {
      ["categoryName"] = "hunter",
      ["localizationKey"] = "category_hunter",
      ["name"] = "PVPW_HunterOptionsFrame"
    },
    [3] = {
      ["categoryName"] = "mage",
      ["localizationKey"] = "category_mage",
      ["name"] = "PVPW_MageOptionsFrame"
    },
    [4] = {
      ["categoryName"] = "paladin",
      ["localizationKey"] = "category_paladin",
      ["name"] = "PVPW_PaladinOptionsFrame"
    },
    [5] = {
      ["categoryName"] = "priest",
      ["localizationKey"] = "category_priest",
      ["name"] = "PVPW_PriestOptionsFrame"
    },
    [6] = {
      ["categoryName"] = "rogue",
      ["localizationKey"] = "category_rogue",
      ["name"] = "PVPW_RogueOptionsFrame"
    },
    [7] = {
      ["categoryName"] = "shaman",
      ["localizationKey"] = "category_shaman",
      ["name"] = "PVPW_ShamanOptionsFrame"
    },
    [8] = {
      ["categoryName"] = "warlock",
      ["localizationKey"] = "category_warlock",
      ["name"] = "PVPW_WarlockOptionsFrame"
    },
    [9] = {
      ["categoryName"] = "warrior",
      ["localizationKey"] = "category_warrior",
      ["name"] = "PVPW_WarriorOptionsFrame"
    },
    [10] = {
      ["categoryName"] = "items",
      ["localizationKey"] = "category_items",
      ["name"] = "PVPW_ItemsOptionsFrame"
    },
    [11] = {
      ["categoryName"] = "racials",
      ["localizationKey"] = "category_racials",
      ["name"] = "PVPW_RacialsOptionsFrame"
    },
    [12] = {
      ["categoryName"] = "misc",
      ["localizationKey"] = "category_misc",
      ["name"] = "PVPW_ItemsOptionsFrame"
    }
  },
  --[[
    Categorymenu
  ]]--
  ELEMENT_CATEGORY_SUB_OPTION_FRAME = "PVPW_CategoryMenuOptionsFrame",

  -- scroll list
  ELEMENT_SPELL_LIST_SCROLL_FRAME = "PVPW_QuickChangeFromScrollFrame",
  ELEMENT_SPELL_LIST_SCROLL_FRAME_SLIDER = "PVPW_QuickChangeFromScrollFrameSlider",
  ELEMENT_SPELL_LIST_CONTENT_FRAME = "PVPW_QuickChangeFromContentFrame",
  SPELL_LIST_CONTENT_FRAME_WIDTH = 580,
  SPELL_LIST_MAX_ROWS = 7,
  SPELL_LIST_ROW_HEIGHT = 80,
  -- spell configuration (single row)
  ELEMENT_CATEGORY_COOLDOWN_SPELL_ICON = "$parentIcon",
  CATEGORY_COOLDOWN_SPELL_ICON_SIZE = 32,
  CATEGORY_CHECK_BOX_SIZE = 32,
  SPELL_TITLE_WIDTH = 150,
  ELEMENT_CATEGORY_ENABLE_SPELL = "$parentEnableSpell",
  ELEMENT_CATEGORY_ENABLE_SOUND = "$parentEnableSound",
  ELEMENT_CATEGORY_ENABLE_SOUND_DOWN = "$parentEnableSoundDown",
  ELEMENT_CATEGORY_ENABLE_VISUAL = "$parentEnableVisual",
}
