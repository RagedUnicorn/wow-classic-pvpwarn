--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

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
-- luacheck: globals GetSpellInfo

local mod = rgpvpw
local me = {}
mod.categoryMenu = me

me.tag = "CategoryMenu"

--[[
  Local references to ui elements
]]--
local spellRows = {}
local spellScrollFrame
-- track whether the menu was already built
local builtMenu = false
--[[
  Cached spelllist for reusing while the player scrolls through the spelllist. Wiped
  when the category changes
]]--
local cachedCategoryData = nil

--[[
  Build or update (if already built) the category menus for configuring spells

  @param {table} frame
    The addon configuration frame to attach to
  @param {string} category
]]--
function me.MenuOnShow(self)
  if builtMenu then
    -- cleaned cached data from previous category
    cachedCategoryData = nil
    mod.logger.LogInfo(me.tag, "Wiped cached spellist after category switch")
    -- changing the scrollframes parent to the respective active category panel
    spellScrollFrame:SetParent(self)
    -- update the scrolllist with new category data
    me.FauxScrollFrameOnUpdate(spellScrollFrame, self.categoryName)
  else
    me.BuildUi(self, self.categoryName)
  end
end

--[[
  Create the spelllist configuration menu

  @param {table} frame
  @param {string} category
]]--
function me.BuildUi(frame, category)
  spellScrollFrame = me.CreateSpellList(frame, category)
  me.FauxScrollFrameOnUpdate(spellScrollFrame, category)
  builtMenu = true
end

--[[
  Create the scrollist for the spelllist

  @param {table} frame

  @return {table}
]]--
function me.CreateSpellList(frame)
  local scrollFrame = me.CreateFauxScrollFrame(
    RGPVPW_CONSTANTS.ELEMENT_SPELL_LIST_SCROLL_FRAME,
    frame,
    RGPVPW_CONSTANTS.SPELL_LIST_CONTENT_FRAME_WIDTH,
    me.FauxScrollFrameOnUpdate,
    spellRows
  )

  scrollFrame:ClearAllPoints()
  scrollFrame:SetPoint("TOPLEFT", frame, 5, -3)

  return scrollFrame
end

--[[
  @param {string} scrollFrameName
  @param {table} frame
  @param {number} width
  @param {function} callback
    OnVerticalScroll callback function
  @param {table} storage
    Storage for the created rows

  @return {table}
    The created scrollFrame
]]--
function me.CreateFauxScrollFrame(scrollFrameName, frame, width, callback, storage)
  local scrollFrame = CreateFrame("ScrollFrame", scrollFrameName, frame, "FauxScrollFrameTemplate")
  scrollFrame:SetWidth(width)
  scrollFrame:SetHeight(RGPVPW_CONSTANTS.SPELL_LIST_ROW_HEIGHT * RGPVPW_CONSTANTS.SPELL_LIST_MAX_ROWS)
  scrollFrame:EnableMouseWheel(true)

  scrollFrame:SetScript("OnVerticalScroll", function(self, offset)
    self.ScrollBar:SetValue(offset)
    self.offset = math.floor(offset / RGPVPW_CONSTANTS.SPELL_LIST_ROW_HEIGHT + 0.5)
    callback(self, self:GetParent().categoryName)
  end)

  for i = 1, RGPVPW_CONSTANTS.SPELL_LIST_MAX_ROWS do
    table.insert(storage, me.CreateRowFrame(scrollFrame, i))
  end

  return scrollFrame
end

--[[
  @param {table} frame
  @param {number} position

  @return {table}
    The created row
]]--
function me.CreateRowFrame(frame, position)
  local row = CreateFrame("Button", RGPVPW_CONSTANTS.ELEMENT_SPELL_LIST_CONTENT_FRAME .. position, frame)
  row:SetSize(frame:GetWidth(), RGPVPW_CONSTANTS.SPELL_LIST_ROW_HEIGHT)
  row:SetPoint("TOPLEFT", frame, 0, (position -1) * RGPVPW_CONSTANTS.SPELL_LIST_ROW_HEIGHT * -1)

  row:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    insets = {left = 0, right = 0, top = 0, bottom = 0},
  })

  if math.fmod(position, 2) == 0 then
    row:SetBackdropColor(0.37, 0.37, 0.37, .4)
  else
    row:SetBackdropColor(.25, .25, .25, .8)
  end

  row.cooldownStatus = me.CreateSpellStatusCheckbox(row)
  row.cooldownIcon = me.CreateSpellIcon(row)
  row.spellTitle = me.CreateSpellTitle(row)

  row.enableSound = me.CreateSpellSoundCheckBox(row)
  row.enableSoundDown = me.CreateSpellSoundDownCheckBox(row)
  row.enableVisual = me.CreateSpellVisualCheckBox(row)

  return row
end

--[[
  @param {table} spellFrame
  TODO might need rework

  @return {table}
    The created icon texture holder
]]--
function me.CreateSpellIcon(spellFrame)
  local iconHolder = CreateFrame("Frame", nil, spellFrame)
  iconHolder:SetSize(
    RGPVPW_CONSTANTS.CATEGORY_COOLDOWN_SPELL_ICON_SIZE + 5,
    RGPVPW_CONSTANTS.CATEGORY_COOLDOWN_SPELL_ICON_SIZE + 5
  )
  iconHolder:SetPoint("LEFT", 40, 0)

  local cooldownIcon = iconHolder:CreateTexture(RGPVPW_CONSTANTS.ELEMENT_CATEGORY_COOLDOWN_SPELL_ICON, "ARTWORK")
  cooldownIcon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
  cooldownIcon:SetPoint("CENTER", 0, 0)
  cooldownIcon:SetSize(
    RGPVPW_CONSTANTS.CATEGORY_COOLDOWN_SPELL_ICON_SIZE,
    RGPVPW_CONSTANTS.CATEGORY_COOLDOWN_SPELL_ICON_SIZE
  )

  local backdrop = {
    bgFile = "Interface\\AddOns\\PVPWarn\\assets\\images\\ui_slot_background",
    edgeFile = "Interface\\AddOns\\PVPWarn\\assets\\images\\ui_slot_background",
    tile = false,
    tileSize = 32,
    edgeSize = 20,
    insets = {
      left = 12,
      right = 12,
      top = 12,
      bottom = 12
    }
  }

  iconHolder:SetBackdrop(backdrop)
  -- Set color based on class
  iconHolder:SetBackdropColor(0.15, 0.15, 0.15, 1)
  iconHolder:SetBackdropBorderColor(0.47, 0.21, 0.74, 1)

  return cooldownIcon
end

--[[
  Create fontstring for title of the spell to configure

  @param {table} spellFrame

  @return {table}
    The created fontstring
]]--
function me.CreateSpellTitle(spellFrame)
  local spellTitleFontString = spellFrame:CreateFontString("TODO", "OVERLAY")
  spellTitleFontString:SetFont(STANDARD_TEXT_FONT, 15)
  spellTitleFontString:SetWidth(RGPVPW_CONSTANTS.SPELL_TITLE_WIDTH)
  spellTitleFontString:SetPoint(
    "LEFT",
    spellFrame.cooldownIcon,
    RGPVPW_CONSTANTS.CATEGORY_COOLDOWN_SPELL_ICON_SIZE + 10,
    0
  )
  spellTitleFontString:SetTextColor(.95, .95, .95)

  return spellTitleFontString
end

--[[
  Create checkbox for configuring whether a spell is active or not

  @param {table} spellFrame

  @return {table}
    The created checkbox
]]--
function me.CreateSpellStatusCheckbox(spellFrame)
  return me.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENABLE_SPELL,
    spellFrame,
    {"LEFT", 0, 0},
    me.ClickConfigSpellCallback
  )
end

--[[
  Click callback for enabling/disabling spell alert
]]--
function me.ClickConfigSpellCallback()
  -- TODO implement updating configuration
  mod.logger.LogError(me.tag, "Spell callback")
end

--[[
  Create checkbox for configuring sound alert configuration

  @param {table} spellFrame

  @return {table}
    The created checkbox
]]--
function me.CreateSpellSoundCheckBox(spellFrame)
  return me.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENABLE_SOUND,
    spellFrame,
    {"LEFT", spellFrame.spellTitle, "RIGHT", 0, 25},
    me.ClickConfigSoundCallback,
    rgpvpw.L["label_enable_sound"]
  )
end

--[[
  Click callback for enabling/disabling sound alert
]]--
function me.ClickConfigSoundCallback()
  -- TODO implement updating configuration
  mod.logger.LogError(me.tag, "Sound")
end

--[[
  Create checkbox for configuring sound down alert configuration

  @param {table} spellFrame

  @return {table}
    The created checkbox
]]--
function me.CreateSpellSoundDownCheckBox(spellFrame)
  return me.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENABLE_SOUND_DOWN,
    spellFrame,
    {"LEFT", spellFrame.spellTitle, "RIGHT", 0, 0},
    me.ClickConfigSoundDownCallback,
    rgpvpw.L["label_enable_sound_down"]
  )
end

--[[
  Click callback for enabling/disabling sound down alert
]]--
function me.ClickConfigSoundDownCallback()
  -- TODO implement updating configuration
  mod.logger.LogError(me.tag, "Sound down")
end

--[[
  Create checkbox for configuring visual alert configuration

  @param {table} spellFrame

  @return {table}
    The created checkbox
]]--
function me.CreateSpellVisualCheckBox(spellFrame)
  return me.CreateCheckBox(
    RGPVPW_CONSTANTS.ELEMENT_CATEGORY_ENABLE_VISUAL,
    spellFrame,
    {"LEFT", spellFrame.spellTitle, "RIGHT", 0, -25},
    me.ClickConfigVisualCallback,
    rgpvpw.L["label_enable_visual"]
  )
end

--[[
  Click callback for enabling/disabling visual alert
]]--
function me.ClickConfigVisualCallback()
  -- TODO implement updating configuration
  mod.logger.LogError(me.tag, "Visual callback")
end

--[[
  Create a configuration checkbox

  @param {string} frameName
  @param {table} parent
  @param {table} position
    An object containing configuration parameters for a SetPoint function call
  @param {function} callback
    Callback that is called onClick
  @param {string} text
    Text is used as label for the checkbox

  @retun {table}
    The created checkbox
]]--
function me.CreateCheckBox(frameName, parent, position, callback, text)
  local checkBoxFrame = CreateFrame(
    "CheckButton",
    frameName,
    parent,
    "UICheckButtonTemplate"
  )
  checkBoxFrame:SetSize(
    RGPVPW_CONSTANTS.CATEGORY_CHECK_BOX_SIZE,
    RGPVPW_CONSTANTS.CATEGORY_CHECK_BOX_SIZE
  )
  checkBoxFrame:SetPoint(unpack(position))

  checkBoxFrame.text = _G[checkBoxFrame:GetName() .. 'Text']
  checkBoxFrame.text:SetFont(STANDARD_TEXT_FONT, 15)
  checkBoxFrame.text:SetTextColor(.95, .95, .95)


  if text ~= nil then
    checkBoxFrame.text:SetText(text)
  end

  checkBoxFrame:SetScript("OnClick", callback)

  return checkBoxFrame
end

--[[
  TODO verify text
  Update the item to switch scrollframe on vertical scroll events. Gathers all items for
  the currently selected inventory type and displays them. This only includes items that
  have an on use effect.

  @param {table} scrollFrame
]]--
function me.FauxScrollFrameOnUpdate(scrollFrame, category)
  if cachedCategoryData == nil then
    mod.logger.LogInfo(me.tag, string.format("Warmed up cached spelllist for category '%s'", category))
    cachedCategoryData = mod.spellMap.GetAllForCategory(category)
  end

  local maxValue = mod.common.TableLength(cachedCategoryData) or 0

  if maxValue <= RGPVPW_CONSTANTS.SPELL_LIST_MAX_ROWS then
    maxValue = RGPVPW_CONSTANTS.SPELL_LIST_MAX_ROWS + 1
  end
  -- Note: maxValue needs to be at least max_rows + 1
  FauxScrollFrame_Update(
    scrollFrame,
    maxValue,
    RGPVPW_CONSTANTS.SPELL_LIST_MAX_ROWS,
    RGPVPW_CONSTANTS.SPELL_LIST_ROW_HEIGHT
  )

  local offset = FauxScrollFrame_GetOffset(scrollFrame)

  for i = 1, RGPVPW_CONSTANTS.SPELL_LIST_MAX_ROWS do
    local value = i + offset

    if value <= maxValue then
      local row = spellRows[i]

      if cachedCategoryData[value] ~= nil then
        local _, _, iconId = GetSpellInfo(cachedCategoryData[value].spellId)
        -- local enabled = mod.configuration.GetCooldownConfigurationState(category, cooldown.spellId) TODO get status from configuration

        row.cooldownIcon:SetTexture(iconId)
        row.spellTitle:SetText(cachedCategoryData[value].name)

--         row.enableSound.text:SetText("Lets try this out") TODO

        local enabled = true -- TODO hardcoded

        if enabled then
          row.cooldownStatus:SetChecked(true)
        else
          row.cooldownStatus:SetChecked(false)
        end

        row:Show()
      else
        spellRows[i]:Hide()
      end
    end
  end
end
