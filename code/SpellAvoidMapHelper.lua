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
  Get all avoid spells for a certain category - used for ui tabs. Rank alias entries (refId)
  are skipped; each returned spell is a clone enriched with its spellId and normalized name.

  @param {string} category

  @return {table}
    List of avoid spells for the passed category
]]--
function me.GetAllForCategory(category)
  if not category then return nil end

  local spellAvoidList = {}
  -- read-only iteration on the raw map; each returned spell is cloned individually
  local categorySpells = mod.spellAvoidMap.GetRawSpellAvoidMap()[category]

  if categorySpells == nil then
    mod.logger.LogWarn(me.tag, "No avoid spells found for category " .. category)

    return spellAvoidList
  end

  for spellId, spellData in pairs(categorySpells) do
    if spellData.refId == nil then
      local clonedSpell = mod.common.Clone(spellData)
      clonedSpell.spellId = spellId
      clonedSpell.normalizedSpellName = mod.common.NormalizeSpellName(spellData.name)
      table.insert(spellAvoidList, clonedSpell)
    end
  end

  return spellAvoidList
end

--[[
  Retrieve a spell from the spellAvoidMap by spellId. Follows refIds if present to retrieve the correct spell.

  @param {number} spellId

  @return ({string} {number} {table}) | {nil}
    category, spellId, spell
    category is the category where the spell was found
    spellId is the real spellId of the spell, in cases where refIds are used this is the spellId of the base spell
    spell is the spell data
]]--
function me.SearchBySpellId(spellId)
  if not spellId then return nil end

  mod.logger.LogDebug(me.tag, "Searching for spellId %s in spellAvoidMap", spellId)

  local category = mod.spellAvoidMap.GetCategoryBySpellId(spellId)

  if not category then return nil end

  -- read-only lookup on the raw map; only the matched entry is cloned before returning
  local spells = mod.spellAvoidMap.GetRawSpellAvoidMap()[category]
  local spellData = spells[spellId]
  local baseSpell
  local realSpellId

  if type(spellData.name) == "string" then
    baseSpell = spellData
    realSpellId = spellId
  elseif type(spellData.refId) == "number" then
    baseSpell = spells[spellData.refId]
    realSpellId = spellData.refId
  end

  if not baseSpell then return nil end

  local clonedSpell = mod.common.Clone(baseSpell)
  clonedSpell.spellId = spellId
  clonedSpell.normalizedSpellName = mod.common.NormalizeSpellName(baseSpell.name)

  return category, realSpellId, clonedSpell
end
