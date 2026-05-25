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
mod.spellMap = me

me.tag = "SpellMap"

-- assembled spellMap, keyed by active branch ("classic" / "sod" / "tbc"). Each branch's map is
-- built once on first access. The test runner switches branch via mod.testHelper.SetActiveBranch
-- between passes; production runs only ever populate one branch entry.
local assembledByBranch = {}

local function determineActiveBranch()
  if RGPVPW_ENVIRONMENT.TEST then
    return mod.testHelper.GetActiveBranch()
  end

  if mod.season.IsTbcActive() then return "tbc" end
  if mod.season.IsSodActive() then return "sod" end

  return "classic"
end

local function buildAssembledMap(branch)
  local overlays = {}

  if branch == "sod" then
    table.insert(overlays, mod.spellMapOverlaySod.GetOverlay())
  elseif branch == "tbc" then
    table.insert(overlays, mod.spellMapOverlayTbc.GetOverlay())
  end

  local base = mod.spellMapBase.GetMap()
  local ok, errs = mod.spellMapAssembler.Validate(base, overlays)

  if not ok then
    for _, errMsg in ipairs(errs) do
      mod.logger.LogError(me.tag, "spellMap overlay validation: " .. errMsg)
    end
  end

  return mod.spellMapAssembler.Apply(base, overlays)
end

local function ensureAssembled()
  local branch = determineActiveBranch()

  if assembledByBranch[branch] == nil then
    assembledByBranch[branch] = buildAssembledMap(branch)
  end

  return assembledByBranch[branch]
end

--[[
  Get the spellMap

  @return {table}
    The spellMap
]]--
function me.GetSpellMap()
  return mod.common.Clone(ensureAssembled())
end

--[[
  Get spellMap for a certain category

  @param {string} category

  @return {table}
    Map for the passed category
]]--
function me.GetSpellMapByCategory(category)
  local map = ensureAssembled()

  if not category or not map[category] then
    mod.logger.LogError(me.tag, "Unable to retrieve spellMap for category: "
      .. tostring(category))

    return nil
  end

  return mod.common.Clone(map[category])
end

--[[
  Gets spell metadata from the spell map for a specific spellId

  @param {string} categoryName
  @param {number} spellId

  @return {table|nil}
    Returns spell metadata or nil if not found
]]--
function me.GetSpellMetadata(category, spellId)
  local map = ensureAssembled()
  local spell = map[category] and map[category][spellId]

  if spell then
    if spell.refId then
      spell = map[spell.refId]
    end
    return spell
  end

  return nil
end
