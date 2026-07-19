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

-- luacheck: globals CreateFrame ScrollUtil GetSpellInfo GetItemIcon

local mod = rgpvpw
local me = {}
mod.spellListHelper = me

me.tag = "SpellListHelper"

-- forward declaration
local BuildUi
local UpdateListAnchor
local CreateSpellListContainer
local CreateRowFrame
local CreateSpellStateCheckBox
local CreateSoundCheckBox
local CreateSoundSpecialCheckBox
local SoundSpecialCheckBoxOnClick
local SoundSpecialCheckBoxOnShow
local PlaySoundButtonOnClick
local PlaySoundSpecialButtonOnClick
local CreateVisualAlertDropdown
local DropDownMenuCallback
local PlayVisualAlertButtonOnClick
local UpdateSpellRows
local UpdateIcon
local UpdateSpellStateCheckBox
local UpdateSound
local UpdateSoundSpecial
local UpdateChooseVisualDropdownMenu
local UpdateCheckButtonState
local UpdateChooseVisualDropdownMenuState
local UpdateSpellTitleState

--[[
  Create a new per-spell settings list instance. The instance carries the configuration
  of a concrete menu and the ui state of its scrollable spell list. All configuration
  reads and writes go through mod.spellConfiguration keyed by numeric spellId.

  @param {table} options
    {
      spellList - {string} spell list constant (RGPVPW_CONSTANTS.SPELL_TYPE) that decides
        upon which stored configuration list should be used
      soundType - {string} spell type (RGPVPW_CONSTANTS.SPELL_TYPES) used when playing
        the warn sound of a spell
      hasSpecialSoundColumn - {boolean} whether rows carry the additional fade/cast
        sound checkbox and play button
      getCategoryData - {function} categoryName -> list of spells to display
      getScrollFrameName - {function} categoryName -> name of the scroll frame
      listWidth - {number} width of the scroll frame
      rowHeight - {number} height of a single row
      maxRows - {number} maximum amount of visible rows
      iconSize - {number} size of the spell icon
      titleWidth - {number} width of the spell title fontstring
      elementNames - {table} frame names for the created ui elements
        {
          rowFrame, spellIcon, spellName, enableSpell, enableSound, playSound,
          visualWarningLabel, visualWarningDropdown, playVisualAlert
          [, enableSoundSpecial, playSoundSpecial]
        }
      labels - {table} localized texts for the created ui elements
        {
          enableSound, playSound, visualWarning, playVisual [, playSoundSpecial]
        }
    }

  @return {table}
    The created spell list instance
]]--
function me.NewSpellList(options)
  return {
    options = options,
    -- local references to the created row ui elements
    rows = {},
    -- outer container holding the scrollFrame and its scrollbar
    container = nil,
    scrollFrame = nil,
    -- scroll child the rows attach to
    content = nil,
    --[[
      Cached category data for reusing while the player scrolls through the spell list.
      Wiped when the category changes
    ]]--
    cachedCategoryData = nil,
    -- currently active category
    activeCategory = nil,
    -- track whether the menu was already built
    builtMenu = false
  }
end

--[[
  Build the spell list on first invocation or update it to its new parent
  category on later ones

  @param {table} spellList
    A spell list instance created through me.NewSpellList
  @param {table} frame
  @param {string} categoryName
]]--
function me.Init(spellList, frame, categoryName)
  frame.categoryName = categoryName

  if spellList.builtMenu then
    spellList.cachedCategoryData = nil
    mod.logger.LogDebug(me.tag, string.format(
      "Wiped cached %s after category switch", spellList.options.spellList)
    )

    UpdateListAnchor(spellList, frame)
    -- update the scrolllist with new category data
    UpdateSpellRows(spellList, categoryName)
  else
    BuildUi(spellList, frame, categoryName)
    spellList.builtMenu = true
  end
end

--[[
  Create the spelllist configuration menu

  @param {table} spellList
  @param {table} frame
  @param {string} categoryName
]]--
BuildUi = function(spellList, frame, categoryName)
  spellList.container = CreateSpellListContainer(spellList, frame, categoryName)
  UpdateSpellRows(spellList, categoryName)
end

--[[
  Update the spell list to its new parent category

  @param {table} spellList
  @param {table} parentFrame
]]--
UpdateListAnchor = function(spellList, parentFrame)
  spellList.container:ClearAllPoints()
  spellList.container:SetPoint("TOPLEFT", parentFrame)
  spellList.container:SetParent(parentFrame)
  spellList.scrollFrame:SetVerticalScroll(0) -- reset scroll position to top
end

--[[
  Create the scrollable container for the spelllist. The rows attach to a scroll child
  driven by a MinimalScrollBar in the style of the stock configuration menus.

  @param {table} spellList
  @param {table} frame
  @param {string} categoryName

  @return {table}
    The created container
]]--
CreateSpellListContainer = function(spellList, frame, categoryName)
  local options = spellList.options
  local listHeight = options.rowHeight * options.maxRows

  local container = CreateFrame("Frame", nil, frame)
  container:SetSize(options.listWidth, listHeight)
  container:SetPoint("TOPLEFT", frame)

  local scrollFrame = CreateFrame(
    "ScrollFrame",
    options.getScrollFrameName(categoryName),
    container
  )
  scrollFrame:SetPoint("TOPLEFT")
  scrollFrame:SetPoint("BOTTOMRIGHT")

  local scrollBar = CreateFrame("EventFrame", nil, container, "MinimalScrollBar")
  scrollBar:SetPoint("TOPLEFT", scrollFrame, "TOPRIGHT", 8, 0)
  scrollBar:SetPoint("BOTTOMLEFT", scrollFrame, "BOTTOMRIGHT", 8, 0)
  ScrollUtil.InitScrollFrameWithScrollBar(scrollFrame, scrollBar)

  local content = CreateFrame("Frame", nil, scrollFrame)
  content:SetSize(options.listWidth, listHeight)
  scrollFrame:SetScrollChild(content)

  spellList.scrollFrame = scrollFrame
  spellList.content = content

  return container
end

--[[
  @param {table} spellList
  @param {table} frame
  @param {number} position

  @return {table}
    The created row
]]--
CreateRowFrame = function(spellList, frame, position)
  local options = spellList.options
  local row = mod.guiHelper.CreateSpellFrame(
    frame,
    position,
    options.elementNames.rowFrame,
    options.rowHeight
  )

  row.position = position
  row.spellStateCheckBox = CreateSpellStateCheckBox(spellList, row)
  row.spellIcon = mod.guiHelper.CreateSpellIcon(
    row,
    options.elementNames.spellIcon,
    options.iconSize
  )
  row.spellTitle = mod.guiHelper.CreateSpellTitle(
    row.spellIcon,
    options.elementNames.spellName,
    options.titleWidth,
    options.iconSize
  )

  row.soundCheckBox = CreateSoundCheckBox(spellList, row)
  row.playSound = mod.guiHelper.CreateTextButton(
    options.elementNames.playSound,
    row,
    {"LEFT", row.soundCheckBox, "RIGHT", 150, 0},
    function(self)
      PlaySoundButtonOnClick(spellList, self)
    end,
    options.labels.playSound
  )

  if options.hasSpecialSoundColumn then
    row.soundSpecialCheckBox = CreateSoundSpecialCheckBox(spellList, row)
    row.playSoundSpecial = mod.guiHelper.CreateTextButton(
      options.elementNames.playSoundSpecial,
      row,
      {"LEFT", row.soundSpecialCheckBox, "RIGHT", 150, 0},
      PlaySoundSpecialButtonOnClick,
      options.labels.playSoundSpecial
    )
  end

  row.chooseVisual = CreateVisualAlertDropdown(spellList, row)
  row.chooseVisualLabel = mod.guiHelper.CreateVisualWarningLabel(
    row.chooseVisual,
    options.elementNames.visualWarningLabel,
    options.labels.visualWarning
  )
  row.playVisual = mod.guiHelper.CreateTextButton(
    options.elementNames.playVisualAlert,
    row,
    --[[ dropdown ends at title right + 150, the sound play buttons start at + 174
         (checkbox 24 + offset 150) - a 24px gap lines this button up with that column ]]--
    {"LEFT", row.chooseVisual, "RIGHT", 24, 0},
    function(self)
      PlayVisualAlertButtonOnClick(spellList, self)
    end,
    options.labels.playVisual
  )

  return row
end

--[[
  Create checkbox for configuring whether a spell is active or not

  @param {table} spellList
  @param {table} spellFrame

  @return {table}
    The created checkbox
]]--
CreateSpellStateCheckBox = function(spellList, spellFrame)
  return mod.guiHelper.CreateCheckBox(
    spellList.options.elementNames.enableSpell,
    spellFrame,
    {"LEFT", 0, 0},
    function(self)
      mod.spellConfiguration.ToggleSpellState(
        spellList.options.spellList,
        spellList.activeCategory,
        spellFrame.spellId,
        spellFrame.normalizedSpellName
      )

      local parentFrame = self:GetParent()

      UpdateCheckButtonState(self, parentFrame.soundCheckBox)

      if parentFrame.soundSpecialCheckBox ~= nil then
        UpdateCheckButtonState(self, parentFrame.soundSpecialCheckBox)
      end

      UpdateChooseVisualDropdownMenuState(parentFrame, self:GetChecked())
      UpdateSpellTitleState(parentFrame, self:GetChecked())
    end,
    function(self)
      local isActive = mod.spellConfiguration.IsSpellActive(
        spellList.options.spellList,
        spellList.activeCategory,
        spellFrame.spellId
      )

      if isActive then
        self:SetChecked(true)
      else
        self:SetChecked(false)
      end
    end,
    nil,
    nil,
    true -- the row's spellId is populated after creation; sync via the real OnShow event
  )
end

--[[
  Create checkbox for configuring sound alert configuration

  @param {table} spellList
  @param {table} spellFrame

  @return {table}
    The created checkbox
]]--
CreateSoundCheckBox = function(spellList, spellFrame)
  return mod.guiHelper.CreateCheckBox(
    spellList.options.elementNames.enableSound,
    spellFrame,
    {"LEFT", spellFrame.spellTitle, "RIGHT", 0, 25},
    function()
      mod.spellConfiguration.ToggleSoundWarning(
        spellList.options.spellList,
        spellList.activeCategory,
        spellFrame.spellId,
        spellFrame.normalizedSpellName
      )
    end,
    function(self)
      local isActive = mod.spellConfiguration.IsSoundWarningActive(
        spellList.options.spellList,
        spellList.activeCategory,
        spellFrame.spellId
      )

      if isActive then
        self:SetChecked(true)
      else
        self:SetChecked(false)
      end
    end,
    spellList.options.labels.enableSound,
    nil,
    true -- the row's spellId is populated after creation; sync via the real OnShow event
  )
end

--[[
  Create checkbox for configuring sound down alert configuration. Used for fade
  and spellcast sound

  @param {table} spellList
  @param {table} spellFrame

  @return {table}
    The created checkbox
]]--
CreateSoundSpecialCheckBox = function(spellList, spellFrame)
  return mod.guiHelper.CreateCheckBox(
    spellList.options.elementNames.enableSoundSpecial,
    spellFrame,
    {"LEFT", spellFrame.spellTitle, "RIGHT", 0, 0},
    function(self)
      SoundSpecialCheckBoxOnClick(spellList, self)
    end,
    function(self)
      SoundSpecialCheckBoxOnShow(spellList, self)
    end,
    nil,
    nil,
    true -- the row's spellId and type are populated after creation; sync via the real OnShow event
  )
end

--[[
  Sound special checkbox onClick callback

  @param {table} spellList
  @param {table} self
]]--
SoundSpecialCheckBoxOnClick = function(spellList, self)
  if self.type == RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED then
    mod.spellConfiguration.ToggleSoundFadeWarning(
      spellList.options.spellList,
      spellList.activeCategory,
      self:GetParent().spellId,
      self:GetParent().normalizedSpellName
    )
  elseif self.type == RGPVPW_CONSTANTS.SPELL_TYPES.START then
    mod.spellConfiguration.ToggleSoundStartWarning(
      spellList.options.spellList,
      spellList.activeCategory,
      self:GetParent().spellId,
      self:GetParent().normalizedSpellName
    )
  else
    mod.logger.LogError(me.tag, "Invalid type on special checkbox")
  end
end

--[[
  Sound special checkbox onShow callback

  @param {table} spellList
  @param {table} self
]]--
SoundSpecialCheckBoxOnShow = function(spellList, self)
  local isActive

  if self.type == RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED then
    isActive = mod.spellConfiguration.IsSoundFadeWarningActive(
      spellList.options.spellList,
      spellList.activeCategory,
      self:GetParent().spellId
    )
  elseif self.type == RGPVPW_CONSTANTS.SPELL_TYPES.START then
    isActive = mod.spellConfiguration.IsSoundStartWarningActive(
      spellList.options.spellList,
      spellList.activeCategory,
      self:GetParent().spellId
    )
  else
    mod.logger.LogError(me.tag, "Invalid type on special checkbox")

    return
  end

  if isActive then
    self:SetChecked(true)
  else
    self:SetChecked(false)
  end
end

--[[
  Click callback for sound button

  @param {table} spellList
  @param {table} self
]]--
PlaySoundButtonOnClick = function(spellList, self)
  mod.sound.PlaySound(self:GetParent().category, spellList.options.soundType, self.soundFileName)
end

--[[
  Click callback for sound special button. Used for fade and spellcast sound

  @param {table} self
]]--
PlaySoundSpecialButtonOnClick = function(self)
  mod.sound.PlaySound(self:GetParent().category, self:GetParent().soundSpecialCheckBox.type, self.soundFileName)
end

--[[
  Create a dropdown with alert color textures to choose

  @param {table} spellList
  @param {table} spellFrame

  @return {table}
    The created dropdown
]]--
CreateVisualAlertDropdown = function(spellList, spellFrame)
  return mod.guiHelper.CreateVisualWarningDropdown(
    spellFrame,
    spellList.options.elementNames.visualWarningDropdown,
    function(dropdown, colorValue)
      DropDownMenuCallback(spellList, dropdown, colorValue)
    end
  )
end

--[[
  Callback for color dropdownmenu

  @param {table} spellList
  @param {table} dropdown
    A reference to the dropdown
  @param {number} colorValue
    The selected color value
]]--
DropDownMenuCallback = function(spellList, dropdown, colorValue)
  mod.spellConfiguration.UpdateVisualWarningColor(
    spellList.options.spellList,
    spellList.activeCategory,
    dropdown:GetParent().spellId,
    dropdown:GetParent().normalizedSpellName,
    colorValue
  )
end

--[[
  Click callback for previewing the spell's configured visual warning - fires the flash
  in the spell's chosen color or asks the user to pick a color first

  @param {table} spellList
  @param {table} self
]]--
PlayVisualAlertButtonOnClick = function(spellList, self)
  -- retrieve color for specific spell and category from configuration
  local color = mod.spellConfiguration.GetVisualWarningColor(
    spellList.options.spellList,
    self:GetParent().category,
    self:GetParent().spellId
  )

  if color == RGPVPW_CONSTANTS.DEFAULT_COLOR then
    mod.logger.PrintUserError(rgpvpw.L["user_message_choose_color"])
    return
  end

  mod.flash.Show(color)
end

--[[
  Update the spell list rows to reflect the active category. Rows are created lazily -
  one per spell - and surplus rows from a previously displayed category are hidden. To
  prevent a heavy load while retrieving the data this step is only done once and the
  data is being cached for further update events.

  @param {table} spellList
  @param {string} categoryName
]]--
UpdateSpellRows = function(spellList, categoryName)
  local options = spellList.options

  spellList.activeCategory = categoryName

  if spellList.cachedCategoryData == nil then
    mod.logger.LogDebug(me.tag, string.format(
      "Warmed up cached %s for category '%s'", options.spellList, categoryName)
    )
    spellList.cachedCategoryData = options.getCategoryData(categoryName)
  end

  local spellCount = #spellList.cachedCategoryData

  for i = 1, math.max(spellCount, #spellList.rows) do
    local spell = spellList.cachedCategoryData[i]

    if spell ~= nil and spellList.rows[i] == nil then
      spellList.rows[i] = CreateRowFrame(spellList, spellList.content, i)
    end

    local row = spellList.rows[i]

    if spell ~= nil then
      row.spellId = spell.spellId
      row.normalizedSpellName = spell.normalizedSpellName
      row.category = categoryName
      row.spellTitle:SetText(spell.name)
      row.playSound.soundFileName = spell.soundFileName

      UpdateIcon(row.spellIcon, categoryName, spell)
      UpdateSpellStateCheckBox(spellList, row.spellStateCheckBox, categoryName, spell.spellId)
      UpdateSound(spellList, row.soundCheckBox, categoryName, spell.spellId)

      if options.hasSpecialSoundColumn then
        row.playSoundSpecial.soundFileName = spell.soundFileName
        UpdateSoundSpecial(spellList, row.soundSpecialCheckBox, row.playSoundSpecial, categoryName, spell)
      end

      UpdateChooseVisualDropdownMenu(spellList, row.chooseVisual, categoryName, spell.spellId)

      row:Show()
    else
      row:Hide()
    end
  end

  spellList.content:SetHeight(math.max(spellCount, options.maxRows) * options.rowHeight)
end

--[[
  @param {table} spellIcon
  @param {string} categoryName
  @param {table} spell
]]--
UpdateIcon = function(spellIcon, categoryName, spell)
  local iconId
  local color = RGPVPW_COLORS.GetCategoryColor(categoryName)

  --[[
    For most items we have to track the actual spelleffect in the combat log. However for
    people to recognize the item it is much better to use items icon itself.
  ]]--
  if spell.itemId ~= nil then
    iconId = GetItemIcon(spell.itemId)
  else
    iconId = select(3, GetSpellInfo(spell.spellId))
  end

  spellIcon:SetTexture(iconId)
  spellIcon.iconHolder:SetBackdropBorderColor(unpack(color))
end

--[[
  @param {table} spellList
  @param {table} spellStateCheckBox
  @param {string} categoryName
  @param {number} spellId
]]--
UpdateSpellStateCheckBox = function(spellList, spellStateCheckBox, categoryName, spellId)
  local isSpellActive = mod.spellConfiguration.IsSpellActive(
    spellList.options.spellList,
    categoryName,
    spellId
  )

  local parentFrame = spellStateCheckBox:GetParent()

  if isSpellActive then
    mod.logger.LogDebug(me.tag, string.format(
      "Spell %s for category %s is active", spellId, categoryName)
    )
    spellStateCheckBox:SetChecked(true)
  else
    mod.logger.LogDebug(me.tag, string.format(
      "Spell %s for category %s is inactive", spellId, categoryName)
    )
    spellStateCheckBox:SetChecked(false)
  end

  UpdateCheckButtonState(spellStateCheckBox, parentFrame.soundCheckBox)

  if parentFrame.soundSpecialCheckBox ~= nil then
    UpdateCheckButtonState(spellStateCheckBox, parentFrame.soundSpecialCheckBox)
  end

  UpdateChooseVisualDropdownMenuState(parentFrame, isSpellActive)
  UpdateSpellTitleState(parentFrame, isSpellActive)
end

--[[
  @param {table} spellList
  @param {table} soundCheckBox
  @param {string} categoryName
  @param {number} spellId
]]--
UpdateSound = function(spellList, soundCheckBox, categoryName, spellId)
  -- update sound checkbox state
  soundCheckBox:SetChecked(
    mod.spellConfiguration.IsSoundWarningActive(
      spellList.options.spellList,
      categoryName,
      spellId
    )
  )
end

--[[
  @param {table} spellList
  @param {table} soundSpecialCheckBox
  @param {table} soundSpecialButton
  @param {string} categoryName
  @param {table} spell
]]--
UpdateSoundSpecial = function(spellList, soundSpecialCheckBox, soundSpecialButton, categoryName, spell)
  if spell.hasFade then
    soundSpecialCheckBox:SetChecked(mod.spellConfiguration.IsSoundFadeWarningActive(
      spellList.options.spellList,
      categoryName,
      spell.spellId
    ))
    soundSpecialCheckBox.text:SetText(rgpvpw.L["label_enable_sound_fade"])
    soundSpecialCheckBox.type = RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED
  elseif spell.hasCast then
    soundSpecialCheckBox:SetChecked(mod.spellConfiguration.IsSoundStartWarningActive(
      spellList.options.spellList,
      categoryName,
      spell.spellId
    ))
    soundSpecialCheckBox.text:SetText(rgpvpw.L["label_enable_sound_cast"])
    soundSpecialCheckBox.type = RGPVPW_CONSTANTS.SPELL_TYPES.START
  else
    soundSpecialCheckBox:Hide()
    soundSpecialButton:Hide()

    return
  end

  soundSpecialCheckBox:Show()
  soundSpecialButton:Show()
end

--[[
  @param {table} spellList
  @param {table} dropdownMenu
  @param {string} categoryName
  @param {number} spellId
]]--
UpdateChooseVisualDropdownMenu = function(spellList, dropdownMenu, categoryName, spellId)
  local colorValue = mod.spellConfiguration.GetVisualWarningColor(
    spellList.options.spellList,
    categoryName,
    spellId
  )

  dropdownMenu.selectedColorValue = colorValue
  -- regenerate so the button text reflects the newly selected radio entry
  dropdownMenu:GenerateMenu()
end

--[[
  Updates a checkbutton based on its state or a dependent checkButton

  @param {table} checkButton
  @param {table} dependentCheckButton
]]--
UpdateCheckButtonState = function(checkButton, dependentCheckButton)
  if checkButton:GetChecked() then
    if dependentCheckButton ~= nil then
      mod.guiHelper.EnableCheckButton(dependentCheckButton)
    else
      mod.guiHelper.EnableCheckButton(checkButton)
    end
  else
    if dependentCheckButton ~= nil then
      mod.guiHelper.DisableCheckButton(dependentCheckButton)
    else
      mod.guiHelper.DisableCheckButton(checkButton)
    end
  end
end

--[[
  Enables or disables the chooseVisual dropdown and its label based
  on the checkButton state of the spell itself

  @param {table} frame
  @param {boolean} enable
]]--
UpdateChooseVisualDropdownMenuState = function(frame, enable)
  if enable then
    frame.chooseVisual:SetEnabled(true)
    mod.guiHelper.SetColor(frame.chooseVisualLabel, RGPVPW_CONSTANTS.COLOR.BODY)
  else
    frame.chooseVisual:SetEnabled(false)
    mod.guiHelper.SetColor(frame.chooseVisualLabel, RGPVPW_CONSTANTS.COLOR.DISABLED)
  end
end

--[[
  Grays out the spell title while the spell itself is deactivated, matching the
  disabled look of the row's other labels

  @param {table} frame
  @param {boolean} enable
]]--
UpdateSpellTitleState = function(frame, enable)
  if enable then
    mod.guiHelper.SetColor(frame.spellTitle, RGPVPW_CONSTANTS.COLOR.SPELL_TITLE)
  else
    mod.guiHelper.SetColor(frame.spellTitle, RGPVPW_CONSTANTS.COLOR.DISABLED)
  end
end
