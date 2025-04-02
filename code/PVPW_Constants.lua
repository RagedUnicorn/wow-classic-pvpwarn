--[[
  MIT License

  Copyright (c) 2025 Michael Wiesendanger

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
    Unit ids
  ]]--
  UNIT_ID_PLAYER = "player",
  UNIT_ID_TARGET = "target",
  --[[
    Buff types
  ]]--
  BUFF_TYPE_BUFF = "BUFF",
  BUFF_TYPE_DEBUFF = "DEBUFF",
  --[[
    Spell types
  ]]--
  -- base game spell types
  SPELL_TYPE_BASE = "SPELL_TYPE_BASE",
  -- season of discovery spell types
  SPELL_TYPE_SOD = "SPELL_TYPE_SOD",
  --[[
    Intervals
  ]]--
  WARN_QUEUE_UPDATE_INTERVAL = 0.1,
  CHECK_COMBAT_STATE_INTERVAL = 0.4,
  CHECK_STANCE_STACE_EXPIRED_INTERVAL = 60,
  --[[
    Warn textures
  ]]--
  TEXTURES = {
    none = {
      textureName = "texture_none",
      colorValue = 0
    },
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
  CATEGORY_COLOR = {
    ["warrior"] = { 0.78, 0.61, 0.43, 1},
    ["priest"] = { 1.00, 1.00, 1.00, 1},
    ["rogue"] = { 1.00, 0.96, 0.41, 1 },
    ["mage"] = { 0.25, 0.78, 0.92, 1},
    ["hunter"] = { 0.67, 0.83, 0.45, 1},
    ["warlock"] = { 0.53, 0.53, 0.93, 1},
    ["paladin"] = { 0.96, 0.55, 0.73, 1},
    ["druid"] = { 1.00, 0.49, 0.04, 1},
    ["shaman"] = { 0.00, 0.44, 0.87, 1},
    ["racials"] = { 0.94, 0.37, 0.36, 1},
    ["items"] = { 0, 0.96, 0.83, 1},
    ["misc"] = { 0.47, 0.21, 0.74, 1 }
  },
  --[[
    default color based on TEXTURES - colorValue
  ]]--
  DEFAULT_COLOR = 0, -- none
  SPELL_TYPES = {
    ["NORMAL"] = 1, -- SPELL_CAST_SUCCESS
    ["START"] = 2, -- SPELL_CAST_START
    ["APPLIED"] = 3, -- SPELL_AURA_APPLIED
    ["REMOVED"] = 4, -- SPELL_AURA_REMOVED
    ["REFRESH"] = 5, -- SPELL_AURA_REFRESH
    ["MISSED_SELF"] = 6, -- SPELL_MISSED
    ["MISSED_ENEMY"] = 7, -- SPELL_MISSED
  },
  --[[
    Miss types that are considered relevant for tracking spell avoidance

    Subtype of SPELL_MISSED - Excludes "ABSORB"
  ]]--
  RELEVANT_MISS_TYPES = {
    DODGE = "DODGE",
    BLOCK = "BLOCK",
    PARRY = "PARRY",
    MISS = "MISS",
    RESIST = "RESIST",
    IMMUNE = "IMMUNE",
    REFLECT = "REFLECT"
  },
  --[[
    Miss types that are considered irrelevant for tracking spell avoidance
  ]]--
  IRRELEVANT_MISS_TYPES = {
    ABSORB = "ABSORB"
  },
  EVENT_SPELL_CAST_SUCCESS = "SPELL_CAST_SUCCESS",
  EVENT_SPELL_CAST_START = "SPELL_CAST_START",
  EVENT_SPELL_MISSED = "SPELL_MISSED",
  EVENT_SPELL_AURA_APPLIED = "SPELL_AURA_APPLIED",
  EVENT_SPELL_AURA_REMOVED = "SPELL_AURA_REMOVED",
  EVENT_SPELL_AURA_REFRESH = "SPELL_AURA_REFRESH",
  --[[
    Spelllist corresponding to the saved addon variable and its configured
    spelllists
  ]]--
  SPELL_TYPE = {
    ["SPELL"] = "spellList",
    ["SPELL_SELF_AVOID"] = "spellSelfAvoidList",
    ["SPELL_ENEMY_AVOID"] = "spellEnemyAvoidList"
  },
  SPELL_AVOID_TYPE = {
    ["SELF_AVOID"] = 1,
    ["ENEMY_AVOID"] = 2
  },
  SPELL_AVOID_MAP = "spellAvoidMap",
  SPELL_MAP = "spellMap",
  TARGET_SELF = 1,
  TARGET_ENEMY = 2,
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

  ]]--
  STATE_ICON_HOLDER_ICON_SIZE = 20,
  --[[
    TargetFrame combatState
  ]]--
  ELEMENT_COMBAT_STATE_FRAME = "PVPW_CombatStateFrame",
  ELEMENT_COMBAT_STATE_TEXTURE = "PVPW_CombatStateTexture",
  COMBAT_STATE_ICON_SIZE = 20,
  COMBAT_STATE_ACTIVE_ICON_ID = 132336, -- warrior challenge
  --[[
    TargetFrame stanceState
  ]]--
  ELEMENT_STANCE_STATE_FRAME = "PVPW_StanceStateFrame",
  ELEMENT_STANCE_STATE_TEXTURE = "PVPW_StanceStateTexture",
  STANCE_STATE_ICON_SIZE = 20,
  STANCE_STATE_UNKNOWN_STANCE_ICON_ID = 134400,

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
  GENERAL_CHECK_OPTION_SIZE = 32,
  ELEMENT_GENERAL_OPT = "PVPW_Opt",
  ELEMENT_GENERAL_FRAME = "PVPW_GeneralFrame",
  ELEMENT_GENERAL_TITLE = "PVPW_GeneralTitle",
  ELEMENT_GENERAL_OPT_ENABLE_COMBAT_STATE = "PVPW_OptEnableCombatStateTracking",
  ELEMENT_GENERAL_OPT_LOCK_FRAME_COMBAT_STATE = "PVPW_OptLockFrameCombatState",
  ELEMENT_GENERAL_OPT_ENABLE_STANCE_STATE = "PVPW_OptEnableStanceStateTracking",
  ELEMENT_GENERAL_OPT_LOCK_FRAME_STANCE_STATE = "PVPW_OptLockFrameStanceState",
  --[[
    ZoneMenu
  ]]--
  ELEMENT_ZONE_MENU_SUB_OPTION_FRAME = "PVPW_ZoneMenuOptionsFrame",
  ELEMENT_ZONE_TITLE = "PVPW_ZoneTitle",
  ELEMENT_ZONE_ALTERAC_VALLEY = "PVPW_AlteracValleyCheckBox",
  ELEMENT_ZONE_ARATHI_BASIN = "PVPW_ArathiBasinCheckBox",
  ELEMENT_ZONE_WARSONG_GULCH = "PVPW_WarsongGulchCheckBox",
  --[[
    A list of available categories consisting of all classes, racials, items and a
    misc category

    {
      ["categoryName"] = "", -- {string} name of the category such as "warrior"
      ["localizationKey"] = "", -- {string} name for the localization key
      ["name"] = "", -- {string} name of the content frame
      ["enemyAvoidEnabled"] = -- {boolean} boolean whether this category has enemy resists enabled or not
    },
  ]]--
  CATEGORIES = {
    [1] = {
      ["categoryName"] = "druid",
      ["localizationKey"] = "category_druid",
      ["name"] = "PVPW_DruidOptionsFrame",
      ["enemyAvoidEnabled"] = true
    },
    [2] = {
      ["categoryName"] = "hunter",
      ["localizationKey"] = "category_hunter",
      ["name"] = "PVPW_HunterOptionsFrame",
      ["enemyAvoidEnabled"] = true
    },
    [3] = {
      ["categoryName"] = "mage",
      ["localizationKey"] = "category_mage",
      ["name"] = "PVPW_MageOptionsFrame",
      ["enemyAvoidEnabled"] = true
    },
    [4] = {
      ["categoryName"] = "paladin",
      ["localizationKey"] = "category_paladin",
      ["name"] = "PVPW_PaladinOptionsFrame",
      ["enemyAvoidEnabled"] = true
    },
    [5] = {
      ["categoryName"] = "priest",
      ["localizationKey"] = "category_priest",
      ["name"] = "PVPW_PriestOptionsFrame",
      ["enemyAvoidEnabled"] = true
    },
    [6] = {
      ["categoryName"] = "rogue",
      ["localizationKey"] = "category_rogue",
      ["name"] = "PVPW_RogueOptionsFrame",
      ["enemyAvoidEnabled"] = true
    },
    [7] = {
      ["categoryName"] = "shaman",
      ["localizationKey"] = "category_shaman",
      ["name"] = "PVPW_ShamanOptionsFrame",
      ["enemyAvoidEnabled"] = true
    },
    [8] = {
      ["categoryName"] = "warlock",
      ["localizationKey"] = "category_warlock",
      ["name"] = "PVPW_WarlockOptionsFrame",
      ["enemyAvoidEnabled"] = true
    },
    [9] = {
      ["categoryName"] = "warrior",
      ["localizationKey"] = "category_warrior",
      ["name"] = "PVPW_WarriorOptionsFrame",
      ["enemyAvoidEnabled"] = true
    },
    [10] = {
      ["categoryName"] = "items",
      ["localizationKey"] = "category_items",
      ["name"] = "PVPW_ItemsOptionsFrame",
      ["enemyAvoidEnabled"] = false
    },
    [11] = {
      ["categoryName"] = "racials",
      ["localizationKey"] = "category_racials",
      ["name"] = "PVPW_RacialsOptionsFrame",
      ["enemyAvoidEnabled"] = false
    },
    [12] = {
      ["categoryName"] = "misc",
      ["localizationKey"] = "category_misc",
      ["name"] = "PVPW_ItemsOptionsFrame",
      ["enemyAvoidEnabled"] = false
    }
  },
  --[[
    Tab configuration
  ]]--
  ELEMENT_TAB_BUTTON = "PVPW_TabButton_",
  ELEMENT_TAB_CONTENT_FRAME = "PVPW_TabContentFrame",

  --[[
    Profilemenu
  ]]--
  ELEMENT_PROFILE_LIST_SCROLL_FRAME = "PVPW_ProfileListScrollFrame",
  PROFILE_LIST_CONTENT_FRAME_WIDTH = 580,
  PROFILE_LIST_MAX_ROWS = 6,
  PROFILE_LIST_ROW_HEIGHT = 20,
  ELEMENT_PROFILE_LIST_CONTENT_FRAME = "PVPW_ProfileListContentFrame",
  ELEMENT_PROFILE_TITLE = "PVPW_ProfileTitle",
  ELEMENT_PROFILE_NAME = "PVPW_ProfileName",
  PROFILE_NAME_WIDTH = 150,
  ELEMENT_SAVE_PROFILE_BUTTON = "PVPW_SaveProfile",
  ELEMENT_DELETE_PROFILE_BUTTON = "PVPW_DeleteProfile",
  ELEMENT_LOAD_PROFILE_BUTTON = "PVPW_LoadProfile",
  ELEMENT_UPDATE_PROFILE_BUTTON = "PVPW_UpdateProfile",
  ELEMENT_PROFILE_LIST_ROW_HIGHLIGHT = "$parentHighlight",
  DEFAULT_PROFILE_NAME = "Default",
  --[[
    Categorymenu
  ]]--
  ELEMENT_CATEGORY_SUB_OPTION_FRAME = "PVPW_CategoryMenuOptionsFrame",

  --[[
    Spellstab
  ]]--
  -- scroll list
  ELEMENT_SPELL_LIST_SCROLL_FRAME = "$parent_PVPW_SpellListScrollFrame",
  ELEMENT_SPELL_LIST_SCROLL_FRAME_SLIDER = "PVPW_SpellListScrollFrameSlider",
  ELEMENT_SPELL_LIST_CONTENT_FRAME = "$parent_PVPW_SpellListContentFrame",
  SPELL_LIST_CONTENT_FRAME_WIDTH = 580,
  SPELL_LIST_CONTENT_FRAME_HEIGHT = 552,
  SPELL_LIST_MAX_ROWS = 6,
  SPELL_LIST_ROW_HEIGHT = 92,
  -- spell configuration (single row)
  ELEMENT_CATEGORY_SPELL_ICON = "$parentIcon",
  CATEGORY_SPELL_ICON_SIZE = 32,
  CATEGORY_CHECK_BOX_SIZE = 32,
  SPELL_TITLE_WIDTH = 150,
  ELEMENT_CATEGORY_SPELL_NAME = "PVPW_SpellName",
  ELEMENT_CATEGORY_ENABLE_SPELL = "$parentEnableSpell",
  ELEMENT_CATEGORY_ENABLE_SOUND = "$parentEnableSound",
  ELEMENT_CATEGORY_ENABLE_SOUND_FADE = "$parentEnableSoundDown",
  ELEMENT_CATEGORY_VISUAL_WARNING_LABEL = "$parentVisualLabel",
  ELEMENT_CATEGORY_VISUAL_WARNING_DROPDOWN = "ChooseVisual_",
  ELEMENT_CATEGORY_PLAY_SOUND_BUTTON = "$parentPlaySound",
  ELEMENT_CATEGORY_PLAY_SOUND_SPECIAL_BUTTON = "$parentPlaySoundSpecial",
  ELEMENT_CATEGORY_PLAY_VISUAL_ALERT_BUTTON = "$parentPlayVisualAlert",
  BUTTON_DEFAULT_PADDING = 15,
  BUTTON_DEFAULT_HEIGHT = 25,
  --[[
    SpellAvoidTab
  ]]--
  -- scroll list
  ELEMENT_SPELL_SELF_AVOID_LIST_SCROLL_FRAME = "PVPW_SpellAvoidListScrollFrame",
  ELEMENT_SPELL_SELF_AVOID_LIST_CONTENT_FRAME = "PVPW_SpellAvoidListContentFrame",
  SPELL_SELF_AVOID_LIST_CONTENT_FRAME_WIDTH = 580,
  SPELL_SELF_AVOID_LIST_MAX_ROWS = 6,
  SPELL_SELF_AVOID_LIST_ROW_HEIGHT = 92,
  -- spell avoid configuration (single row)
  ELEMENT_CATEGORY_ENABLE_SPELL_SELF_AVOID = "$parentEnableSpellSelfAvoid",
  ELEMENT_CATEGORY_SPELL_SELF_AVOID_ICON = "$parentIcon",
  ELEMENT_CATEGORY_SPELL_SELF_AVOID_ICON_SIZE = 32,
  ELEMENT_CATEGORY_SPELL_SELF_AVOID_NAME = "PVPW_SpellSelfAvoidName",
  SPELL_SELF_AVOID_TITLE_WIDTH = 150,
  ELEMENT_CATEGORY_ENABLE_SELF_AVOID_SOUND = "$parentEnableSelfAvoidSound",
  ELEMENT_CATEGORY_PLAY_SELF_AVOID_SOUND_BUTTON = "$parentPlaySelfAvoidSound",
  ELEMENT_CATEGORY_SELF_AVOID_VISUAL_WARNING_LABEL = "$parentSelfAvoidVisualLabel",
  ELEMENT_CATEGORY_SELF_AVOID_VISUAL_WARNING_DROPDOWN = "ChooseSelfAvoidVisual_",
  ELEMENT_CATEGORY_PLAY_SELF_AVOID_VISUAL_ALERT_BUTTON = "$parentPlaySelfAvoidVisualAlert",
  --[[
    SpellEnemyAvoid
  ]]--
  -- scroll list
  ELEMENT_SPELL_ENEMY_AVOID_LIST_CONTENT_FRAME = "PVPW_SpellEnemyAvoidListContentFrame",
  ELEMENT_SPELL_ENEMY_AVOID_LIST_SCROLL_FRAME = "PVPW_SpellEnemyAvoidListScrollFrame",
  ELEMENT_SPELL_ENEMY_AVOID_LIST_CONTENT_ROW_FRAME = "PVPW_SpellEnemyAvoidListContentRowFrame",
  SPELL_ENEMY_AVOID_LIST_CONTENT_FRAME_WIDTH = 580,
  SPELL_ENEMY_AVOID_LIST_MAX_ROWS = 6,
  SPELL_ENEMY_AVOID_LIST_ROW_HEIGHT = 92,
  -- spell enemy avoid configuration (single row)
  ELEMENT_CATEGORY_ENABLE_SPELL_ENEMY_AVOID = "$parentEnableSpellEnemyAvoid",
  ELEMENT_CATEGORY_SPELL_ENEMY_AVOID_ICON = "$parentIcon",
  ELEMENT_CATEGORY_SPELL_ENEMY_AVOID_ICON_SIZE = 32,
  ELEMENT_CATEGORY_SPELL_ENEMY_AVOID_NAME =  "PVPW_SpellEnemyAvoidName",
  SPELL_ENEMY_AVOID_TITLE_WIDTH = 150,
  ELEMENT_CATEGORY_ENABLE_ENEMY_AVOID_SOUND = "$parentEnableEnemyAvoidSound",
  ELEMENT_CATEGORY_PLAY_ENEMY_AVOID_SOUND_BUTTON = "$parentPlayEnemyAvoidSound",
  ELEMENT_CATEGORY_ENEMY_AVOID_VISUAL_WARNING_LABEL = "$parentEnemyAvoidVisualLabel",
  ELEMENT_CATEGORY_ENEMY_AVOID_VISUAL_WARNING_DROPDOWN = "ChooseEnemyAvoidVisual_",
  ELEMENT_CATEGORY_PLAY_ENEMY_AVOID_VISUAL_ALERT_BUTTON = "$parentPlayEnemyAvoidVisualAlert"
}
