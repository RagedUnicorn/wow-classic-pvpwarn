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

-- luacheck: globals CreateFrame

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

local activeCategory = ""

--[[
  TODO
  TODO
  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildUi(frame, category)
  mod.logger.LogError(me.tag, "category: " .. category)
  me.SetCategory(category)

  if not builtMenu then
    spellScrollFrame = me.CreateSpellList(frame)
  end

  -- changing the scrollframes parent to the respective category panel so it is actually shown
  spellScrollFrame:SetParent(frame)
  -- initial load of spellList list
  me.FauxScrollFrameOnUpdate(spellScrollFrame)

  builtMenu = true
end

function me.SetCategory(category)
  activeCategory = category
end

--[[
  TODO TODO!!
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
  scrollFrame:SetPoint("TOPLEFT", frame, 5, -10)

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
  scrollFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background"
  })


  scrollFrame:SetScript("OnVerticalScroll", function(self, offset)
    self.ScrollBar:SetValue(offset)
    self.offset = math.floor(offset / RGPVPW_CONSTANTS.SPELL_LIST_ROW_HEIGHT + 0.5)
    callback(self)
  end)
  scrollFrame:SetScript("OnVerticalScroll", me.SpellListOnVerticalScroll)

  for i = 1, RGPVPW_CONSTANTS.SPELL_LIST_MAX_ROWS do
    table.insert(storage, me.CreateRowFrames(scrollFrame, i))
  end

  return scrollFrame
end

--[[
  @param {table} frame
  @param {number} position

  @return {table}
    The created row
]]--
function me.CreateRowFrames(frame, position)
  local row = CreateFrame("Button", RGPVPW_CONSTANTS.ELEMENT_SPELL_LIST_CONTENT_FRAME .. position, frame)
  row:SetSize(frame:GetWidth(), RGPVPW_CONSTANTS.SPELL_LIST_ROW_HEIGHT)
  row:SetPoint("TOPLEFT", frame, 0, (position -1) * RGPVPW_CONSTANTS.SPELL_LIST_ROW_HEIGHT * -1)

  local itemNameFontString = row:CreateFontString(nil, "OVERLAY")
  itemNameFontString:SetFont(STANDARD_TEXT_FONT, 14)
  itemNameFontString:SetPoint("LEFT", 16 + 5, 0)
  itemNameFontString:SetWidth(row:GetWidth() - 16 - 5)

  row.name = itemNameFontString

  return row
end

--[[
  TODO verify text
  Update the item to switch scrollframe on vertical scroll events. Gathers all items for
  the currently selected inventory type and displays them. This only includes items that
  have an on use effect.

  @param {table} scrollFrame
]]--
function me.FauxScrollFrameOnUpdate(scrollFrame)
  mod.logger.LogError(me.tag, "Fauxupdate")
  local spells = mod.spellMap.GetAllForCategory(activeCategory)
  local maxValue = mod.common.TableLength(spells) or 0
  p = spells
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
      mod.logger.LogError(me.tag, "Updating now ... value: " .. value .. spells[value].name)

      row.name:SetText("just some text to test " .. spells[value].name)

      row:Show()
    else
      spellRows[i]:Hide()
    end
  end
end
