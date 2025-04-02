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

local mod = rgpvpw
local me = {}
mod.spellAvoidMapHelper = me

me.tag = "SpellAvoidMapHelper"

--[[
  Get an unfiltered complete copy of the spellAvoidMap. Used for testing purposes. Does not filter out
  spells that might not be available in the current version of WoW.

  @return {table}
    The complete spellAvoidMap
]]--
function me.GetSpellConfiguration()
  return mod.spellAvoidMap.GetSpellAvoidMap()
end

--[[
  Get an unfiltered copy of the spellAvoidMap for a certain category. Used for testing purposes. Does not filter out
  spells that might not be available in the current version of WoW.

  @param {string} category

  @return {table} | nil
    The spellAvoidMap for the passed category or nil if no category was found
]]--
function me.GetSpellConfigurationByCategory(category)
  return mod.spellAvoidMap.GetSpellAvoidMapByCategory(category)
end

--[[
  Retrieve the spellAvoidMap filtered to the version of WoW running. There are base spells present
  in all versions marked with RGPVPW_CONSTANTS.SPELL_TYPE_BASE. Spells that are only available
  in Season of Discovery are marked with RGPVPW_CONSTANTS.SPELL_TYPE_SOD

  @return {table}
    The filtered spellAvoidMap
]]--
function me.GetFilteredSpellAvoidMap()
  local filteredSpellAvoidMap = {}
  local baseSpellAvoidMap = mod.spellAvoidMap.GetSpellAvoidMap()

  for category, _ in pairs(baseSpellAvoidMap) do
    filteredSpellAvoidMap[category] = {}

    for spellId, spellData in pairs(baseSpellAvoidMap[category]) do
      -- spells that only contain a refId are not added to the filtered spellAvoidMap
      if spellData.refId == nil then
        if spellData.type == RGPVPW_CONSTANTS.SPELL_TYPE_SOD and mod.season.IsSodActive() or RGPVPW_ENVIRONMENT.TEST then
          filteredSpellAvoidMap[category][spellId] = spellData
        end

        if spellData.type == RGPVPW_CONSTANTS.SPELL_TYPE_BASE then
          filteredSpellAvoidMap[category][spellId] = spellData
        end
      end
    end
  end

  return filteredSpellAvoidMap
end

--[[
  Get map for a certain category - used for ui tabs

  @param {string} category

  @return {table}
    Map for the passed category
]]--
function me.GetAllForCategory(category)
  if not category then return nil end

  local spellAvoidList = {}
  local filteredSpellAvoidMap = me.GetFilteredSpellAvoidMap()

  for spellId, spellData in pairs(filteredSpellAvoidMap[category]) do
    local clonedSpell = mod.common.Clone(spellData)
    clonedSpell.spellId = spellId
    clonedSpell.normalizedSpellName = mod.common.NormalizeSpellName(spellData.name)
    table.insert(spellAvoidList, clonedSpell)
  end

  return spellAvoidList
end

--[[
  Retrieve a spell from the spellAvoidMap by spellId. Follows refIds if present to retrieve the correct spell.

  @return ({string} {number} {table}) | {nil}
    category, spellId, spell
    category is the category where the spell was found
    spellId is the real spellId of the spell, in cases where refIds are used this is the spellId of the base spell
    spell is the spell data
]]--
function me.SearchBySpellId(spellId)
  if not spellId then return nil end

  local baseSpellMap = mod.spellAvoidMap.GetSpellAvoidMap()

  mod.logger.LogDebug(me.tag, string.format("Searching for spellId %s in spellAvoidMap", spellId))

  for category, spells in pairs(baseSpellMap) do
    local spellData = spells[spellId]
    local baseSpell
    local realSpellId

    if spellData then
      if type(spellData.name) == "string" then
        baseSpell = spellData
        realSpellId = spellId
      elseif type(spellData.refId) == "number" then
        baseSpell = spells[spellData.refId]
        realSpellId = spellData.refId
      end
    end

    if baseSpell then
      local clonedSpell = mod.common.Clone(baseSpell)
      clonedSpell.spellId = spellId
      clonedSpell.normalizedSpellName = mod.common.NormalizeSpellName(baseSpell.name)

      return category, realSpellId, clonedSpell
    end

    return nil
  end
end
