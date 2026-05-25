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

  return mod.spellAvoidMapAssembler.Apply(base, overlays)
end

local function ensureAssembled()
  local branch = determineActiveBranch()

  if assembledByBranch[branch] == nil then
    assembledByBranch[branch] = buildAssembledMap(branch)
  end

  return assembledByBranch[branch]
end

--[[
  Get the spellAvoidMap

  @return {table}
    The spellAvoidMap
]]--
function me.GetSpellAvoidMap()
  return mod.common.Clone(ensureAssembled())
end

--[[
  Get spellAvoidMap for a certain category

  @param {string} category

  @return {table}
    Map for the passed category
]]--
function me.GetSpellAvoidMapByCategory(category)
  local map = ensureAssembled()

  if not category or not map[category] then
    mod.logger.LogError(me.tag, "Unable to retrieve spellMap for category: "
        .. tostring(category))

    return nil
  end

  return mod.common.Clone(map[category])
end
