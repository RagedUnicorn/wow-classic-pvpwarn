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

-- forward declaration
local BuildWarnTextures

RGPVPW_CONSTANTS = {
  ADDON_NAME = "PVPWarn",
  --[[
    Addon message prefix for the version broadcast (code/Comm.lua), max 16 characters
  ]]--
  ADDON_MESSAGE_PREFIX = "RGPVPW_VER",
  --[[
    Unit ids
  ]]--
  DEFAULT_VOICE_PACK_NAME = "default",
  UNIT_ID_PLAYER = "player",
  UNIT_ID_TARGET = "target",
  --[[
    Buff types
  ]]--
  BUFF_TYPE_DEBUFF = "DEBUFF",
  --[[
    Spell types
  ]]--
  -- base game spell types
  SPELL_TYPE_BASE = "SPELL_TYPE_BASE",
  -- season of discovery spell types
  SPELL_TYPE_SOD = "SPELL_TYPE_SOD",
  -- the burning crusade spell types
  SPELL_TYPE_TBC = "SPELL_TYPE_TBC",
  --[[
    Intervals
  ]]--
  WARN_QUEUE_UPDATE_INTERVAL = 0.1,
  CHECK_COMBAT_STATE_INTERVAL = 0.4,
  CHECK_STANCE_STATE_EXPIRED_INTERVAL = 60,
  --[[
    Warn textures - TEXTURES is derived from RGPVPW_COLORS.WARNINGS and assigned after
    this table (see BuildWarnTextures)
  ]]--
  --[[
    default color - no visual warning configured
  ]]--
  DEFAULT_COLOR = RGPVPW_COLORS.NONE,
  SPELL_TYPES = {
    NORMAL = 1, -- SPELL_CAST_SUCCESS
    START = 2, -- SPELL_CAST_START
    APPLIED = 3, -- SPELL_AURA_APPLIED
    REMOVED = 4, -- SPELL_AURA_REMOVED
    REFRESH = 5, -- SPELL_AURA_REFRESH
    MISSED_SELF = 6, -- SPELL_MISSED
    MISSED_ENEMY = 7, -- SPELL_MISSED
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
  TARGET_SELF = 1,
  TARGET_ENEMY = 2,
  --[[
    Max age in seconds of a warn message before it is considered to old. Messages
    that are to old are dropped from the queue.
  ]]--
  MAX_WARN_AGE = 5,
  --[[
    Duration in seconds the warn queue stays busy after playing a warning. Prevents
    multiple sounds and visual warnings from playing at the same time.
  ]]--
  WARN_QUEUE_BUSY_GATE = 0.8,
  --[[
    Vignette flash overlay (see gui/Flash.lua)
  ]]--
  ELEMENT_FLASH_FRAME = "PVPW_FlashFrame",
  ELEMENT_FLASH_TEXTURE = "PVPW_FlashTexture",
  --[[
    Shared icon size for the combat state and stance state icon holders
  ]]--
  STATE_ICON_HOLDER_ICON_SIZE = 20,
  --[[
    CombatFrame combatState
  ]]--
  ELEMENT_COMBAT_STATE_FRAME = "PVPW_CombatStateFrame",
  ELEMENT_COMBAT_STATE_TEXTURE = "PVPW_CombatStateTexture",
  COMBAT_STATE_ACTIVE_ICON_ID = 132336, -- warrior challenge
  --[[
    TargetFrame stanceState
  ]]--
  ELEMENT_STANCE_STATE_FRAME = "PVPW_StanceStateFrame",
  ELEMENT_STANCE_STATE_TEXTURE = "PVPW_StanceStateTexture",
  STANCE_STATE_UNKNOWN_STANCE_ICON_ID = 134400,

  --[[
    Addon configuration
  ]]--
  ELEMENT_ADDON_PANEL = "PVPW_AddonPanel",
  --[[
    Design colour tokens as { r, g, b } in the 0-1 range. Derived from Quartermaster's COLOR
    table, but BODY / SUBNOTE are brightened: Quartermaster's values are tuned for its own
    near-black panel backdrop, while these panels render on the lighter stock settings canvas.
  ]]--
  COLOR = {
    TITLE_GOLD = { 1.0, 0.819, 0.0 },       -- #ffd100 panel titles
    SECTION_GOLD = { 0.851, 0.647, 0.129 }, -- #d9a521 section headers
    BODY = { 0.91, 0.87, 0.80 },            -- #e8decc body text / option labels (warm near-white)
    SPELL_TITLE = { 0.95, 0.95, 0.95 },     -- #f2f2f2 spell names in the per-spell lists
    DISABLED = { 0.45, 0.41, 0.35 },        -- disabled control labels (QM stepper disabled-glyph tone)
    SUBNOTE = { 0.66, 0.60, 0.50 }          -- #a89980 option descriptions (warm mid gray)
  },
  SLIDER_WITH_STEPPERS_WIDTH = 250,
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
  ELEMENT_GENERAL_TITLE = "PVPW_GeneralTitle",
  ELEMENT_GENERAL_OPT_WARN_MODE_DROPDOWN = "PVPW_OptWarnModeDropdown",
  --[[
    CombatStateMenu
  ]]--
  ELEMENT_COMBAT_STATE_SUB_OPTION_FRAME = "PVPW_CombatStateMenuOptionsFrame",
  ELEMENT_COMBAT_STATE_TITLE = "PVPW_CombatStateTitle",
  ELEMENT_COMBAT_STATE_OPT_ENABLE = "PVPW_CombatStateOptEnable",
  ELEMENT_COMBAT_STATE_POSITION_BUTTON = "PVPW_CombatStatePositionButton",
  ELEMENT_COMBAT_STATE_RESET_BUTTON = "PVPW_CombatStateResetButton",
  --[[
    StanceStateMenu
  ]]--
  ELEMENT_STANCE_STATE_SUB_OPTION_FRAME = "PVPW_StanceStateMenuOptionsFrame",
  ELEMENT_STANCE_STATE_TITLE = "PVPW_StanceStateTitle",
  ELEMENT_STANCE_STATE_OPT_ENABLE = "PVPW_StanceStateOptEnable",
  ELEMENT_STANCE_STATE_OPT_HIDE_UNKNOWN = "PVPW_StanceStateOptHideUnknownStance",
  ELEMENT_STANCE_STATE_POSITION_BUTTON = "PVPW_StanceStatePositionButton",
  ELEMENT_STANCE_STATE_RESET_BUTTON = "PVPW_StanceStateResetButton",
  --[[
    ZoneMenu
  ]]--
  ELEMENT_ZONE_MENU_SUB_OPTION_FRAME = "PVPW_ZoneMenuOptionsFrame",
  ELEMENT_ZONE_TITLE = "PVPW_ZoneTitle",
  ELEMENT_ZONE_ALTERAC_VALLEY = "PVPW_AlteracValleyCheckBox",
  ELEMENT_ZONE_ARATHI_BASIN = "PVPW_ArathiBasinCheckBox",
  ELEMENT_ZONE_WARSONG_GULCH = "PVPW_WarsongGulchCheckBox",
  --[[
    VoicePackMenu
  ]]--
  ELEMENT_VOICE_PACK_SUB_OPTION_FRAME = "PVPW_VoicePackMenuOptionsFrame",
  ELEMENT_VOICE_PACK_TITLE = "PVPW_VoicePackTitle",
  ELEMENT_VOICE_PACK_DROPDOWN = "PVPW_VoicePackDropdown",
  ELEMENT_VOICE_PACK_DROPDOWN_MIN_WIDTH = 120,
  ELEMENT_VOICE_PACK_PLAY_SOUND_BUTTON = "PVPW_VoicePackPlaySoundButton",
  --[[
    Detection bar
  ]]--
  ELEMENT_DETECTION_BAR_ANCHOR_FRAME = "PVPW_DetectionBarAnchor",
  ELEMENT_DETECTION_BAR_SUB_OPTION_FRAME = "PVPW_DetectionBarMenuOptionsFrame",
  ELEMENT_DETECTION_BAR_TITLE = "PVPW_DetectionBarTitle",
  ELEMENT_DETECTION_BAR_ENABLE = "PVPW_DetectionBarEnable",
  ELEMENT_DETECTION_BAR_POSITION_BUTTON = "PVPW_DetectionBarPositionButton",
  ELEMENT_DETECTION_BAR_MAX_BARS_SLIDER = "PVPW_DetectionBarMaxBarsSlider",
  ELEMENT_DETECTION_BAR_SCALE_SLIDER = "PVPW_DetectionBarScaleSlider",
  ELEMENT_DETECTION_BAR_RESET_ANCHOR_BUTTON = "PVPW_DetectionBarResetAnchorButton",
  --[[
    Flash menu (vignette flash options sub-panel)
  ]]--
  ELEMENT_FLASH_SUB_OPTION_FRAME = "PVPW_FlashMenuOptionsFrame",
  ELEMENT_FLASH_MENU_TITLE = "PVPW_FlashMenuTitle",
  ELEMENT_FLASH_OPT_ENABLE = "PVPW_FlashOptEnable",
  ELEMENT_FLASH_OPT_MAX_OPACITY_SLIDER = "PVPW_FlashOptMaxOpacitySlider",
  ELEMENT_FLASH_OPT_PULSE = "PVPW_FlashOptPulse",
  ELEMENT_FLASH_OPT_ADDITIVE_BLEND = "PVPW_FlashOptAdditiveBlend",
  ELEMENT_FLASH_OPT_TEST_BUTTON = "PVPW_FlashOptTestButton",
  --[[
    Target filter warning modes (see code/CombatLog.lua ShouldWarnForTarget)
  ]]--
  TARGET_FILTER_MODE_WARN_ALL = "warnAll",
  TARGET_FILTER_MODE_CURRENT_TARGET = "currentTarget",
  --[[
    Fallback event-text color for a detection bar when the detected spell has no visual
    warning color configured (colorValue "none"). #FF4FA8
  ]]--
  DETECTION_BAR_DEFAULT_EVENT_COLOR = { r = 1.00, g = 0.31, b = 0.66 },
  --[[
    event-text color for aura-removed ("down") detections, matching the red 'X' icon marker
  ]]--
  DETECTION_BAR_REMOVED_EVENT_COLOR = { r = 0.92, g = 0.26, b = 0.23 },
  --[[
    Detection bar visual tokens
  ]]--
  DETECTION_BAR_MAX_SLOTS = 4,
  DETECTION_BAR_WIDTH = 760,
  DETECTION_BAR_HEIGHT = 56,
  DETECTION_BAR_GAP = 6,
  DETECTION_BAR_FONT = "Interface\\AddOns\\PVPWarn\\assets\\fonts\\FiraSans-Heavy.ttf",
  DETECTION_BAR_FONT_FALLBACK = "Fonts\\FRIZQT__.TTF",
  DETECTION_BAR_ICON_GLOW_TEXTURE = "Interface\\AddOns\\PVPWarn\\assets\\detection_bar\\icon_glow",
  DETECTION_BAR_GRADIENT_CLASS_TEXTURE = "Interface\\AddOns\\PVPWarn\\assets\\detection_bar\\bar_gradient_class",
  DETECTION_BAR_GRADIENT_DARK_TEXTURE = "Interface\\AddOns\\PVPWarn\\assets\\detection_bar\\bar_gradient_dark",
  DETECTION_BAR_REMOVED_MARK_TEXTURE = "Interface\\RaidFrame\\ReadyCheck-NotReady",
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
      ["name"] = "PVPW_MiscOptionsFrame",
      ["enemyAvoidEnabled"] = false
    }
  },
  --[[
    Categorymenu

    The title is created once per category - the categoryName ("druid" ... "misc") is appended
    to keep the fontString names unique
  ]]--
  ELEMENT_CATEGORY_TITLE = "PVPW_CategoryTitle_",
  --[[
    Tab configuration
  ]]--
  ELEMENT_TAB_BUTTON = "PVPW_TabButton_",
  ELEMENT_TAB_CONTENT_FRAME = "PVPW_TabContentFrame",

  --[[
    Profilemenu
  ]]--
  ELEMENT_PROFILE_SUB_OPTION_FRAME = "PVPW_ProfileMenuOptionsFrame",
  ELEMENT_PROFILE_LIST_SCROLL_FRAME = "PVPW_ProfileListScrollFrame",
  PROFILE_LIST_CONTENT_FRAME_WIDTH = 280,
  PROFILE_LIST_MAX_ROWS = 8,
  PROFILE_LIST_ROW_HEIGHT = 20,
  -- padding between the border of the list container and the rows inside it
  PROFILE_LIST_VIEWPORT_INSET = 6,
  -- keeps a profile name clear of the scrollbar that overlays the right edge of its row
  PROFILE_LIST_NAME_INSET_RIGHT = 24,
  ELEMENT_PROFILE_LIST_CONTENT_FRAME = "PVPW_ProfileListContentFrame",
  ELEMENT_PROFILE_TITLE = "PVPW_ProfileTitle",
  ELEMENT_PROFILE_NAME = "$parentName",
  ELEMENT_CREATE_PROFILE_BUTTON = "PVPW_CreateProfile",
  ELEMENT_DELETE_PROFILE_BUTTON = "PVPW_DeleteProfile",
  ELEMENT_LOAD_PROFILE_BUTTON = "PVPW_LoadProfile",
  ELEMENT_UPDATE_PROFILE_BUTTON = "PVPW_UpdateProfile",
  ELEMENT_PROFILE_STRING_LABEL = "PVPW_ProfileStringLabel",
  ELEMENT_PROFILE_STRING_SCROLL_FRAME = "PVPW_ProfileStringScrollFrame",
  ELEMENT_PROFILE_EXPORT_BUTTON = "PVPW_ExportProfile",
  ELEMENT_PROFILE_IMPORT_BUTTON = "PVPW_ImportProfile",
  PROFILE_STRING_BOX_WIDTH = 540,
  PROFILE_STRING_BOX_HEIGHT = 90,
  ELEMENT_PROFILE_LIST_ROW_HIGHLIGHT = "$parentHighlight",
  DEFAULT_PROFILE_NAME = "Default",

  --[[
    Spellstab
  ]]--
  -- scroll list
  ELEMENT_SPELL_LIST_SCROLL_FRAME = "$parent_PVPW_SpellListScrollFrame",
  ELEMENT_SPELL_LIST_CONTENT_FRAME = "$parent_PVPW_SpellListContentFrame",
  --[[
    Shared spell list layout. All three lists (spells tab, avoid tab, enemy avoid) stretch to
    the settings canvas they are placed on - its size comes from the SettingsPanel and varies
    with resolution and ui scale. The insets below say how much of the canvas is kept free
    around the list, the per list width/maxRows constants are only fallbacks used until the
    canvas reports a size.
  ]]--
  SPELL_LIST_CONTENT_FRAME_INSET_RIGHT = 5,
  SPELL_LIST_CONTENT_FRAME_INSET_BOTTOM = 10,
  --[[
    The scrollbar overlays the rows at the right edge of the list rather than getting a gutter
    of its own - that way the row background reaches the border of the list and runs on behind
    the bar. SPELL_LIST_ROW_INSET_RIGHT keeps the row controls clear of it.
  ]]--
  SPELL_LIST_SCROLL_BAR_GAP = 6,
  SPELL_LIST_CONTENT_FRAME_WIDTH = 580,
  SPELL_LIST_MAX_ROWS = 6,
  SPELL_LIST_ROW_HEIGHT = 92,
  -- spell configuration (single row)
  ELEMENT_CATEGORY_SPELL_ICON = "$parentIcon",
  CATEGORY_SPELL_ICON_SIZE = 32,
  CATEGORY_CHECK_BOX_SIZE = 24,
  --[[
    Single row layout, shared by all three lists - see gui/SpellListHelper.lua CreateRowFrame.
    The left cluster (enable checkbox, icon) hangs off the rows left edge and the control
    columns off its right one, so every pixel the list gains ends up in the spell title, which
    is anchored between the two.
  ]]--
  SPELL_LIST_ROW_INSET_LEFT = 10,
  -- wide enough to clear the scrollbar the rows now run underneath
  SPELL_LIST_ROW_INSET_RIGHT = 22,
  -- gap between the enable checkbox and the spell icon
  SPELL_LIST_ROW_ICON_GAP = 16,
  -- gap the spell title keeps to the icon on its left and to the control columns on its right
  SPELL_LIST_ROW_TITLE_GAP = 8,
  --[[
    Space kept free to the right of a checkbox for its label. Checkbox plus label column put
    the play button 174 into the control column, which the 150 wide dropdown on the line below
    reaches with a 24px gap to spare - so all three play buttons end up in one column.
  ]]--
  SPELL_LIST_ROW_LABEL_COLUMN_WIDTH = 150,
  SPELL_LIST_ROW_DROPDOWN_WIDTH = 150,
  -- vertical offsets of the three control lines, relative to the center of the row
  SPELL_LIST_ROW_SOUND_LINE_Y = 25,
  SPELL_LIST_ROW_SOUND_SPECIAL_LINE_Y = 0,
  SPELL_LIST_ROW_VISUAL_LINE_Y = -30,
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
  ELEMENT_CATEGORY_ENABLE_SELF_AVOID_SOUND = "$parentEnableSelfAvoidSound",
  ELEMENT_CATEGORY_PLAY_SELF_AVOID_SOUND_BUTTON = "$parentPlaySelfAvoidSound",
  ELEMENT_CATEGORY_SELF_AVOID_VISUAL_WARNING_LABEL = "$parentSelfAvoidVisualLabel",
  ELEMENT_CATEGORY_SELF_AVOID_VISUAL_WARNING_DROPDOWN = "ChooseSelfAvoidVisual_",
  ELEMENT_CATEGORY_PLAY_SELF_AVOID_VISUAL_ALERT_BUTTON = "$parentPlaySelfAvoidVisualAlert",
  --[[
    EnemyAvoidMenu
  ]]--
  ELEMENT_ENEMY_AVOID_SUB_OPTION_FRAME = "PVPW_EnemyAvoidMenuOptionsFrame",
  ELEMENT_ENEMY_AVOID_TITLE = "PVPW_EnemyAvoidTitle",
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
  ELEMENT_CATEGORY_ENABLE_ENEMY_AVOID_SOUND = "$parentEnableEnemyAvoidSound",
  ELEMENT_CATEGORY_PLAY_ENEMY_AVOID_SOUND_BUTTON = "$parentPlayEnemyAvoidSound",
  ELEMENT_CATEGORY_ENEMY_AVOID_VISUAL_WARNING_LABEL = "$parentEnemyAvoidVisualLabel",
  ELEMENT_CATEGORY_ENEMY_AVOID_VISUAL_WARNING_DROPDOWN = "ChooseEnemyAvoidVisual_",
  ELEMENT_CATEGORY_PLAY_ENEMY_AVOID_VISUAL_ALERT_BUTTON = "$parentPlayEnemyAvoidVisualAlert"
}

--[[
  Build the warn texture table - one entry per RGPVPW_COLORS.WARNINGS color, keyed by the
  bare color name. Derived so a color added in code/Colors.lua automatically gets its
  texture entry (the matching texture assets must still be shipped). Requires code/Colors.lua
  to be loaded first (see toc order).

  @return {table}
    colorName = {textureName = "texture_<colorName>", colorValue = <number>}
]]--
BuildWarnTextures = function()
  local textures = {}

  for colorName, colorData in pairs(RGPVPW_COLORS.WARNINGS) do
    textures[colorName] = {
      textureName = "texture_" .. colorName,
      colorValue = colorData.value
    }
  end

  return textures
end

RGPVPW_CONSTANTS.TEXTURES = BuildWarnTextures()
