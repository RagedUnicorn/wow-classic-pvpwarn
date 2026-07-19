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
mod.spellAvoidMap = me

me.tag = "SpellAvoidMap"

-- assembled spellAvoidMap, keyed by active branch ("classic" / "sod" / "tbc"). See sibling note
-- in code/SpellMap.lua.
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
    table.insert(overlays, mod.spellAvoidMapOverlaySod.GetOverlay())
  elseif branch == "tbc" then
    table.insert(overlays, mod.spellAvoidMapOverlayTbc.GetOverlay())
  end

  local base = mod.spellAvoidMapBase.GetMap()
  local ok, errs = mod.spellAvoidMapAssembler.Validate(base, overlays)

  if not ok then
    for _, errMsg in ipairs(errs) do
      mod.logger.LogError(me.tag, "spellAvoidMap overlay validation: " .. errMsg)
    end
  end

  local assembled = mod.spellAvoidMapAssembler.Apply(base, overlays)
  -- rank aliases are synthesized from the primaries' allRanks arrays after overlay
  -- application, so overlay-appended ranks get their alias too
  mod.spellAvoidMapAssembler.SynthesizeRankAliases(assembled)

  return assembled
end

local function ensureAssembled()
  local branch = determineActiveBranch()

  if assembledByBranch[branch] == nil then
    assembledByBranch[branch] = buildAssembledMap(branch)
  end

  return assembledByBranch[branch]
end

-- flat spellId → category index per assembled branch, built lazily from the assembled
-- map so combat-log searches resolve with a single lookup instead of a category scan
local categoryIndexByBranch = {}

-- forward declaration
local ensureCategoryIndex

--[[
  Get the spellAvoidMap

  @return {table}
    The spellAvoidMap
]]--
function me.GetSpellAvoidMap()
  return mod.common.Clone(ensureAssembled())
end

--[[
  Get the assembled spellAvoidMap without cloning it. Intended for read-only lookups on
  the combat-log hot path — callers must not mutate the returned table. Consumers that
  need a mutable copy use GetSpellAvoidMap instead.

  @return {table}
    The assembled spellAvoidMap
]]--
function me.GetRawSpellAvoidMap()
  return ensureAssembled()
end

--[[
  Find the category that contains the passed spellId

  @param {number} spellId

  @return {string | nil}
    The category name or nil if the spellId is not present in the spellAvoidMap
]]--
function me.GetCategoryBySpellId(spellId)
  return ensureCategoryIndex()[spellId]
end

--[[
  Build (once per branch) and return the flat spellId → category index for the active branch

  @return {table}
    The spellId → category index
]]--
ensureCategoryIndex = function()
  local branch = determineActiveBranch()

  if categoryIndexByBranch[branch] == nil then
    local index = {}

    for category, spells in pairs(ensureAssembled()) do
      for spellId in pairs(spells) do
        index[spellId] = category
      end
    end

    categoryIndexByBranch[branch] = index
  end

  return categoryIndexByBranch[branch]
end
